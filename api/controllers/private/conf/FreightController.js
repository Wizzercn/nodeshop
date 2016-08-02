/**
* Created by root on 11/5/15.
*/
module.exports = {
  index: function (req, res) {
    Sms_config.findOrCreate({ id: 1 }).exec(function (err, obj) {
      req.data.obj = obj;
      return res.view('private/conf/freight/index', req.data);
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    Sms_config.update({ id: body.id }, body).exec(function (err, obj) {
      if (err) return res.json({ code: 1, msg: sails.__('update.fail') });
      sails.config.system.SmsConfig = obj[0];
      return res.json({ code: 0, msg: sails.__('update.ok') });
    });
  },
  add: function (req, res) {
    var data = req.data;
    Shop_area.find().sort('id asc').sort('path asc').exec(function (err, objs) {
      var str = [];
      if (objs) {
        objs.forEach(function (o) {
          var obj = {};
          obj.id = o.id;
          obj.text = o.name;
          obj.data = o.id || '';
          obj.parent = o.parentId == 0 ? "#" : o.parentId;
          str.push(obj);
        });
      }
      data.menu = str;
      return res.view('private/conf/freight/add', data);
    });
  },
  cityEdit: function (req, res) {
    var freightContentId = req.body.fcId;
    var ids = req.body.ids;
    console.log(ids);
    console.log(freightContentId);
    Shop_area.find({ id: ids }).exec(function (err, city) {
      return res.json({ code: 0, city: city });
      // if (role && ids) {
      //   role.menus.remove(ids);
      //   role.menus.add(ids);
      //   role.save(function (se) {
      //   });
      //   return res.json({code: 0, msg: sails.__('update.ok')});
      // } else {
      //   return res.json({code: 1, msg: sails.__('update.fail')});
      // }
    });
  },
  setferight: function (req,res) {
    return res.json(req.body.vmdata);
  }
};
