/**
 * Created by root on 3/23/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    var m = req.session.member;
    if (!m || m.memberId < 1) {
      return res.redirect('/login');
    }
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      //获取所有商品分类
      allClassList: function (done) {
        Shop_goods_class.getAllClass(function (list) {
          done(null, list);
        });
      },
      dbMember: function (done) {
        Shop_member.findOne(m.memberId).populate('lv_id').exec(function (e, o) {
          done(null, o);
        });
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.dbMember = result.dbMember || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.siteTitle = '绑定手机_' + req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/member_mobile', req.data);

    });
  },
  getSmscodeMobile: function (req, res) {
    var mobile = req.body.mobile || '';
    var type = req.body.type || '';
    var sms = '';
    var member = req.session.member;
    //return res.json({code: 0, msg: '短信发送成功，请在5分钟之内进行验证'});
    if (member && member.memberId > 0) {
      var tmp = sails.config.system.SmsConfig.sms_reg_template;
      if (type == 'join') {
        sms = '注册验证';
      } else if (type == 'login') {
        tmp = sails.config.system.SmsConfig.sms_login_template;
        sms = '登录验证';
      } else if (type == 'check') {
        tmp = sails.config.system.SmsConfig.sms_check_template;
        sms = '身份验证';
      } else if (type == 'password') {
        tmp = sails.config.system.SmsConfig.sms_password_template;
        sms = '变更验证';
      }
      Shop_member.findOne({id: {'!': member.memberId}, mobile: mobile}).exec(function (e2, m) {
        if (m)return res.json({code: 3, msg: '手机号已被占用，请更换手机号绑定'});
        var code = StringUtil.randomNum(6);
        SmsService.sendVercode(mobile || '', {
          code: code,
          product: sails.config.system.SiteConfig.site_name || 'SunShop'
        }, tmp, function (result) {
          if (result) {
            RedisService.set('sms_vercode_' + mobile || '', code, 60 * 5, function (e, o) {
              if (!e) {
                Sms_log.create({mobile: mobile || '', code: code, sms: sms}).exec(function (e1, o1) {
                });
                return res.json({code: 0, msg: '短信发送成功，请在5分钟之内进行验证'});
              } else {
                return res.json({code: 2, msg: '短信未发送成功，请重试'});
              }
            });
          } else {
            return res.json({code: 2, msg: '短信未发送成功，请重试'});
          }
        });
      });
    } else {
      return res.json({code: 1, msg: '用户尚未登录'});
    }
  },
  save: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: '用户未登录'});
    }
    var mobile = req.body.mobile || '';
    var smscode = req.body.smscode || '';
    Shop_member.findOne({id: {'!': member.memberId}, mobile: mobile}).exec(function (e2, m) {
      if (m)return res.json({code: 1, msg: '手机号已被占用，请更换手机号绑定'});
      RedisService.get('sms_vercode_' + mobile, function (e, o) {
        if (o && smscode == o.toString()) {
          Shop_member.update(member.memberId, {mobile: mobile}).exec(function (ue, uo) {
            Shop_member_account.count({memberId:member.memberId,login_name:mobile}).exec(function(eee,num){
              if(num<1){
                var now = moment().format('X');
                var password = StringUtil.password(mobile, mobile, now);
                Shop_member_account.create({
                  memberId: member.memberId,
                  login_name: mobile,
                  login_password: password,
                  createdAt: now
                }).exec(function(ec,oc){
                  return res.json({code: 0, msg: '绑定成功，下次您也可以通过手机号登录，<span style="color: red">初始密码是您的手机号</span>'});
                });
              }else{
                return res.json({code: 0, msg: '绑定成功，下次您也可以通过手机号登录'});
              }
            });
          });
        } else {
          return res.json({code: 2, msg: '验证码错误'});
        }
      });
    });
  }
};
