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
    type:{//select  flat  disabled
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
    }

  }
};
