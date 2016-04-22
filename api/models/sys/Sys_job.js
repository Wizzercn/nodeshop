/**
 * 定时任务
 * Created by wizzer on 2016/4/20.
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
      type:'string',
      size:50
    },
    cron:{
      type:'string',
      size:50
    },
    note:{
      type:'string',
      size:255
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    createdBy: {
      model: 'Sys_user',
      index:true
    },
    createdAt:{
      type:'integer',
      index: true,
      defaultsTo:function(){
        return moment().format('X');
      }
    }
  }
};
