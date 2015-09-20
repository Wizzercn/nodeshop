/**
 * Created by root on 9/16/15.
 */
module.exports = function(req, res, next) {
  if (req.session.auth && !req.session.user.disabled) {
    var roleCodes = req.session.roleCodes;
    if (roleCodes && roleCodes.indexOf('sysadmin') > -1) {
      req.data = {
        layout: 'layouts/private',
        lang: req.getLocale(),
        user: req.session.user,
        path:req.url
      };
      return next();
    } else {
      return res.forbidden(sails.__('private.forbidden'));
    }
  }else{
    return res.redirect('/private/login/login');
  }
};
