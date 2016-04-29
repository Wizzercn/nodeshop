/**
* Created by root on 20/4/16.
*/
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    return res.view('private/shop/order/order/index', req.data);
  },
  data: function (req,res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {};
    var orderStatus = req.body.orderStatus||'0';
    switch (orderStatus) {
      case '0':
      where = {shipStatus:0};
      break;
      case '1':
      where = {shipStatus:1};
      break;
      case '2':
      where = {payStatus:0};
      break;
      case '3':
      where = {payStatus:1};
      break;
      case 'all':
      where = {};
      break;
      default:
      where = {shipStatus:0};

    }
    // var where = {shipStatus:orderStatus};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Shop_order.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_order.find(where)
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
    Shop_order.findOne(req.params.id)
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
      orderObj = obj||{};
      Shop_order_ship.find().exec(function (err,obj) {
        var where = {
          shipStatus:0,
          addrCity:orderObj.addrCity,
          addrArea:orderObj.addrArea,
          addrAddr:orderObj.addrAddr,
          addrName:orderObj.addrName,
          addrMobile:orderObj.addrMobile,
          payStatus:orderObj.payStatus,
        }
        orderObj['ship'] = obj;
        //查找可合并发货订单
        Shop_order.find({
          shipStatus:0,
          addrCity:orderObj.addrCity,
          addrArea:orderObj.addrArea,
          addrAddr:orderObj.addrAddr,
          addrName:orderObj.addrName,
          addrMobile:orderObj.addrMobile,
          payStatus:orderObj.payStatus,

        })
        .populate('goods')
        .exec(function (orderlisterr, orderlistobj) {
          orderObj['orderList'] = orderlistobj||{};
          req.data.moment = moment;
          req.data.StringUtil = StringUtil;
          req.data.obj = orderObj;
          return res.view('private/shop/order/order/send', req.data);
        });
      });
    });
  },


  doSend: function(req,res){
    var orderList = req.body.orderlist;
    var i = 0;
    orderList.forEach(function(orderId){
      var ssql = 'update Shop_order o,Shop_order_goods og ';
      ssql = ssql+'set o.shipStatus=1,o.shiptypeId='+req.body.shiptypeId;
      ssql = ssql+',o.shiptypeNo='+req.body.shiptypeNo;
      ssql = ssql+',og.sendNum = og.num where o.id = og.orderId and o.id = '+ orderId;
      Shop_order_goods.query(ssql,function(){
        if(orderList.length==++i){
          return res.view('private/shop/order/order/index', req.data);
        }
      });
    });
  },
  pay: function (req,res){
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
  doPay: function(req,res){
    var ssql = 'update Shop_order set payAmount=finishAmount,payStatus=1 where id = '+req.body.id;
    Shop_order.query(ssql,function(err,list){
      res.json({code: 0});
      // return res.view('private/shop/order/order/index', req.data);
    });
  },
  cancel: function (req,res) {
    Shop_order.findOne(req.params.id)
    .exec(function (err,obj) {
      if(err) res.json({msg:订单不存在});
      if (obj.payStatus == 0) {
        
      }
    });
  }
}
