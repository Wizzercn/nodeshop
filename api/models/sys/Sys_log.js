/**
 * 系统日志
 * Created by wizzer on 2015/9/6.
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
    type: {
      type: 'string',
      size: 10
    },
    url:{
      type:'string',
      size:100
    },
    note:{
      type:'string',
      size:255
    },
    op_id: {//操作人ID
      type: 'string',
      size: 50
    },
    op_name: {
      type: 'string',
      size: 50
    },
    op_ip:{
      type:'string',
      size:20
    },
    createdAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    },
    updatedAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    }
  }
};
