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
      index: true
    },
    goodsId: {
      model: 'Shop_goods',
      index: true
    },
    productId: {
      model: 'Shop_goods_products',
      index: true
    },
    name: {
      type: 'string'
    },
    spec: {
      type: 'string'
    },
    imgurl: {
      type: 'string'
    },
    num: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    price: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    weight: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    is_buy:{
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    }
  },
  saveDb: function (member, cartObj) {
    Shop_goods_lv_price.findOne({
      lvid: member.lv_id,
      productId: cartObj.productId,
      goodsid: cartObj.goodsId
    }).exec(function (es, os) {
      Shop_member_lv.findOne(member.lv_id).exec(function (elv, olv) {
        //计算会员价
        var lv = {member_lv: olv || {}, product_lv: os || {}};
        var hyprice = cartObj.price;
        if (lv && lv.member_lv && lv.member_lv.disabled == false) {
          if (lv.product_lv && lv.product_lv.price > 0) {
            hyprice = lv.product_lv.price;
          } else {
            hyprice = cartObj.price>100?cartObj.price * lv.member_lv.dis_count / 100:cartObj.price;
          }
        }
        async.waterfall([function (cb) {
          Shop_member_cart.findOne({
            memberId: member.id,
            productId: cartObj.productId,
            goodsId: cartObj.goodsId
          }).exec(function (e, o) {
            cb(e, o);
          });
        }, function (obj, cb) {
          if (obj) {
            Shop_member_cart.update(obj.id, {num: cartObj.num + obj.num,price:hyprice}).exec(function (e1, o1) {
              cb(null, obj);
            });
          } else {
            cb(null, obj);
          }
        }, function (obj, cb) {
          if (!obj) {
            cartObj.memberId = member.id;
            cartObj.price=hyprice;
            Shop_member_cart.create(cartObj).exec(function (e2, o2) {
              cb(null, obj);
            });
          } else {
            cb(null, obj);
          }
        }], function (err, r) {

        });
      });
    });
  },
  //登录时将Cookies购物车数据同步到数据库
  updateCookieCartDataToDb: function (req, res, member, cb) {
    var cookies = req.cookies;
    if (cookies) {
      for (var key in cookies) {
        if (key.indexOf('shop_cart_goods_') == 0) {
          res.cookie(key, 'null', {maxAge: 0});
          var cartObj = JSON.parse(cookies[key]);
          //因为使用for循环，所以需要进行同步控制，否则会造成数据不一致
          Shop_member_cart.saveDb(member, cartObj);
        }
      }
    }
    cb();
  }
};
