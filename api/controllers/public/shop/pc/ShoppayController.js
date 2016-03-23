/**
 * Created by root on 3/21/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  payMoney: function (req, res) {
    var id = req.params.id || '';
    var smscode = req.body.smscode || '';
    var member = req.session.member;
    if (member && member.memberId > 0) {
      Shop_member.findOne(member.memberId).exec(function (e2, m) {
        RedisService.get('sms_vercode_' + m.mobile, function (e, o) {
          if (o && smscode == o.toString()) {
            //Shop_order.query("START TRANSACTION;SAVEPOINT ORDER_PAY_"+id+";");
            Shop_order.findOne({id: id, memberId: member.memberId}).exec(function (e1, order) {
              if (order.payStatus != 0) {
                return res.json({code: 5, msg: '', orderId: id});
              }
              if (m.money >= order.finishAmount) {
                Shop_history_payments.create({
                  orderId: order.id,
                  memberId: member.memberId,
                  money: order.finishAmount,
                  payType: 'pay_money',
                  payName: '余额支付',
                  payAccount: m.nickname,
                  payIp: req.ip,
                  payAt: moment().format('X'),
                  memo: '余额支付:￥' + StringUtil.setPrice(order.finishAmount),
                  finishAt: moment().format('X'),
                  disabled: false
                }).exec(function (e3, o3) {
                  //更新会员信息 余额 积分
                  Shop_member.update(member.memberId, {
                    money: m.money - order.finishAmount,
                    score: m.score + order.score
                  }).exec(function (e4, o4) {
                    //更新订单
                    Shop_order.update(id, {
                      payAmount: order.finishAmount,
                      payStatus: 1,//0 待付款 1已付款 2申请退款 3已退款
                      payType: 'pay_money',
                      updateAt: moment().format('X')
                    }).exec(function (e5, o5) {
                      if (e1 || e2 || e3 || e4 || e5) {
                        /*订单日志表
                         opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
                         opType:admin,member
                         opResult:ok,fail
                         */
                        //回滚
                        //Shop_order.query("ROLLBACK TO SAVEPOINT ORDER_PAY_"+id+";", function (rerr) {
                        //  if (rerr) {
                        //    console.log('shopay::' + id + '::' + rerr)
                        //  }
                        Shop_order_log.create({
                          orderId: order.id, opTag: 'payment', opContent: '订单付款:余额支付', opType: 'member',
                          opId: member.memberId,
                          opNickname: member.nickname,
                          opAt: moment().format('X'),
                          opResult: 'fail'
                        }).exec(function (el1, ol1) {
                        });
                        //});
                        return res.json({code: 4, msg: '付款失败，请重试或联系客服', orderId: id});
                      } else {
                        /*订单日志表
                         opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
                         opType:admin,member
                         opResult:ok,fail
                         */
                        Shop_order_log.create({
                          orderId: order.id, opTag: 'payment', opContent: '订单付款:余额支付', opType: 'member',
                          opId: member.memberId,
                          opNickname: member.nickname,
                          opAt: moment().format('X'),
                          opResult: 'fail'
                        }).exec(function (el1, ol1) {

                        });
                        //余额日志
                        Shop_member_money_log.create({
                          memberId: member.memberId,
                          orderId: order.id,
                          oldMoney: m.money,
                          newMoney: m.money - order.finishAmount,
                          diffMoney: order.finishAmount,
                          note: '支付订单:' + id,
                          createdBy: 0,
                          createdAt: moment().format('X')
                        }).exec(function (em, om) {

                        });
                        //积分日志
                        Shop_member_score_log.create({
                          memberId: member.memberId,
                          orderId: order.id,
                          oldScore: m.score,
                          newScore: m.score - order.score,
                          diffScore: order.score,
                          note: '订单:' + id,
                          createdBy: 0,
                          createdAt: moment().format('X')
                        }).exec(function (es, os) {
                          //Shop_order.query("COMMIT;");
                          return res.json({code: 0, msg: '付款成功', orderId: id});
                        });
                      }
                    });

                  });
                });
              } else {
                return res.json({code: 3, msg: '您的余额不足，请充值', orderId: id});
              }
            });

          } else {
            return res.json({code: 2, msg: ''});
          }
        });
      });
    } else {
      return res.json({code: 1, msg: ''});
    }

  },
  payCash: function (req, res) {
    var id = req.params.id || '';
    var member = req.session.member;
    if (member && member.memberId > 0) {
      //更新订单
      Shop_order.update({id: id, memberId: member.memberId}, {
        payType: 'pay_cash',
        updateAt: moment().format('X')
      }).exec(function (e, o) {
        if (e) {
          /*订单日志表
           opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
           opType:admin,member
           opResult:ok,fail
           */
          Shop_order_log.create({
            orderId: id, opTag: 'update', opContent: '变更支付方式为:货到付款', opType: 'member',
            opId: member.memberId,
            opNickname: member.nickname,
            opAt: moment().format('X'),
            opResult: 'fail'
          }).exec(function (el1, ol1) {
          });
        } else {
          /*订单日志表
           opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
           opType:admin,member
           opResult:ok,fail
           */
          Shop_order_log.create({
            orderId: id, opTag: 'update', opContent: '变更支付方式为:货到付款', opType: 'member',
            opId: member.memberId,
            opNickname: member.nickname,
            opAt: moment().format('X'),
            opResult: 'ok'
          }).exec(function (el1, ol1) {
          });
        }
        return res.json({code: 0, msg: ''});
      });
    } else {
      return res.json({code: 1, msg: ''});
    }
  },
  payAlipay:function(req,res){
    var id = req.body.id || '';
    Shop_order.findOne(id).exec(function (e1, order) {
      AlipayService.init(function (err, alipay) {
        if (err||e1) {
          return res.serverError('支付宝接口异常');
        } else {
          var data = {
            out_trade_no:id
            ,subject:'订单号:' + id
            ,total_fee:StringUtil.getFloat(StringUtil.setPrice(order.finishAmount))
            ,body: '订单号:' + id
            ,show_url:'http://'+sails.config.system.AppDomain+'/shopcart/order/'+id
          };
          return alipay.create_direct_pay_by_user(data, res);
        }
      });
    });
  },
  payWxpay: function (req, res) {
    var id = req.params.id || '';
    Shop_order.findOne(id).exec(function (e1, order) {
      WxpayService.init(function (err, wxpay) {
        if (err||e1) {
          return res.json({code: 1, msg: ''});
        } else {
          wxpay.createUnifiedOrder({
            body: '订单号:' + id,
            out_trade_no: id,
            total_fee: order.finishAmount,
            spbill_create_ip: sails.config.system.AppIp || '127.0.0.1',
            notify_url: 'http://' + sails.config.system.AppDomain + '/public/shop/pc/wxpay/order',
            trade_type: 'NATIVE',
            product_id: id
          }, function (err, result) {
            sails.log.debug('result::'+JSON.stringify(result));
            if (err)
              return res.json({code: 1, msg: ''});
            if(result.code_url)
              return res.json({code: 0, msg: '', code_url: result.code_url});
            return res.json({code: 2, msg: ''});
          });
        }
      });

    });
  },
  payStatus:function(req,res){
    var id = req.params.id || '';
    Shop_order.find({select:['id','payStatus'],where:{id:id}}).exec(function (e1, order) {
      if(order.length>0&&order[0].payStatus==1){
        return res.json({code: 0, msg: ''});
      }else {
        return res.json({code: 1, msg: ''});
      }
    });
  },
  payStatusAlipay:function(req,res){
    AlipayService.initAlipayNotify(function (err, alipayNotify) {
      if (err||e1) {
        return res.send("支付失败");
      } else {
        alipayNotify.verifyReturn(req.query, function(verify_result){
          if(verify_result) {//验证成功
            //商户订单号
            var id = req.query.out_trade_no||'';
            //支付宝交易号
            var trade_no = req.query.trade_no||'';
            //交易状态
            var trade_status = req.query.trade_status||'';

            if(trade_status  == 'TRADE_FINISHED'){
              //交易成功后一个月，支付宝通知finished
              //return res.send("支付成功");
              return res.redirect('/shopcart/order/'+id);
            }
            else if(trade_status == 'TRADE_SUCCESS'){
              //交易成功后更新订单、积分、会员等
              Shop_order.findOne(id).exec(function (order_err, order) {
                if (order) {
                  Shop_member.findOne(order.memberId).exec(function (e2, m) {
                    if (order.status == 1) {
                      //return res.send("支付成功");
                      return res.redirect('/shopcart/order/'+id);
                    } else {
                      //更新订单、积分、日志等
                      Shop_history_payments.create({
                        orderId: order.id,
                        memberId: order.memberId,
                        money: order.finishAmount,
                        payType: 'pay_alipay',
                        payName: '支付宝支付',
                        payAccount: m.nickname,
                        payIp: req.ip,
                        payAt: moment().format('X'),
                        memo: '支付宝支付:￥' + StringUtil.setPrice(order.finishAmount),
                        finishAt: moment().format('X'),
                        disabled: false,
                        trade_no:trade_no
                      }).exec(function (e3, o3) {
                        //更新会员信息 余额 积分
                        Shop_member.update(order.memberId, {
                          score: m.score + order.score
                        }).exec(function (e4, o4) {
                          //更新订单
                          Shop_order.update(id, {
                            payAmount: order.finishAmount,
                            payStatus: 1,//0 待付款 1已付款 2申请退款 3已退款
                            payType: 'pay_alipay',
                            updateAt: moment().format('X')
                          }).exec(function (e5, o5) {
                            if (e2 || e3 || e4 || e5) {
                              /*订单日志表
                               opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
                               opType:admin,member
                               opResult:ok,fail
                               */
                              Shop_order_log.create({
                                orderId: order.id, opTag: 'payment', opContent: '订单付款:支付宝支付', opType: 'member',
                                opId: order.memberId,
                                opNickname: m.nickname,
                                opAt: moment().format('X'),
                                opResult: 'fail'
                              }).exec(function (el1, ol1) {
                              });
                              return res.send("支付失败");
                            } else {
                              /*订单日志表
                               opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
                               opType:admin,member
                               opResult:ok,fail
                               */
                              Shop_order_log.create({
                                orderId: order.id, opTag: 'payment', opContent: '订单付款:支付宝支付', opType: 'member',
                                opId: order.memberId,
                                opNickname: m.nickname,
                                opAt: moment().format('X'),
                                opResult: 'fail'
                              }).exec(function (el1, ol1) {

                              });
                              //积分日志
                              Shop_member_score_log.create({
                                memberId: order.memberId,
                                orderId: order.id,
                                oldScore: m.score,
                                newScore: m.score - order.score,
                                diffScore: order.score,
                                note: '订单:' + id,
                                createdBy: 0,
                                createdAt: moment().format('X')
                              }).exec(function (es, os) {
                              });

                              //return res.send("支付成功");
                              return res.redirect('/shopcart/order/'+id);
                            }
                          });

                        });
                      });
                    }
                  });
                } else {
                  return res.send("支付失败");
                }
              });

            }
          }
          else {
            //验证失败
            return res.send("支付失败");
          }
        });
      }
    });
  }
};
