/**
 * Created by wizzer on 2015/9/6.
 */
var ccap = require('ccap')();
var bcrypt = require('bcrypt');
var StringUtil = require('../../common/util/StringUtil');
module.exports = {
  /**
   * 登陆页
   * @param req
   * @param res
   */
  login: function (req, res) {

    //Sys_role.findOne(1).populate('users').populate('menus').exec(function(err, role) {
    //  console.log(':::'+JSON.stringify(role.users));
    //  console.log(':::'+JSON.stringify(role.menus));
    //});
    Sys_menu.query('SELECT * FROM SYS_MENU', function(err, data) {
      console.log('::1:'+JSON.stringify(data));
      for(var i in data){
        console.log('::'+data[i].name);
      }

    });
    Sys_user.findOne(4).populate('roles',{disabled:false}).exec(function(err, user) {
      console.log('::2:'+JSON.stringify(user.roles));
      console.log('::3:'+JSON.stringify(user.roles[0].menus));
      var roleIds=[],userRoles=user.roles;
      console.log(':'+JSON.stringify(userRoles.prototype));
      for(var i in userRoles){
        console.log(i+':'+userRoles[i].id);
        roleIds.push(userRoles[i].id);
      }
      console.log('::roleIds:'+JSON.stringify(roleIds));
      Sys_role.find().where({id:roleIds}).populate('menus',{disabled:false}).exec(function(err, role) {
        console.log('::4:'+JSON.stringify(role[0].menus));
      });
    });

    //Sys_user.findOne(4).populate('roles').exec(function(err, user) {
    //  console.log('::2:'+JSON.stringify(user.roles));
    //  console.log('::3:'+JSON.stringify(user.roles.id));
    //    Sys_role.find(1).populate('menus').exec(function(err, role) {
    //      console.log('::4:'+JSON.stringify(role.menus));
    //    });
    //
    //});

    return res.view('private/login.ejs', {layout: 'layouts/login'});
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
          type: 'system', url: req.url, note: '退出系统',
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
      return res.json({code: 1, msg: '用户名密码不能为空'});
    }
    if (captchaMust) {
      if (captcha == '') {
        return res.json({code: 2, msg: '请输入验证码'});
      } else if (captchaText == captcha.toLowerCase()) {
        errCount = 0;
      } else {
        return res.json({code: 5, msg: '验证码不正确'});
      }
    }
    if (errCount > 1) {
      req.session.captchaMust = true;
      return res.json({code: 2, msg: '请输入验证码'});
    }
    req.session.errorCount = errCount + 1;

    Sys_user.findOne({
        loginname: username
      },
      function (err, user) {
        if (!user || err) return res.json({code: 3, msg: '用户名不存在'});
        if(user.disabled){
          return res.json({code: 6, msg: '用户被禁止登陆'});
        }else if (bcrypt.compareSync(password, user.password)) {
          req.session.auth = true;
          req.session.user = user;
          req.session.captchaMust = false;
          req.session.errorCount = 0;

          Sys_user.update(user.id,{lastIp:StringUtil.getClientAddress(req),loginCount:user.loginCount+1},function(err){});
          //登陆日志
          Sys_log.create({
            type: 'system', url: req.url, note: '登陆成功',
            createdBy: user.id, createdByName: user.nickname, createdIp: StringUtil.getClientAddress(req)
          }).exec(function (err) {});

          return res.json({code: 0, msg: '登陆成功'});
        } else {
          return res.json({code: 4, msg: '密码不正确'});
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
