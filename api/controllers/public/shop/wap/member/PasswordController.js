/**
 * Created by root on 3/23/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    var m = req.session.member;
    if (!m || m.memberId < 1) {
      return res.redirect('/wap/login');
    }
    req.data.StringUtil = StringUtil;
    req.data.moment = moment;
    return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/member_password', req.data);

  },
  save: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var newpassword = req.body.newpassword || '';
    var smscode = req.body.smscode || '';
    Shop_member.findOne(member.memberId).exec(function (e2, m) {
      RedisService.get('sms_vercode_' + m.mobile, function (e, o) {
        if (o && smscode == o.toString()) {
          Shop_member_account.find({memberId: member.memberId}).exec(function (el, list) {
            var i = 0;
            list.forEach(function (account) {
              i++;
              var login_password = StringUtil.password(newpassword, account.login_name, account.createdAt);
              Shop_member_account.update(account, {login_password: login_password}).exec(function (ep, op) {
                if (i == list.length) {
                  return res.json({code: 0, msg: ''});
                }
              });
            });
          });

        } else {
          return res.json({code: 2, msg: ''});
        }
      });
    });
  }
};
