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
    name: {
      type: 'string'
    },
    freighttype: {
      type: 'string',
      enum: ['weight', 'cubage', 'quantity']
    },
    content: {
      collection: 'Shop_freight_content',
      via: 'freightId'
    }

  }
};
