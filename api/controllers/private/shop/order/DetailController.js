/**
* Created by root on 20/4/16.
*/
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    //var orderid = req.params.id;
    var orderid = req.params.id;
    // var memberid = req.body.memberid;
    Shop_order.findOne({id:orderid})
    .populate('memberId')
    .populate('goods')
    .exec(function (err, obj) {
      req.data.obj = obj || {};
      req.data.moment = moment;
      req.data.StringUtil = StringUtil;
      // req.data.memberid = memberid;
      return res.view('private/shop/order/detail/index', req.data);
    });
  }
}
