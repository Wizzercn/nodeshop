/**
 * Created by root on 3/21/16.
 */
var WXPay = require('weixin-pay');
var fs = require('fs-extra');
var wxpay;
module.exports = {
  init: function (cb) {
    if (wxpay) {
      cb(null,wxpay);
    } else {
      Shop_config.findOne(1).exec(function (e, o) {
        if (o && o.pay_wxpay_info && o.pay_wxpay_info.wxpay_appid &&o.pay_wxpay_info.wxpay_mchid &&o.pay_wxpay_info.wxpay_key) {
          wxpay = WXPay({
            appid: o.pay_wxpay_info.wxpay_appid || '',
            mch_id: o.pay_wxpay_info.wxpay_mchid || '',
            partner_key: o.pay_wxpay_info.wxpay_key || '', //微信商户平台API密钥
            pfx: fs.readFileSync(sails.config.appPath + '/cert/apiclient_cert.p12') //微信商户平台证书
          });
          cb(null,wxpay);
        } else {
          cb('error',{});
        }
      });
    }
  }
};
