/**
 * Created by root on 10/25/15.
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
    title: {
      type: 'string',
      required: true
    },
    picurl: {
      type: 'string'
    },
    note: {
      type: 'string',
      size:500
    },
    createdBy:{
      type: 'integer'
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
