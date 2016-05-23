/**
 * Created by wizzer on 2016/5/23.
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
    name:{
      type: 'string'
    },
    loginname: {
      type: 'string',
      unique: true,
      size: 100,
      required: true,
      maxLength: 100,
      index: true
    },
    password: {
      type: 'string',
      required: true
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    }
  }
};
