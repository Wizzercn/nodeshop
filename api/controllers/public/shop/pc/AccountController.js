/**
 * 帐号登录/注册
 * Created by root on 3/8/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  join: function (req, res) {
    //SmsService.sendVercode('13359011952',{code:'123456',product:sails.config.system.SiteConfig.site_name||'SunShop'},sails.config.system.SmsConfig.sms_reg_template,function(result){
    //  console.log('result::'+result);
    //});
    RedisService.set('sms_reg_13359011952','123456',30,function(cb){

    });
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      }

    }, function (err, result) {

      req.data.channelList = result.channelList || [];
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/account_join', req.data);
    });
  },
  login: function (req, res) {
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      }

    }, function (err, result) {

      req.data.channelList = result.channelList || [];
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/account_login', req.data);
    });
  }
};
