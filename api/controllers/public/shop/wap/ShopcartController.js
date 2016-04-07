/**
 * Created by root on 3/10/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  //购物车商品数量
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
  //我的购物车-批量删除
  delCart: function (req, res) {
    var list = req.body.list || [];
    if (list && list.length > 0) {
      var member = req.session.member;
      if (member && member.memberId > 0) {
        var i = 0;
        list.forEach(function (o) {
          Shop_member_cart.destroy({
            memberId: member.memberId,
            productId: o.productId,
            goodsId: o.goodsId
          }).exec(function (err) {
            i++;
            if (i == list.length) {
              return res.json({code: 0, msg: ''});
            }
          });
        });
      } else {
        var j = 0;
        list.forEach(function (o) {
          var key = 'shop_cart_goods_' + o.goodsId + '_' + o.productId;
          res.cookie(key, 'null', {maxAge: 0});
          j++;
          if (j == list.length) {
            return res.json({code: 0, msg: ''});
          }
        });
      }
    }
  },
  //我的购物车-清空购物车
  clearCart: function (req, res) {
    var member = req.session.member;
    if (member && member.memberId > 0) {
      Shop_member_cart.destroy({
        memberId: member.memberId
      }).exec(function (err) {
        return res.json({code: 0, msg: ''});
      });
    } else {
      var cookies = req.cookies;
      if (cookies) {
        for (var key in cookies) {
          if (key.indexOf('shop_cart_goods_') == 0) {
            res.cookie(key, 'null', {maxAge: 0});
          }
        }
      }
      return res.json({code: 0, msg: ''});
    }
  },
  //浮动购物车-删除商品
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
  //增加或减少商品数量
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
        if(err)return res.json({code: 0, msg: ''});
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
  //获取购物车商品
  showGoods: function (req, res) {
    var member = req.session.member;
    var cookies = req.cookies;
    var ShopConfig = sails.config.system.ShopConfig;
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
            obj.showSumPrice = StringUtil.setPrice((obj.price * obj.num).toString());
            list_new.push(obj);
          });
        }
        //计算运费
        var yunMoney = 0;
        if (ShopConfig.freight_disabled == false && allPrice > 0) {
          if (ShopConfig.freight_type == 'price') {
            if (allPrice < ShopConfig.freight_num * 100) {
              yunMoney = ShopConfig.freight_price * 100;
            }
          } else if (ShopConfig.freight_type == 'weight') {
            if (weight >= ShopConfig.freight_num) {
              yunMoney = Math.ceil(weight/ShopConfig.freight_num)*ShopConfig.freight_price * 100;
            }
          }
        }
        return res.json({
          allPrice: allPrice,
          showAllprice: StringUtil.setPrice(allPrice.toString()) || '0.00',
          count: count,
          weight: weight,
          yunMoney: yunMoney,
          showYunMoney: StringUtil.setPrice(yunMoney.toString()) || '0.00',
          totalMoney: yunMoney + allPrice,
          showTotalMoney: StringUtil.setPrice((yunMoney + allPrice).toString()) || '0.00',
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
            cartObj.showSumPrice = StringUtil.setPrice((cartObj.price * cartObj.num).toString());
            list.push(cartObj);
          }
        }
        list.sort(StringUtil.arrSort('goodsId', false));
      }
      //计算运费
      var yunMoney = 0;
      if (ShopConfig.freight_disabled == false && allPrice > 0) {
        if (ShopConfig.freight_type == 'price') {
          if (allPrice < ShopConfig.freight_num * 100) {
            yunMoney = ShopConfig.freight_price * 100;
          }
        } else if (ShopConfig.freight_type == 'weight') {
          if (weight >= ShopConfig.freight_num) {
            yunMoney = Math.ceil(weight/ShopConfig.freight_num)*ShopConfig.freight_price * 100;
          }
        }
      }
      return res.json({
        allPrice: allPrice,
        showAllprice: StringUtil.setPrice(allPrice.toString()) || '0.00',
        count: count,
        weight: weight,
        yunMoney: yunMoney,
        showYunMoney: StringUtil.setPrice(yunMoney.toString()) || '0.00',
        totalMoney: yunMoney + allPrice,
        showTotalMoney: StringUtil.setPrice((yunMoney + allPrice).toString()) || '0.00',
        list: list
      });
    }
  },
  //获取购物车商品(获取部分数据)
  readGoods: function (req, res) {
    var read_list = req.body.list || [];
    var member = req.session.member;
    var cookies = req.cookies;
    var ShopConfig = sails.config.system.ShopConfig;
    if (member && member.memberId > 0) {
      async.waterfall([function (cb) {
        var list = [];
        var i = 0;
        if (read_list.length > 0) {
          read_list.forEach(function (o) {
            Shop_member_cart.findOne({
              memberId: member.memberId,
              goodsId: o.goodsId,
              productId: o.productId
            }).exec(function (err, obj) {
              if (obj) {
                list.push(obj);
              }
              i++;
              if (i == read_list.length) {
                cb(null, list);
              }
            });
          });
        } else {
          cb(null, list);
        }
      }], function (err, list) {
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
            obj.showSumPrice = StringUtil.setPrice((obj.price * obj.num).toString());
            list_new.push(obj);
          });
        }
        //计算运费
        var yunMoney = 0;
        if (ShopConfig.freight_disabled == false && allPrice > 0) {
          if (ShopConfig.freight_type == 'price') {
            if (allPrice < ShopConfig.freight_num * 100) {
              yunMoney = ShopConfig.freight_price * 100;
            }
          } else if (ShopConfig.freight_type == 'weight') {
            if (weight >= ShopConfig.freight_num) {
              yunMoney = Math.ceil(weight/ShopConfig.freight_num)*ShopConfig.freight_price * 100;
            }
          }
        }
        return res.json({
          allPrice: allPrice,
          showAllprice: StringUtil.setPrice(allPrice.toString()) || '0.00',
          count: count,
          weight: weight,
          yunMoney: yunMoney,
          showYunMoney: StringUtil.setPrice(yunMoney.toString()) || '0.00',
          totalMoney: yunMoney + allPrice,
          showTotalMoney: StringUtil.setPrice((yunMoney + allPrice).toString()) || '0.00',
          list: list_new
        });
      });
    } else {
      var allPrice = 0;
      var count = 0;
      var weight = 0;
      var list = [];
      if (cookies) {
        read_list.forEach(function (o) {
          var cookieGoods = req.cookies['shop_cart_goods_' + o.goodsId + '_' + o.productId];
          if (cookieGoods) {
            var cartObj = JSON.parse(cookieGoods);
            count += cartObj.num;
            allPrice += cartObj.num * cartObj.price;
            weight += cartObj.num * cartObj.weight;
            cartObj.showPrice = StringUtil.setPrice(cartObj.price.toString());
            cartObj.showSumPrice = StringUtil.setPrice((cartObj.price * cartObj.num).toString());
            list.push(cartObj);
          }
        });
        list.sort(StringUtil.arrSort('goodsId', false));
      }
      //计算运费
      var yunMoney = 0;
      if (ShopConfig.freight_disabled == false && allPrice > 0) {
        if (ShopConfig.freight_type == 'price') {
          if (allPrice < ShopConfig.freight_num * 100) {
            yunMoney = ShopConfig.freight_price * 100;
          }
        } else if (ShopConfig.freight_type == 'weight') {
          if (weight >= ShopConfig.freight_num) {
            yunMoney = Math.ceil(weight/ShopConfig.freight_num)*ShopConfig.freight_price * 100;
          }
        }
      }
      return res.json({
        allPrice: allPrice,
        showAllprice: StringUtil.setPrice(allPrice.toString()) || '0.00',
        count: count,
        weight: weight,
        yunMoney: yunMoney,
        showYunMoney: StringUtil.setPrice(yunMoney.toString()) || '0.00',
        totalMoney: yunMoney + allPrice,
        showTotalMoney: StringUtil.setPrice((yunMoney + allPrice).toString()) || '0.00',
        list: list
      });
    }
  },
  //向购物车添加商品
  addGoods: function (req, res) {
    var goodsId = StringUtil.getInt(req.body.goodsId);
    var productId = StringUtil.getInt(req.body.productId);
    var num = StringUtil.getInt(req.body.num);
    if (num == 0)num = 1;
    var stock=0;
    var member = req.session.member;

    async.waterfall([function (cb) {
      if (productId > 0) {
        Shop_goods_products.find({
          select: ['id', 'spec','name', 'price','stock', 'weight', 'goodsid'],
          where: {disabled: false, id: productId}
        }).populate('goodsid', {
          select: ['id', 'imgurl']
        }).exec(function (e, o) {
          var obj={};
          if (o && o.length > 0) {
            obj.price = o[0].price || 0;
            obj.weight = o[0].weight || 0;
            obj.spec = o[0].spec || '';
            obj.name = o[0].name || '';
            obj.productId = productId;
            obj.goodsId = o[0].goodsid.id;
            obj.imgurl = o[0].goodsid.imgurl;
            stock=o[0].stock || 0;
          }

          cb(e, obj);
        });
      } else {
        Shop_goods.find({
          select: ['id', 'name', 'price', 'imgurl', 'weight'],
          where: {disabled: false, id: goodsId}
        }).populate('products', {
          select: ['id', 'name', 'spec','stock','price', 'weight'],
          sort: {location: 'asc'}
        }).exec(function (e, o) {
          var obj = {};
          obj.goodsId = goodsId;
          obj.spec = '';
          obj.productId = 0;
          if (o && o.length > 0) {

            obj.imgurl = o[0].imgurl || '';
            var p = o[0].products;
            if (p.length == 1) {
              obj.name = p[0].name || '';
              obj.price = p[0].price || 0;
              obj.weight = p[0].weight || 0;
              obj.productId = p[0].id;
              stock=p[0].stock || 0;
            }
          }
          cb(e, obj);
        });
      }
    }], function (err, cartObj) {
      //根据用户是否登录存储到不同位置
      if (member && member.memberId > 0 && cartObj && cartObj.price>0) {
        Shop_member.findOne(member.memberId).exec(function(mmbErr,mmb) {

          Shop_goods_lv_price.findOne({
            lvid: mmb.lv_id,
            productId: cartObj.productId,
            goodsid: cartObj.goodsId
          }).exec(function (es, os) {
            Shop_member_lv.findOne(mmb.lv_id).exec(function (elv, olv) {
              //计算会员价
              var lv = {member_lv: olv || {}, product_lv: os || {}};
              var hyprice = cartObj.price;
              if (lv && lv.member_lv && lv.member_lv.disabled == false) {
                if (lv.product_lv && lv.product_lv.price > 0) {
                  hyprice = lv.product_lv.price;
                } else {
                  hyprice = cartObj.price > 100 ? cartObj.price * lv.member_lv.dis_count / 100 : cartObj.price;
                }
              }
              //这里只提交了一个对象，所以不用做同步控制（回调嵌回调即可）不同于 Shop_member_cart.updateCookieCartDataToDb
              Shop_member_cart.findOne({
                memberId: member.memberId,
                productId: cartObj.productId,
                goodsId: cartObj.goodsId
              }).exec(function (e, o) {
                if (o) {
                  cartObj.num = o.num + num;
                  cartObj.price = hyprice;
                  if(cartObj.num>stock){
                    return res.json({code: 2, msg: '库存不足'});
                  }
                  Shop_member_cart.update(o.id, cartObj).exec(function (e1, o1) {
                    return res.json({code: 0, msg: ''});
                  });
                } else {
                  cartObj.num = num;
                  cartObj.memberId = member.memberId;
                  cartObj.price = hyprice;
                  if(cartObj.num>stock){
                    return res.json({code: 2, msg: '库存不足'});
                  }
                  Shop_member_cart.create(cartObj).exec(function (e2, o2) {
                    return res.json({code: 0, msg: ''});
                  });
                }

              });
            });
          });
        });
      } else if(cartObj && cartObj.price>0){
        var cookieGoods = req.cookies['shop_cart_goods_' + cartObj.goodsId + '_' + cartObj.productId];
        if (cookieGoods) {
          var obj = JSON.parse(cookieGoods);
          cartObj.num = obj.num + num;
          if(cartObj.num>stock){
            return res.json({code: 2, msg: '库存不足'});
          }
          res.cookie('shop_cart_goods_' + cartObj.goodsId + '_' + cartObj.productId, JSON.stringify(cartObj), {
            maxAge: 1000 * 60 * 60 * 24 * 30,
            httpOnly: true,
            path: '/',
            secure: false
          });
          return res.json({code: 0, msg: ''});
        } else {
          cartObj.num = num;
          if(cartObj.num>stock){
            return res.json({code: 2, msg: '库存不足'});
          }
          res.cookie('shop_cart_goods_' + cartObj.goodsId + '_' + cartObj.productId, JSON.stringify(cartObj), {
            maxAge: 1000 * 60 * 60 * 24 * 30,
            httpOnly: true,
            path: '/',
            secure: false
          });
          return res.json({code: 0, msg: ''});
        }

      }else{
        return res.json({code: 2, msg: '商品已下架'});
      }
    });

  },
  //我的购物车-列表
  list: function (req, res) {
    req.data.StringUtil = StringUtil;
    req.data.moment = moment;
    req.data.r = '/wap/shopcart/list';
    return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/shopcart_list', req.data);
  },
  //我的购物车-保存购物车
  save: function (req, res) {
    var goodsId = req.query.goodsId;
    var productId = req.query.productId;
    var num = StringUtil.getInt(req.query.num) || 1;
    var member = req.session.member;
    if (member && member.memberId > 0) {
      if (goodsId && productId) {
        Shop_goods_products.findOne({
          select: ['id', 'name', 'spec', 'price', 'weight','stock', 'goodsid'],
          where: {disabled: false, id: productId, goodsid: goodsId}
        }).populate('goodsid', {
          select: ['id', 'imgurl']
        }).exec(function (e, o) {
          if (o) {
            var obj = {};
            obj.price = o.price || 0;
            obj.weight = o.weight || 0;
            obj.name = o.name || '';
            obj.spec = o.spec || '';
            obj.productId = productId;
            obj.goodsId = goodsId;
            obj.imgurl = o.goodsid.imgurl;
            obj.is_buy = true;
            obj.num = num;
            if(num>o.stock){
              return res.json({code: 3, msg: '库存不足'});
            }
            Shop_member.findOne(member.memberId).exec(function(mmbErr,mmb) {

              Shop_goods_lv_price.findOne({
                lvid: mmb.lv_id,
                productId: productId,
                goodsid: goodsId
              }).exec(function (es, os) {
                Shop_member_lv.findOne(mmb.lv_id).exec(function (elv, olv) {
                  //计算会员价
                  var lv = {member_lv: olv || {}, product_lv: os || {}};
                  var hyprice = obj.price;
                  if (lv && lv.member_lv && lv.member_lv.disabled == false) {
                    if (lv.product_lv && lv.product_lv.price > 0) {
                      hyprice = lv.product_lv.price;
                    } else {
                      hyprice = obj.price > 100 ? obj.price * lv.member_lv.dis_count / 100 : obj.price;

                    }
                  }
                  //将购物车其他商品置为非购买状态
                  Shop_member_cart.update({memberId: member.memberId}, {is_buy: false}).exec(function (e1, o1) {
                    //这里只提交了一个对象，所以不用做同步控制（回调嵌回调即可）不同于 Shop_member_cart.updateCookieCartDataToDb
                    Shop_member_cart.findOne({
                      memberId: member.memberId,
                      productId: productId,
                      goodsId: goodsId
                    }).exec(function (e, o) {
                      if (o) {
                        obj.price = hyprice;
                        Shop_member_cart.update(o.id, obj).exec(function (e1, o1) {
                          return res.json({code: 0, msg: ''});
                        });
                      } else {
                        obj.memberId = member.memberId;
                        obj.price = hyprice;
                        Shop_member_cart.create(obj).exec(function (e2, o2) {
                          return res.json({code: 0, msg: ''});

                        });
                      }
                    });
                  });
                });
              });
            });
          } else {
            return res.json({code: 2, msg: ''});
          }
        });
      } else {
        var list = req.body.list || [];
        //将购物车其他商品置为非购买状态
        Shop_member_cart.update({memberId: member.memberId}, {is_buy: false}).exec(function (e1, o1) {
          var i = 0;
          list.forEach(function (o) {
            Shop_member_cart.update({
              memberId: member.memberId,
              goodsId: o.goodsId,
              productId: o.productId
            }, {is_buy: true}).exec(function (e2, o2) {
              i++;
              if (i == list.length) {
                return res.json({code: 0, msg: ''});
              }
            });
          });
        });
      }
    } else {
      return res.json({code: 1, msg: ''});
    }
  },
  //我的购物车-确认订单信息
  buy: function (req, res) {
    var ShopConfig = sails.config.system.ShopConfig;
    var member = req.session.member;
    if (member && member.memberId > 0) {
      async.parallel({
        cartGoods: function (done) {
          Shop_member_cart.find({memberId: member.memberId, is_buy: true}).exec(function (err, list) {
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
                obj.showSumPrice = StringUtil.setPrice((obj.price * obj.num).toString());
                list_new.push(obj);
              });
            }
            //计算运费
            var yunMoney = 0;
            if (ShopConfig.freight_disabled == false && allPrice > 0) {
              if (ShopConfig.freight_type == 'price') {
                if (allPrice < ShopConfig.freight_num * 100) {
                  yunMoney = ShopConfig.freight_price * 100;
                }
              } else if (ShopConfig.freight_type == 'weight') {
                if (weight >= ShopConfig.freight_num) {
                  yunMoney = Math.ceil(weight/ShopConfig.freight_num)*ShopConfig.freight_price * 100;
                }
              }
            }
            done(null, {
              allPrice: allPrice,
              showAllprice: StringUtil.setPrice(allPrice.toString()) || '0.00',
              count: count,
              weight: weight,
              yunMoney: yunMoney,
              showYunMoney: StringUtil.setPrice(yunMoney.toString()) || '0.00',
              totalMoney: yunMoney + allPrice,
              showTotalMoney: StringUtil.setPrice((yunMoney + allPrice).toString()) || '0.00',
              list: list_new
            });
          });
        },
        couponList: function (done) {
          Shop_member_coupon.find({
            select: ['id', 'couponName', 'couponPrice'],
            where: {memberId: member.memberId, status: 0}
          }).exec(function (e, l) {
            done(null, l);
          });
        },
        address: function (done) {
          Shop_member_addr.findOne({memberId: member.memberId,is_default:true}).exec(function (e, o) {
            done(null, o);
          });
        }
      }, function (err, result) {
        req.data.couponList = result.couponList || [];
        req.data.cartGoods = result.cartGoods || {};
        req.data.address = result.address || {};
        req.data.StringUtil = StringUtil;
        req.data.moment = moment;
        req.data.r = '/wap/shopcart/buy';
        return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/shopcart_buy', req.data);

      });
    } else {
      return res.redirect('/login');
    }
  },
  //生成订单
  orderSave: function (req, res) {
    var ShopConfig = sails.config.system.ShopConfig;
    var member = req.session.member;
    var list = req.body.list || [];
    var addrId = req.body.addrId || '0';
    var payType = req.body.payType || '';
    var receivedTime=req.body.receivedTime||'0';
    var couponId = req.body.couponId || '0';
    var memo = req.body.memo || '';
    var fapiao = req.body.fapiao || {};
    if (member && member.memberId > 0) {
      async.waterfall([
        //1.生成订单号
        function (cb) {
          Shop_order.getOrderId(function (orderId) {
            cb(null, orderId);
          });
        },
        //2.获取商品信息、计算会员价、插入订单商品表
        function (orderId, cb) {
          var allPrice = 0;
          var count = 0;
          var weight = 0;
          var i = 0;
          Shop_member.findOne(member.memberId).exec(function(mmbErr,mmb){
          Shop_member_lv.findOne(mmb.lv_id).exec(function (elv, olv) {
            //计算会员价
            var lv = {member_lv: olv || {}};
            list.forEach(function (obj) {
              Shop_goods_products.findOne({
                select: ['id', 'name', 'gn', 'spec', 'price', 'stock','weight', 'goodsid'],
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
                  goods.imgurl= o.goodsid.imgurl;
                  if(goods.num> o.stock){
                    return cb({code:3,msg:o.name},null);
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
                        hyprice = o.price>100?o.price * lv.member_lv.dis_count / 100:o.price;

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
                      if(err1)
                       sails.log.debug(JSON.stringify(err1));
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
                }else{
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
        //3.计算运费
        function (order, cb) {
          var yunMoney = 0;
          if (ShopConfig.freight_disabled == false && order.goodsAmount > 0) {
            if (ShopConfig.freight_type == 'price') {
              if (order.goodsAmount < ShopConfig.freight_num * 100) {
                yunMoney = ShopConfig.freight_price * 100;
              }
            } else if (ShopConfig.freight_type == 'weight') {
              if (order.weight >= ShopConfig.freight_num) {
                yunMoney = Math.ceil(order.weight/ShopConfig.freight_num)*ShopConfig.freight_price * 100;
              }
            }
          }
          order.freightAmount = yunMoney;
          return cb(null, order);
        },
        //4.计算优惠券,和积分
        function (order, cb) {
          Shop_member_coupon.findOne({memberId: member.memberId, id: couponId, status: 0}).exec(function (e, o) {
            var discountAmount = 0;
            if (o) {
              discountAmount = o.couponPrice;
            }
            order.discountAmount = discountAmount;
            order.finishAmount = order.goodsAmount + order.freightAmount - discountAmount;
            if(order.finishAmount<1){
              order.finishAmount=1;
            }
            if(order.finishAmount-order.freightAmount-discountAmount>0){
              order.score=Math.floor((order.finishAmount-order.freightAmount-discountAmount) / 100);
            }else {
              order.score=0;
            }
            return cb(null, order);
          });
        },
        //5.获取收货地址
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
        }, function (order, cb) {
          order.memo = memo;
          order.source = 'pc';
          order.createdIp = req.ip;
          order.status = 'active';//['active','dead','finish']
          order.payStatus = 0;
          order.payType = payType;
          order.receivedTime=receivedTime;
          Shop_order.create(order).exec(function (e, o) {
            return cb(e, order);
          });
        }], function (err, order) {
        sails.log.debug('saveOrder err::'+JSON.stringify(err));
        if (err) {
          if(err.code==3){
            return res.json({code: 3, msg:'商品:'+ err.msg+'<br>库存不足,请重新下单'});
          }
          /*订单日志表
           opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
           opType:admin,member
           opResult:ok,fail
           */
          Shop_order_log.create({orderId:order.id,opTag:'create',opContent:'创建订单',opType:'member',
            opId:member.memberId,
            opNickname:member.nickname,
            opAt:moment().format('X'),
            opResult:'fail'
          }).exec(function(el1,ol1){

          });
          return res.json({code: 2, msg: ''});
        } else {
          /*订单日志表
           opTag:create,update,payment,refund,delivery,receive,reship,complete,finish,cancel
           opType:admin,member
           opResult:ok,fail
          */
          Shop_order_log.create({orderId:order.id,opTag:'create',opContent:'创建订单',opType:'member',
            opId:member.memberId,
            opNickname:member.nickname,
            opAt:moment().format('X'),
            opResult:'ok'
          }).exec(function(el1,ol1){

          });
          //订单提交成功则更新优惠券状态  0未使用  1已使用  2已失效
          if(couponId){
            Shop_member_coupon.update(couponId, {
              status: 1,
              orderId: order.id,
              orderAt: moment().format('X')
            }).exec(function (e, o) {

            });
          }
          //订单提交成功则删除购物车数据
          list.forEach(function (o) {
            Shop_member_cart.destroy({
              memberId: member.memberId,
              productId: o.productId,
              goodsId: o.goodsId
            }).exec(function (e) {
            });
            Shop_goods.query('UPDATE shop_goods SET buy_count=buy_count+1 WHERE id=?',[o.goodsId],function(gErr,g){
            });
            Shop_goods_products.query('UPDATE shop_goods_products SET stock=stock-? WHERE id=?',[StringUtil.getInt(o.num),o.productId],function(gErr,g){
            });
          });
          return res.json({code: 0, msg: '订单生成成功',orderId:order.id});
        }
      });
    } else {
      return res.json({code: 1, msg: '会员未登录'});
    }
  },
  order: function (req, res) {
    var id = req.params.id || '';
    var member = req.session.member;
    if (member && member.memberId > 0) {
      sails.log.debug('wxpay member::'+JSON.stringify(member));
      async.parallel({
        order: function (done) {
          Shop_order.findOne({id:id,memberId:member.memberId}).exec(function (e, order) {
            if(member.loginWx&& order.payType=='pay_wxpay'){
              WxpayService.init(function (err, wxpay) {
                if (wxpay){
                  wxpay.getBrandWCPayRequestParams({
                    openid:member.openid,
                    body: '订单号:' + id,
                    out_trade_no: id,
                    total_fee: order.finishAmount,
                    spbill_create_ip: sails.config.system.AppIp || '127.0.0.1',
                    notify_url: 'http://' + sails.config.system.AppDomain + '/public/shop/pc/wxpay/order',
                    product_id: id
                  }, function (err, result) {
                    sails.log.debug('wxpay result::'+JSON.stringify(result));
                    order.wxpayInfo=result;
                    done(null, order);
                  });
                }else {
                  order.wxpayInfo={};
                  done(null, order);
                }
              });
            }else {
              order.wxpayInfo={};
              done(null, order);
            }
          });
        },
        member: function (done) {
          Shop_member.findOne(member.memberId).exec(function (e, o) {
              done(null, o);
          });
        }
      }, function (err, result) {
        req.data.order = result.order || {};
        req.data.dbMember = result.member || {};
        req.data.member = member;
        req.data.StringUtil = StringUtil;
        req.data.moment = moment;
        return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/shopcart_order', req.data);
      });
    } else {
      return res.redirect('/wap/login?r=/wap/shopcart/order/'+id);
    }
  }

};
