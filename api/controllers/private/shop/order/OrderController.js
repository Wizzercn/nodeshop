/**
 * Created by root on 20/4/16.
 */
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    //sails.log.debug(req.query);
    req.data.navStatus = req.query.navStatus;
    req.data.moment = moment;
    req.data.StringUtil = StringUtil;
    return res.view('private/shop/order/order/index', req.data);
  },
  data: function (req, res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {};
    var status = req.body.status || '0';
    switch (status) {
      case 'unship':
        where = {
          disabled: false,
          status: 'active',
          shipStatus: 0,
          or: [
            {
              payStatus: 1,
              payType: {'!': 'pay_cash'}
            },
            {
              payStatus: 0,
              payType: 'pay_cash'
            }
          ]
        };
        break;
      case 'shiped':
        where = {shipStatus: 1, status: 'active',disabled: false};
        break;
      case 'unpay':
        where = {payStatus: 0, status: 'active',disabled: false};
        break;
      case 'payed':
        where = {payStatus: 1, status: 'active',disabled: false};
        break;
      case 'finish':
        where = {payStatus: 1, status: 'finish',disabled: false};
        break;
      case 'all':
        where = {};
        break;
      default:
        where = {shipStatus: 0, status: 'active'};
    }
    if (req.body.id) {
      where.id = req.body.id;
    }
    // var where = {shipStatus:orderStatus};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Shop_order.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_order.find(where)
          .sort(sort)
          .sort('createdAt desc')
          .paginate({page: page, limit: pageSize})
          .exec(function (err, list) {
            return res.json({
              "draw": draw,
              "recordsTotal": pageSize,
              "recordsFiltered": count,
              "data": list
            });
          });
      } else {
        return res.json({
          "draw": draw,
          "recordsTotal": pageSize,
          "recordsFiltered": 0,
          "data": []
        });
      }
    });
  },
  detail: function (req, res) {
    Shop_order.findOne({id:req.params.id})
      .populate('memberId')
      .populate('goods')
      .exec(function (err, obj) {
        req.data.obj = obj || {};
        req.data.moment = moment;
        req.data.StringUtil = StringUtil;
        return res.view('private/shop/order/order/detail', req.data);
      });
  },
  send: function (req, res) {
    var orderObj = {};
    //查出订单信息
    Shop_order.findOne(req.params.id)
      .populate('memberId')
      .exec(function (err, obj) {
        orderObj = obj || {};
        Shop_logistics.find().exec(function (err, obj) {
          var where = {
            disabled: false,
            status: 'active',
            shipStatus: 0,
            or: [
              {
                payStatus: 1,
                payType: {'!': 'pay_cash'}
              },
              {
                payStatus: 0,
                payType: 'pay_cash'
              }
            ],
            addrCity: orderObj.addrCity,
            addrArea: orderObj.addrArea,
            addrAddr: orderObj.addrAddr,
            addrName: orderObj.addrName,
            addrMobile: orderObj.addrMobile,
            payStatus: orderObj.payStatus
          };
          orderObj['ship'] = obj;
          //查找可合并发货订单
          Shop_order.find({where})
            .populate('goods')
            .exec(function (orderlisterr, orderlistobj) {
              orderObj['orderList'] = orderlistobj || {};
              req.data.moment = moment;
              req.data.StringUtil = StringUtil;
              req.data.obj = orderObj;
              sails.log.debug(req.data.obj);
              return res.view('private/shop/order/order/send', req.data);
            });
        });
      });
  },
  doSend: function (req, res) {
    if(!req.body.orderlist){return  res.json({code: 1,msg:'发货失败：未选择发货订单'}); }
    if(!req.body.shiptypeNo) {return  res.json({code: 1,msg:'发货失败：未填写物流单号'}); }

    var shiptypeId =  req.body.shiptypeId;
    var shiptypeNo = req.body.shiptypeNo;
    var orderList = req.body.orderlist;
    var i = 0;
    orderList.forEach(function (orderId) {
      var ssql = 'update Shop_order o,Shop_order_goods og ';
      ssql = ssql + 'set o.shipStatus=1,o.shiptypeId=' + shiptypeId;
      ssql = ssql + ',o.shiptypeNo=' + shiptypeNo;
      ssql = ssql + ',og.sendNum = og.num where o.id = og.orderId and o.id = ' + orderId;
      Shop_order_goods.query(ssql, function () {
        Shop_order_ship_log.create({
          orderId: orderId,
          shiptypeNo: req.body.shiptypeNo,
          memo: '已发货',
          createAt: moment().format('X')
        }).exec(function (el1, ol1) {
        });
        if (orderList.length == ++i) {
          return res.json({code: 0});}
      });
    });
  },
  pay: function (req, res) {
    Shop_order.findOne(req.params.id)
      .populate('memberId')
      .populate('goods')
      .exec(function (err, obj) {
        req.data.obj = obj || {};
        req.data.moment = moment;
        req.data.StringUtil = StringUtil;
        return res.view('private/shop/order/order/pay', req.data);
      });
  },
  doPay: function (req, res) {
    var ssql = 'update Shop_order set payAmount=finishAmount,payStatus=1 where id = ' + req.body.id;
    Shop_order.query(ssql, function (err, list) {
      Shop_order.findOne({id: req.body.id}).exec(function (err, order) {
        Shop_history_payments.create({
          orderId: order.id,
          memberId: order.memberId,
          money: order.payAmount,
          payType: 'pay_cash',
          payName: '货到付款',
          payAccount: '管理员支付',
          payIp: req.ip,
          payAt: moment().format('X'),
          memo: '货到付款支付:￥' + StringUtil.setPrice(order.payAmount),
          finishAt: moment().format('X'),
          disabled: false,
          trade_no: ''
        }).exec(function (er, obj) {
          if(er){return res.json({msg: '订单不存在'});}
          return res.json({code: 0});
        });
      });
    });
  },
  cancel: function (req, res) {
    var id = req.params.id;
    Shop_order.findOne(req.params.id)
      .populate('memberId')
      .exec(function (err, order) {
        if (err) {
          res.json({msg: '订单不存在'});
        }
        var member = order.memberId;
        Shop_order.update({id: req.params.id}, {
          status: 'dead',
          updateAt: moment().format('X')
        }).exec(function (e, o) {
          if (e) {
            /*订单日志表
             opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
             opType:admin,member
             opResult:ok,fail
             */
            Shop_order_log.create({
              orderId: id, opTag: 'cancel', opContent: '取消订单', opType: 'admin',
              opId: '0',
              opNickname: '管理员',
              opAt: moment().format('X'),
              opResult: 'fail'
            }).exec(function (el1, ol1) {
              return res.json({code: 3, msg: '系统异常'});
            });
          } else {
            //退库存
            Shop_order_goods.find({orderId: id}).exec(function (orderErr, orderGoogs) {
              orderGoogs.forEach(function (goodsObj) {
                var ssql = "UPDATE shop_goods_products SET stock=stock+"+StringUtil.getInt(goodsObj.num);
                ssql += " WHERE goodsId="+goodsObj.goodsId+" and id="+goodsObj.productId;
                sails.log.debug(ssql);
                Shop_goods_products.query(ssql, [StringUtil.getInt(goodsObj.num), goodsObj.goodsId, goodsObj.productId], function (gErr, g) {
                });
              });
            });
            if (order.payStatus == 1) {
              /*订单日志表
               opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
               opType:admin,member
               opResult:ok,fail
               */
              Shop_order_log.create({
                orderId: id, opTag: 'cancel', opContent: '取消订单', opType: 'admin',
                opId: '0',
                opNickname: '管理员',
                opAt: moment().format('X'),
                opResult: 'ok'
              }).exec(function (el1, ol1) {
              });
              //已支付的订单分别处理
              if (order.payType == 'pay_cash') {
                //货到付款，此时没有结算积分，所以不用处理
                // Shop_member.update()
                Shop_member.update(member.id, {
                  score: member.score - order.score
                }).exec(function (e4, o4) {

                  if (order.score > 0) {
                    Shop_member_score_log.create({
                      memberId: member.id,
                      orderId: order.id,
                      oldScore: member.score,
                      newScore: member.score - order.score,
                      diffScore: order.score,
                      note: '取消订单:' + id,
                      createdBy: 0,
                      createdAt: moment().format('X')
                    }).exec(function (es, os) {

                    });
                  }
                  return res.json({code: 0, msg: ''});
                });
                // return res.json({code: 0, msg: ''});
              }
              else if (order.payType == 'pay_money') {
                //余额支付，退回支付金额，减去积分
                Shop_member.update(member.id, {
                  money: member.money + order.finishAmount,
                  score: member.score - order.score
                }).exec(function (e4, o4) {

                  if (order.score > 0) {
                    Shop_member_score_log.create({
                      memberId: member.id,
                      orderId: order.id,
                      oldScore: member.score,
                      newScore: member.score - order.score,
                      diffScore: order.score,
                      note: '取消订单:' + id,
                      createdBy: 0,
                      createdAt: moment().format('X')
                    }).exec(function (es, os) {

                    });
                  }
                  //余额日志
                  Shop_member_money_log.create({
                    memberId: member.id,
                    orderId: order.id,
                    oldMoney: member.money,
                    newMoney: member.money + order.finishAmount,
                    diffMoney: order.finishAmount,
                    note: '取消订单:' + id,
                    createdBy: 0,
                    createdAt: moment().format('X')
                  }).exec(function (em, om) {

                  });
                  Shop_history_refunds.create({
                    orderId: order.id,
                    memberId: member.id,
                    money: order.finishAmount,
                    payType: 'pay_money',
                    payName: '余额支付',
                    payAccount: member.nickname,
                    payIp: req.ip,
                    payAt: moment().format('X'),
                    memo: '退款到账户余额:￥' + StringUtil.setPrice(order.finishAmount),
                    finishAt: moment().format('X'),
                    disabled: false
                  }).exec(function (e3, o3) {

                  });
                  Shop_order.update({id: id}, {
                    payStatus: 3,
                    updateAt: moment().format('X')
                  }).exec(function (err, obj) {

                  });
                  return res.json({code: 0, msg: ''});
                });
              }
              else {
                //如果是微信支付、支付宝支付
                if (order.payType == 'pay_wxpay') {
                  Shop_history_payments.findOne({orderId: id})
                    .exec(function (err, payHistory) {
                      WxpayService.init(function (err, wxpay) {
                        if (err) {
                          return res.json({code: 1, msg: ''});
                        } else {
                          var params = {
                            appid: wxpay.options.appid,
                            mch_id: wxpay.options.mch_id,
                            op_user_id: wxpay.options.mch_id,
                            out_refund_no: id,
                            total_fee: payHistory.money, //原支付金额
                            refund_fee: payHistory.money, //退款金额
                            transaction_id: payHistory.trade_no
                          };
                          wxpay.refund(params, function (err, result) {
                            Shop_member.update(member.id, {
                              score: member.score - order.score
                            }).exec(function (e4, o4) {

                              if (order.score > 0) {
                                Shop_member_score_log.create({
                                  memberId: member.id,
                                  orderId: order.id,
                                  oldScore: member.score,
                                  newScore: member.score - order.score,
                                  diffScore: order.score,
                                  note: '取消订单:' + id,
                                  createdBy: 0,
                                  createdAt: moment().format('X')
                                }).exec(function (es, os) {

                                });
                              }
                              Shop_history_refunds.create({
                                orderId: order.id,
                                memberId: member.id,
                                money: order.finishAmount,
                                payType: 'pay_wxpay',
                                payName: '微信支付',
                                payAccount: member.nickname,
                                payIp: req.ip,
                                payAt: moment().format('X'),
                                memo: '微信退款:￥' + StringUtil.setPrice(order.finishAmount),
                                finishAt: moment().format('X'),
                                disabled: false
                              }).exec(function (e3, o3) {
                                Shop_order.update({id: id}, {
                                  payStatus: 3,
                                  updateAt: moment().format('X')
                                }).exec(function (err, obj) {
                                  return res.json({code: 0, msg: ''});
                                });
                              });

                            });
                          });
                        }
                      });
                    });
                }
                else if (order.payType == 'pay_alipay') {
                  Shop_history_payments.findOne({orderId: id})
                    .exec(function (err, payHistory) {
                      AlipayService.init_refund(function (err, alipay) {
                        if (err) {
                          return res.send("支付宝加载失败，请重试。");
                        } else {
                          var detailData = payHistory.trade_no + '^' + payHistory.money / 100 + '^' + '备注';
                          var data = {
                            refund_date: moment().format('YYYY-MM-DD HH:mm:ss'),
                            batch_no: moment().format('YYYYMMDD') + id + '1',
                            batch_num: 1,
                            detail_data: detailData
                          };
                          var result = alipay.refund_fastpay_by_platform_pwd(data, res);
                          // return  res.json({code: '1', msg: result});


                          Shop_member.update(member.id, {
                            score: member.score - order.score
                          }).exec(function (e4, o4) {

                            if (order.score > 0) {
                              Shop_member_score_log.create({
                                memberId: member.id,
                                orderId: order.id,
                                oldScore: member.score,
                                newScore: member.score - order.score,
                                diffScore: order.score,
                                note: '取消订单:' + id,
                                createdBy: 0,
                                createdAt: moment().format('X')
                              }).exec(function (es, os) {

                              });
                            }
                            Shop_history_refunds.create({
                              orderId: order.id,
                              memberId: member.id,
                              money: order.finishAmount,
                              payType: 'pay_alipay',
                              payName: '支付宝支付',
                              payAccount: member.nickname,
                              payIp: req.ip,
                              payAt: moment().format('X'),
                              memo: '支付宝退款:￥' + StringUtil.setPrice(order.finishAmount),
                              finishAt: moment().format('X'),
                              disabled: false
                            }).exec(function (e3, o3) {

                            });
                            Shop_order.update({id: id}, {
                              payStatus: 3,
                              updateAt: moment().format('X')
                            }).exec(function (err, obj) {
                              return res.json({code: 'alipay', msg: result});
                              // return res.json({code: 0, msg: ''});
                            });


                          });

                        }
                      });
                    });
                }
              }
            } else {
              /*订单日志表
               opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
               opType:admin,member
               opResult:ok,fail
               */
              Shop_order_log.create({
                orderId: id, opTag: 'cancel', opContent: '取消订单', opType: 'admin',
                opId: '0',
                opNickname: '管理员操作',
                opAt: moment().format('X'),
                opResult: 'ok'
              }).exec(function (el1, ol1) {
                return res.json({code: 0, msg: ''});
              });
            }
          }
        });
      });
  },
  doAliRefund: function (req, res) {
    Shop_history_refunds.create({
      orderId: 1,
      memberId: 1,
      money: 1,
      payType: 'pay_alipay',
      payName: '支付宝退款',
      payAccount: 'req.body',
      payIp: '1',
      payAt: moment().format('X'),
      memo: '支付宝退款回调',
      finishAt: moment().format('X'),
      disabled: false
    }).exec(function (e3, o3) {

    });
  },
  print: function (req, res) {
    req.data.layout = 'layouts/layout';

    var ordid = req.params.id;
    Shop_order.findOne(req.params.id)
      .populate('memberId')
      .populate('goods')
      .exec(function (err, obj) {
        req.data.obj = obj || {};
        req.data.moment = moment;
        req.data.StringUtil = StringUtil;
        return res.view('private/shop/order/order/print', req.data);
      });
  }
};
