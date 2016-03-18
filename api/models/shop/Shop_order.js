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
      size:20,
      autoIncrement: true,
      primaryKey: true
    },
    cityId: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //订单状态
    status:{
      type: 'string',
      enum: ['active','dead','finish'],
      size: 10,
      index:true
    },
    //订单重量
    weight:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //商品总额
    goodsAmount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //运费
    freightAmount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //优惠金额
    discountAmount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //订单总额
    finishAmount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //支付金额 会发生部分支付的情况，如：余额支付
    payAmount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //付款状态
    payStatus:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      },
      index:true
    },
    //支付方式
    payType:{
      type: 'string',
      size:100
    },
    //发货状态
    shipStatus:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      },
      index:true
    },
    //配送方式id
    shiptypeId:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //配送方式
    shiptypeName:{
      type: 'string',
      size:100
    },
    //物流单号
    shiptypeNo:{
      type: 'string',
      size:100
    },
    //收货地区
    shipProvince:{
      type: 'string',
      size:30
    },
    //收货地区
    shipCity:{
      type: 'string',
      size:30
    },
    //收货地区
    shipArea:{
      type: 'string',
      size:30
    },
    //收货地址
    shipAddr:{
      type: 'string',
      size:255
    },
    //收货人
    shipName:{
      type: 'string',
      size:100
    },
    //收货人电话
    shipMobile:{
      type: 'string',
      size:20
    },
    //配送时间
    shipTime:{
      type: 'string',
      size:100
    },
    //0  1企业 2个人
    taxType:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //企业税务号
    taxNo:{
      type: 'string',
      size:100
    },
    //发票抬头
    taxTitle:{
      type: 'string',
      size:100
    },
    //发票内容
    taxCentent:{
      type: 'string',
      size:255
    },
    //收货状态   0  1
    receivedStatus:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      },
      index:true
    },
    createdIp:{
      type: 'string',
      size:100
    },
    //创建时间
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      },
      index:true
    },
    //收货时间
    receivedAt: {
      type: 'integer',
      index:true
    },
    //状态更新时间
    updateAt: {
      type: 'integer',
      index:true
    },
    //会员ID
    memberId: {
      model: 'Shop_member',
      index:true
    },
    //订单备注
    memo:{
      type:'string',
      size:500
    },
    //订单来源
    source:{
      type: 'string',
      enum: ['pc','wap','weixin'],
      size: 10
    },
    //取消订单
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      },
      index:true
    },
    //收款单
    payments: {
      collection: 'Shop_history_payments',
      via: 'orderId'
    },
    //收款单
    refunds: {
      collection: 'Shop_history_refunds',
      via: 'orderId'
    }
  }
};
