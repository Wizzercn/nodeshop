/**
 * 帐号登录/注册
 * Created by root on 3/8/16.
 */
var captchapng = require('captchapng');
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  join: function (req, res) {
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      bannerLink: function (done) {
        Cms_linkClass.getLinkList('登录页背景', function (list) {
          done(null, list);
        });
      }

    }, function (err, result) {

      req.data.channelList = result.channelList || [];
      req.data.bannerLink = result.bannerLink || {};
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
  },
  getSmscode:function(req, res){
    var mobile=req.body.mobile||'';
    var vercode=req.body.vercode||'';
    var publicCaptcha=req.session.publicCaptcha||'';
    var code = StringUtil.randomNum(6);
    if(vercode==publicCaptcha){
      SmsService.sendVercode(mobile,{code:code,product:sails.config.system.SiteConfig.site_name||'SunShop'},sails.config.system.SmsConfig.sms_reg_template,function(result){
        if(result){
          RedisService.set('sms_vercode_'+mobile,code,60*5,function(e,o){
            if(!e){
              Sms_log.create({mobile:mobile,code:code,sms:'注册验证'}).exec(function(e1,o1){});
              return res.json({code:0,msg:'短信发送成功，请在5分钟之内进行验证'});
            }else {
              return res.json({code:2,msg:'短信未发送成功，请重试'});
            }
          });
        }else {
          return res.json({code:2,msg:'短信未发送成功，请重试'});
        }
      });
      //return res.json({code:0,msg:'短信发送成功，请在5分钟之内进行验证'});
    }else {
      return res.json({code:1,msg:'验证码不正确'});
    }
  },
  checkLoginname:function(req, res){
    var id=req.params.id;
    Shop_member_account.findOne({login_name:id}).exec(function(err,obj){
      if(obj)return res.json({code:1,msg:'帐号已存在'});
      return res.json({code:0,msg:''});
    });
  },
  captcha: function (req, res) {
    if (req.url == '/favicon.ico')return res.end('');
    var txt = ''+parseInt(Math.random() * 9000 + 1000);
    var p = new captchapng(80, 30, txt); // width,height,numeric captcha
    p.color(0, 0, 0, 0);  // First color: background (red, green, blue, alpha)
    p.color(80, 80, 80, 255); // Second color: paint (red, green, blue, alpha)

    var img = p.getBase64();
    var imgbase64 = new Buffer(img, 'base64');
    req.session.publicCaptcha = txt;
    res.writeHead(200, {
      'Content-Type': 'image/png'
    });
    res.end(imgbase64);
  }
};
