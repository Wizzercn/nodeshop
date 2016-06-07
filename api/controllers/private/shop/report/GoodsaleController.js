/**
 * Created by root on 20/4/16.
 */
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
// var util = require('weixin-pay/lib/util');
// var WXPay = require('weixin-pay');
module.exports = {
  index: function (req, res) {
    req.data.moment = moment;
    return res.view('private/shop/report/goodsale/index', req.data);
  },
  data: function (req, res) {
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
    var beginDay = req.body.beginDay ? moment(req.body.beginDay).format('X') : beginDay = moment().add(-30, 'days').format('X');
    var endDay = req.body.endDay ? moment(req.body.endDay).format('X') : endDay = moment().format('X');
    var ssql = "select og.name name,sum(og.amount) amount from shop_order_goods og,shop_order o ";
    ssql += "where o.id=og.orderId and  o.status <> 'dead' and o.disabled=0";
    ssql += " and o.createdAt<=" + endDay;
    ssql += " and o.createdAt>=" + beginDay;
    ssql += " group by og.name order by sum(og.amount) desc"
    Shop_order_goods.query(ssql,function (err, o) {
      if (!err && o.length > 0) {
        var ssql1 = "select og.name name,sum(og.amount) amount from shop_order_goods og,shop_order o ";
        ssql1 += "where o.id=og.orderId and  o.status <> 'dead' and o.disabled=0";
        ssql1 += " and o.createdAt<=" + endDay;
        ssql1 += " and o.createdAt>=" + beginDay;
        ssql1 += " group by og.name order by sum(og.amount) desc"
        ssql1 += " LIMIT "+pageSize+" OFFSET "+start;
        var list = [];
        Shop_order_goods.query(ssql1, function (err, obj) {
          for (var i = 0; i < obj.length; i++) {
            list.push({index: i + 1+(page-1)*pageSize, name: obj[i].name, amount: StringUtil.setPrice(obj[i].amount)});
          }
          return res.json({
            "draw": draw,
            "recordsTotal": pageSize,
            "recordsFiltered": o.length,
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
  }
};
