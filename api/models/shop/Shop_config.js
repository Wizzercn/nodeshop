/**
 * Created by root on 2/29/16.
 */
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
    shop_templet:{
      type:'string',
      size:20
    },
    shop_css:{
      type:'string',
      size:20
    },
    shop_stock:{
      type:'integer',
      defaultsTo: function () {
        return 10;
      }
    },
    list_load_type:{
      type:'string',
      size:20
    },
    list_page_size:{
      type:'integer',
      defaultsTo: function () {
        return 4;
      }
    },
    list_quick_buy: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    freight_disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    freight_type:{
      type:'string',
      size:20
    },
    freight_price:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    freight_num:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    tax_disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return true;
      }
    },
    tax_price:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    pay_cash: {
      type: 'boolean',
      defaultsTo: function () {
        return true;
      }
    },
    pay_money: {
      type: 'boolean',
      defaultsTo: function () {
        return true;
      }
    },
    pay_alipay: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    pay_alipay_info:{
      type:'json'
    },
    pay_wxpay: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    pay_wxpay_info:{
      type:'json'
    },
    member_reg_coupon:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    member_reg_score:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    member_weixinreg_auto: {
      type: 'boolean',
      defaultsTo: function () {
        return true;
      }
    },
    member_weixinreg_coupon:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    member_weixinreg_score:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    oauth_open:{
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    oauth_weixin:{
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    oauth_qq:{
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    oauth_qq_info:{
      type:'json'
    }
  }
};
