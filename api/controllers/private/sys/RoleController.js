/**
 * Created by root on 10/14/15.
 */
var bcrypt = require('bcrypt');
var moment = require('moment');
var StringUtil = require('../../../common/StringUtil');
module.exports = {
  /**
   * 角色管理
   * @param req
   * @param res
   */
  index: function (req, res) {
    var data = req.data;
    return res.view('private/sys/role/index', data);
  },
  add: function (req, res) {
    var data = req.data;
    return res.view('private/sys/role/add', data);
  },
  addDo: function (req, res) {
    var body = req.body;
    var code = body.code;
    var menuIds = body.menuIds;
    Sys_role.findOne({code: code}).exec(function (err, obj) {
      if (obj) {
        return res.json({code: 1, msg: sails.__('private.sys.role.code')});
      } else {
        body.createdBy = req.session.user.id;
        body.location = 0;
        Sys_role.create(body).exec(function (ce, o) {
          if (ce) {
            return res.json({code: 1, msg: sails.__('add.fail')});
          } else {
            Sys_role.findOne(o.id).exec(function (fe, role) {
              if (role && menuIds) {
                role.menus.add(menuIds.split(','));
                role.save(function (se) {
                });
              }
            });
            return res.json({code: 0, msg: sails.__('add.ok')});
          }
        });
      }
    });
  },
  editUser: function (req, res) {
    var data = req.data;
    Sys_role.findOne(req.params.id).exec(function (err, role) {
      data.role = role;
      return res.view('private/sys/role/editUser', data);
    });
  },
  menuTree: function (req, res) {
    var pid = req.query.pid;
    if (!pid)pid = '0';
    Sys_menu.find().where({parentId: pid}).sort('location asc').sort('path asc').exec(function (err, objs) {
      var str = [];
      if (objs) {
        objs.forEach(function (o) {
          var obj = {};
          obj.id = o.id;
          obj.text = o.name;
          obj.children = o.hasChildren;
          obj.icon = o.icon;
          obj.data = o.url || '';
          str.push(obj);
        });
      }
      return res.json(str);
    });
  },
  tree: function (req, res) {
    var pid = req.query.pid;
    if (!pid)pid = '0';
    Sys_unit.find().where({parentId: pid}).sort('location asc').sort('path asc').exec(function (err, objs) {
      var str = [];
      if (pid == '0') {
        var obj = {};
        obj.id = '0';
        obj.text = '系统角色';
        obj.children = false;
        str.push(obj);
      }
      if (objs) {
        objs.forEach(function (o) {
          var obj = {};
          obj.id = o.id;
          obj.text = o.name;
          obj.children = o.hasChildren;
          str.push(obj);
        });
      }

      return res.json(str);
    });
  },
  /**
   * 角色分页(jQuery.datatables)
   * @param req
   * @param res
   */
  data: function (req, res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var unitid = req.body.unitid || 0;
    var loginname = req.body.loginname || '';
    var nickname = req.body.nickname || '';
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {unitid: unitid};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Sys_role.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Sys_role.find(where)
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
