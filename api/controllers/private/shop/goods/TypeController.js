/**
 * Created by root on 11/5/15.
 */
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    return res.view('private/shop/goods/type/index', req.data);
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
  next: function (req, res) {
    var id = req.params.id || 0;
    id = parseInt(id);
    req.data.id = id;
    if (id > 0) {
      Shop_goods_type.findOne(id).exec(function (err, obj) {
        req.data.obj = obj;
        return res.view('private/shop/goods/type/next', req.data);
      });
    } else {
      req.data.obj = {};
      return res.view('private/shop/goods/type/next', req.data);
    }

  },
  add: function (req, res) {
    req.data.is_physical = req.query.is_physical || '0';
    req.data.use_props = req.query.use_props || '0';
    req.data.use_params = req.query.use_params || '0';
    req.data.use_spec = req.query.use_spec || '0';
    req.data.use_tabs = req.query.use_tabs || '0';
    return res.view('private/shop/goods/type/add', req.data);
  },
  addDo: function (req, res) {
    var body = req.body;
    var name = body.name;
    var is_physical = body.is_physical || '0';
    var use_props = body.use_props || '0';
    var use_spec = body.use_spec || '0';
    Shop_goods_type.findOne({name: name}).exec(function (err, obj) {
      if (obj) {
        return res.json({code: 1, msg: sails.__('add.exist')});
      } else {
        body.is_physical=is_physical=='1';
        body.use_props=use_props=='1';
        body.use_spec=use_spec=='1';
        body.createdBy = req.session.user.id;
        Shop_goods_type.create(body).exec(function (e, o) {
          if (e)return res.json({code: 1, msg: sails.__('add.fail')});
          var props_name = body.props_name;
          var props_type = body.props_type;
          var props_values = body.props_values;
          var specId = body.specId;
          if (specId && specId.length > 0) {
            var k = 0;
            specId.forEach(function (sp) {
              Shop_goods_type_spec.create({
                specid: sp,
                typeid: o.id,
                location: k
              }).exec(function (e4, o4) {

              });
              k++;
            });
          }
          if (props_name && props_name.length > 0) {
            var props_obj = {};
            var i = 0;
            props_name.forEach(function (v) {
              var strs = [];
              if (props_values && props_values.length > 0) {
                strs = props_values[i].split(',');
              }
              props_obj.name = v;
              if (props_type[i]) {
                props_obj.type = props_type[i];
              }
              props_obj.typeid = o.id;
              props_obj.location = i;
              i++;

              Shop_goods_type_props.create(props_obj).exec(function (e2, props) {
                if (props && props_values && props_values.length > 0) {
                  var j = 0;
                  strs.forEach(function (val) {
                    if (val) {
                      Shop_goods_type_props_values.create({
                        name: val,
                        propsid: props.id,
                        location: j
                      }).exec(function (e3, o3) {

                      });
                    }
                    j++;
                  });
                }

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
      Shop_goods_spec_values.find({specid: obj.id}).sort({location: 'asc'}).exec(function (e2, spvlist) {
        req.data.spvlist = spvlist;
        return res.view('private/shop/goods/type/edit', req.data);
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
  },
  spec: function (req, res) {
    Shop_goods_spec.find().sort({id: "asc"}).exec(function (e, list) {
      req.data.list = list || [];
      return res.view('private/shop/goods/type/spec', req.data);
    });
  },
  spec_val: function (req, res) {
    var id = req.params.id || '0';
    Shop_goods_spec_values.find({specid: id}).sort({location: "asc"}).exec(function (e, list) {
      if (e)return res.json({code: 1, msg: ''});
      return res.json({code: 0, msg: '', data: list});
    });
  }
};
