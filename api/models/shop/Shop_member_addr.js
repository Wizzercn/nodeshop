/**
 * Created by root on 18/3/16.
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
      model: 'Shop_member',
      index:true
    },
    name:{
      type:'string',
      size:100
    },
    mobile:{
      type:'string',
      size:20
    },
    province:{
      type:'string',
      size:20
    },
    city:{
      type:'string',
      size:20
    },
    area:{
      type:'string',
      size:20
    },
    addr:{
      type:'string',
      size:255
    },
    is_default: {
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
