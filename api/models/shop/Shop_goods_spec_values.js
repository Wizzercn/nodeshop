/**
 * Created by root on 11/4/15.
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
    spec_value: {
      type: 'string',
      size: 100,
      required: true
    },
    spec_alias: {
      type: 'string',
      size: 10
    },
    spec_picurl: {
      type: 'string',
      size: 255
    },
    location: {
      type: 'integer'
    },
    specId: {
      model: 'Shop_goods_specification',
      index: true
    }
  }
};
