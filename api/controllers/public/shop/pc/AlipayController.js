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
        alipay.create_direct_pay_by_user_notify(req, function(verify_result){
          sails.log.debug('verify_result::'+verify_result);
          sails.log.debug('req.body::'+JSON.stringify(req.body));
          if(verify_result&&req.body.seller_id==alipay.alipay_config.partner) {//验证成功

            //商户订单号
            var id = req.body.out_trade_no||'';
            //支付宝交易号
            var trade_no = req.body.trade_no||'';
            //交易状态
            var trade_status = req.body.trade_status||'';
            var buyer_email=req.body.buyer_email||'';
            if(trade_status  == 'TRADE_FINISHED'){
              //交易成功后一个月，支付宝通知finished
              return res.send("success");
            }
            else if(trade_status == 'TRADE_SUCCESS'){
              //交易成功后更新订单、积分、会员等
              Shop_order.findOne(id).exec(function (order_err, order) {
                if (order) {
                  Shop_member.findOne(order.memberId).exec(function (e2, m) {
                    if (order.status == 1) {
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
                              if(order.score>0){
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
          else {
            //验证失败
            return res.send("fail");
          }
        });
      }
    });
  }
};
