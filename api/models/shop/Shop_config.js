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
    }
  }
};
