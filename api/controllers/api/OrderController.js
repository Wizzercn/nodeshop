/**
* Created by wizzer on 2016/5/23.
*/
var StringUtil = require('../../common/StringUtil');
var moment = require('moment');
var jwt = require('jwt-simple');
module.exports = {
  create: function (req, res) {
    if(!req.body){
        return res.json({code: 900, msg: 'err:param is null' });
    }
    if(req.body.products.length>100){
      return res.json({code: 901, msg: 'err:good count more than 100' });
    }
    if(req.body.products.length<0){
      return res.json({code: 902, msg: 'err:none SKU' });
    }
    if(!req.body.trade_no){
      return res.json({code: 903, msg: 'err:none trade_no' });
    }
    var ShopConfig = sails.config.system.ShopConfig||'';
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
          if(obj.memberId){
            member = obj.memberId;
            return cb(null);
          }else {
            return res.json({code: 901, msg: 'err:unknow member' });
          }
        });
      },
      function (cb) {
        var i = 0;
        var nosku = '';
        req.body.products.forEach(function(o){
          Api_basket_products.findOne({appid:req.appid,sku:o.sku})
          .exec(function(err,obj){
            if(!obj){
              nosku = o.sku;
            }
            i++;
            if (i >= req.body.products.length) {
              if(nosku){
                return res.json({code: 911, msg: 'err:SKU not exists::'+o.sku});
              }else {
                return cb(null);
              }
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
        order.addrId = addrId || 0;
        order.addrProvince = req.body.province || '';
        order.addrCity = req.body.city || '';
        order.addrArea = req.body.area || '';
        order.addrName = req.body.name || '';
        order.addrMobile = req.body.mobile || '';
        order.addrAddr = req.body.addr || '';
        order.trade_no = req.body.trade_no || '';
        if(req.body.invoice){
          order.taxType = StringUtil.getInt(req.body.invoice.taxType) || 0;
          order.taxNo = req.body.invoice.taxNo || '';
          order.taxTitle = req.body.invoice.taxTitle || '';
          order.taxCentent = req.body.invoice.taxCentent || '';
        }else {
          order.taxType = 0;
        }
        return cb(null, order);
        // });
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
          return res.json({
            code: 0,
            msg: 'success',
            data: {
              goodsAmount:StringUtil.setPrice(allPrice),
              freightAmount:StringUtil.setPrice(yunMoney),
              finishAmount:StringUtil.setPrice(allPrice+yunMoney)
            }
          });
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
