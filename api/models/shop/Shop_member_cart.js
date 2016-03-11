/**
 * Created by root on 3/8/16.
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
    memberId: {
      model: 'Shop_member',
      index:true
    },
    goodsId: {
      model: 'Shop_goods',
      index:true
    },
    productId: {
      model: 'Shop_goods_products',
      index:true
    },
    name:{
      type: 'string'
    },
    spec:{
      type: 'string'
    },
    imgurl:{
      type: 'string'
    },
    num:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    price:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    }
  },
  //登录时将Cookies购物车数据同步的数据库
  updateCookieCartDataToDb:function(req,res,memberId,cb){
    var cookies=req.cookies;
    if(cookies){
      for(var key in cookies){
        if(key.indexOf('shop_cart_goods_')==0){
          res.cookie(key,'null',{maxAge:0});
          var cartObj=JSON.parse(cookies[key]);
          //因为使用for循环，所以需要进行同步控制，否则会造成数据不一致
          async.waterfall([function (cb) {
            Shop_member_cart.findOne({memberId:memberId,productId:cartObj.productId,goodsId:cartObj.goodsId}).exec(function(e,o) {
              cb(e,o);
            });
          },function(obj,cb){
            if(obj){
              Shop_member_cart.update(obj.id,{num:cartObj.num+obj.num}).exec(function(e1,o1){
                cb(null,obj);
              });
            }else {
              cb(null,obj);
            }
          },function(obj,cb){
            if(!obj){
              cartObj.memberId=memberId;
              Shop_member_cart.create(cartObj).exec(function(e2,o2){
                cb(null,obj);
              });
            }else {
              cb(null,obj);
            }
          }],function(err,r){

          });
        }
      }
    }
    cb();
  }
};
