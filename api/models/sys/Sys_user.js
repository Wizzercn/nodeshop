/**
 * 系统用户
 * Created by wizzer on 2015/9/6.
 */
var uuid=require('node-uuid');
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
    loginname: {
      type: 'string',
      unique: true,
      size: 100,
      required: true,
      maxLength: 100
    },
    nickname: {
      type: 'string',
      size: 50,
      required: true,
      maxLength: 50
    },
    email: {
      type: 'email',
      unique: true,
      required: true
    },
    password:{
      type: 'string',
      size: 100,
      required: true
    },
    lastIp:{
      type: 'string',
      size: 20
    },
    loginCount:{
      type: 'integer',
      size: 11,
      defaultsTo:function(){
        return 0;
      }
    },
    disabled:{
      type:'boolean',
      defaultsTo: function (){ return false; }
    },
    createdBy:{
      type: 'string',
      size: 50
    },
    createdAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    },
    roles: {
      collection: 'Sys_role',
      via: 'users'
    }
  }
};

