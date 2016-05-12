/**
* Created by root on 20/4/16.
*/
var moment = require('moment');
var fs= require('fs');
var StringUtil = require('../../../common/StringUtil');
// var util = require('weixin-pay/lib/util');
// var WXPay = require('weixin-pay');
module.exports = {
  index: function (req, res) {
    return res.view('private/shop/logistics/index', req.data);
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
    Shop_logistics.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_logistics.find(where)
        .paginate({page: page, limit: pageSize})
        .sort('bn asc')
        .exec(function (err, list) {
          console.log(err);
          console.log(list);
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
  add : function (req,res) {
      return res.view('private/shop/logistics/add', req.data);
    },
    addDo: function (req, res) {
      var body = req.body;
      var logisticsBn = body.bn;
      var logisticsName = body.name;
      console.log(body);
      Shop_logistics.findOne({bn: logisticsBn}).exec(function (err, obj) {
        if (obj) {
          return res.json({code: 1, msg: '编码重复'});
        }
        Shop_logistics.findOne({name: logisticsName}).exec(function (errM, objM) {
          if (objM) {
            return res.json({code: 1, msg: '物流公司已存在'});
          }
          body.createdBy = req.session.user.id;
          Shop_logistics.create({bn: logisticsBn, name: logisticsName}).exec(function (e, o) {
            if (e)return res.json({code: 1, msg: sails.__('add.fail')});
            return res.json({code: 0, msg: sails.__('add.ok')});
          });
        });
      });
    },
    delete: function (req, res) {
      var logisticsBn = req.params.bn||req.body.bn;
      Shop_logistics.destroy({bn: logisticsBn}).exec(function (err) {
        if (err){
          return res.json({code: 1, msg: sails.__('delete.fail')});

        }
        return res.json({code: 0, msg: sails.__('delete.ok')});
      });
    }
};
