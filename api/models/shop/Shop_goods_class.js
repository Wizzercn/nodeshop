/**
 *
 * Created by root on 1/28/16.
 */
//var uuid = require('node-uuid');
var moment = require('moment');
module.exports = {
  schema: true,
  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      type: 'integer',
      autoIncrement: true,
      primaryKey: true
    },
    parentId: {
      type: 'integer'
    },
    path: {
      type: 'string',
      size: 100,
      index:true
    },
    name: {
      type: 'string',
      size: 20,
      maxLength: 20,
      required: true
    },
    settings: {
      type: 'json'
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    hasChildren: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    is_index: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    location: {
      type: 'integer',
      size: 11
    },
    createdBy:{
      type: 'integer'
    },
    createdAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    },
    typeid: {
      model: 'Shop_goods_type'
    },
    goods: {
      collection: 'Shop_goods',
      via: 'classid'
    }
  },
  //获取首页banner，根据名称固定
  getAllClass: function (cb) {
    Shop_goods_class.find({disabled:false}).sort('location asc').sort('path asc').exec(function (err, list) {
      return cb(list);
    });
  },
  //获取首页显示的商品分类
  getIndexClass: function (cb) {
    Shop_goods_class.find({disabled:false,is_index:true,parentId:0}).sort('location asc').sort('path asc').exec(function (err, list) {
      return cb(list);
    });
  },
  //获取下级商品分类
  getChildrenClass: function (id,cb) {
    Shop_goods_class.find({disabled:false,parentId:id}).sort('location asc').sort('path asc').exec(function (err, list) {
      return cb(list);
    });
  },
  //获取下级商品分类
  getChildrenClassByPath: function (path,cb) {
    Shop_goods_class.find({disabled:false,path:path}).sort('location asc').sort('path asc').exec(function (err, list) {
      return cb(list);
    });
  }
};
