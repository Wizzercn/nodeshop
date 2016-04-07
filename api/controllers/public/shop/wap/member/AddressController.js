/**
 * Created by root on 3/23/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    var m=req.session.member;
    if(!m|| m.memberId<1){
      return res.redirect('/wap/login');
    }
    req.data.StringUtil = StringUtil;
    req.data.moment = moment;
    req.data.from=req.query.from||'';
    return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/member_address', req.data);

  }
};
