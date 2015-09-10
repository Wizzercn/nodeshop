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
      type: 'string',
      primaryKey: true,
      size: 50,
      defaultsTo: function (){ return uuid.v4().replace('-',''); }
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
    disabled:{
      type:'boolean',
      defaultsTo: function (){ return false; }
    },
    createdAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    },
    updatedAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    }
  }
};

