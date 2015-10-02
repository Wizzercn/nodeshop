/**
 * Created by root on 9/25/15.
 */
var bcrypt = require('bcrypt');
module.exports = {
  index: function (req, res) {
    var data = req.data;
    return res.view('private/sys/user/index.ejs', data);

  },
  doChangePassword: function (req, res) {
    var oldPassword = req.body.oldPassword;
    var newPassword = req.body.newPassword;
    console.log('oldPassword::'+oldPassword);
    console.log('newPassword::'+newPassword);
    var user = req.session.user;
    console.log('password::'+user.password);

    if (bcrypt.compareSync(oldPassword, user.password)) {
      var salt = bcrypt.genSaltSync(10);
      var hash = bcrypt.hashSync(newPassword, salt);
      Sys_user.update({id: user.id}, {password: hash}).exec(function (err, obj) {
        if (err) {
          return res.json({code: 2, msg: sails.__('update.fail')});
        } else {
          return res.json({code: 0, msg: sails.__('update.ok')});
        }
      });
    } else {
      return res.json({code: 1, msg: sails.__('private.login.errorpassword')});
    }
  }
};
