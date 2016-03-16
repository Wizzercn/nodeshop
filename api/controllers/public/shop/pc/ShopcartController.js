/**
 * Created by root on 3/10/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  cartNum: function (req, res) {
    var member = req.session.member;
    if (member && member.memberId > 0) {
      Shop_member_cart.find({memberId: member.memberId}).sum('num').then(function (o) {
        return res.json({code: 0, msg: '', num: o[0].num});
      });
    } else {
      var num = 0;
      var cookies = req.cookies;
      if (cookies) {
        for (var key in cookies) {
          if (key.indexOf('shop_cart_goods_') == 0) {
            var o = JSON.parse(cookies[key]);
            if (o.num)
              num += o.num;
          }
        }
      }
      return res.json({code: 0, msg: '', num: num});
    }
  },
  delGoods: function (req, res) {
    var goodsId = StringUtil.getInt(req.body.goodsId);
    var productId = StringUtil.getInt(req.body.productId);
    var member = req.session.member;
    if (member && member.memberId > 0) {
      Shop_member_cart.destroy({
        memberId: member.memberId,
        productId: productId,
        goodsId: goodsId
      }).exec(function (err) {
        return res.json({code: 0, msg: ''});
      });
    } else {
      var key = 'shop_cart_goods_' + goodsId + '_' + productId;
      res.cookie(key, 'null', {maxAge: 0});
      return res.json({code: 0, msg: ''});
    }
  },
  changeGoodsNum: function (req, res) {
    var goodsId = StringUtil.getInt(req.body.goodsId);
    var productId = StringUtil.getInt(req.body.productId);
    var num = StringUtil.getInt(req.body.num);
    var member = req.session.member;
    if (member && member.memberId > 0) {
      Shop_member_cart.findOne({
        memberId: member.memberId,
        productId: productId,
        goodsId: goodsId
      }).exec(function (err, obj) {
        var n_num = obj.num + num;
        if (n_num == 0) {
          Shop_member_cart.destroy({
            memberId: member.memberId,
            productId: productId,
            goodsId: goodsId
          }).exec(function (e1) {
            return res.json({code: 0, msg: ''});
          });
        } else {
          Shop_member_cart.update({
            memberId: member.memberId,
            productId: productId,
            goodsId: goodsId
          }, {num: n_num}).exec(function (e2, o2) {
            return res.json({code: 0, msg: ''});
          });
        }
      });
    } else {
      var key = 'shop_cart_goods_' + goodsId + '_' + productId;
      var cookieGoods = req.cookies[key];
      if (cookieGoods) {
        var obj = JSON.parse(cookieGoods);
        var n_num = obj.num + num;
        obj.num = n_num;
        if (n_num == 0) {
          res.cookie(key, 'null', {maxAge: 0});
        } else {
          res.cookie('shop_cart_goods_' + goodsId + '_' + productId, JSON.stringify(obj), {
            maxAge: 1000 * 60 * 60 * 24 * 30,
            httpOnly: true,
            path: '/',
            secure: false
          });
        }
      }
      return res.json({code: 0, msg: ''});
    }
  },
  showGoods: function (req, res) {
    var member = req.session.member;
    var cookies = req.cookies;
    if (member && member.memberId > 0) {
      Shop_member_cart.find({memberId: member.memberId}).exec(function (err, list) {
        var allPrice = 0;
        var count = 0;
        var weight = 0;
        var list_new = [];
        if (list.length > 0) {
          list.forEach(function (obj) {
            count += obj.num;
            allPrice += obj.num * obj.price;
            weight += obj.num * obj.weight;
            obj.showPrice = StringUtil.setPrice(obj.price.toString());
            list_new.push(obj);
          });
        }
        return res.json({
          allPrice: allPrice,
          showAllprice: StringUtil.setPrice(allPrice.toString()),
          count: count,
          weight: weight,
          list: list_new
        });
      });
    } else {
      var allPrice = 0;
      var count = 0;
      var weight = 0;
      var list = [];
      if (cookies) {
        for (var key in cookies) {

          if (key.indexOf('shop_cart_goods_') == 0) {
            var cartObj = JSON.parse(cookies[key]);
            count += cartObj.num;
            allPrice += cartObj.num * cartObj.price;
            weight += cartObj.num * cartObj.weight;
            cartObj.showPrice = StringUtil.setPrice(cartObj.price.toString());
            list.push(cartObj);
          }
        }
        list.sort(StringUtil.arrSort('goodsId', false));
      }
      return res.json({
        allPrice: allPrice,
        showAllprice: StringUtil.setPrice(allPrice.toString()),
        count: count,
        weight: weight,
        list: list
      });
    }
  },
  addGoods: function (req, res) {
    var goodsId = StringUtil.getInt(req.body.goodsId);
    var productId = StringUtil.getInt(req.body.productId);
    var num = StringUtil.getInt(req.body.num);
    if (num == 0)num = 1;
    var member = req.session.member;

    async.waterfall([function (cb) {
      if (productId > 0) {
        Shop_goods_products.find({
          select: ['id', 'spec', 'price', 'weight','goodsid'],
          where: {disabled: false, id: productId}
        }).populate('goodsid', {
          select: ['id', 'imgurl']
        }).exec(function (e, o) {
          if (o && o.length > 0) {
            obj.price = o[0].price || 0;
            obj.weight = o[0].weight || 0;
            obj.spec = o[0].spec || '';
            obj.productId = productId;
            obj.goodsid = o[0].goodsid.id;
            obj.imgurl = o[0].goodsid.imgurl;
          }
          cb(e, obj);
        });
      } else {
        Shop_goods.find({
          select: ['id', 'name', 'price', 'imgurl', 'weight'],
          where: {disabled: false, id: goodsId}
        }).populate('products', {
          select: ['id', 'name', 'spec', 'price', 'weight'],
          sort: {location: 'asc'}
        }).exec(function (e, o) {
          var obj = {};
          obj.goodsId = goodsId;
          obj.spec = '';
          obj.productId = 0;
          if (o && o.length > 0) {
            obj.name = o[0].name || '';
            obj.price = o[0].price || 0;
            obj.weight = o[0].weight || 0;
            obj.imgurl = o[0].imgurl || '';
            var p = o[0].products;
            if (p.length == 1) {
              obj.productId = p[0].id;
            }
          }
          cb(e, obj);
        });
      }
    }], function (err, cartObj) {
      //根据用户是否登录存储到不同位置
      if (member && member.memberId > 0) {
        //这里只提交了一个对象，所以不用做同步控制（回调嵌回调即可）不同于 Shop_member_cart.updateCookieCartDataToDb
        Shop_member_cart.findOne({
          memberId: member.memberId,
          productId: cartObj.productId,
          goodsId: cartObj.goodsId
        }).exec(function (e, o) {
          if (o) {
            cartObj.num = o.num + num;
            Shop_member_cart.update(o.id, cartObj).exec(function (e1, o1) {
            });
          } else {
            cartObj.num = num;
            cartObj.memberId = member.memberId;
            Shop_member_cart.create(cartObj).exec(function (e2, o2) {
            });
          }
          return res.json({code: 0, msg: ''});
        });
      } else {
        var cookieGoods = req.cookies['shop_cart_goods_' + cartObj.goodsId + '_' + cartObj.productId];
        if (cookieGoods) {
          var obj = JSON.parse(cookieGoods);
          cartObj.num = obj.num + num;
          res.cookie('shop_cart_goods_' + cartObj.goodsId + '_' + cartObj.productId, JSON.stringify(cartObj), {
            maxAge: 1000 * 60 * 60 * 24 * 30,
            httpOnly: true,
            path: '/',
            secure: false
          });
        } else {
          cartObj.num = num;
          res.cookie('shop_cart_goods_' + cartObj.goodsId + '_' + cartObj.productId, JSON.stringify(cartObj), {
            maxAge: 1000 * 60 * 60 * 24 * 30,
            httpOnly: true,
            path: '/',
            secure: false
          });

        }
        return res.json({code: 0, msg: ''});
      }
    });

  },
  list: function (req, res) {
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      //获取所有商品分类
      allClassList: function (done) {
        Shop_goods_class.getAllClass(function (list) {
          done(null, list);
        });
      },
      cartGoods: function (done) {
        var member = req.session.member;
        var cookies = req.cookies;
        if (member && member.memberId > 0) {
          Shop_member_cart.find({memberId: member.memberId}).exec(function (err, list) {
            var allPrice = 0;
            var count = 0;
            var weight = 0;
            var list_new = [];
            if (list.length > 0) {
              list.forEach(function (obj) {
                count += obj.num;
                allPrice += obj.num * obj.price;
                weight += obj.num * obj.weight;
                obj.showPrice = StringUtil.setPrice(obj.price.toString());
                list_new.push(obj);
              });
            }
            done(null, {
              allPrice: allPrice,
              showAllprice: StringUtil.setPrice(allPrice.toString()),
              count: count,
              weight: weight,
              list: list_new
            });
          });
        } else {
          var allPrice = 0;
          var count = 0;
          var weight = 0;
          var list = [];
          if (cookies) {
            for (var key in cookies) {
              if (key.indexOf('shop_cart_goods_') == 0) {
                var cartObj = JSON.parse(cookies[key]);
                count += cartObj.num;
                allPrice += cartObj.num * cartObj.price;
                weight += cartObj.num * cartObj.weight;
                cartObj.showPrice = StringUtil.setPrice(cartObj.price.toString());
                list.push(cartObj);
              }
            }
          }
          done(null, {
            allPrice: allPrice,
            showAllprice: StringUtil.setPrice(allPrice.toString()),
            count: count,
            weight: weight,
            list: list
          });
        }
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.cartGoods = result.cartGoods || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.r = '/shopcart/list';
      req.data.siteTitle = '会员中心_' + req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/shopcart_list', req.data);

    });
  },
  save: function (req, res) {
    return res.end();
  }
};
