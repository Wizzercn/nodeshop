/**
 * Created by root on 9/16/15.
 */
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    Sys_unit.find().where({parentId: 0}).sort('location asc').sort('path asc').exec(function (err, objs) {
      req.data.unit = objs;
      return res.view('private/sys/unit/index.ejs', req.data);
    });
  },
  child: function (req, res) {
    var id = req.params.id;
    if (!id)id = '0';
    Sys_unit.find().where({parentId: id}).sort('location asc').sort('path asc').exec(function (err, objs) {
      req.data.unit = objs;
      return res.view('private/sys/unit/child.ejs', req.data);
    });
  },
  detail: function (req, res) {
    Sys_unit.findOne({id: req.params.id}).exec(function (err, obj) {
      req.data.moment = require("moment");
      req.data.obj = obj;
      return res.view('private/sys/unit/detail.ejs', req.data);
    });
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
    //不知道哪种写法性能更好,留着备用
    //Sys_unit.query('SELECT id,NAME AS TEXT,haschildrenAS children FROM sys_unit WHERE parentId =? ORDER BY location ASC,path asc', [pid], function (err, objs) {
    //  var json = JSON.stringify(objs, function (key, value) {
    //    if (key == 'children') {
    //      return value == 1;
    //    }
    //    return value;
    //  });
    //  return res.json(JSON.parse(json));
    //});
  },
  add: function (req, res) {
    var pid = req.query.pid;
    if (pid) {
      Sys_unit.findOne({id: pid}).exec(function (err, obj) {
        req.data.parentUnit = obj;
        return res.view('private/sys/unit/add', req.data);
      });
    } else {
      return res.view('private/sys/unit/add', req.data);
    }
  },
  addDo: function (req, res) {
    var body = req.body;
    console.log(JSON.stringify(body));
    Sys_unit.create()
    return res.json({});

  }
};
