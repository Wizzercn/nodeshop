/**
 * Created by root on 11/4/15.
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
    type: {//0 文字  1 图片
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    memo: {
      type: 'string',
      size: 100
    },
    alias: {
      type: 'string',
      size: 100
    },
    location: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    articles: {
      collection: 'Shop_goods_spec_values',
      via: 'specid'
    }
  }
};
