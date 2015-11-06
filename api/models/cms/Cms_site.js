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
      autoIncrement: false,
      primaryKey: true,
      defaultsTo: function () {
        return 1;
      }
    },
    shopid:{//预留店铺ID
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    name: {
      type: 'string',
      size: 100,
      required: true
    },
    domain: {
      type: 'string'
    },
    icp: {
      type: 'string',
      size: 50
    },
    qq: {
      type: 'string',
      size: 20
    },
    email: {
      type: 'string'
    },
    weibo_name: {
      type: 'string',
      size: 100
    },
    weibo_qrcode: {
      type: 'string'
    },
    wechat_name: {
      type: 'string',
      size: 100
    },
    wechat_qrcode: {
      type: 'string'
    },
    telphone: {
      type: 'string',
      size: 20
    },
    seo_title: {
      type: 'string'
    },
    seo_keywords:{
      type: 'string'
    },
    seo_description:{
      type: 'string'
    },
    footer_content: {
      type: 'string',
      size:500
    }
  }
};
