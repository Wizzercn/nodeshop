
/**
* Created by root on 20/4/16.
*/
var moment = require('moment');
var fs= require('fs');
var StringUtil = require('../../../../common/StringUtil');
// var util = require('weixin-pay/lib/util');
// var WXPay = require('weixin-pay');
module.exports = {
  index: function (req, res) {
    req.data.moment = moment;
    return res.view('private/shop/report/goodsale/index', req.data);
  },
  data: function (req,res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {status: {'!': 'dead'}};
    //
    // if (order.length > 0) {
    //   sort[columns[order[0].column].data] = order[0].dir;
    // }

      console.log(req.body);
    Shop_order.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        var beginDay = req.body.beginDay?moment(req.body.beginDay).format('X'):beginDay = moment().add(-30, 'days').format('X');
        var endDay = req.body.endDay?moment(req.body.endDay).format('X'):endDay = moment().format('X');
        var ssql = "select gp.name name,sum(og.amount) amount from shop_order_goods og,shop_order o,shop_goods_products gp ";
        ssql += "where o.id=og.orderId and og.productId = gp.id and o.status <> 'dead'";
        ssql += " and o.createdAt<=" + endDay;
        ssql += " and o.createdAt>=" + beginDay;
        ssql +=" group by gp.name order by sum(og.amount) desc";
        var list = [];
        Shop_order_goods.query(ssql,function (err,obj) {
          console.log(obj);
          for (var i = 0; i < obj.length; i++) {
              list.push({index:i+1,name:obj[i].name,amount:obj[i].amount/100});
          }
          return res.json({
            "draw": draw,
            "recordsTotal": pageSize,
            "recordsFiltered": obj.length,
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

}
