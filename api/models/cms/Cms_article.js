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
    shopid:{//预留店铺ID
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    title: {
      type: 'string',
      required: true
    },
    info: {
      type: 'string',
      size:500
    },
    author: {
      type: 'string'
    },
    client:{
      type:'string',
      size:10
    },
    publishAt: {
      type: 'integer'
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    picurl: {
      type: 'string'
    },
    seo_title: {
      type: 'string',
      size: 100
    },
    seo_keywords: {
      type: 'string',
      size: 100
    },
    seo_description: {
      type: 'string',
      size: 100
    },
    createdBy: {
      type: 'integer'
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    },
    channelId: {
      model: 'Cms_channel',
      index: true
    },
    contentId: {
      model: 'Cms_article_content',
      index: true
    }
  }
};

