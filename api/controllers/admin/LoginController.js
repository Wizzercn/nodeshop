/**
 * Created by wizzer on 2015/9/6.
 */
module.exports = {
  login: function (req, res) {
    EmailService.sendEmail({email: 'wizzer@wizzer.cn', title: 'test',html:'<span style=color: red>hhahaha</span>'});
    return res.view('admin/login.ejs');
  },
  doLogin:function(req,res){

  }
};
