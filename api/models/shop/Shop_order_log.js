/**
 * Created by root on 3/15/16.
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
    orderId: {
      model: 'Shop_order',
      index:true,
      size:20
    },
    opTag:{
      type:'string',
      size:100
    },
    opContent:{
      type:'string',
      size:255
    },
    opType:{
      type:'string',
      enum: ['admin','member'],
      size: 10,
      index:true
    },
    opId:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    opNickname:{
      type:'string',
      size:100
    },
    opAt:{
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    }

  }
};
