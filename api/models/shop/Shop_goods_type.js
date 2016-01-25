/**
 * Created by root on 20/1/16.
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
    name: {
      type: 'string',
      size: 100,
      required: true
    },
    alias: {
      type: 'string',
      size: 100
    },
    is_physical:{
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    use_spec:{
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    use_props:{
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    use_params:{
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    use_tabs:{
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    params:{
      type: 'longtext'
    },
    tabs:{
      type: 'longtext'
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    props: {
      collection: 'Shop_goods_type_props',
      via: 'typeid'
    }
  }
};
