/**
 * Created by root on 3/8/16.
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
    memberId: {
      model: 'Shop_member'
    },
    bind_type:{
      type:'string',
      size:10
    },
    bind_openid:{
      type:'string',
      size:100,
      index:true
    },
    bind_nickname:{
      type:'string',
      size:100
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    }
  }
};
