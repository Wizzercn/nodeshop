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
    async.parallel({
      dbMember:function(done){
        Shop_member.findOne(m.memberId).populate('lv_id').exec(function(e,o){
          done(null,o);
        });
      }
    }, function (err, result) {
      var money = StringUtil.getFloat(req.query.money)*100 || 0;
      req.data.dbMember=result.dbMember||{};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.money = money;
      if(m.loginWx&& sails.config.system.ShopConfig.pay_wxpay) {
        WechatService.init_js_appid(sails.config.system.ShopConfig.pay_wxpay_info.wxpay_appid, function (api) {
          var str = 'http://' + sails.config.system.AppDomain + '/wap/member/pay?money=' + req.query.money;
          var param = {
            debug: false,
            jsApiList: ['chooseWXPay'],
            url: str
          };
          api.setOpts({timeout: 35000});
          api.getJsConfig(param, function (e1, result) {
            sails.log.debug('wxpayParam::' + JSON.stringify(result));
            req.data.wxpayParam = result;
            WxpayService.init(function (err, wxpay) {
              if (wxpay) {
                var s = moment().format('YYMMDDHHmm');
                var n = StringUtil.getUuid(5, 10);
                var sn = s + n;
                wxpay.getBrandWCPayRequestParams({
                  openid: m.openid,
                  body: '余额充值',
                  out_trade_no: sn,
                  total_fee: money,
                  spbill_create_ip: sails.config.system.AppIp || '127.0.0.1',
                  notify_url: 'http://' + sails.config.system.AppDomain + '/public/shop/wap/wxpay/order',
                  product_id: m.memberId,
                  attach:'余额充值,会员ID:'+m.memberId
                }, function (e2, result2) {
                  sails.log.debug('wxpayInfo::' + JSON.stringify(result2));
                  req.data.wxpayInfo = result2;
                  return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/member_pay', req.data);
                });
              } else {
                req.data.wxpayInfo = {};
                return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/member_pay', req.data);
              }
            });
          });
        });
      }else {
        req.data.wxpayParam = {};
        req.data.wxpayInfo = {};
        return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/member_pay', req.data);
      }
    });
  },
  payAlipay: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var money = StringUtil.getFloat(req.body.money) || 0;
    AlipayService.init_wap(function (err, alipay) {
      if (err) {
        return res.serverError('支付宝接口异常');
      } else {
        var s = moment().format('YYMMDDHHmm');
        var n = StringUtil.getUuid(5, 10);
        var sn = s + n;
        var data = {
          out_trade_no: sn
          , subject: member.memberId
          , total_fee: money
          , body: '余额充值'
          , show_url: 'http://' + sails.config.system.AppDomain + '/member/money'
        };
        return alipay.wap_create_direct_pay_by_user(data, res);
      }
    });
  }
};
