/**
 * Created by wizzer on 2016/5/23.
 */
var StringUtil = require('../../common/StringUtil');
var moment = require('moment');
module.exports = {
  basket: function (req, res) {
    Api_basket.find({select: ['id', 'name', 'num'], where: {appid: req.appid}}).exec(function (e, l) {
      if (e) {
        return res.json({code: 1, msg: 'err:' + e});
      }
      return res.json({code: 0, msg: 'success', data: l});
    });
  },
  sku: function (req, res) {
    try {
      var basketid = req.body.basketid;
      var skus = [];
      Api_basket_products.find({select: ['sku'], where: {basketid: basketid,appid: req.appid}}).exec(function (e, l) {
        if (e) {
          return res.json({code: 1, msg: 'err:' + e});
        }
        if (l.length > 0) {
          l.forEach(function (o) {
            skus.push(o.sku);
          });
        }
        return res.json({code: 0, msg: 'success', data: skus});
      });
    } catch (err) {
      return res.json({code: 2, msg: 'err:' + err});
    }
  },
  detail: function (req, res) {
    try {
      var sku = req.body.sku;
      Shop_goods_products.findOne({gn: sku}).populate('goodsid').populate('classid').populate('brandid').exec(function (e, o) {
        if (e || !o) {
          return res.json({code: 1, msg: 'err:' + e});
        }
        var obj = {};
        obj.sku = o.sku;
        obj.weight = o.weight;
        if (o.goodsid && o.goodsid.imgurl) {
          obj.imagePath = 'http://' + sails.config.system.AppDomain + o.goodsid.imgurl;
        } else {
          obj.imagePath = '';
        }
        obj.state = o.disabled == true ? 0 : 1;//1为上架 0为下架
        if (o.brandid && o.brandid.name) {
          obj.brandName = o.brandid.name;
        } else {
          obj.brandName = '';
        }
        if (o.spec) {
          obj.name = o.name + ' (' + o.spec + ')';
        } else {
          obj.name = o.name;
        }
        if (o.classid && o.classid.name) {
          obj.category = o.classid.name;
        } else {
          obj.category = '';
        }
        obj.saleUnit = '百大';
        if (o.goodsid && o.goodsid.note) {
          var note = o.goodsid.note || '';
          //将图片、附件链接，替换为公网地址
          note = note.replace(/src=\/upload/g, 'src=http://' + sails.config.system.AppDomain + '/upload');
          note = note.replace(/src="\/upload/g, 'src="http://' + sails.config.system.AppDomain + '/upload');
          note = note.replace(/href=\/upload/g, 'href=http://' + sails.config.system.AppDomain + '/upload');
          note = note.replace(/href="\/upload/g, 'href="http://' + sails.config.system.AppDomain + '/upload');
          obj.introduction = note;
        } else {
          obj.introduction = '';
        }
        if (o.goodsid && o.goodsid.prop) {
          var str = '<table width="100%" cellspacing="1" cellpadding="0" border="0" class="Ptable"><tbody><tr><th colspan="2" class="tdTitle">基本参数</th></tr><tr></tr>';
          if (o.goodsid.prop.length > 0) {
            o.goodsid.prop.forEach(function (p) {
              str += '<tr><td class="tdTitle">' + p.name + '</td><td>' + p.value + '</td></tr>';
            });
          }
          str += '</tbody></table>';
          obj.param = str;
        } else {
          obj.param = '';
        }
        return res.json({code: 0, msg: 'success', data: obj});
      });
    } catch (err) {
      return res.json({code: 2, msg: 'err:' + err});
    }
  },
  state: function (req, res) {
    try {
      var sku = req.body.sku;
      var skus = sku.split(',');
      var states = [];
      var i = 0;
      if (skus.length > 100) {
        return res.json({code: 1, msg: 'err:sku too length'});
      }
      skus.forEach(function (gn) {
        Shop_goods_products.findOne({select: ['id', 'gn', 'disabled'], where: {gn: gn}}).exec(function (e, o) {
          if (o) {
            var obj = {};
            obj.sku = gn;
            obj.state = o.disabled == true ? 0 : 1;//1为上架 0为下架
            states.push(obj);
          }
          i++;
          if (i == skus.length) {
            return res.json({code: 0, msg: 'success', data: states});
          }
        });
      });
    } catch (err) {
      return res.json({code: 2, msg: 'err:' + err});
    }
  },
  image: function (req, res) {
    try {
      var sku = req.body.sku;
      var skus = sku.split(',');
      var images = [];
      var i = 0;
      if (skus.length > 100) {
        return res.json({code: 1, msg: 'err:sku too length'});
      }
      skus.forEach(function (gn) {
        Shop_goods_products.findOne({
          select: ['id', 'gn', 'disabled', 'goodsid'],
          where: {gn: gn}
        }).exec(function (e, o) {
          Shop_goods.findOne({select: ['id', 'imgurl'], where: {id: o.goodsid}}).exec(function (eg, og) {
            Shop_images.find({goodsid: o.goodsid}).sort({id: 'asc'}).exec(function (ei, img) {
              if (img && img.length > 0) {
                var j = 0;
                var r = [];
                img.forEach(function (m) {
                  var obj = {};
                  obj.path = 'http://' + sails.config.system.AppDomain + m.imgurl;
                  if (og && og.imgurl == m.imgurl) {
                    obj.isPrimary = 1;
                  } else {
                    obj.isPrimary = 0;
                  }
                  obj.orderSort = j;
                  r.push(obj);
                  j++;
                });
                var s = {};
                s.sku = gn;
                s.images = r;
                images.push(s);
              }
              i++;
              if (i == skus.length) {
                return res.json({code: 0, msg: 'success', data: images});
              }
            });
          });
        });
      });
    } catch (err) {
      return res.json({code: 2, msg: 'err:' + err});
    }
  },
  goodwill: function (req, res) {
    try {
      var sku = req.body.sku;
      var skus = sku.split(',');
      var goodwill = [];
      var i = 0;
      if (skus.length > 50) {
        return res.json({code: 1, msg: 'err:sku too length'});
      }
      skus.forEach(function (gn) {
        Shop_goods_products.findOne({
          select: ['id', 'gn', 'goodsid'],
          where: {gn: gn}
        }).exec(function (e, o) {
          if (o) {
            Shop_member_comment.count({type: 1, goodsId: o.goodsid, score: 3, disabled: false}).exec(function (e3, c3) {//好
              Shop_member_comment.count({
                type: 1,
                goodsId: o.goodsid,
                score: 2,
                disabled: false
              }).exec(function (e3, c2) {//中
                Shop_member_comment.count({
                  type: 1,
                  goodsId: o.goodsid,
                  score: 1,
                  disabled: false
                }).exec(function (e3, c1) {//差
                  var allCount = c3 + c2 + c1;
                  var goodRate = Math.round(c3 / allCount * 100);
                  var generalRate = Math.round(c2 / allCount * 100);
                  var poorRate = Math.round(c1 / allCount * 100);
                  var obj = {};
                  obj.sku = gn;
                  obj.goodRate = goodRate || 100;
                  obj.generalRate = generalRate || 0;
                  obj.poorRate = poorRate || 0;
                  if (obj.goodRate >= 70) {
                    obj.averageScore = '5颗星';
                  } else {
                    obj.averageScore = '4颗星';
                  }
                  goodwill.push(obj);
                  i++;
                  if (i == skus.length) {
                    return res.json({code: 0, msg: 'success', data: goodwill});
                  }
                });
              });
            });
          } else {
            i++;
            if (i == skus.length) {
              return res.json({code: 0, msg: 'success', data: goodwill});
            }
          }
        });
      });
    } catch (err) {
      return res.json({code: 2, msg: 'err:' + err});
    }
  },
  price: function (req, res) {
    try {
      var sku = req.body.sku;
      var skus = sku.split(',');
      var prices = [];
      var i = 0;
      if (skus.length > 100) {
        return res.json({code: 1, msg: 'err:sku too length'});
      }
      skus.forEach(function (gn) {
        Shop_goods_products.findOne({
          select: ['id', 'gn', 'goodsid', 'price'],
          where: {gn: gn}
        }).exec(function (e, o) {
          if (o) {
            var obj = {};
            obj.sku = gn;
            obj.price = StringUtil.setPrice(o.price);
            prices.push(obj);
            i++;
            if (i == skus.length) {
              return res.json({code: 0, msg: 'success', data: prices});
            }
          } else {
            i++;
            if (i == skus.length) {
              return res.json({code: 0, msg: 'success', data: prices});
            }
          }
        });
      });
    } catch (err) {
      return res.json({code: 2, msg: 'err:' + err});
    }
  },
  negoprice: function (req, res) {
    try {
      var sku = req.body.sku;
      var skus = sku.split(',');
      var prices = [];
      var i = 0;
      if (skus.length > 100) {
        return res.json({code: 1, msg: 'err:sku too length'});
      }
      skus.forEach(function (gn) {
        Api_basket_products.findOne({
          select: ['id', 'sku', 'productid', 'price'],
          where: {sku: gn,appid: req.appid}
        }).populate('productid').exec(function (e, o) {
          if (o) {
            var obj = {};
            obj.sku = gn;
            obj.negoprice = StringUtil.setPrice(o.price);
            if(o.productid&& o.productid.price){
              obj.price = StringUtil.setPrice(o.productid.price);
            }else{
              obj.price = StringUtil.setPrice(o.productid.price);
            }
            prices.push(obj);
            i++;
            if (i == skus.length) {
              return res.json({code: 0, msg: 'success', data: prices});
            }
          } else {
            i++;
            if (i == skus.length) {
              return res.json({code: 0, msg: 'success', data: prices});
            }
          }
        });
      });
    } catch (err) {
      return res.json({code: 2, msg: 'err:' + err});
    }
  },
  stock: function (req, res) {
    try {
      var sku = req.body.sku;
      var skus = sku.split(',');
      var stocks = [];
      var i = 0;
      if (skus.length > 100) {
        return res.json({code: 1, msg: 'err:sku too length'});
      }
      skus.forEach(function (gn) {
        Shop_goods_products.findOne({
          select: ['id', 'gn', 'stock'],
          where: {gn: gn}
        }).exec(function (e, o) {
          if (o) {
            var obj = {};
            obj.sku = gn;
            if(o.stock>0){
              obj.stock = '有货';
            }else{
              obj.stock = '无货';
            }
            stocks.push(obj);
            i++;
            if (i == skus.length) {
              return res.json({code: 0, msg: 'success', data: stocks});
            }
          } else {
            i++;
            if (i == skus.length) {
              return res.json({code: 0, msg: 'success', data: stocks});
            }
          }
        });
      });
    } catch (err) {
      return res.json({code: 2, msg: 'err:' + err});
    }
  }
};
