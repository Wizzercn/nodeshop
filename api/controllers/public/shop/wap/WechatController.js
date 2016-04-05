/**
 * Created by root on 3/31/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
var OAuth = require('wechat-oauth');
var emoji=require('emoji');
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
            Shop_member.findOne(bind1.memberId).exec(function (mmbErr, mmb) {
              if (mmb) {
                req.session.member = {
                  memberId: mmb.id,
                  nickname: mmb.nickname,
                  login_name: openid,
                  loginIp: req.ip,
                  loginAt: moment().format('X'),
                  loginWx: true,
                  binded: bind1.binded,
                  openid: openid
                };
              }
              return res.redirect(wechat_goto_url);
            });
          } else {
            //如果不存在微信商城帐号，则新注册帐号(前提是微信支付和微信帐号、菜单都配置好)
            if (sails.config.system.ShopConfig.pay_wxpay) {
              async.waterfall([
                function (done) {
                  Wx_config.findOne({appid: sails.config.system.ShopConfig.pay_wxpay_info.wxpay_appid}).exec(function (e, o) {
                    if (o) {
                      done(null, o);
                    }
                    done('error', {id:0});
                  });
                },
                function (conf, done) {
                  Wx_user.count({openid: openid, wxid: conf.id}).exec(function (err, c) {
                    if (!err && c > 0) {
                      //若微信表存在数据,则更新
                      WechatService.init_id(conf.id, function (api) {
                        sails.log.debug('WechatService api::'+JSON.stringify(api));

                        api.getUser({openid: openid, lang: 'zh_CN'}, function (er, result) {
                          if (result) {
                            result.subscribe = 1;
                            result.nickname=emoji.unifiedToHTML(result.nickname);
                            Wx_user.update({openid: openid, wxid: conf.id}, result).exec(function (e3, o3) {
                            });
                            //是否开启自动创建商城帐号
                            if(sails.config.system.ShopConfig.member_weixinreg_auto){
                              Shop_member_bind.findOne({bind_openid:openid}).exec(function(bindErr,bind){
                                if(!bind){
                                  //如果帐号绑定表数据不存在，则创建
                                  Shop_member.create({
                                    nickname:result.nickname,
                                    headimgurl:result.headimgurl||'',
                                    sex:result.sex||0,
                                    reg_ip:req.ip,
                                    reg_time:moment().format('X'),
                                    reg_source:'weixin'
                                  }).exec(function(mmbErr,mmb){
                                    if(mmb){
                                      req.session.member = {
                                        memberId: mmb.id,
                                        nickname: mmb.nickname,
                                        login_name: openid,
                                        loginIp: req.ip,
                                        loginAt: moment().format('X'),
                                        loginWx: true,
                                        binded: false,
                                        openid: openid
                                      };
                                      Shop_member_bind.create({
                                        memberId:mmb.id,
                                        bind_type:'weixin',
                                        bind_openid:openid,
                                        bind_nickname:result.nickname,
                                        disabled:false,
                                        createdAt:moment().format('X')
                                      }).exec(function(bcErr,bc){

                                      });
                                      //注册赠送积分
                                      var member_weixinreg_score=sails.config.system.ShopConfig.member_weixinreg_score||0;
                                      if(member_weixinreg_score>0){
                                        Shop_member.update(mmb.id,{score:mmb.score+member_weixinreg_score}).exec(function(mscoreErr,mscore){
                                          if(mscore){
                                            Shop_member_score_log.create({
                                              memberId:mmb.id,
                                              oldScore:mmb.score,
                                              newScore:mmb.score+member_weixinreg_score,
                                              diffScore:member_weixinreg_score,
                                              note:'微信注册赠送',
                                              createdBy:0,
                                              createdAt:moment().format('X')
                                            }).exec(function(logErr,log){

                                            });
                                          }
                                        });
                                      }
                                      //注册赠送优惠券
                                      if(sails.config.system.ShopConfig.member_weixinreg_coupon>0){
                                        Shop_sales_coupon.findOne(sails.config.system.ShopConfig.member_weixinreg_coupon).exec(function(couponErr,coupon){
                                          if(coupon.disabled==false&&coupon.maxNum>coupon.hasNum){
                                            Shop_member_coupon.create({
                                              memberId:mmb.id,
                                              couponId:coupon.id,
                                              couponName:coupon.name,
                                              couponPrice:coupon.price,
                                              status:0,
                                              createdAt:moment().format('X')
                                            }).exec(function(mcErr,mc){
                                              done(null, 0);
                                            });
                                          }else {
                                            done(null, 0);
                                          }
                                        });
                                      }else {
                                        done(null, 0);
                                      }
                                    }else {
                                      done(null, 0);
                                    }
                                  });
                                }else {
                                  Shop_member_bind.update({bind_openid:openid},{disabled:false}).exec(function(bcErr2,bc2){
                                    if(bc2.length>0)
                                      req.session.member = {
                                        memberId: bc2[0].memberId,
                                        nickname: bc2[0].bind_nickname,
                                        login_name: bc2[0].bind_openid,
                                        loginIp: req.ip,
                                        loginAt: moment().format('X'),
                                        loginWx: true,
                                        binded: bc2[0].binded,
                                        openid: bc2[0].bind_openid
                                      };
                                  });
                                  done(null, 0);
                                }
                              });
                            }else {
                              done(null, 0);
                            }

                          }else {
                            done(null, 0);
                          }
                        });
                      });
                    } else {
                      //若微信表不存在数据,则创建
                      Wx_user.create({openid: openid, wxid: conf.id,subscribe:1}).exec(function (e2, obj) {
                        if (obj) {
                          WechatService.init_id(conf.id, function (api) {
                            api.getUser({openid: openid, lang: 'zh_CN'}, function (er, result) {
                              if (result) {
                                result.subscribe = 1;
                                result.nickname=emoji.unifiedToHTML(result.nickname);
                                Wx_user.update({openid: openid, wxid: conf.id}, result).exec(function (e3, o3) {
                                });
                                //是否开启自动创建商城帐号
                                if(sails.config.system.ShopConfig.member_weixinreg_auto){
                                  Shop_member_bind.findOne({bind_openid:openid}).exec(function(bindErr,bind){
                                    if(!bind){
                                      //如果帐号绑定表数据不存在，则创建
                                      Shop_member.create({
                                        nickname:result.nickname,
                                        headimgurl:result.headimgurl||'',
                                        sex:result.sex||0,
                                        reg_ip:req.ip,
                                        reg_time:moment().format('X'),
                                        reg_source:'weixin'
                                      }).exec(function(mmbErr,mmb){
                                        if(mmb){
                                          req.session.member = {
                                            memberId: mmb.id,
                                            nickname: mmb.nickname,
                                            login_name: openid,
                                            loginIp: req.ip,
                                            loginAt: moment().format('X'),
                                            loginWx: true,
                                            binded: false,
                                            openid: openid
                                          };
                                          Shop_member_bind.create({
                                            memberId:mmb.id,
                                            bind_type:'weixin',
                                            bind_openid:openid,
                                            bind_nickname:result.nickname,
                                            disabled:false,
                                            createdAt:moment().format('X')
                                          }).exec(function(bcErr,bc){

                                          });
                                          //注册赠送积分
                                          var member_weixinreg_score=sails.config.system.ShopConfig.member_weixinreg_score||0;
                                          if(member_weixinreg_score>0){
                                            Shop_member.update(mmb.id,{score:mmb.score+member_weixinreg_score}).exec(function(mscoreErr,mscore){
                                              if(mscore){
                                                Shop_member_score_log.create({
                                                  memberId:mmb.id,
                                                  oldScore:mmb.score,
                                                  newScore:mmb.score+member_weixinreg_score,
                                                  diffScore:member_weixinreg_score,
                                                  note:'微信注册赠送',
                                                  createdBy:0,
                                                  createdAt:moment().format('X')
                                                }).exec(function(logErr,log){

                                                });
                                              }
                                            });
                                          }
                                          //注册赠送优惠券
                                          if(sails.config.system.ShopConfig.member_weixinreg_coupon>0){
                                            Shop_sales_coupon.findOne(sails.config.system.ShopConfig.member_weixinreg_coupon).exec(function(couponErr,coupon){
                                              if(coupon.disabled==false&&coupon.maxNum>coupon.hasNum){
                                                Shop_member_coupon.create({
                                                  memberId:mmb.id,
                                                  couponId:coupon.id,
                                                  couponName:coupon.name,
                                                  couponPrice:coupon.price,
                                                  status:0,
                                                  createdAt:moment().format('X')
                                                }).exec(function(mcErr,mc){
                                                  done(null, 0);
                                                });
                                              }else {
                                                done(null, 0);
                                              }
                                            });
                                          }else {
                                            done(null, 0);
                                          }
                                        }else {
                                          done(null, 0);
                                        }
                                      });
                                    }else {
                                      Shop_member_bind.update({bind_openid:openid},{disabled:false}).exec(function(bcErr2,bc2){
                                        if(bc2.length>0)
                                          req.session.member = {
                                            memberId: bc2[0].memberId,
                                            nickname: bc2[0].bind_nickname,
                                            login_name: bc2[0].bind_openid,
                                            loginIp: req.ip,
                                            loginAt: moment().format('X'),
                                            loginWx: true,
                                            binded: bc2[0].binded,
                                            openid: bc2[0].bind_openid
                                          };
                                      });
                                      done(null, 0);
                                    }
                                  });
                                }else {
                                  done(null, 0);
                                }
                              }else {
                                done(null, 0);
                              }
                            });
                          });
                        }else {
                          done(null, 0);
                        }
                      });
                    }
                  });
                }
              ], function (e, r) {
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
