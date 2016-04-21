/**
 * Created by root on 12/4/16.
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
        sails.log.debug(obj);
        return res.view('private/shop/order/order/detail', req.data);
      });
  },
  send: function (req, res) {
    Shop_order.findOne(req.params.id)
      .populate('memberId')
      .populate('goods')
      .exec(function (err, obj) {
        req.data.obj = obj || {};
        req.data.moment = moment;
        req.data.StringUtil = StringUtil;
        sails.log.debug(obj);
        return res.view('private/shop/order/order/send', req.data);
      });
  },
  doSend: function(req,res){
    Shop_order.findOne(req.params.id)
      .populate('memberId')
      .populate('goods')
      .exec(function (err, obj) {
        req.data.obj = obj || {};
        req.data.moment = moment;
        req.data.StringUtil = StringUtil;
        sails.log.debug(obj);
        return res.view('private/shop/order/order/index', req.data);
      });
  }
}
