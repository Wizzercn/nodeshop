/**
 * Created by root on 16/3/16.
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
    name: {
      type:'string',
      size:100
    },
    price:{
      type:'integer'
    },
    //最大数量
    maxNum:{
      type:'integer'
    },
    //已发放数量
    hasNum:{
      type:'integer'
    },
    createBy:{
      type: 'integer'
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
