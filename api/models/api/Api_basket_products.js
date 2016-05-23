/**
 * Created by wizzer on 2016/5/23.
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
    appid: {
      model: 'Api_token'
    },
    basketid: {
      model: 'Api_basket'
    },
    goodsid:{
      model: 'Shop_goods'
    },
    productid:{
      model: 'Shop_goods_products'
    },
    sku:{
      type: 'string',
      size: 100,
      required: true
    },
    price:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    createdBy:{
      type: 'integer'
    },
    createdAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    }
  }
};
