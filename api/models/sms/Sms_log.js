/**
 * Created by root on 9/3/16.
 */
var moment = require('moment');
module.exports = {
  schema: true,
  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      type: 'string',
      primaryKey: true,
      defaultsTo: function () {
        return 1;
      }
    },
    mobile:{
      type:'string',
      size:20
    },
    code:{
      type:'string',
      size:10
    },
    sms:{
      type:'string',
      size:100
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    }
  }
};

