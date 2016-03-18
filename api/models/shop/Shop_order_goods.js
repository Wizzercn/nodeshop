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
      size: 20,
      autoIncrement: true,
      primaryKey: true
    },
    orderId: {
      model: 'Shop_order',
      index: true,
      size: 20
    },
    goodsId:{
      model: 'Shop_goods',
      index: true,
      size: 20
    },
    productId:{
      model: 'Shop_goods_products',
      index: true,
      size: 20
    },
    name:{
      type: 'string',
      size: 255
    },
    gn:{
      type: 'string',
      size: 100
    },
    spec:{
      type: 'string',
      size: 100
    },
    //购买价格(会员价)
    price:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //销售价(会员原价)
    gprice:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    num:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    sendNum:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //=num*price
    amount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    score:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    weight:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    createAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    }

  }
};
