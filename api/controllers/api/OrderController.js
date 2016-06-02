/**
* Created by wizzer on 2016/5/23.
*/
var StringUtil = require('../../common/StringUtil');
var moment = require('moment');
var jwt = require('jwt-simple');

module.exports = {
  create: function (req, res) {
    if(req.body.products.length>100){
      return res.json({code: 900, msg: 'err:good count more than 100' });
    }
    var ShopConfig = sails.config.system.ShopConfig;
    var member = '';
    var list = req.body.list || [];
    var addrId = '0';
    var payType = 'pay_cash';
    var receivedTime = req.body.receivedTime || '0';
    var memo = req.body.memo || '';
    var fapiao = req.body.fapiao || {};
    async.waterfall([
      function (cb) {
        Api_token.findOne({id:req.appid}).exec(function (err,obj) {
          if(obj){
            member = obj.memberId;
            return cb(null);
          }else {
            return res.json({code: 901, msg: 'err:unknow member' });
          }
        });
      },
      function (cb) {
        Shop_member_addr.findOne({memberId:member}).exec(function(err,obj){

          if(obj){
            addrId = obj.id;
          }else {
            return res.json({code: 902, msg: 'err:no address'});
          }
          return cb(null);
        });
      },
      function (cb) {
        var i = 0;
        req.body.products.forEach(function(o){
          Api_basket_products.findOne({appid:req.appid,sku:o.sku})
          .exec(function(err,obj){
              if(!obj){
                return res.json({code: 911, msg: 'err:SKU not exists::'+o.sku});
              }
              i++;
              if (i == req.body.products.length) {
                cb(null);
              }
          });
        });
      },
      function (cb) {
        Shop_order.getOrderId(function (orderId) {
          return cb(null, orderId);
        });
      },
      function (orderId, cb) {
        var allPrice = 0;
        var count = 0;
        var weight = 0;
        var i = 0;
        req.body.products.forEach(function(o){
          Api_basket_products.findOne({appid:req.appid,sku:o.sku})
          .populate('goodsid')
          .populate('productid')
          .exec(function(err,obj){
            var goods = {};
            goods.orderId = orderId;
            goods.goodsId = obj.productid.goodsid;
            goods.productId = obj.productid.id;
            goods.num = o.num;
            goods.name = obj.productid.name;
            goods.gn = obj.productid.gn;
            goods.spec = obj.productid.spec;
            goods.gprice = obj.productid.price;
            goods.price = obj.price;
            goods.weight = obj.productid.weight;
            goods.imgurl = obj.goodsid.imgurl;
            goods.amount = goods.num * goods.price;
            goods.score = Math.floor(goods.amount / 100);
            Shop_order_goods.create(goods).exec(function (err1, obj1) {
              count += goods.num;
              allPrice += goods.num * goods.price;
              weight += goods.num * goods.weight;
              i++;
              if (i >= req.body.products.length) {
                return cb(null, {
                  id: orderId,
                  memberId: member,
                  goodsAmount: allPrice,
                  weight: weight
                });
              }
            });

          });
        });
      },
      function (order, cb) {
        Shop_member_addr.findOne(addrId).exec(function (e, o) {
          order.addrId = addrId || 0;
          order.addrProvince = o.province || '';
          order.addrCity = o.city || '';
          order.addrArea = o.area || '';
          order.addrName = o.name || '';
          order.addrMobile = o.mobile || '';
          order.addrAddr = o.addr || '';
          order.taxType = StringUtil.getInt(fapiao.taxType) || 0;
          order.taxNo = fapiao.taxNo || '';
          order.taxTitle = fapiao.taxTitle || '';
          order.taxCentent = fapiao.taxCentent || '';
          return cb(null, order);
        });
      },
      function (order, cb) {
        var yunMoney = 0;
        if (ShopConfig.freight_disabled == false && order.goodsAmount > 0) {
          if (ShopConfig.freight_type == 'price') {
            if (order.goodsAmount < ShopConfig.freight_num * 100) {
              yunMoney = ShopConfig.freight_price * 100;
            }
          } else if (ShopConfig.freight_type == 'weight') {
            if (order.weight >= ShopConfig.freight_num) {
              yunMoney = Math.ceil(order.weight / ShopConfig.freight_num) * ShopConfig.freight_price * 100;
            }
          }
        }
        order.freightAmount = yunMoney;
        return cb(null, order);
      },
      function (order, cb) {
        order.finishAmount = order.goodsAmount + order.freightAmount;
        order.memo = memo;
        order.source = 'api';
        order.createdIp = StringUtil.getIp(req);
        order.status = 'active';//['active','dead','finish']
        order.payStatus = 0;
        order.payType = payType;
        order.receivedTime = receivedTime;
        Shop_order.create(order).exec(function (e, o) {
          return cb(e, order);
        });
      }
    ],function(err, order) {
      if(err){
        switch (err) {
          case 911:
            Shop_order_goods.destroy({orderId:order.orderId}).exec(function(err,obj){
              return res.json({code: 911, msg: 'err:SKU not exists::'+order.sku});
            });
            break;
          default:
          return res.json({code: 1, msg: 'err:' +err});
        }
      }
      return res.json({code: 0, msg: 'success', data: {orderId:order.id}});
    }
  );
},
price:function(req,res){
  var allPrice = 0;
  var weight = 0;
  var i = 0;
  var ShopConfig = sails.config.system.ShopConfig;
  req.body.products.forEach(function(o){
    Api_basket_products.findOne({appid:req.appid,sku:o.sku})
    .populate('goodsid')
    .populate('productid')
    .exec(function(err,obj){
      if (obj) {
      allPrice += o.num * obj.price;
      weight += o.num * obj.productid.weight;
      i++;
      if (i == req.body.products.length) {
        var yunMoney = 0;
        if (ShopConfig.freight_disabled == false && allPrice > 0) {
          if (ShopConfig.freight_type == 'price') {
            if (allPrice < ShopConfig.freight_num * 100) {
              yunMoney = ShopConfig.freight_price * 100;
            }
          } else if (ShopConfig.freight_type == 'weight') {
            if (weight >= ShopConfig.freight_num) {
              yunMoney = Math.ceil(weight / ShopConfig.freight_num) * ShopConfig.freight_price * 100;
            }
          }
        }
        return res.json({code: 0, msg: 'success', data: {goodsAmount:allPrice,freightAmount:yunMoney}});
      }
    }else {
        return res.json({code: 911, msg: 'err:SKU not exists::'+o.sku});
    }
    });
  });
},
status:function(req,res){
  Api_token.findOne({id:req.appid})
  .exec(function(err,t){

    Shop_order.findOne({
      id:req.body.orderId,
      memberId:t.memberId
    })
    .exec(function (err,obj) {
      if(obj){
        var data ={};
        data.orderId = obj.id;
        data.status = obj.status;
        data.shipStatus = obj.shipStatus;
        return res.json({code: 0, msg: 'success', data: data});
      }else {
        return res.json({code: 910, msg: 'err::order not exists'});
      }
    });
  });
}
}
