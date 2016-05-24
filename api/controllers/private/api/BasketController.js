/**
 * Created by root on 5/23/16.
 */
var moment = require('moment');
var StringUtil = require('../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    var appid = req.params.id || '';
    Api_token.find().exec(function (err, list) {
      if (!appid && list && list.length > 0) {
        appid = list[0].id;
      }
      req.data.list = list;
      req.data.appid = appid;
      return res.view('private/api/basket/index', req.data);
    });
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
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Api_basket.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Api_basket.find(where)
          .sort(sort)
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
  add: function (req, res) {
    req.data.appid = req.params.id;
    return res.view('private/api/basket/add', req.data);
  },
  addDo: function (req, res) {
    var body = req.body;
    body.createdBy = req.session.user.id;
    Api_basket.create(body).exec(function (e, o) {
      if (e)return res.json({code: 1, msg: sails.__('add.fail')});
      return res.json({code: 0, msg: sails.__('add.ok')});
    });
  },
  edit: function (req, res) {
    var id = req.params.id;
    Api_basket.findOne({id: id}).exec(function (err, obj) {
      req.data.obj = obj;
      return res.view('private/api/basket/edit', req.data);
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    Api_basket.update({id: body.id}, body).exec(function (err, obj) {
      if (err)return res.json({code: 1, msg: sails.__('update.fail')});
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  },
  delete: function (req, res) {
    var ids = req.params.id || req.body.ids;
    Api_basket.destroy({id: ids}).exec(function (err) {
      if (err) {
        return res.json({code: 1, msg: sails.__('delete.fail')});
      } else {
        Api_basket_products.destroy({basketid: ids}).exec(function (e1) {
        });
        return res.json({code: 0, msg: sails.__('delete.ok')});
      }
    });
  },
  product: function (req, res) {
    var id = req.params.id;
    Api_basket.findOne(id).exec(function (e, o) {
      req.data.obj = o || {};
      return res.view('private/api/basket/product', req.data);
    });
  },
  productData: function (req, res) {
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
    Api_basket_products.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Api_basket_products.find(where)
          .sort(sort)
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
  }
};
