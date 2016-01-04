/**
 * Created by root on 10/25/15.
 */
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    req.data.types = [{'id': 1, name: '拆红包'}];
    Wx_config.find({select: ['id','appname']}).exec(function (err, list) {
      req.data.wxlist = list;
      return res.view('private/wx/sales/manage/index', req.data);
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
    Wx_sales.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Wx_sales.find(where)
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
    Wx_config.find().exec(function (err, list) {
      req.data.list = list;
      req.data.types = [{'id': 1, name: '拆红包'}];
      return res.view('private/wx/sales/manage/add', req.data);
    });
  },
  addDo: function (req, res) {
    var body = req.body;
    var appid = body.appid;
    Wx_sales.findOne({appid: appid}).exec(function (err, obj) {
      if (obj) {
        return res.json({code: 1, msg: sails.__('add.exist')});
      } else {
        if (body.startTime) {
          body.startTime = moment(body.startTime).format('X');
        }
        if (body.endTime) {
          body.endTime = moment(body.endTime).format('X');
        }
        body.createdBy = req.session.user.id;
        Wx_sales.create(body).exec(function (e, o) {
          if (e)return res.json({code: 1, msg: sails.__('add.fail')});
          return res.json({code: 0, msg: sails.__('add.ok')});
        });
      }
    });
  },
  edit: function (req, res) {
    var id = req.params.id;
    req.data.moment = moment;
    Wx_config.find().exec(function (err, list) {
      Wx_sales.findOne({id: id}).exec(function (err, obj) {
        req.data.obj = obj;
        req.data.list = list;
        req.data.types = [{'id': 1, name: '拆红包'}];
        return res.view('private/wx/sales/manage/edit', req.data);
      });
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    if (body.startTime) {
      body.startTime = moment(body.startTime).format('X');
    }
    if (body.endTime) {
      body.endTime = moment(body.endTime).format('X');
    }
    Wx_sales.update({id: body.id}, body).exec(function (err, obj) {
      if (err)return res.json({code: 1, msg: sails.__('update.fail')});
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  },
  delete: function (req, res) {
    var ids = req.params.id || req.body.ids;
    Wx_sales.destroy({id: ids}).exec(function (err) {
      if (err) {
        return res.json({code: 1, msg: sails.__('delete.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('delete.ok')});
      }
    });
  },
  enable: function (req, res) {
    var id = req.params.id;
    Wx_sales.update({id: id}, {disabled: false}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  },
  disable: function (req, res) {
    var id = req.params.id;
    Wx_sales.update({id: id}, {disabled: true}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  }
};
