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
  tree: function (req, res) {
    var pid = req.query.pid;
    if (!pid)pid = '0';
    Sys_unit.find().where({parentId: pid}).sort('location asc').sort('path asc').exec(function (err, objs) {
      var str = [];
      if(pid=='0'){
        var obj = {};
        obj.id = '_system';
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
  }
};
