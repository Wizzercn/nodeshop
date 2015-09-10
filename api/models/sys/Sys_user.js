/**
 * 系统用户
 * Created by wizzer on 2015/9/6.
 */
var uuid=require('node-uuid');
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
    slat:{
      type: 'string',
      size: 10,
      required: true
    },
    disabled:{
      type:'boolean',
      defaultsTo: function (){ return false; }
    },
    createdAt:{
      type:'integer',
      defaultsTo:function(){
        return new Date().getTime();
      }
    },
    updatedAt:{
      type:'integer',
      defaultsTo:function(){
        return new Date().getTime();
      }
    }
  }
};

