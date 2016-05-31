/**
 * Created by wizzer on 2016/5/23.
 */
var StringUtil = require('../../common/StringUtil');
var moment = require('moment');
var jwt = require('jwt-simple');

module.exports = {
  create: function (req, res) {
    sails.log.debug(req.appid);
    var ShopConfig = sails.config.system.ShopConfig;
    var member = req.appid;
    var list = req.body.list || [];
    var addrId = req.body.addrId || '0';
    var payType = req.body.payType || '';
    var receivedTime = req.body.receivedTime || '0';
    var couponId = req.body.couponId || '0';
    var memo = req.body.memo || '';
    var fapiao = req.body.fapiao || {};
    async.waterfall([
      function (cb) {
        Shop_member_addr.findOne({memberId:member}).exec(function(err,obj){
          addrId = obj.id;
          return cb(null);
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
          Shop_member.findOne(member).exec(function (mmbErr, mmb) {
            Shop_member_lv.findOne(mmb.lv_id).exec(function (elv, olv) {
              //计算会员价
              var lv = {member_lv: olv || {}};
              list.forEach(function (obj) {
                Shop_goods_products.findOne({
                  select: ['id', 'name', 'gn', 'spec', 'price', 'stock', 'buyMin', 'buyMax', 'weight', 'goodsid'],
                  where: {disabled: false, id: obj.productId, goodsid: obj.goodsId}
                }).populate('goodsid', {
                  select: ['id', 'imgurl']
                }).exec(function (e, o) {
                  if (o) {
                    var goods = {};
                    goods.orderId = orderId;
                    goods.goodsId = obj.goodsId;
                    goods.productId = obj.productId;
                    goods.num = StringUtil.getInt(obj.num);
                    goods.name = o.name;
                    goods.gn = o.gn;
                    goods.name = o.name;
                    goods.spec = o.spec;
                    goods.gprice = o.price;
                    goods.price = o.price;
                    goods.weight = o.weight;
                    goods.imgurl = o.goodsid.imgurl;
                    if (goods.num > o.stock) {
                      cb({code: 3, msg: o.name}, null);
                    }
                    if (o.buyMin > 0 && goods.num < o.buyMin) {
                      cb({code: 4, msg: o.name, num: o.buyMin}, null);
                    }
                    if (o.buyMax > 0 && goods.num > o.buyMax) {
                      cb({code: 5, msg: o.name, num: o.buyMax}, null);
                    }
                    Shop_goods_lv_price.findOne({
                      lvid: mmb.lv_id,
                      productId: obj.productId,
                      goodsid: obj.goodsId
                    }).exec(function (es, os) {
                      lv.product_lv = os || {};
                      var hyprice = o.price;
                      if (lv && lv.member_lv && lv.member_lv.disabled == false) {
                        if (lv.product_lv && lv.product_lv.price > 0) {
                          hyprice = lv.product_lv.price;
                        } else {
                          hyprice = o.price > 100 ? Math.ceil(o.price * lv.member_lv.dis_count / 100) : o.price;

                        }
                        goods.price = hyprice;
                      }
                      //...
                      count += goods.num;
                      allPrice += goods.num * goods.price;
                      weight += goods.num * goods.weight;
                      goods.amount = goods.num * goods.price;
                      goods.score = Math.floor(goods.amount / 100);
                      Shop_order_goods.create(goods).exec(function (err1, obj1) {

                      });
                      i++;
                      if (i == list.length) {
                        return cb(null, {
                          id: orderId,
                          memberId: member.memberId,
                          goodsAmount: allPrice,
                          weight: weight
                        });
                      }
                    });
                  } else {
                    return cb(null, {
                      id: orderId,
                      memberId: member.memberId,
                      goodsAmount: allPrice,
                      weight: weight
                    });
                  }
                });
              });
            });
          });
        },

    ],function(err, order) {
      if(err){
        return res.json({code: 1, msg: 'err:' +err});
      }
      return res.json({code: 1, msg: 'err:' +err});
    }
    );
  }
}
