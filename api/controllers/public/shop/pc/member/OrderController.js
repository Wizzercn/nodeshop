/**
 * Created by root on 3/23/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    var m = req.session.member;
    if (!m || m.memberId < 1) {
      return res.redirect('/login');
    }
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      //获取所有商品分类
      allClassList: function (done) {
        Shop_goods_class.getAllClass(function (list) {
          done(null, list);
        });
      },
      dbMember: function (done) {
        Shop_member.findOne(m.memberId).populate('lv_id').exec(function (e, o) {
          done(null, o);
        });
      }
    }, function (err, result) {
      req.data.orderType=req.query.orderType||'all';
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.dbMember = result.dbMember || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.siteTitle = '我的订单_' + req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/member_order', req.data);

    });
  },
  list: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var pageSize = 5;
    var start = StringUtil.getInt(req.query.start);
    var sort = {createdAt: 'desc'};
    var where = {memberId: member.memberId, disabled: false};
    var type = req.query.type;
    if (type == 'nopay') {
      where.status = 'active';
      where.payStatus = 0;
      where.shipStatus = 0;
    }
    if (type == 'ship') {
      where.status = 'active';
      where.shipStatus = [1, 2];
    }
    if (type == 'all') {
    }
    if (type == 'finish') {
      where.status = 'finish';
    }
    if (type == 'dead') {
      where.status = 'dead';
    }
    Shop_order.getPageList(pageSize, start, where, sort, function (obj) {
      return res.json({code: 0, msg: '', data: obj});
    });
  },
  dead: function (req, res) {
    var m = req.session.member;
    if (!m || m.memberId < 1) {
      return res.json({code: 1, msg: '登录已失效，请重新登录'});
    }
    var id = req.params.id || '';
    Shop_member.findOne(m.memberId).exec(function (eme, member) {
      Shop_order.findOne(id).exec(function (errorder, order) {
        if(errorder){
          return res.json({code: 3, msg: '订单不存在'});
        }
        if (order.shipStatus != 0) {
          return res.json({code: 2, msg: '订单已发货，不能取消，请联系客服'});
        }
        Shop_order.update({id: id, memberId: m.memberId}, {
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
              orderId: id, opTag: 'cancel', opContent: '取消订单', opType: 'member',
              opId: member.id,
              opNickname: member.nickname,
              opAt: moment().format('X'),
              opResult: 'fail'
            }).exec(function (el1, ol1) {
              return res.json({code: 3, msg: '系统异常'});
            });
          } else {

            if (order.payStatus == 1) {
              /*订单日志表
               opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
               opType:admin,member
               opResult:ok,fail
               */
              Shop_order_log.create({
                orderId: id, opTag: 'cancel', opContent: '取消订单', opType: 'member',
                opId: member.id,
                opNickname: member.nickname,
                opAt: moment().format('X'),
                opResult: 'ok'
              }).exec(function (el1, ol1) {
              });
              //已支付的订单分别处理
              if (order.payType == 'pay_cash') {
                //货到付款，此时没有结算积分，所以不用处理
                return res.json({code: 0, msg: ''});
              } else if (order.payType == 'pay_money') {
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
                  return res.json({code: 0, msg: ''});
                });
              } else {
                //如果是微信支付、支付宝支付
                return res.json({code: 0, msg: ''});
              }
            } else {
              /*订单日志表
               opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
               opType:admin,member
               opResult:ok,fail
               */
              Shop_order_log.create({
                orderId: id, opTag: 'cancel', opContent: '取消订单', opType: 'member',
                opId: member.id,
                opNickname: member.nickname,
                opAt: moment().format('X'),
                opResult: 'ok'
              }).exec(function (el1, ol1) {
                return res.json({code: 0, msg: ''});
              });
            }
          }
        });
      });
    });
  },
  receive: function (req, res) {
    var m = req.session.member;
    if (!m || m.memberId < 1) {
      return res.json({code: 1, msg: '登录已失效，请重新登录'});
    }
    var id = req.params.id || '';
    Shop_member.findOne(m.memberId).exec(function (eme, member) {
      Shop_order.update({id: id, memberId: m.memberId}, {
        receivedStatus: 1,
        receivedAt: moment().format('X'),
        updateAt: moment().format('X')
      }).exec(function (e, o) {
        if (e) {
          /*订单日志表
           opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
           opType:admin,member
           opResult:ok,fail
           */
          Shop_order_log.create({
            orderId: id, opTag: 'receive', opContent: '确认收货', opType: 'member',
            opId: member.id,
            opNickname: member.nickname,
            opAt: moment().format('X'),
            opResult: 'fail'
          }).exec(function (el1, ol1) {
            return res.json({code: 3, msg: '系统异常'});
          });
        } else {
          Shop_order_log.create({
            orderId: id, opTag: 'receive', opContent: '确认收货', opType: 'member',
            opId: member.id,
            opNickname: member.nickname,
            opAt: moment().format('X'),
            opResult: 'ok'
          }).exec(function (el1, ol1) {
          });
          return res.json({code: 0, msg: ''});
        }
      });
    });
  },
  del: function (req, res) {
    var m = req.session.member;
    if (!m || m.memberId < 1) {
      return res.json({code: 1, msg: '登录已失效，请重新登录'});
    }
    var id = req.params.id || '';
    Shop_member.findOne(m.memberId).exec(function (eme, member) {
      Shop_order.findOne(id).exec(function (errorder, order) {
        if(errorder){
          return res.json({code: 3, msg: '订单不存在'});
        }
        if (order.payStatus != 0 || order.shipStatus != 0) {
          return res.json({code: 2, msg: '此订单不可删除'});
        }
        Shop_order.update({id: id, memberId: m.memberId}, {
          disabled: true,
          updateAt: moment().format('X')
        }).exec(function (e, o) {
          if (e) {
            /*订单日志表
             opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel,delete
             opType:admin,member
             opResult:ok,fail
             */
            Shop_order_log.create({
              orderId: id, opTag: 'delete', opContent: '删除订单', opType: 'member',
              opId: member.id,
              opNickname: member.nickname,
              opAt: moment().format('X'),
              opResult: 'fail'
            }).exec(function (el1, ol1) {
              return res.json({code: 3, msg: '系统异常'});
            });
          } else {
            Shop_order_log.create({
              orderId: id, opTag: 'delete', opContent: '删除订单', opType: 'member',
              opId: member.id,
              opNickname: member.nickname,
              opAt: moment().format('X'),
              opResult: 'ok'
            }).exec(function (el1, ol1) {
            });
            return res.json({code: 0, msg: ''});
          }
        });
      });
    });
  }
};
