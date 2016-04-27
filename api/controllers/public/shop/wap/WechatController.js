/**
 * Created by root on 3/31/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
var OAuth = require('wechat-oauth');
var emoji = require('emoji');
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
        Shop_member_bind.findOne({bind_openid: openid}).exec(function (bindErr1, bind1) {
          if (bind1) {
            //如果存在微信商城帐号
                req.session.member = {
                  memberId: bind1.memberId,
                  nickname: bind1.bind_nickname,
                  login_name: openid,
                  loginIp: StringUtil.getIp(req),
                  loginAt: moment().format('X'),
                  loginWx: true,
                  binded: bind1.binded,
                  openid: openid
                };
              return res.redirect(wechat_goto_url);
          } else {
            //如果不存在微信商城帐号，则新注册帐号(前提是微信支付和微信帐号、菜单都配置好)
            if (sails.config.system.ShopConfig.pay_wxpay) {
              async.waterfall([
                function (done) {
                  Wx_config.findOne({appid: sails.config.system.ShopConfig.pay_wxpay_info.wxpay_appid}).exec(function (e, o) {
                    if (o) {
                      return done(null, o);
                    }
                    return done('error', {id: 0});
                  });
                },
                function (conf, done) {
                  Wx_user.count({openid: openid, wxid: conf.id}).exec(function (err, c) {
                    if (!err && c > 0) {
                      //若微信表存在数据,则更新
                      WechatService.init_id(conf.id, function (api) {
                        api.getUser({openid: openid, lang: 'zh_CN'}, function (er, result) {
                          if (result) {
                            result.subscribe = 1;
                            result.nickname = emoji.unifiedToHTML(result.nickname);
                            Wx_user.update({openid: openid, wxid: conf.id}, result).exec(function (e3, o3) {
                              return done(null, o3[0]);
                            });
                          }
                        });
                      });
                    } else {
                      WechatService.init_id(conf.id, function (api) {
                        api.getUser({openid: openid, lang: 'zh_CN'}, function (er, result) {
                          if (result) {
                            result.wxid=conf.id;
                            result.subscribe = 1;
                            result.nickname = emoji.unifiedToHTML(result.nickname);
                            Wx_user.create(result).exec(function (e3, o) {
                              return done(null, o);
                            });
                          }
                        });
                      });
                    }
                  });
                },
                function (wxuser, done) {
                  //是否开启自动创建商城帐号
                  if (sails.config.system.ShopConfig.member_weixinreg_auto) {
                    Shop_member_bind.findOne({bind_openid: openid}).exec(function (bindErr, bind) {
                      if (!bind) {
                        //如果帐号绑定表数据不存在，则创建
                        Shop_member.create({
                          nickname: wxuser.nickname,
                          headimgurl: wxuser.headimgurl || '',
                          sex: wxuser.sex || 0,
                          reg_ip: StringUtil.getIp(req),
                          reg_time: moment().format('X'),
                          reg_source: 'weixin'
                        }).exec(function (mmbErr, mmb) {
                          Shop_member_bind.create({
                            memberId: mmb.id,
                            bind_type: 'weixin',
                            bind_openid: openid,
                            bind_nickname: wxuser.nickname,
                            disabled: false,
                            createdAt: moment().format('X')
                          }).exec(function (bcErr, bc) {
                            bc.jiSuan=true;
                            return done(null, bc);
                          });
                        });
                      } else {
                        Shop_member_bind.update({bind_openid: openid}, {disabled: false}).exec(function (bcErr2, bc2) {
                          //如果是取消关注重新关注的，则不进行积分优惠券计算
                          bc.jiSuan=false;
                          return done(null, bind);

                        });
                      }
                    });
                  } else {
                    return done(null, 0);
                  }
                }
                , function (bind, done) {
                  if (bind.jiSuan == false)
                    done(null, bind);
                  Shop_member.findOne(bind.memberId).exec(function (errmmb, mmb) {
                    var member_weixinreg_score = sails.config.system.ShopConfig.member_weixinreg_score || 0;
                    if (member_weixinreg_score > 0) {
                      Shop_member.update(mmb.id, {score: mmb.score + member_weixinreg_score}).exec(function (mscoreErr, mscore) {
                        Shop_member_score_log.create({
                          memberId: mmb.id,
                          oldScore: mmb.score,
                          newScore: mmb.score + member_weixinreg_score,
                          diffScore: member_weixinreg_score,
                          note: '微信注册赠送',
                          createdBy: 0,
                          createdAt: moment().format('X')
                        }).exec(function (logErr, log) {
                          return done(null, bind);
                        });
                      });
                    } else
                      return done(null, bind);
                  });
                }, function (bind, done) {
                  if (bind.jiSuan == false)
                    done(null, bind);
                  //注册赠送优惠券
                  if (sails.config.system.ShopConfig.member_weixinreg_coupon > 0) {
                    Shop_sales_coupon.findOne(sails.config.system.ShopConfig.member_weixinreg_coupon).exec(function (couponErr, coupon) {
                      if (coupon.disabled == false && coupon.maxNum > coupon.hasNum) {
                        Shop_member_coupon.create({
                          memberId: bind.memberId,
                          couponId: coupon.id,
                          couponName: coupon.name,
                          couponPrice: coupon.price,
                          status: 0,
                          createdAt: moment().format('X')
                        }).exec(function (mcErr, mc) {
                          return done(null, bind);
                        });
                      } else {
                        return done(null, bind);
                      }
                    });
                  } else {
                    return done(null, bind);
                  }
                }
              ], function (e, bind) {
                req.session.member = {
                  memberId: bind.memberId,
                  nickname: bind.bind_nickname,
                  login_name: openid,
                  loginIp: StringUtil.getIp(req),
                  loginAt: moment().format('X'),
                  loginWx: true,
                  binded: bind.binded,
                  openid: openid
                };
                return res.redirect(wechat_goto_url);
              });
            } else {
              return res.redirect(wechat_goto_url);
            }
          }
        });
      } else {
        return res.redirect(wechat_goto_url);
      }
    });
  }
};
