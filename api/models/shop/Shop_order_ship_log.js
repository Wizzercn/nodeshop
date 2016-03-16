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
      index: true,
      size: 20
    },
    //物流单号
    shiptypeNo:{
      type: 'string',
      size:100,
      index: true
    },
    //物流状态
    memo:{
      type: 'string',
      size:500
    },
    createAt:{
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    }

  }
};
