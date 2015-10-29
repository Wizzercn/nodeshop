/**
 * Created by root on 10/25/15.
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
    appname: {
      type: 'string',
      required: true
    },
    ghid: {//原始ID
      type: 'string',
      unique: true,
      required: true
    },
    appid: {
      type: 'string',
      unique: true,
      required: true
    },
    appsecret: {
      type: 'string',
      unique: true,
      required: true
    },
    encodingAESKey:{
      type: 'string',
      unique: true,
      required: true
    },
    token: {
      type: 'string',
      unique: true,
      required: true
    },
    access_token: {
      type: 'string'
    },
    expire_time: {
      type:'integer',
      defaultsTo:function(){
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
    },
    replys: {
      collection: 'Wx_reply',
      via: 'wxid'
    },
    menus: {
      collection: 'Wx_menu',
      via: 'wxid'
    }

  }
};
