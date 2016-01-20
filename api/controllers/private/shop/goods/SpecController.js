/**
 * Created by root on 11/5/15.
 */
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    return res.view('private/shop/goods/spec/index', req.data);
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
    Shop_goods_spec.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_goods_spec.find(where)
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
    return res.view('private/shop/goods/spec/add', req.data);
  },
  addDo: function (req, res) {
    var body = req.body;
    var name = body.name;
    Shop_goods_spec.findOne({name: name}).exec(function (err, obj) {
      if (obj) {
        return res.json({code: 1, msg: sails.__('add.exist')});
      } else {
        body.createdBy = req.session.user.id;
        Shop_goods_spec.create(body).exec(function (e, o) {
          if (e)return res.json({code: 1, msg: sails.__('add.fail')});
          var spec_value = body.spec_value;
          var spec_alias = body.spec_alias;
          var spec_picurl = body.spec_picurl;
          if (spec_value.length > 0) {
            var vobj = {};
            var i = 0;
            spec_value.forEach(function (v) {
              vobj.spec_value = v;
              if (spec_alias[i]) {
                vobj.spec_alias = spec_alias[i];
              }
              if ('1' == body.type && spec_picurl[i]) {
                vobj.spec_picurl = spec_picurl[i];
              }
              vobj.specid = o.id;
              vobj.location = i;
              i++;
              Shop_goods_spec_values.create(vobj).exec(function (e2, o2) {

              });
            });
          }
          return res.json({code: 0, msg: sails.__('add.ok')});
        });
      }
    });
  },
  edit: function (req, res) {
    var id = req.params.id;
    Shop_goods_spec.findOne(id).exec(function (err, obj) {
      req.data.obj = obj;
      Shop_goods_spec_values.find({specid: obj.id}).sort({location:'asc'}).exec(function (e2, spvlist) {
        req.data.spvlist = spvlist;
        return res.view('private/shop/goods/spec/edit', req.data);
      });
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    Shop_goods_spec.update({id: body.id}, body).exec(function (err, obj) {
      if (err)return res.json({code: 1, msg: sails.__('update.fail')});
      var spec_value = body.spec_value;
      var spec_alias = body.spec_alias;
      var spec_picurl = body.spec_picurl;
      Shop_goods_spec_values.destroy({specid: body.id}).exec(function (err) {
        if (spec_value.length > 0) {
          var vobj = {};
          var i = 0;
          spec_value.forEach(function (v) {
            vobj.spec_value = v;
            if (spec_alias[i]) {
              vobj.spec_alias = spec_alias[i];
            }
            if ('1' == body.type && spec_picurl[i]) {
              vobj.spec_picurl = spec_picurl[i];
            }
            vobj.specid = body.id;
            vobj.location = i;
            i++;
            Shop_goods_spec_values.create(vobj).exec(function (e2, o2) {

            });
          });
        }
      });
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  },
  /**
   * 删除规格前，记得先判断规格是否被使用s
   * @param req
   * @param res
   */
  delete: function (req, res) {
    var ids = req.params.id || req.body.ids;
    Shop_goods_spec.destroy({id: ids}).exec(function (err) {
      if (err)
        return res.json({code: 1, msg: sails.__('delete.fail')});
      Shop_goods_spec_values.destroy({specid: ids}).exec(function (err) {
      });
      return res.json({code: 0, msg: sails.__('delete.ok')});

    });
  }
};
