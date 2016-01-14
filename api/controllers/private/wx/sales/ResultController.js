/**
 * Created by root on 10/25/15.
 */
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    Wx_sales.find().exec(function (err, list) {
      req.data.list = list;
      return res.view('private/wx/sales/result/index', req.data);
    });
  },
  count: function (req, res) {
    var id = req.params.id;
    Wx_sales_log.count({salesid: id}).exec(function (e1, c1) {
      Wx_sales_user.count({salesid: id}).exec(function (e2, c2) {
        Wx_sales_user.count({salesid: id, share: 1}).exec(function (e3, c3) {
          Wx_sales_user.query('SELECT COUNT(*) as num FROM wx_sales_user a,wx_user b WHERE a.openid=b.openid AND a.salesid=?', [id], function (e4, c4) {
            Wx_sales_user.query('UPDATE wx_sales_user a,wx_user b set a.subscribe=1,a.nickname=b.nickname WHERE a.openid=b.openid AND a.salesid=? AND b.subscribe=1',[id],function(err, rows, fields){

            });
            return res.json({allip: c1, alluser: c2, allshare: c3, subscribe: c4[0].num});
          });
        });
      });
    });
  },
  data: function (req, res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var salesid = req.body.salesid;
    var substatus = req.body.substatus;
    var sort = {};
    var where = {};
    if (salesid) {
      where.salesid = salesid;
    }
    if (substatus) {
      where.subscribe = substatus;
    }
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Wx_sales_user.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Wx_sales_user.find(where)
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
  enable: function (req, res) {
    var id = req.params.id;
    Wx_sales_user.update({id: id}, {status: 0}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  },
  disable: function (req, res) {
    var id = req.params.id;
    Wx_sales_user.update({id: id}, {status: 1,usedAt:moment().format('X')}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  }
};
