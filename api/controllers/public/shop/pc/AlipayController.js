/**
* 支付宝支付异步通知处理
* Created by root on 3/22/16.
*/
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  order: function (req, res, next) {
    AlipayService.init(function (err, alipay) {
      if (err) {
        return res.send("fail");
      } else {
        alipay.create_direct_pay_by_user_notify(req, function (verify_result) {
          sails.log.debug('verify_result::' + verify_result);
          sails.log.debug('req.body::' + JSON.stringify(req.body));
          if (verify_result && req.body.seller_id == alipay.alipay_config.partner) {//验证成功

            //商户订单号
            var id = req.body.out_trade_no || '';
            //支付宝交易号
            var trade_no = req.body.trade_no || '';
            //交易状态
            var trade_status = req.body.trade_status || '';
            var buyer_email = req.body.buyer_email || '';
            if (trade_status == 'TRADE_FINISHED') {
              //交易成功后一个月，支付宝通知finished
              return res.send("success");
            }
            else if (trade_status == 'TRADE_SUCCESS') {
              if ('余额充值' == req.body.body) {
                var memberId = req.body.subject || 0;
                Shop_member.findOne(memberId).exec(function (e_1, m) {
                  if (e_1) {
                    return res.send("fail");
                  }
                  Shop_member_money_log.findOne({memberId: m.id, trade_no: trade_no}).exec(function (e_2, mlog) {
                    if (mlog) {
                      return res.send("success");
                    }
                    Shop_member.update(memberId, {money: m.money + StringUtil.getFloat(req.body.total_fee) * 100}).exec(function (e_3, m2) {
                      //余额日志
                      Shop_member_money_log.create({
                        memberId: m.id,
                        orderId: 0,
                        oldMoney: m.money,
                        newMoney: m.money + StringUtil.getFloat(req.body.total_fee) * 100,
                        diffMoney: StringUtil.getFloat(req.body.total_fee) * 100,
                        note: '余额充值(支付宝支付)',
                        trade_no: trade_no,
                        createdBy: 0,
                        createdAt: moment().format('X')
                      }).exec(function (em, om) {
                        return res.send("success");
                      });
                    });
                  });
                });
              } else {
                //交易成功后更新订单、积分、会员等
                Shop_order.findOne(id).exec(function (order_err, order) {
                  if (order) {
                    Shop_member.findOne(order.memberId).exec(function (e2, m) {
                      if (order.payStatus == 1) {
                        return res.send("success");
                      } else {
                        //更新订单、积分、日志等
                        Shop_history_payments.create({
                          orderId: order.id,
                          memberId: order.memberId,
                          money: order.finishAmount,
                          payType: 'pay_alipay',
                          payName: '支付宝支付',
                          payAccount: buyer_email,
                          payIp: StringUtil.getIp(req),
                          payAt: moment().format('X'),
                          memo: '支付宝支付:￥' + StringUtil.setPrice(order.finishAmount),
                          finishAt: moment().format('X'),
                          disabled: false,
                          trade_no: trade_no
                        }).exec(function (e3, o3) {
                          //更新会员信息 余额 积分
                          Shop_member.update(order.memberId, {
                            score: m.score + order.score,
                            order_num: m.order_num + 1
                          }).exec(function (e4, o4) {
                            //更新订单
                            Shop_order.update(id, {
                              payAmount: order.finishAmount,
                              payStatus: 1,//0 待付款 1已付款 2申请退款 3已退款
                              payType: 'pay_alipay',
                              payAt: moment().format('X'),
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
                                return res.send("fail");
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
                                  opResult: 'ok'
                                }).exec(function (el1, ol1) {

                                });
                                //积分日志
                                if (order.score > 0) {
                                  Shop_member_score_log.create({
                                    memberId: order.memberId,
                                    orderId: order.id,
                                    oldScore: m.score,
                                    newScore: m.score + order.score,
                                    diffScore: order.score,
                                    note: '订单:' + id,
                                    createdBy: 0,
                                    createdAt: moment().format('X')
                                  }).exec(function (es, os) {
                                  });
                                }
                                return res.send("success");
                              }
                            });

                          });
                        });
                      }
                    });
                  } else {
                    return res.send("fail");
                  }
                });
              }
            }
          }
          else {
            //验证失败
            return res.send("fail");
          }
        });
      }
    });
  },
  aliNotify: function(req, res){
    AlipayService.init_refund(function (err, alipay) {
      if (err) {
        return res.send("fail");
      } else {
        alipay.refund_fastpay_by_platform_pwd_notify(req, function (verify_result) {
          sails.log.debug('verify_result::' + verify_result);
          sails.log.debug('req.body::' + JSON.stringify(req.body));
          if (verify_result && req.body.seller_id == alipay.alipay_config.partner) {//验证成功
            var result_details = verify_result.result_details.split('^');
            if (result_details[2]=='SUCCESS'){
              Shop_history_refunds.count({trade_no: result_details[0]}).exec(function (err, count) {
                if (!err && count > 0) {
                  return res.send("success");
                }else {
                  shop_history_payments.findOne({trade_no: result_details[0]}).exec(function (e1,payment){
                    sails.log.debug(payment);
                    Shop_history_refunds.create({
                      orderId: payment.orderId,
                      memberId: payment.memberId,
                      money: payment.money,
                      payType: payment.payType,
                      payName: payment.payType,
                      payAccount: payment.payType,
                      payIp: req.ip,
                      payAt: moment().format('X'),
                      memo: '支付宝退款：￥' + StringUtil.setPrice(result_details[1]),
                      finishAt: moment().format('X'),
                      disabled: false
                    }).exec(function (e3, o3) {
                      return res.send("success");
                    });
                  });
                }
              });
            }else {
              return res.send("fail");
            }
          }
        });
      }
    });
  },
  aliRefund:function(req,res){
    sails.log.debug(req.body);
    var upd_pay_status = function(order,payStatus){
      Shop_order.update({id: order.id}, {
        payStatus: payStatus,
        updateAt: moment().format('X')
      }).exec(function (e, o) {});
    };

    //更新库存
    var upd_stock = function(order){
      Shop_order_goods.find({orderId: order.id}).exec(function (orderErr, orderGoogs) {
        var i = 0;
        orderGoogs.forEach(function (goodsObj) {
          var ssql = "UPDATE shop_goods_products SET stock=stock+"+StringUtil.getInt(goodsObj.num);
          ssql += " WHERE goodsId="+goodsObj.goodsId+" and id="+goodsObj.productId;
          Shop_goods_products.query(ssql, function (e, o) {});
        });
      });
    };

    var upd_score = function(order){
      Shop_member.update(order.memberId.id, {
        score: order.memberId.score - order.score
      }).exec(function (e4, o4) {
        Shop_member_score_log.create({
          memberId: order.memberId.id,
          orderId: order.id,
          oldScore: order.memberId.score,
          newScore: order.memberId.score - order.score,
          diffScore: order.score,
          note: '取消订单:' + order.id,
          createdBy: 0,
          createdAt: moment().format('X')
        }).exec(function (err, obj) { });
      });
    };

    var order_log = function (order,result) {
      Shop_order_log.create({
        orderId: order.id,
        opTag: 'cancel',
        opContent: '取消订单',
        opType: 'admin',
        opId: '0',
        opNickname: order.memberId.nickname,
        opAt: moment().format('X'),
        opResult: result
      }).exec(function (e, obj) {});
    };

    //退款操作日志
    var refund_log = function(order,vPayType,vPayName,vMemo){
      Shop_history_refunds.create({
        orderId: order.id,
        memberId: order.memberId.id,
        money: order.finishAmount,
        payType: vPayType,
        payName: vPayName,
        payAccount: order.memberId.nickname,
        payIp: req.ip,
        payAt: moment().format('X'),
        memo: vMemo + StringUtil.setPrice(order.finishAmount),
        finishAt: moment().format('X'),
        disabled: false
      }).exec(function (e3, o3) { });
    };

    var result_details = req.body.result_details.split("^");
    if (result_details[2]=='SUCCESS') {
      Shop_history_refunds.count({trade_no: result_details[0]}).exec(function (err, count) {
        if (!err && count > 0) {
          return res.send("success");
        }else {
          Shop_history_payments.findOne({trade_no: result_details[0]}).exec(function (e1,payment){
            sails.log.debug(payment);

            Shop_order.findOne(payment.orderId)
            .populate('memberId')
            .exec(function (e, order) {
              upd_score(order);
              refund_log(order,'pay_alipay','支付宝退款',result_details[1]+":"+result_details[0]);
              upd_pay_status(order,'3');
              order_log(order,'ok');
              return res.send("success");
            });
          });
        }
      });
    }
  }
};
