/**
 * Created by root on 3/8/16.
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
    lv_id:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    nickname:{
      type: 'string'
    },
    area:{
      type: 'string'
    },
    mobile:{
      type: 'string',
      size:20
    },
    tel:{
      type: 'string',
      size:20
    },
    email:{
      type: 'string',
      size:100
    },
    order_num:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    b_year:{
      type: 'integer',
      size:4,
      defaultsTo: function () {
        return 0;
      }
    },
    b_month:{
      type: 'integer',
      size:2,
      defaultsTo: function () {
        return 0;
      }
    },
    b_day:{
      type: 'integer',
      size:2,
      defaultsTo: function () {
        return 0;
      }
    },
    sex:{
      type: 'integer',
      size:1,
      defaultsTo: function () {
        return 0;
      }
    },
    //预存款
    money:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //当订单使用余额支付，并且订单未全部支付时冻结的金额
    money_freeze:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //支付密码：充值时必须设置密码、重置支付密码功能
    money_password:{
      type: 'string',
      size:20
    },
    //积分
    score:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    reg_ip:{
      type: 'string'
    },
    reg_time:{
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    },
    reg_source:{
      type: 'string',
      size:5
    },
    accounts: {
      collection: 'Shop_member_account',
      via: 'memberId'
    }

  }
};
