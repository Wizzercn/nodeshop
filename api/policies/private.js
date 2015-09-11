/**
 * Created by root on 9/9/15.
 */
module.exports = function(req, res, next) {
  if (req.session.auth && !req.session.user.disabled) {
    return next();
  } else {
    return res.redirect('/private/login/login');
  }
};
