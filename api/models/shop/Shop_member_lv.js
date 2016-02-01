/**
 * Created by root on 2/1/16.
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
    name: {
      type: 'string',
      size: 100
    },
    //等级类型
    lv_type:{
      type: 'string',
      enum: ['retail', 'wholesale','dealer'],
      size: 20
    },
    lv_logo: {
      type: 'string',
      size: 255
    },
    dis_count: {
      type: 'integer'
    },
    experience:{
      type: 'integer'
    },
    expiretime:{
      type: 'integer'
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    }
  }
};
