/**
 * Created by root on 9/9/15.
 */
module.exports = function (req, res, next) {
  if (req.session.auth && !req.session.user.disabled) {
    req.data = {
      layout: 'layouts/private',
      lang: req.getLocale(),
      user: req.session.user,
      firstMenus: req.session.firstMenus,
      secondMenus: req.session.secondMenus
    };
    return next();
  } else {
    return res.redirect('/private/login/login');
  }
};
