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
      required: true,
      size:50
    },
    nickname: {//用户的昵称
      type: 'string',
      size:50
    },
    status:{
      type:'integer',
      defaultsTo:function(){
        return 0;
      }
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
