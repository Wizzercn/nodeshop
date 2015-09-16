/**
 * Created by root on 9/9/15.
 */
module.exports = function(req, res, next) {
  if (req.session.auth && !req.session.user.disabled) {
    res.layout='layouts/private';
    res.lang=req.getLocale();
    return next(res);
  } else {
    return res.redirect('/private/login/login');
  }
};
