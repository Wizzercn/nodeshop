/**
 * Created by root on 3/22/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  order: function (req, res, next) {
    var body = req.body.toString('utf-8');
    AlipayService.init(function (err, alipay) {
      return res.json({code:0});
      if (err) {
      } else {
      }
    });
  }
};
