/**
 * Created by root on 9/25/15.
 */
var bcrypt = require('bcrypt');
module.exports = {
  index: function (req, res) {
    var data = req.data;
    data.pageData = {pageNum: 20};
    return res.view('private/sys/user/index.ejs', data);

  },
  data: function (req, res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var unitid = req.body.unitid || 1;
    var loginname = req.body.loginname || '';
    var nickname = req.body.nickname || '';
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {unitid: unitid};
    if (loginname) {
      where.loginname = {'like':'%'+loginname+'%'};
    }
    if (nickname) {
      where.nickname = {'like':'%'+nickname+'%'};
    }
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Sys_user.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Sys_user.find(where)
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
  list: function (req, res) {
    return res.view('private/sys/user/list', req.data);
  },
  tree: function (req, res) {
    var pid = req.query.pid;
    if (!pid)pid = '0';
    Sys_unit.find().where({parentId: pid}).sort('location asc').sort('path asc').exec(function (err, objs) {
      var str = [];
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
  doChangePassword: function (req, res) {
    var oldPassword = req.body.oldPassword;
    var newPassword = req.body.newPassword;
    var user = req.session.user;
    if (bcrypt.compareSync(oldPassword, user.password)) {
      var salt = bcrypt.genSaltSync(10);
      var hash = bcrypt.hashSync(newPassword, salt);
      Sys_user.update({id: user.id}, {password: hash}).exec(function (err, obj) {
        if (err) {
          return res.json({code: 2, msg: sails.__('update.fail')});
        } else {
          return res.json({code: 0, msg: sails.__('update.ok')});
        }
      });
    } else {
      return res.json({code: 1, msg: sails.__('private.login.errorpassword')});
    }
  }
};
