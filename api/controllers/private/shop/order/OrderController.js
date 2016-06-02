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
    if(req.body.shopShip!='true'){
      if(!req.body.orderlist){return  res.json({code: 1,msg:'发货失败：未选择发货订单'}); }
      if(!req.body.shiptypeNo) {return  res.json({code: 1,msg:'发货失败：未填写物流单号'}); }
    }

    var shiptypeId =  req.body.shiptypeId;
    var shiptypeNo = req.body.shiptypeNo;
    var orderList = req.body.orderlist;
    var i = 0;
    if(req.body.shopShip=='true'){
      var shiptypeId =  -1;
      var shiptypeNo = "'商家自发货'";
    }
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
          return res.json({code: 0});
        }
        });
      }
    );
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
  cancel: function (req,res) {

    //更新订单状态
    var upd_status = function(order,status){
      Shop_order.update({id: order.id}, {
        status: status,
        updateAt: moment().format('X')
      }).exec(function (e, o) {});
    };

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

    //更新预存款
    var upd_momey = function(order){
      Shop_member.update(order.member.id, {
        money: order.member.money + order.finishAmount
        }).exec(function (e4, o4) {
        Shop_member_money_log.create({
          memberId: order.member.id,
          orderId: order.id,
          oldMoney: order.member.money,
          newMoney: order.member.money + order.finishAmount,
          diffMoney: order.finishAmount,
          note: '取消订单:' + order.id,
          createdBy: 0,
          createdAt: moment().format('X')
        }).exec(function (e, o) {});
      });
    };

    //更新积分
    var upd_score = function(order){
      Shop_member.update(order.member.id, {
        score: order.member.score - order.score
      }).exec(function (e4, o4) {
        Shop_member_score_log.create({
          memberId: order.member.id,
          orderId: order.id,
          oldScore: order.member.score,
          newScore: order.member.score - order.score,
          diffScore: order.score,
          note: '取消订单:' + order.id,
          createdBy: 0,
          createdAt: moment().format('X')
        }).exec(function (err, obj) { });
      });
    };

    //订单日志
    var order_log = function (order,result) {
      Shop_order_log.create({
        orderId: order.id,
        opTag: 'cancel',
        opContent: '取消订单',
        opType: 'admin',
        opId: '0',
        opNickname: req.data.user.nickname,
        opAt: moment().format('X'),
        opResult: result
      }).exec(function (e, obj) {});
    };

    //退款操作日志
    var refund_log = function(order,vPayType,vPayName,vMemo){
      Shop_history_refunds.create({
        orderId: order.id,
        memberId: order.member.id,
        money: order.finishAmount,
        payType: vPayType,
        payName: vPayName,
        payAccount: order.member.nickname,
        payIp: req.ip,
        payAt: moment().format('X'),
        memo: vMemo + StringUtil.setPrice(order.finishAmount),
        finishAt: moment().format('X'),
        disabled: false
      }).exec(function (e3, o3) { });
    };

    //预存款退款
    var refund_pay_money = function (order) {
      upd_score(order);
      upd_momey(order);
      refund_log(order,'pay_money','余额支付','退款到账户余额:￥');
      upd_pay_status(order,'3');
      order_log(order,'ok');
      return res.json({code:0});
    };

    //现金
    var refund_pay_cash = function (order) {
      upd_score(order);
      refund_log(order,'pay_cash','货到付款','货到付款退款:￥');
      upd_pay_status(order,'3');
      order_log(order,'ok');
      return res.json({code:0});
    };

    //微信
    var refund_pay_wxpay = function (order) {
      Shop_history_payments.findOne({orderId: order.id})
      .exec(function (err, payHistory) {
        WxpayService.init(function (err, wxpay) {
          if (err) return res.json({code: 1, msg: ''});
          var params = {
            appid: wxpay.options.appid,
            mch_id: wxpay.options.mch_id,
            op_user_id: wxpay.options.mch_id,
            out_refund_no: order.id,
            total_fee: payHistory.money, //原支付金额
            refund_fee: payHistory.money, //退款金额
            transaction_id: payHistory.trade_no
          };
          wxpay.refund(params, function (err, result) {
            if(result.return_code=='SUCCESS'&&result.result_code=='SUCCESS'){
              upd_score(order);
              refund_log(order,'pay_wxpay','微信支付',result.refund_id);
              upd_pay_status(order,'3');
              order_log(order,'ok');
              return res.json({code:0});
            }else {
              return res.json({msg:'微信退款失败，请手动处理'});
            }
          });
        });
      });
    };

    var refund_pay_alipay = function(order){
      Shop_history_payments.findOne({orderId: order.id})
      .exec(function (err, payHistory) {
        AlipayService.init_refund(function (err, alipay) {
          if (err) return res.json({code: 3, msg: '错误，支付宝加载失败'});
          var detailData = payHistory.trade_no + '^' + payHistory.money / 100 + '^' + '备注';
          var data = {
            refund_date: moment().format('YYYY-MM-DD HH:mm:ss'),
            batch_no: moment().format('YYYYMMDD') + order.id + '1',
            batch_num: 1,
            detail_data: detailData
          };
          var result = alipay.refund_fastpay_by_platform_pwd(data, res);
          return res.json({code: 'alipay', msg: result});
        });
      });
    };

    //退款业务操作
    Shop_order.findOne(req.params.id)
    .populate('memberId')
    .exec(function (e, order) {
      if (!order.memberId) return res.json({code: 3, msg: '错误，无对应用户!'});
      order.member = order.memberId;
      if(e||!order){
        return res.json({code: 3, msg: '订单不存在'});
      }else {
        upd_stock(order);
        upd_status(order,'dead');
        upd_pay_status(order,'2');
        if (order.payStatus==0) {
          upd_pay_status(order,'3');
          order_log(order,'ok');
        } else {
          switch (order.payType) {
            case 'pay_money':
            refund_pay_money(order);
            break;
            case 'pay_cash':
            refund_pay_cash(order);
            break;
            case 'pay_wxpay':
            refund_pay_wxpay(order);
            break;
            case 'pay_alipay':
            refund_pay_alipay(order);
            break;
            default:
            return res.json({msg: '退款失败!'});
          }
        }
      }
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
