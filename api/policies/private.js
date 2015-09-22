/**
 * Created by root on 9/9/15.
 */
module.exports = function (req, res, next) {
  if (req.url == '/favicon.ico')return res.end('');
  if (req.session.auth && !req.session.user.disabled) {
    var p = req.url.split('/');
    var url = [];
    console.log('p.length:::' + p.length);
    if (p.length > 4) {
      url.push('/' + p[1] + '/' + p[2] + '/' + p[3] + '/' + p[4]);
      url.push('/' + p[1] + '/' + p[2] + '/' + p[3]);
      url.push('/' + p[1] + '/' + p[2]);
    } else if (p.length > 3) {
      url.push('/' + p[1] + '/' + p[2] + '/' + p[3]);
      url.push('/' + p[1] + '/' + p[2]);
    }
    url.push(req.url);
    Sys_menu.findOne({url: url}).sort({url: 'desc', path: 'desc'}).exec(function (err, obj) {
      var path = '';
      if (obj) {
        path = obj.path || ''
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
