/**
 * Sys_user.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/#!documentation/models
 */
var uuid=require('node-uuid');
module.exports = {
  schema: true,
  tableName: 'aaaasys_user',
  attributes: {
    id: {
      type: 'string',
      primaryKey: true,
      unique: true,
      defaultsTo: function (){ return uuid.v4().replace('-',''); }
    },
    loginname: {
      type: 'string',
      unique: true,
      size: 100
    },
    nickname: {
      type: 'string',
      size: 50
    },
    email: {
      type: 'string',
      size: 100
    },
    password:{
      type: 'string'
    },
    slat:{
      type: 'string'
    },
    disabled:{
      type:'string',
      enum: ['true', 'false']
    },
    createAt:{
      type: 'integer',
      size: 10,
      defaultsTo: function (){ return new Date().getTime(); }
    }
  }
};

