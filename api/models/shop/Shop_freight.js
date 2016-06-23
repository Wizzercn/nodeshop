/**
 * 资源菜单
 * Created by root on 9/10/15.
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
    name:{
      type:'string'
    },
    firstunit: {
      type: 'integer'
    },
    continueunit: {
      type: 'string',
      size: 100,
      index:true
    },
    firstprice: {
      type: 'string',
      size: 50,
      index: true
    },
    continueprice: {
      model: 'Shop_freight_content'
    }
  }
};
