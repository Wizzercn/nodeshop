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
      req.data.saveLoginname=req.cookies.saveLoginname||'';
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/account_login', req.data);
    });
  },
  doLogin:function(req,res){
    var login_name=req.body.login_name||'';
    var login_pass=req.body.login_pass||'';
    var vercode=req.body.vercode||'';
    var saveLoginname=req.body.saveLoginname=='true';
    var publicCaptcha=req.session.publicCaptcha||'';
    if(vercode==publicCaptcha){
      Shop_member_account.findOne({login_name:login_name,disabled:false}).populate('memberId').exec(function(err,obj) {
        if (obj&&obj.login_password==StringUtil.password(login_pass,login_name,obj.createdAt)){
          req.session.member={lvId:obj.memberId.lv_id,memberId:obj.memberId.id,nickname:obj.memberId.nickname,score:obj.memberId.score,login_name:login_name,loginIp:obj.loginIp,loginAt:obj.loginAt};
          //记录登录IP和时间
          Shop_member_account.update(obj.id,{loginIp:req.ip,loginAt:moment().format('X')}).exec(function(ep,op){});
          if(saveLoginname){
            res.cookie('saveLoginname', login_name, {maxAge:1000*60*60*24*30, httpOnly:true, path:'/', secure:false});
          }else {
            res.cookie('saveLoginname','null',{maxAge:0});
          }
          //将cookies购物车数据同步到数据库
          Shop_member_cart.updateCookieCartDataToDb(req,res,obj.memberId,function() {
            return res.json({code: 0, msg: '登录成功'});
          });
        }else {
          return res.json({code:2,msg:'用户名或密码错误'});
        }
      });
    }else {
      return res.json({code:1,msg:'验证码不正确'});
    }
  },
  doLoginMobile:function(req,res){
    var mobile=req.body.mobile||'';
    var smscode=req.body.smscode||'';
    if(mobile.length!=11)
      return res.json({code:1,msg:'手机动态密码不正确'});
    RedisService.get('sms_vercode_'+mobile,function(e,o){
      if(o&&smscode== o.toString()){
        Shop_member_account.findOne({login_name:mobile,disabled:false}).populate('memberId').exec(function(err,obj) {
          if (obj){
            req.session.member={lvId:obj.memberId.lv_id,memberId:obj.memberId.id,nickname:obj.memberId.nickname,score:obj.memberId.score,login_name:login_name,loginIp:obj.loginIp,loginAt:obj.loginAt};
            //记录登录IP和时间
            Shop_member_account.update(obj.id,{loginIp:req.ip,loginAt:moment().format('X')}).exec(function(ep,op){});
            //将cookies购物车数据同步到数据库
            Shop_member_cart.updateCookieCartDataToDb(req,res,obj.memberId,function() {
              return res.json({code: 0, msg: '登录成功'});
            });
          }else {
            return res.json({code:2,msg:'帐号不存在'});
          }
        });
      }else {
        return res.json({code:1,msg:'手机动态密码不正确，请重新获取'});
      }
    });
  },
  doJoin:function(req,res){
    var mobile=req.body.mobile||'';
    var smscode=req.body.smscode||'';
    var pass=req.body.pass||'';
    if(mobile.length!=11)
      return res.json({code:1,msg:'手机校验码不正确'});
    RedisService.get('sms_vercode_'+mobile,function(e,o){
      if(o&&smscode== o.toString()){
        Shop_member_account.findOne({login_name:mobile}).exec(function(err,obj){
          if(obj)return res.json({code:2,msg:'帐号已存在，请更换手机号注册'});
          Shop_member.create({nickname:mobile.substring(0,3)+'****'+mobile.substring(7),mobile:mobile,reg_ip:req.ip,reg_source:'pc'}).exec(function(err,member){
            if(member){
              var now=moment().format('X');
              var password=StringUtil.password(pass,mobile,now);
              Shop_member_account.create({lvId:0,memberId:member.id,login_name:mobile,login_password:password,createdAt:now}).exec(function(e3,acc){
                if(!e3){
                  req.session.member={memberId:member.id,nickname:member.nickname,score:member.score,login_name:mobile};
                  return res.json({code:0,msg:'注册成功'});
                }else {
                  return res.json({code:3,msg:'注册失败，请重试'});
                }
              });
            }else {
              return res.json({code:3,msg:'注册失败，请重试'});
            }
          });
        });
      }else {
        return res.json({code:1,msg:'手机校验码不正确，请重新获取'});
      }
    });
  },
  getSmscode:function(req, res){
    var mobile=req.body.mobile||'';
    var vercode=req.body.vercode||'';
    var type=req.body.type||'';
    var sms='';
    var tmp=sails.config.system.SmsConfig.sms_reg_template;
    if(type=='join'){
      sms='注册验证';
    }else if(type=='login'){
      tmp=sails.config.system.SmsConfig.sms_login_template;
      sms='登录验证';
    }
    var publicCaptcha=req.session.publicCaptcha||'';
    var code = StringUtil.randomNum(6);
    if(vercode==publicCaptcha){
      SmsService.sendVercode(mobile,{code:code,product:sails.config.system.SiteConfig.site_name||'SunShop'},tmp,function(result){
        if(result){
          RedisService.set('sms_vercode_'+mobile,code,60*5,function(e,o){
            if(!e){
              Sms_log.create({mobile:mobile,code:code,sms:sms}).exec(function(e1,o1){});
              return res.json({code:0,msg:'短信发送成功，请在5分钟之内进行验证'});
            }else {
              return res.json({code:2,msg:'短信未发送成功，请重试'});
            }
          });
        }else {
          return res.json({code:2,msg:'短信未发送成功，请重试'});
        }
      });
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
  },
  logout:function(req, res){
    var member=req.session.member;
    if (member) {
      req.session.destroy();
      res.redirect('/');
    } else {
      res.redirect('/');
    }
  }
};
