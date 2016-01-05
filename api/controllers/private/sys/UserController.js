/**
 * Created by root on 9/25/15.
 */
var bcrypt = require('bcrypt');
var moment = require('moment');
var StringUtil = require('../../../common/StringUtil');
module.exports = {
  /**
   * 用户管理
   * @param req
   * @param res
   */
  index: function (req, res) {
    var data = req.data;
    return res.view('private/sys/user/index', data);

  },
  /**
   * 添加用户
   * @param req
   * @param res
   */
  add: function (req, res) {
    return res.view('private/sys/user/add', req.data);
  },
  /**
   * 保存用户
   * @param req
   * @param res
   */
  addDo: function (req, res) {
    var body = req.body;
    var loginname = body.loginname;
    Sys_user.findOne({loginname: loginname}).exec(function (err, obj) {
      if (obj) {
        return res.json({code: 1, msg: sails.__('private.sys.user.loginname')});
      } else {
        var salt = bcrypt.genSaltSync(10);
        var hash = bcrypt.hashSync(body.password, salt);
        body.password = hash;
        body.createdBy = req.session.user.id;
        body.disabled = false;
        body.online = false;
        Sys_user.create(body).exec(function (e, o) {
          if (e)return res.json({code: 1, msg: sails.__('add.fail')});
          return res.json({code: 0, msg: sails.__('add.ok')});
        });
      }
    });
  },
  /**
   * 修改用户
   * @param req
   * @param res
   */
  edit: function (req, res) {
    var id = req.params.id;
    Sys_user.findOne({id: id}).populate('unitid').exec(function (err, obj) {
      if (obj.unitid) {
        obj.unitName = obj.unitid.name;
      }
      req.data.obj = obj;
      return res.view('private/sys/user/edit', req.data);
    });
  },
  /**
   * 保存修改
   * @param req
   * @param res
   */
  editDo: function (req, res) {
    var body = req.body;
    var oldLoginname = body.oldLoginname;
    var loginname = body.loginname;
    if (loginname != oldLoginname) {//如果修改用户名则需判断是否已存在
      Sys_user.findOne({loginname: loginname}).exec(function (err, obj) {
        if (obj) {
          return res.json({code: 1, msg: sails.__('private.sys.user.loginname')});
        } else {
          Sys_user.update({id: body.id}, body).exec(function (err, obj) {
            if (err)return res.json({code: 1, msg: sails.__('update.fail')});
            return res.json({code: 0, msg: sails.__('update.ok')});
          });
        }
      });
    } else {//讨厌的回调，不这样写会取不到数据
      Sys_user.update({id: body.id}, body).exec(function (err, obj) {
        if (err)return res.json({code: 1, msg: sails.__('update.fail')});
        return res.json({code: 0, msg: sails.__('update.ok')});
      });
    }
  },
  /**
   * 用户分页查询(jQuery.datatables)
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
    var where = {};
    if (unitid > 0) {
      where.unitid = unitid;
    }
    if (loginname) {
      where.loginname = {'like': '%' + loginname + '%'};
    }
    if (nickname) {
      where.nickname = {'like': '%' + nickname + '%'};
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
  /**
   * 启用用户
   * @param req
   * @param res
   */
  enable: function (req, res) {
    var id = req.params.id;
    Sys_user.update({id: id}, {disabled: false}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  },
  /**
   * 禁用用户
   * @param req
   * @param res
   */
  disable: function (req, res) {
    var id = req.params.id;
    Sys_user.update({id: id}, {disabled: true}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  },
  /**
   * 删除用户
   * 1.../private/sys/user/delete/:id  删除单个用户
   * 2...POST 提交ids 批量删除用户
   * @param req
   * @param res
   */
  delete: function (req, res) {
    var ids = req.params.id || req.body.ids;
    Sys_user.destroy({id: ids}).exec(function (err) {
      if (err) {
        return res.json({code: 1, msg: sails.__('delete.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('delete.ok')});
      }
    });
  },
  /**
   * 用户详情
   * @param req
   * @param res
   */
  detail: function (req, res) {
    var id = req.params.id;
    Sys_user.findOne({id: id}).populate('roles', {disabled: false}).exec(function (err, user) {
      if (err)res.end();
      req.data.obj = user;
      req.data.moment = moment;
      return res.view('private/sys/user/detail', req.data);
    });
  },
  /**
   * 查询用户有权限的菜单列表
   * @param req
   * @param res
   */
  menu: function (req, res) {
    var id = req.params.id;
    Sys_user.findOne({id: id}).populate('roles', {disabled: false}).exec(function (err, user) {
      if (err)res.end();
      req.data.obj = user;
      var roleIds = [], userRoles = user.roles;
      if (userRoles) {
        userRoles.forEach(function (obj) {
          roleIds.push(obj.id);
        });
      }
      var firstMenus = [], secondMenus = [];
      if (roleIds.length > 0) {
        Sys_role.find().where({id: roleIds}).populate('menus', {disabled: false}).exec(function (e, role) {
          if (role) {

            role.forEach(function (m) {
              m.menus.forEach(function (obj) {
                if (obj.path.length == 4) {
                  firstMenus.push(obj);
                } else {
                  secondMenus.push(obj);
                }
              });

            });
            req.data.userFirstMenus = firstMenus;
            req.data.userSecondMenus = secondMenus;
            return res.view('private/sys/user/menu', req.data);
          }
        });
      } else {
        req.data.userFirstMenus = firstMenus;
        req.data.userSecondMenus = secondMenus;
        return res.view('private/sys/user/menu', req.data);
      }

    });
  },
  /**
   * 左侧单位树
   * @param req
   * @param res
   */
  tree: function (req, res) {
    var pid = req.query.pid;
    if (!pid)pid = '0';
    Sys_unit.find().where({parentId: pid}).sort('location asc').sort('path asc').exec(function (err, objs) {
      var str = [];
      if (pid == '0') {
        var obj = {};
        obj.id = '0';
        obj.text = '所有用户';
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
   * 重置密码
   * @param req
   * @param res
   */
  resetPwd: function (req, res) {
    var id = req.params.id;
    var password = StringUtil.randomString(6);
    var salt = bcrypt.genSaltSync(10);
    var hash = bcrypt.hashSync(password, salt);
    Sys_user.update({id: id}, {password: hash}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok'), data: password});
      }
    });
  },
  /**
   * 右上角修改密码
   * @param req
   * @param res
   */
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
