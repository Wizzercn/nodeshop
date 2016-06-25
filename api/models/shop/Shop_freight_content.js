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
    freightId: {
      model:'Shop_freight',
      index: true
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
      type: 'string',
      size: 20
    },
    freight: {
      collection: 'Shop_area',
      via: 'id'
    }
  }
};
