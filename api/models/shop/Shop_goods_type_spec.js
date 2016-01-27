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
    location: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    typeid: {
      model: 'Shop_goods_type',
      index: true
    },
    specid: {
      model: 'Shop_goods_spec',
      index: true
    }
  }
};
