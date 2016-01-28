/**
 * Created by root on 20/1/16.
 */
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
      type: 'string',
      size: 100,
      required: true
    },
    type:{//select  input
      type: 'string',
      size: 20,
      required: true
    },
    location: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    typeid: {
      model: 'Shop_goods_type'
    },
    values: {
      collection: 'Shop_goods_type_props_values',
      via: 'propsid'
    }

  }
};
