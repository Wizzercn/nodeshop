/**
 * Created by wizzer on 2015/9/6.
 */
var ccap = require('ccap')();
module.exports = {
  login: function (req, res) {
    //EmailService.sendEmail({email: 'wizzer@wizzer.cn', title: 'test',html:'<span style=color: red>hhahaha</span>'});
    return res.view('admin/login.ejs');
  },
  doLogin:function(req,res){

  },
  /**
   *
   * @param req
   * @param res
   */
  captcha:function(req,res){
    if(req.url == '/favicon.ico')return res.end('');//Intercept request favicon.ico
    var ary = ccap.get();
    var txt = ary[0];
    var buf = ary[1];
    res.end(buf);
    req.session.captchaText=txt;
  }
};
