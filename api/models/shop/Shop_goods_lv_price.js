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
    goodsid: {
      model: 'Shop_goods'
    },
    productid: {
      model: 'Shop_goods_products'
    },
    lvid: {
      model: 'Shop_member_lv'
    },
    price:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    }
  }
};
