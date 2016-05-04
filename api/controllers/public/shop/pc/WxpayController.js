/**
 * 微信扫码支付异步通知处理
 * Created by root on 3/21/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
var util = require('weixin-pay/lib/util');
module.exports = {
  order: function (req, res, next) {
    var body = req.body.toString('utf-8');

    WxpayService.init(function (err, wxpay) {
      if (err) {
        return res.end(util.buildXML({xml: {return_code: 'FAIL'}}));
      } else {
        util.parseXML(body, function (e, msg) {
          sails.log.debug('weixin-pay:::' + JSON.stringify(msg));
          if (e)
            return res.end(util.buildXML({xml: {return_code: 'FAIL'}}));
          if (msg.result_code == 'SUCCESS') {
            var id = msg.out_trade_no;
            var transaction_id = msg.transaction_id;
            if (msg.attach && msg.attach.indexOf('余额充值,会员ID:') > -1) {
              var memberId = msg.attach.substring(msg.attach.indexOf(':') + 1);
              Shop_member.findOne(memberId).exec(function (e_1, m) {
                if (e_1) {
                  return res.end(util.buildXML({xml: {return_code: 'FAIL'}}));
                }
                Shop_member_money_log.findOne({memberId: m.id, trade_no: transaction_id}).exec(function (e_2, mlog) {
                  if (mlog) {
                    return res.end(util.buildXML({xml: {return_code: 'SUCCESS'}}));
                  }
                  Shop_member.update(memberId, {money: m.money + StringUtil.getInt(msg.total_fee)}).exec(function (e_3, m2) {
                    //余额日志
                    Shop_member_money_log.create({
                      memberId: m.id,
                      orderId: 0,
                      oldMoney: m.money,
                      newMoney: m.money + StringUtil.getInt(msg.total_fee),
                      diffMoney: StringUtil.getInt(msg.total_fee),
                      note: '余额充值(微信支付)',
                      trade_no: transaction_id,
                      createdBy: 0,
                      createdAt: moment().format('X')
                    }).exec(function (em, om) {
                      return res.end(util.buildXML({xml: {return_code: 'SUCCESS'}}));
                    });
                  });
                });
              });
            } else {
              Shop_order.findOne(id).exec(function (order_err, order) {
                if (order) {
                  Shop_member.findOne(order.memberId).exec(function (e2, m) {
                    if (order.payStatus == 1) {
                      return res.end(util.buildXML({xml: {return_code: 'SUCCESS'}}));
                    } else {
                      //更新订单、积分、日志等
                      Shop_history_payments.create({
                        orderId: order.id,
                        memberId: order.memberId,
                        money: order.finishAmount,
                        payType: 'pay_wxpay',
                        payName: '微信扫码支付',
                        payAccount: msg.openid,
                        payIp: StringUtil.getIp(req),
                        payAt: moment().format('X'),
                        memo: '微信扫码支付:￥' + StringUtil.setPrice(order.finishAmount),
                        finishAt: moment().format('X'),
                        disabled: false,
                        trade_no: transaction_id
                      }).exec(function (e3, o3) {
                        //更新订单
                        Shop_order.update(id, {
                          payAmount: order.finishAmount,
                          payStatus: 1,//0 待付款 1已付款 2申请退款 3已退款
                          payType: 'pay_wxpay',
                          updateAt: moment().format('X')
                        }).exec(function (e5, o5) {
                          if (e2 || e3 || e5) {
                            /*订单日志表
                             opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
                             opType:admin,member
                             opResult:ok,fail
                             */
                            Shop_order_log.create({
                              orderId: order.id, opTag: 'payment', opContent: '订单付款:微信扫码支付', opType: 'member',
                              opId: order.memberId,
                              opNickname: m.nickname,
                              opAt: moment().format('X'),
                              opResult: 'fail'
                            }).exec(function (el1, ol1) {
                            });
                            return res.end(util.buildXML({xml: {return_code: 'FAIL'}}));
                          } else {
                            /*订单日志表
                             opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
                             opType:admin,member
                             opResult:ok,fail
                             */
                            Shop_order_log.create({
                              orderId: order.id, opTag: 'payment', opContent: '订单付款:微信扫码支付', opType: 'member',
                              opId: order.memberId,
                              opNickname: m.nickname,
                              opAt: moment().format('X'),
                              opResult: 'ok'
                            }).exec(function (el1, ol1) {

                            });
                            //更新会员信息 余额 积分
                            Shop_member.update(order.memberId, {
                              score: m.score + order.score,
                              order_num: m.order_num + 1
                            }).exec(function (e4, o4) {
                              if (order.score > 0) {
                                //积分日志
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
                            });

                            return res.end(util.buildXML({xml: {return_code: 'SUCCESS'}}));
                          }
                        });
                      });
                    }
                  });
                } else {
                  return res.end(util.buildXML({xml: {return_code: 'FAIL'}}));
                }
              });
            }
          } else {
            return res.end(util.buildXML({xml: {return_code: 'FAIL'}}));
          }
        });
      }
    });
  }
};
