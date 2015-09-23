/**
 * Created by wizzer on 2015/9/6.
 */
var ccap = require('ccap')();
var bcrypt = require('bcrypt');
module.exports = {
  /**
   * 切换语言
   * @param req
   * @param res
   */
  lang: function (req, res) {
    req.setLocale(req.param('lang'));
    console.log('lang::' + req.getLocale());
    var url = req.headers['referer'] || '/';
    res.redirect(url);
  },
  /**
   * 更改主题
   * @param req
   * @param res
   */
  theme: function (req, res) {
    req.session.user.loginTheme = req.body.loginTheme;
    req.session.save();
    Sys_user.update({id: req.session.user.id}, {loginTheme: req.body.loginTheme}).exec(function (err, obj) {

    });
    res.end();
  },
  /**
   * 更改布局
   * @param req
   * @param res
   */
  layout: function (req, res) {
    var p = req.body.p, v = req.body.v == 'true';
    console.log('a...' + typeof(v));
    console.log('c...' + (v));
    if ('sidebar' == p) {
      req.session.user.loginSidebar = v;
      Sys_user.update({id: req.session.user.id}, {loginSidebar: v}).exec(function (err, obj) {
      });
    } else if ('boxed' == p) {
      req.session.user.loginBoxed = v;
      Sys_user.update({id: req.session.user.id}, {loginBoxed: v}).exec(function (err, obj) {
      });
    } else if ('scroll' == p) {
      req.session.user.loginScroll = v;
      Sys_user.update({id: req.session.user.id}, {loginScroll: v}).exec(function (err, obj) {
      });
    }
    req.session.save();
    res.end();
  },
  /**
   * 登陆页
   * @param req
   * @param res
   */
  login: function (req, res) {
    //var salt = bcrypt.genSaltSync(10); var hash = bcrypt.hashSync('1', salt); console.log(hash);
    return res.view('private/login.ejs', {layout: 'layouts/login', lang: req.getLocale()});
  },
  /**
   * 登出
   * @param req
   * @param res
   */
  logout: function (req, res) {
    if (req.session.user) {
      Sys_log.create({
        type: 'system', url: req.url, note: sails.__('private.login.logout'),
        op_id: req.session.user.id, op_name: req.session.user.nickname, op_ip: req.ip
      }).exec(function (err, log) {
      });
      req.session.destroy();
      res.redirect('/private/login/login');
    } else {
      res.redirect('/private/login/login');
    }
  },
  /**
   * 登陆
   * @param req
   * @param res
   * @returns {*}
   */
  doLogin: function (req, res) {
    var username = req.param('username'),
      password = req.param('password'),
      captcha = req.param('captcha'),
      captchaText = req.session.captchaText || '',
      captchaMust = req.session.captchaMust || false,
      errCount = req.session.errorCount || 0;
    if (!username || !password) {
      return res.json({code: 1, msg: sails.__('private.login.required')});
    }
    if (captchaMust) {//验证验证码
      if (captcha == '') {
        return res.json({code: 2, msg: sails.__('private.login.inputverifycode')});
      } else if (captchaText == captcha.toLowerCase()) {
        errCount = 0;
      } else {
        return res.json({code: 5, msg: sails.__('private.login.errorverifycode')});
      }
    }
    if (errCount > 1) {//若输错密码三次则必须验证验证码
      req.session.captchaMust = true;
      return res.json({code: 2, msg: sails.__('private.login.inputverifycode')});
    }
    req.session.errorCount = errCount + 1;

    Sys_user.findOne({loginname: username}).populate('roles', {disabled: false}).exec(function (err, user) {
      if (!user || err) return res.json({code: 3, msg: sails.__('private.login.nousername')});
      if (user.disabled) {//判断用户状态
        return res.json({code: 6, msg: sails.__('private.login.forbidden')});
      } else if (bcrypt.compareSync(password, user.password)) {//判断密码
        req.session.auth = true;
        req.session.user = user;
        req.session.captchaMust = false;
        req.session.errorCount = 0;
        var roleIds = [], roleCodes = [], userRoles = user.roles;
        userRoles.forEach(function (obj) {
          roleIds.push(obj.id);
          roleCodes.push(obj.code);
        });
        req.session.roleCodes = roleCodes;
        Sys_user.update(user.id, {
          lastIp: req.ip,
          loginCount: user.loginCount + 1
        }, function (err) {
        });
        //登陆日志
        Sys_log.create({
          type: 'system', url: req.url, note: sails.__('private.login.success'),
          createdBy: user.id, createdByName: user.nickname, createdIp: req.ip
        }).exec(function (err) {
        });
        if (roleIds.length > 0) {
          Sys_role.find().where({id: roleIds}).populate('menus', {disabled: false}).exec(function (err, role) {

            if (role) {
              var firstMenus = [], secondMenus = {},permission=[];
              role.forEach(function (m) {
                m.menus.forEach(function (obj) {
                  if (obj.path.length == 4) {
                    firstMenus.push(obj);
                  } else {
                    var s = secondMenus[obj.path.substring(0, obj.path.length - 4)] || [];
                    if (s) {
                      s.push(obj);
                    }
                    secondMenus[obj.path.substring(0, obj.path.length - 4)] = s;
                  }
                  if(obj.permission){
                    permission.push(obj.permission);
                  }
                });

              });
              req.session.firstMenus = firstMenus;
              req.session.secondMenus = secondMenus;
              req.session.permission = permission;
            }

            req.session.save();
            return res.json({code: 0, msg: sails.__('private.login.success')});
          });
        } else {
          return res.json({code: 0, msg: sails.__('private.login.success')});

        }

      } else {
        return res.json({code: 4, msg: sails.__('private.login.errorpassword')});
      }


    });
  },
  /**
   * 验证码
   * @param req
   * @param res
   */
  captcha: function (req, res) {
    if (req.url == '/favicon.ico')return res.end('');//Intercept request favicon.ico
    var ary = ccap.get();
    var txt = ary[0];
    var buf = ary[1];
    req.session.captchaText = txt.toLowerCase();
    res.end(buf);
  }
};
