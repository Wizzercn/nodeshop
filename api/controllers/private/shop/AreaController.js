/**
 * Created by root on 9/16/15.
 */
var moment = require('moment');
var StringUtil = require('../../../common/StringUtil');
module.exports = {
  /**
   * 首页
   * @param req
   * @param res
   */
  index: function (req, res) {
    Shop_area.find().where({parentId: 0}).sort('location asc').sort('path asc').exec(function (err, objs) {
      req.data.unit = objs;
      return res.view('private/shop/area/index', req.data);
    });
  },
  /**
   * 查找子
   * @param req
   * @param res
   */
  child: function (req, res) {
    var id = req.params.id;
    if (!id)id = '0';
    Shop_area.find().where({parentId: id}).sort('location asc').sort('path asc').exec(function (err, objs) {
      req.data.unit = objs;
      return res.view('private/shop/area/child', req.data);
    });
  },
  /**
   * 选择(树形结构)
   * @param req
   * @param res
   */
  tree: function (req, res) {
    var pid = req.query.pid||0;
    Shop_area.find().where({parentId: pid}).sort('location asc').sort('path asc').exec(function (err, objs) {
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
  /**
   * 添加菜单
   * @param req
   * @param res
   */
  add: function (req, res) {
    var pid = req.query.pid;
    if (pid) {
      Shop_area.findOne({id: pid}).exec(function (err, obj) {
        req.data.parentUnit = obj;
        return res.view('private/shop/area/add', req.data);
      });
    } else {
      return res.view('private/shop/area/add', req.data);
    }
  },
  /**
   * 保存添加
   * @param req
   * @param res
   */
  addDo: function (req, res) {
    var body = req.body;
    var parentId = 0;
    if(body.parentId){
      parentId=parseInt(body.parentId);
    }
    Shop_area.findOne({id: parentId}).exec(function (err, unit) {
      var path = '';
      if (unit)path = unit.path || '';
      Shop_area.find().where({parentId: parentId}).sort({path: 'desc'}).limit(1).exec(function (ferr, objs) {
        if (objs&&objs.length > 0) {
          var num = parseInt(objs[0].path) + 1;
          path = StringUtil.getPath(num, objs[0].path.length);
        } else {
          path = path + '0001';
        }
        body.disabled=body.disabled=='on';
        body.parentId=parentId;
        body.path = path;
        body.location = 0;
        body.createdBy = req.session.user.id;
        Shop_area.create(body).exec(function (cerr, obj) {
          if (cerr || !obj)return res.json({code: 1, msg: sails.__('add.fail')});
          if (parentId > 0) {
            Shop_area.update({id: parentId}, {hasChildren: true}).exec(function (e, o) {
            });
          }
          return res.json({code: 0, msg: sails.__('add.ok')});
        });
      });
    });

  },
  /**
   * 修改菜单
   * @param req
   * @param res
   */
  edit: function (req, res) {
    var id = req.params.id;
    Shop_area.findOne({id: id}).exec(function (err, obj) {
      if (obj) {
        Shop_area.findOne({id: obj.parentId}).exec(function (err, punit) {
          req.data.parentUnit = punit;
          req.data.obj = obj;
          return res.view('private/shop/area/edit', req.data);
        });
      } else {
        return res.view('private/shop/area/edit', req.data);
      }
    });
  },
  /**
   * 保存修改
   * @param req
   * @param res
   */
  editDo: function (req, res) {
    var body = req.body;
    Shop_area.update({id: body.id}, body).exec(function (err, obj) {
      if (err || !obj)return res.json({code: 1, msg: sails.__('update.fail')});
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  },
  /**
   * 删除菜单,更新父级状态
   * @param req
   * @param res
   */
  delete: function (req, res) {
    var id = req.params.id;
    Shop_area.findOne(id).exec(function (e, menu) {
      Shop_area.destroy({path: {like:menu.path+'%'}}).exec(function (err) {
        if (err) {
          return res.json({code: 1, msg: sails.__('delete.fail')});
        } else {
          Shop_area.count({parentId: menu.parentId}).exec(function (err, count) {
            if (count == 0) {
              Shop_area.update({id: menu.parentId}, {hasChildren: false}).exec(function (err, obj) {
              });
            }
          });
          return res.json({code: 0, msg: sails.__('delete.ok')});
        }
      });
    });

  },
  /**
   * 启用
   * @param req
   * @param res
   */
  enable: function (req, res) {
    var id = req.params.id;
    Shop_area.update({id: id}, {disabled: false}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  },
  /**
   * 禁用
   * @param req
   * @param res
   */
  disable: function (req, res) {
    var id = req.params.id;
    Shop_area.update({id: id}, {disabled: true}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  },
  sort: function (req, res) {
    var id=req.query.pid||0;
    var len=4;
    Shop_area.find({parentId:id}).sort({location: "asc"}).sort({path: "asc"}).exec(function (err, menus) {
      req.data.menus = menus;
      if(id>0){
        Shop_area.findOne(id).exec(function(e,o){
          len= o.path.length+4;
          req.data.len= len;
          return res.view('private/shop/area/sort', req.data);

        });
      }else{
        req.data.len= len;
        return res.view('private/shop/area/sort', req.data);

      }
    });
  },
  sortDo: function (req, res) {
    var i = 0, j = 0, k = 0;
    var ids = req.body.ids;
    ids.forEach(function (obj) {
      i++;
      var id1 = obj.id || obj['[id]'];
      Shop_area.update({id: id1}, {location: i}).exec(function (e, o11) {
        if (obj.children) {
          obj.children.forEach(function (o2) {
            j++;
            var id2 = o2.id || o2['[id]'];
            Shop_area.update({id: id2}, {location: j}).exec(function (e, o12) {
              if (o2.children) {
                o2.children.forEach(function (o3) {
                  k++;
                  var id3 = o3.id || o3['[id]'];
                  Shop_area.update({id: id3}, {location: k}).exec(function (e, o13) {
                  });
                });
              }
            });
          });
        }
      });
    });
    return res.json({code: 0, msg: sails.__('update.ok')});

  },
  getArea:function(req,res){
    var pid=req.query.pid||0;
    Shop_area.find({parentId:id,disabled:false}).sort({location: "asc"}).sort({path: "asc"}).exec(function (err, list) {
      return res.json({code:0,msg:'',list:list});
    });
  }
};
