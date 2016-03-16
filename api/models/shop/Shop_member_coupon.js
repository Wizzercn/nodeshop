/**
 * Created by root on 16/3/16.
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
      index:true
    },
    couponId:{
      model:'Shop_sales_coupon',
      index:true
    },
    couponName:{
      type:'string',
      size:100
    },
    couponPrice: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    orderId: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    orderAt: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //0未使用  1已使用  2已失效
    status: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
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
