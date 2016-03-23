/**
 * Created by root on 3/22/16.
 */
var Alipay = require('alipay').Alipay;
var fs = require('fs-extra');
var alipay;
module.exports = {
  init: function (cb) {
    if (alipay) {
      cb(null,alipay);
    } else {
      Shop_config.findOne(1).exec(function (e, o) {
        if (o && o.pay_alipay_info && o.pay_alipay_info.alipay_parter &&o.pay_alipay_info.alipay_key &&o.pay_alipay_info.alipay_email) {
          try {
            alipay =new Alipay({
              partner:o.pay_alipay_info.alipay_parter||'' //合作身份者id，以2088开头的16位纯数字
              ,key:o.pay_alipay_info.alipay_key||''//安全检验码，以数字和字母组成的32位字符
              ,seller_email:o.pay_alipay_info.alipay_email||'' //卖家支付宝帐户 必填
              ,host:'http://'+sails.config.system.AppDomain+'/'
              ,cacert:sails.config.appPath + '/cert/alipay/rsa_private_key.pem'//ca证书路径地址，用于curl中ssl校验
              ,transport:'http' //访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
              ,input_charset:'utf-8'//字符编码格式 目前支持 gbk 或 utf-8
              ,create_direct_pay_by_user_notify_url:'/public/shop/pc/alipay/order'//异步通知地址
              ,create_direct_pay_by_user_return_url:'/public/shop/pc/shoppay/payStatusAlipay'//同步通知地址
            });
            cb(null,alipay);
          } catch (err) {
            sails.log.debug('AlipayService err::'+JSON.stringify(err));
            cb('error',{});
          }
        } else {
          cb('error',{});
        }
      });
    }
  }
};
