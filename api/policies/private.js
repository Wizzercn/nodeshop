/**
 * Created by root on 9/9/15.
 */
var async = require('async');
module.exports = function (req, res, next) {
  if (req.url == '/favicon.ico')return res.end('');
  if (req.session.auth && !req.session.user.disabled) {
    Sys_menu.findOne({url: req.url}).exec(function (err, obj) {
      var path='';
      if(obj){
        path = obj.path||''
      }
      req.data = {
        layout: 'layouts/private',
        lang: req.getLocale(),
        user: req.session.user,
        firstMenus: req.session.firstMenus,
        secondMenus: req.session.secondMenus,
        path: path
      };
      return next();
    });
  } else {
    return res.redirect('/private/login/login');
  }
};
