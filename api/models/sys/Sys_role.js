/**
 * Created by root on 9/10/15.
 */
//var uuid=require('node-uuid');
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
    unitId: {
      type: 'integer',
      size:10
    },
    name: {
      type: 'string',
      size: 20,
      maxLength: 20,
      required: true
    },
    code: {
      type: 'string',
      size: 20,
      maxLength: 20,
      required: true,
      unique: true
    },
    disabled:{
      type:'boolean',
      defaultsTo: function (){ return false; }
    },
    location: {
      type: 'integer',
      size: 11
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
    users: {
      collection: 'Sys_user',
      via: 'roles'
      //dominant: true
    },
    menus: {
      collection: 'Sys_menu',
      via: 'roles'
    }
  }
};
