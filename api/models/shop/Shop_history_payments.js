/**
 * Created by root on 3/15/16.
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
    orderId: {
      model: 'Shop_order',
      index:true,
      size:20
    },
    memberId: {
      model: 'Shop_member',
      index:true
    },
    //支付金额
    money:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //唯一单号
    payNo:{
      type: 'string',
      size:100
    },
    //支付方式
    payType:{
      type: 'string',
      size: 10
    },
    //支付时间
    payAt:{
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      },
      index:true
    },
    //支付名称
    payName:{
      type: 'string',
      size:100
    },
    //支付帐号
    payAccount:{
      type: 'string',
      size:100
    },
    //支付IP
    payIp:{
      type: 'string',
      size:100
    },
    //回调地址
    return_url:{
      type: 'string',
      size:255
    },
    //支付备注
    memo:{
      type:'string',
      size:500
    },
    //完成时间
    finishAt:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //交易单据号
    trade_no:{
      type:'string',
      size:100
    },
    //支付单状态
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      },
      index:true
    }
  }
};
