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
    return res.view('private/shop/order/ship/index', req.data);
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
    if (req.body.id) {
      where.orderId = req.body.id;
    }
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Shop_order_ship_log.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_order_ship_log.find(where)
        .sort(sort)
        .sort('createAt desc')
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
  shipEdit : function(req,res){

  }
};
