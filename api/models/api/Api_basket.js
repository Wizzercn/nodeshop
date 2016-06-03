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
    appid:{
      model:'Api_token'
    },
    name:{
      type: 'string',
      size: 50
    },
    dis_count:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    num:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
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
    products: {
      collection: 'Api_basket_products',
      via: 'basketid'
    }
  }
};
