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
    //等级名称
    name: {
      type: 'string',
      size: 100
    },
    //等级类型
    lv_type:{
      type: 'string',
      enum: ['member', 'wholesale','dealer'],
      size: 20
    },
    //等级logo
    lv_logo: {
      type: 'string',
      size: 255
    },
    //会员折扣率
    dis_count: {
      type: 'integer'
    },
    //所需积分
    point:{
      type: 'integer'
    },
    //积分过期时间
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
