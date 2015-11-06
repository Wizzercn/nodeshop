/**
 * Created by root on 11/4/15.
 */
//var uuid = require('node-uuid');
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
    parentId: {
      type: 'integer'
    },
    path: {
      type: 'string',
      size: 100
    },
    name: {
      type: 'string',
      size: 20,
      maxLength: 20,
      required: true
    },
    url: {
      type: 'string',
      size: 100
    },
    seo_title: {
      type: 'string',
      size: 100
    },
    seo_keywords:{
      type: 'string',
      size: 100
    },
    seo_description:{
      type: 'string',
      size: 100
    },
    hidden: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    homepage: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    content: {
      type: 'text'
    },
    hasChildren: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    location: {
      type: 'integer',
      size: 11
    },
    createdBy:{
      type: 'integer'
    },
    createdAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    },
    articles: {
      collection: 'Cms_article',
      via: 'channel'
    }
  }
};
