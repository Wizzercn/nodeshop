/**
 * Created by root on 10/27/15.
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
    openid: {
      type: 'string',
      size:50
    },
    ip: {
      type: 'string',
      size: 30
    },
    source:{
      type: 'string',
      size: 100
    },
    createdAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    },
    wxid: {
      model: 'Wx_config'
    },
    salesid: {
      model: 'Wx_sales'
    }
  }
};
