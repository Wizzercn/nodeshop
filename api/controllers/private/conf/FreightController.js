
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
  addDo: function (req, res) {
    var vmdata = req.body.vmdata;
    var freightData = Object.create();
    // freightData.name = vmdata.freightname||'';
    // freightData.type = vmdata.freighttype||'';
    // for(let listItem of vmdata.freightlist) {
    //   freightData.content.push({listItem.firstunit})
    //   for(let item of listItem) {
        
    //   }
    // }


    // freightData.contentId =
    Shop_freight.create({
      name: vmdata.freightname,
      freighttype: vmdata.freighttype,
      contentId: [
        { firstunit: 1, city: [1, 2, 3] }, { firstunit: 2, city: [7, 8, 9] }
      ]
    }).exec(function (err, obj) {
      if (err) {
        return res.json({ msg: 2, data: err })
      }
      return res.json({ msg: 0, data: obj })
    })

    //  Shop_freight_content.find()
    //    .populateAll()
    //    .then((params) => {
    //      console.log(params);
    //    })
    //    .catch((params) => {
    //      console.log(params);
    //    })

    // addFreight()
    //   .then(id => {
    //     console.log(id);
    //     return res.json(id);
    //   })
    //   .catch(err => {
    //     console.log(err)
    //     return res.json(err)
    //   })
  },
  cityEdit: function (req, res) {
    var freightContentId = req.body.fcId;
    var ids = req.body.ids;
    console.log(ids);
    console.log(freightContentId);
    Shop_area.find({ select: ['id', 'name'] }, { id: ids })
      .exec(function (err, city) {
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
  }
  // addFreight:function (vmdata) 

};
