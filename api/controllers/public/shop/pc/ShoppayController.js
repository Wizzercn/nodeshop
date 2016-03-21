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
              if(order.payStatus!=0){
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
                          });
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
      Shop_order.update({id:id,memberId:member.memberId}, {
        payType: 'pay_cash',
        updateAt: moment().format('X')
      }).exec(function (e,o) {
        if(e){
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
        }else {
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
    }else {
      return res.json({code: 1, msg: ''});
    }
  }
};
