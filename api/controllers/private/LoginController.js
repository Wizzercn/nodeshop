/**
 * Created by wizzer on 2015/9/6.
 */
var ccap = require('ccap')();
var bcrypt = require('bcrypt');
var StringUtil = require('../../common/util/StringUtil');
module.exports = {
  /**
   * 切换语言
   * @param req
   * @param res
   */
  lang: function (req, res) {
    console.log('lang::'+req.param('lang'));
    console.log('Referer::'+req.header('Referer'));
    req.setLocale(req.param('lang'));
    console.log('lang::'+req.getLocale());
    res.redirect('/private/login/login');
  },
  /**
   * 登陆页
   * @param req
   * @param res
   */
  login: function (req, res) {
    return res.view('private/login.ejs', {layout: 'layouts/login',lang:req.getLocale()});
  },
  /**
   * 登出
   * @param req
   * @param res
   */
  logout: function (req, res) {
    Sys_user.findOne(req.session.user.id).exec(function (err, user) {
      if (user) {
        Sys_log.create({
          type: 'system', url: req.url, note:  sails.__('private.login.logout'),
          op_id: user.id, op_name: user.nickname, op_ip: StringUtil.getClientAddress(req)
        }).exec(function (err, log) {
        });
        req.session.destroy();
        res.redirect('/private/login/login');
      } else {
        res.redirect('/');
      }
    });
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
        var roleIds = [],roleCodes=[], userRoles = user.roles;
        userRoles.forEach(function (obj) {
          roleIds.push(obj.id);
          roleCodes.push(obj.code);
        });
        req.session.roleCodes = roleCodes;

        if (roleIds.length > 0) {//用户拥有角色则加载菜单
          Sys_role.find().where({id: roleIds}).populate('menus', {disabled: false}).exec(function (err, role) {
            var fisrtMenus = [], secondMenus = new Map();
            role.forEach(function (m) {
              m.menus.forEach(function (obj)
              {
                if (obj.path.length == 4) {
                  fisrtMenus.push(obj);
                } else {
                  var s = secondMenus.get(obj.path.substring(0, obj.path.length - 4))||[];
                  if (s) {
                    s.push(obj);
                  }
                  secondMenus.set(obj.path.substring(0, obj.path.length - 4), s);
                }
              });

            });
            req.session.fisrtMenus=fisrtMenus;
            req.session.secondMenus=secondMenus;

          });
        }
        Sys_user.update(user.id, {
          lastIp: StringUtil.getClientAddress(req),
          loginCount: user.loginCount + 1
        }, function (err) {
        });
        //登陆日志
        Sys_log.create({
          type: 'system', url: req.url, note:  sails.__('private.login.success'),
          createdBy: user.id, createdByName: user.nickname, createdIp: StringUtil.getClientAddress(req)
        }).exec(function (err) {
        });

        return res.json({code: 0, msg: sails.__('private.login.success')});
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
