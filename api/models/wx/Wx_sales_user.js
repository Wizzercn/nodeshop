/**
 * Created by root on 10/27/15.
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
    openid: {
      type: 'string',
      required: true,
      index:true,
      size:50
    },
    name: {//用户的昵称
      type: 'string',
      size:50
    },
    nickname: {//用户的昵称
      type: 'string'
    },
    fromId: {
      type: 'integer'
    },
    share:{
      type:'integer',
      defaultsTo:function(){ //0 not share 1 share
        return 0;
      }
    },
    subscribe:{
      type:'integer',
      defaultsTo:function(){ //0 not share 1 share
        return 0;
      }
    },
    money:{
      type:'integer',
      defaultsTo:function(){
        return 0;
      }
    },
    status:{
      type:'integer',
      defaultsTo:function(){ //0 not use 1 used
        return 0;
      }
    },
    createdAt:{
      type:'integer',
      index:true,
      defaultsTo:function(){
        return moment().format('X');
      }
    },
    usedAt:{
      type:'integer'
    },
    wxid: {
      model: 'Wx_config'
    },
    salesid: {
      model: 'Wx_sales'
    },
    infoid: {
      model: 'Wx_sales_info'
    },
    logid: {
      model: 'Wx_sales_log'
    }

  }
};
