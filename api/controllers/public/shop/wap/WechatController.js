/**
 * Created by root on 3/31/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
var OAuth = require('wechat-oauth');
var api;
module.exports = {
  oauth: function (req, res) {
    var wechat_goto_url = req.query.goto_url || '/wap/';
    req.session.wechat_goto_url = wechat_goto_url;
    if (sails.config.system.ShopConfig.pay_wxpay) {
      var obj = sails.config.system.ShopConfig.pay_wxpay_info;
      var back_url = 'http://' + sails.config.system.AppDomain + '/public/shop/wap/wechat/back';
      var redirect_uri = encodeURIComponent(back_url);
      var state = 'wechat';
      var scope = 'snsapi_base';
      var oauth_url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' + obj.wxpay_appid + '&redirect_uri=' + redirect_uri + '&response_type=code&scope=' + scope + '&state=' + state + '#wechat_redirect';
      return res.redirect(oauth_url);
    } else {
      return res.redirect(wechat_goto_url);
    }
  },
  back: function (req, res) {
    var code = req.query.code;
    var wechat_goto_url = req.session.wechat_goto_url || '/wap/';
    if (!api && sails.config.system.ShopConfig.pay_wxpay) {
      var obj = sails.config.system.ShopConfig.pay_wxpay_info;
      api = new OAuth(obj.wxpay_appid, obj.wxpay_appsecret);
      api.setOpts({timeout: 35000});
    }
    api.getAccessToken(code, function (ew, ow) {
      if (ow && ow.data) {
        var openid = ow.data.openid;
        Shop_member_bind.findOne({bind_openid: openid}).exec(function (bindErr, bind) {
          if (bind) {
            Shop_member.findOne(bind.memberId).exec(function (mmbErr, mmb) {
              if (mmb) {
                req.session.member = {
                  memberId: mmb.id,
                  nickname: mmb.nickname,
                  login_name: openid,
                  loginIp: req.ip,
                  loginAt: moment().format('X'),
                  loginWx:true,
                  binded:bind.binded,
                  openid:openid
                };
              }
              return res.redirect(wechat_goto_url);
            });
          } else {
            return res.redirect(wechat_goto_url);
          }
        });
      } else {
        return res.redirect(wechat_goto_url);
      }
    });
  }
};
