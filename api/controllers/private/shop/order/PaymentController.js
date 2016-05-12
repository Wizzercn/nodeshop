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
    return res.view('private/shop/order/payment/index', req.data);
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

    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Shop_history_payments.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_history_payments.find(where)
        .sort(sort)
        .sort('payAt desc')
        .populate('memberId')
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
  }
};
