/**
 * 会员积分变动日志表
 * Created by root on 18/3/16.
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
    memberId: {
      model: 'Shop_member',
      index: true
    },
    orderId: {
      model: 'Shop_order',
      index: true,
      size: 20,
      defaultsTo: function () {
        return 0;
      }
    },
    oldScore:{
      type: 'integer'
    },
    newScore:{
      type: 'integer'
    },
    diffScore:{
      type: 'integer'
    },
    note:{
      type:'string',
      size:255
    },
    //若管理员调整则记录管理员id
    createdBy: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    }
  }
};
