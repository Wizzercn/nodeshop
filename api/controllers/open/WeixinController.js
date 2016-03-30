/**
 * 这个JS文件写的比较早，也比较乱，我都不忍心看下去了……改动的时候小心点啊
 * Created by root on 10/25/15.
 */
var emoji=require('emoji');
var moment = require('moment');
module.exports = {
  api: function (req, res) {
    var id = req.params.id;

    Wx_config.findOne(id).exec(function (err, conf) {
      if (err)return res.send(200, 'fail');
      if (req.body) {
        WeixinService.loop(req, function (data) {
          sails.log.warn(JSON.stringify(data));
          if (data.type == 'text') {//用户发送纯文本
            var txt = data.txt;
            Wx_reply.findOne({wxid: id, type: 'keyword', keyword: txt}).exec(function (err, obj) {
              if (obj) {
                Wx_reply.sendMsg(req, res, obj, conf.ghid, data);
              } else {//查找默认回复内容
                Wx_reply.findOne({wxid: id, type: 'keyword', keyword: 'default'}).exec(function (err2, obj2) {
                  if (obj) {
                    Wx_reply.sendMsg(req, res, obj2, conf.ghid, data);
                  } else {
                    return res.send(200, req.query.echostr);
                  }
                });
              }
            });
          } else if (data.type == 'event') {
            if (data.event == 'subscribe') {//关注事件
              req.body.wxid = id;
              Wx_user.count({openid: data.openid, wxid: id}).exec(function (err, c) {
                if (!err && c > 0) {
                  //若微信表存在数据,则更新
                  WechatService.init(req, res, function (api) {
                    api.getUser({openid: data.openid, lang: 'zh_CN'}, function (er, result) {
                      if (result) {
                        result.subscribe = 1;
                        result.nickname=emoji.unifiedToHTML(result.nickname);
                        Wx_user.update({openid: data.openid, wxid: id}, result).exec(function (e3, o3) {
                        });
                        //是否开启自动创建商城帐号
                        if(sails.config.system.ShopConfig.member_weixinreg_auto){
                          Shop_member_bind.findOne({bind_openid:data.openid}).exec(function(bindErr,bind){
                            if(!bind){
                              //如果帐号绑定表数据不存在，则创建
                              Shop_member.create({
                                nickname:result.nickname,
                                sex:result.sex||0,
                                reg_ip:req.ip,
                                reg_time:moment().format('X'),
                                reg_source:'weixin'
                              }).exec(function(mmbErr,mmb){
                                if(mmb){
                                  Shop_member_bind.create({
                                    memberId:mmb.id,
                                    bind_type:'weixin',
                                    bind_openid:data.openid,
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
                                          var msg = {toUserName: data.openid, fromUserName: conf.ghid, content: '恭喜您得到一张 '+coupon.name+' 优惠券，可在购物结算时使用。'};
                                          WeixinService.sendTextMsg(res, msg);//向用户回复消息
                                        });
                                      }else {
                                        return res.send(200, req.query.echostr);
                                      }
                                    });
                                  }else {
                                    return res.send(200, req.query.echostr);
                                  }
                                }else {
                                  return res.send(200, req.query.echostr);
                                }
                              });
                            }else {
                              Shop_member_bind.update({bind_openid:data.openid},{disabled:false}).exec(function(bcErr2,bc2){

                              });
                              return res.send(200, req.query.echostr);
                            }
                          });
                        }else {
                          return res.send(200, req.query.echostr);
                        }

                      }else {
                        return res.send(200, req.query.echostr);
                      }
                    });
                  });
                } else {
                  //若微信表不存在数据,则创建
                  Wx_user.create({openid: data.openid, wxid: id,subscribe:1}).exec(function (e2, obj) {
                    if (obj) {
                      WechatService.init(req, res, function (api) {
                        api.getUser({openid: data.openid, lang: 'zh_CN'}, function (er, result) {
                          if (result) {
                            result.subscribe = 1;
                            result.nickname=emoji.unifiedToHTML(result.nickname);
                            Wx_user.update({openid: data.openid, wxid: id}, result).exec(function (e3, o3) {
                            });
                            //是否开启自动创建商城帐号
                            if(sails.config.system.ShopConfig.member_weixinreg_auto){
                              Shop_member_bind.findOne({bind_openid:data.openid}).exec(function(bindErr,bind){
                                if(!bind){
                                  //如果帐号绑定表数据不存在，则创建
                                  Shop_member.create({
                                    nickname:result.nickname,
                                    sex:result.sex||0,
                                    reg_ip:req.ip,
                                    reg_time:moment().format('X'),
                                    reg_source:'weixin'
                                  }).exec(function(mmbErr,mmb){
                                    if(mmb){
                                      Shop_member_bind.create({
                                        memberId:mmb.id,
                                        bind_type:'weixin',
                                        bind_openid:data.openid,
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
                                              var msg = {toUserName: data.openid, fromUserName: conf.ghid, content: '恭喜您得到一张 '+coupon.name+' 优惠券，可在购物结算时使用。'};
                                              WeixinService.sendTextMsg(res, msg);//向用户回复消息
                                            });
                                          }else {
                                            return res.send(200, req.query.echostr);
                                          }
                                        });
                                      }else {
                                        return res.send(200, req.query.echostr);
                                      }
                                    }else {
                                      return res.send(200, req.query.echostr);
                                    }
                                  });
                                }else {
                                  Shop_member_bind.update({bind_openid:data.openid},{disabled:false}).exec(function(bcErr2,bc2){

                                  });
                                  return res.send(200, req.query.echostr);
                                }
                              });
                            }else {
                              return res.send(200, req.query.echostr);
                            }
                          }else {
                            return res.send(200, req.query.echostr);
                          }
                        });
                      });
                    }else {
                      return res.send(200, req.query.echostr);
                    }
                  });
                }
              });
              if(sails.config.system.ShopConfig.member_weixinreg_auto&&sails.config.system.ShopConfig.member_weixinreg_coupon>0){
                //如果启用关注创建帐号并赠送优惠券，则回复优惠券消息
              }else {
              Wx_reply.findOne({wxid: id, type: 'follow'}).exec(function (err, obj) {
                if (obj) {
                  if (obj.msgtype == 'txt') {
                    Wx_txt.findOne({id: obj.content}).exec(function (e, o) {
                      if (o) {
                        var msg = {toUserName: data.openid, fromUserName: conf.ghid, content: o.content};
                        WeixinService.sendTextMsg(res, msg);//向用户回复消息
                      } else {
                        return res.send(200, req.query.echostr);
                      }
                    });
                  } else if (obj.msgtype == 'news') {
                    var sql = 'SELECT * FROM wx_news WHERE id IN (' + obj.content + ') ORDER BY INSTR(\'' + obj.content + '\',id)';
                    //按id数组顺序排序
                    Wx_news.query(sql, [], function (e, o) {
                      if (o.length > 0) {
                        var msg = {
                          toUserName: data.openid, fromUserName: conf.ghid,
                          articles: o
                        };
                        WeixinService.sendNewsMsg(res, msg);//向用户回复消息
                      } else {
                        return res.send(200, req.query.echostr);
                      }
                    });
                  } else {
                    return res.send(200, req.query.echostr);
                  }
                }else {
                  return res.send(200, req.query.echostr);
                }
              });
              }
            }else if (data.event == 'unsubscribe') {//取消关注事件
              Wx_user.update({openid: data.openid, wxid: id}, {subscribe: 0}).exec(function (err, obj) {

              });
              if(sails.config.system.ShopConfig.member_weixinreg_auto){
                Shop_member_bind.update({bind_openid:data.openid},{disabled:true}).exec(function(bcErr,bc){

                });
              }
              return res.send(200, req.query.echostr);
            }else if (data.event == 'CLICK') {
              Wx_reply.findOne({wxid: id, type: 'keyword', keyword: data.eventKey}).exec(function (err, obj) {
                if (obj) {
                  Wx_reply.sendMsg(req, res, obj, conf.ghid, data);
                } else {
                  return res.send(200, req.query.echostr);
                }
              });

            } else {
              return res.send(200, req.query.echostr);
            }
          } else {
            return res.send(200, req.query.echostr);
          }
        });
      } else {
        //签名
        if (WeixinService.checkSignature(req, conf.token)) {
          return res.send(200, req.query.echostr);
        } else {
          sails.log.error('weixin checkSignature fail');
          return res.send(200, 'fail');
        }
      }

    });
  },
  test: function (req, res) {
    return res.view('test', {layout: 'layouts/layout'});
  }
};
