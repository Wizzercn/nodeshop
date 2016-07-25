/**
 * Created by root on 2/1/16.
 */
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    req.data.stock = req.query.stock || 0;
    req.data.disabled = req.query.disabled || '';
    Shop_goods_type.find().exec(function (error, obj) {
      if(obj)
      req.data.typelist = obj;
      return res.view('private/shop/goods/goods/index', req.data);
    });
  },
  add: function (req, res) {
    async.parallel({
      typelist: function (done) {
        Shop_goods_type.find().exec(function (error, obj) {
          if (!error)
            done(null, obj);
          else
            done(error, null);
        });
      },
      brandlist: function (done) {
        Shop_goods_brand.find().exec(function (error, obj) {
          if (!error)
            done(null, obj);
          else
            done(error, null);
        });
      },
      lvlist: function (done) {
        Shop_member_lv.find({disabled: false}).exec(function (error, obj) {
          if (!error)
            done(null, obj);
          else
            done(error, null);
        });
      },
      pn: function (done) {
        var y = moment().format('YY');
        var m = moment().format('MM');
        var gsn = y + m;
        var num = 1;
        Shop_goods.findOne({
          select: ['gn'],
          sort: {id: 'desc'},
          where: {gn: {'like': 'G' + gsn + '%'}},
          limit: 1
        }).exec(function (e, o) {
          if (o) {
            var temp = o.gn;
            num = parseInt(temp.substring(5)) + 1;
          }
          done(null, 'P' + gsn + StringUtil.getSn(num, 6));
        });
      }
    }, function (error, result) {
      req.data.typelist = result.typelist || [];
      req.data.brandlist = result.brandlist || [];
      req.data.lvlist = result.lvlist || [];
      req.data.pn = result.pn || '';
      return res.view('private/shop/goods/goods/add', req.data);
    });
  },
  addDo: function (req, res) {
    var body = req.body;
    sails.log.warn("body::" + JSON.stringify(body));
    async.waterfall([function (cb) {
      var y = moment().format('YY');
      var m = moment().format('MM');
      var gsn = y + m;
      var num = 1;
      Shop_goods.findOne({
        select: ['gn'],
        sort: {id: 'desc'},
        where: {gn: {'like': 'G' + gsn + '%'}},
        limit: 1
      }).exec(function (e, o) {
        if (o) {
          var temp = o.gn;
          num = parseInt(temp.substring(5)) + 1;
        }
        cb(null, gsn + StringUtil.getSn(num, 6));
      });
    }, function (sn,cb) {
      var gn = 'G' + sn, pn = 'P' + sn;
      Shop_goods.findOne({gn: gn})
        .exec(function (e, o) {
          if (o) {
            cb('商品编号已存在', gn);
          }
          Shop_goods_products.findOne({gn: body.pbn})
            .exec(function (e, o) {
              // console.log(o);
              if (o) {
                cb('货品编号已存在', pn)
              } else {
                cb(null, sn);
              }
            })
        });
    }, function (sn, cb) {
      var gn = 'G' + sn, pn = 'P' + sn;
      var is_spec = body.is_spec == 'true';
      var goods = {};
      var specs = JSON.parse(body.specs);
      var images = JSON.parse(body.images);
      var prop_values = JSON.parse(body.prop_values);
      var products = [];
      var imgurl = '';
      var dbimgs = [];
      goods.gn = gn;
      goods.prop = prop_values;
      goods.name = body.name;
      goods.info = body.info;
      goods.note = body.note;
      goods.hotsale = body.hotsale=='1';
      goods.disabled = body.disabled == '1';
      goods.unit = body.unit;
      goods.spec = JSON.parse(body.spec_values);
      goods.classid = StringUtil.getInt(body.classid);
      goods.typeid = StringUtil.getInt(body.typeid);
      goods.brandid = StringUtil.getInt(body.brandid);
      goods.location = 0;
      goods.updatedBy = req.session.user.id;
      goods.updatedAt = moment().format('X');
      goods.upAt = moment().format('X');
      goods.is_spec=is_spec;
      var k = 0;
      images.forEach(function (o) {
        var url = o.url.substring(0, o.url.indexOf('?'));
        if (k == 0 || o.d) {
          imgurl = url;
        }
        dbimgs.push(url);
        k++;
      });
      goods.imgurl = imgurl;
      if (!is_spec) {
        var sobj = specs[0];
        goods.price = StringUtil.getPrice(sobj.price);
        goods.priceMarket = StringUtil.getPrice(sobj.priceMarket);
        goods.priceCost = StringUtil.getPrice(sobj.priceCost);
        goods.weight = StringUtil.getInt(sobj.weight);
        goods.stock = StringUtil.getInt(sobj.stock);
        goods.buyMin = StringUtil.getInt(sobj.buyMin);
        goods.buyMax = StringUtil.getInt(sobj.buyMax);
        var p = {};
        p.price = StringUtil.getPrice(sobj.price);
        p.priceMarket = StringUtil.getPrice(sobj.priceMarket);
        p.priceCost = StringUtil.getPrice(sobj.priceCost);
        p.weight = StringUtil.getInt(sobj.weight);
        p.stock = StringUtil.getInt(sobj.stock);
        p.buyMin = StringUtil.getInt(sobj.buyMin);
        p.buyMax = StringUtil.getInt(sobj.buyMax);
        p.classid = StringUtil.getInt(body.classid);
        p.typeid = StringUtil.getInt(body.typeid);
        p.brandid = StringUtil.getInt(body.brandid);
        p.unit = body.unit;
        p.name = body.name;
        p.gn = sobj.gn;
        p.spec = sobj.spec;
        p.lvprice = sobj.lvprice;
        p.is_default = sobj.is_default;
        if (!p.gn) {
          p.gn = pn;
        }
        products.push(p);
      } else {
        specs.forEach(function (sobj) {
          var p = {};
          p.price = StringUtil.getPrice(sobj.price);
          p.priceMarket = StringUtil.getPrice(sobj.priceMarket);
          p.priceCost = StringUtil.getPrice(sobj.priceCost);
          p.weight = StringUtil.getInt(sobj.weight);
          p.stock = StringUtil.getInt(sobj.stock);
          p.buyMin = StringUtil.getInt(sobj.buyMin);
          p.buyMax = StringUtil.getInt(sobj.buyMax);
          p.classid = StringUtil.getInt(body.classid);
          p.typeid = StringUtil.getInt(body.typeid);
          p.brandid = StringUtil.getInt(body.brandid);
          p.unit = body.unit;
          p.name = body.name;
          p.gn = sobj.gn;
          p.spec = sobj.spec;
          p.is_default = sobj.is_default;
          p.lvprice = sobj.lvprice;
          p.disabled = sobj.disabled == '1';
          if (sobj.is_default) {
            goods.price = StringUtil.getPrice(sobj.price);
            goods.priceMarket = StringUtil.getPrice(sobj.priceMarket);
            goods.priceCost = StringUtil.getPrice(sobj.priceCost);
            goods.weight = StringUtil.getInt(sobj.weight);
            goods.stock = StringUtil.getInt(sobj.stock);
            goods.buyMin = StringUtil.getInt(sobj.buyMin);
            goods.buyMax = StringUtil.getInt(sobj.buyMax);
          }
          products.push(p);
        });
      }
      //console.log('goods:::'+JSON.stringify(goods));
      Shop_goods.create(goods).exec(function (e1, o1) {
        if (o1) {
          var goodsid = o1.id;
          var i = 0;
          products.forEach(function (sobj) {
            sobj.goodsid = goodsid;
            sobj.location = i;
            sobj.updatedBy = req.session.user.id;
            sobj.updatedAt = moment().format('X');
            sobj.upAt = moment().format('X');
            Shop_goods_products.create(sobj).exec(function (e2, o2) {
              if (o2) {
                var lvprice = sobj.lvprice || [];
                lvprice.forEach(function (lv) {
                  Shop_goods_lv_price.create({
                    goodsid: goodsid,
                    productid: o2.id,
                    lvid: lv.lv_id,
                    price: StringUtil.getPrice(lv.lv_price)
                  }).exec(function (e3, o3) {
                  });
                });
              }
            });
            i++;
          });
          dbimgs.forEach(function (imgurl) {
            var imgobj = {};
            imgobj.imgurl = imgurl;
            imgobj.goodsid = goodsid;
            Shop_images.create(imgobj).exec(function (e3, o3) {
            });
          });
          cb(e1, goodsid);
        } else {
          cb(e1, 0);
        }
      });
    }], function (err, result) {
      if (err) {
        return res.json({code: 1, msg: '保存失败 err::' + JSON.stringify(err)});
      } else {
        return res.json({code: 0, msg: '保存成功', goodsid: result});
      }
    });

  },
  edit: function (req, res) {
    var id = req.params.id;
    async.parallel({
      goods: function (done) {
        Shop_goods.findOne(id).populate('classid').populate('products', {sort: {location: 'asc'}}).populate('images', {sort: {id: 'asc'}}).exec(function (error, obj) {
          if (obj) {
            Shop_goods_type_props.find({typeid: obj.typeid}).sort({location: 'asc'}).populate('values', {sort: {location: 'asc'}}).exec(function (propse, propslist) {
              async.waterfall([function (cb) {
                Shop_goods_type_spec.find({typeid: obj.typeid}).sort({location: 'asc'}).exec(function (e, o) {
                  cb(e, o);
                });
              }, function (list, cb) {
                var ids = [];
                if (list) {
                  list.forEach(function (sp) {
                    ids.push(sp.specid);
                  });
                }
                Shop_goods_spec.find({id: ids}).sort({location: 'asc'}).populate('values', {sort: {location: 'asc'}}).exec(function (e, o) {
                  cb(e, o);
                });
              }], function (err, o) {
                obj.propslist = propslist || [];
                obj.speclist = o || [];
                done(null, obj);
              });


            });

          }
          else
            done('undefined', null);
        });
      },
      lvpricelist: function (done) {
        Shop_goods_lv_price.find({goodsid: id}).sort({lvid: 'asc'}).exec(function (error, obj) {
          if (!error)
            done(null, obj);
          else
            done(error, null);
        });
      },
      typelist: function (done) {
        Shop_goods_type.find().exec(function (error, obj) {
          if (!error)
            done(null, obj);
          else
            done(error, null);
        });
      },
      brandlist: function (done) {
        Shop_goods_brand.find().exec(function (error, obj) {
          if (!error)
            done(null, obj);
          else
            done(error, null);
        });
      },
      lvlist: function (done) {
        Shop_member_lv.find({disabled: false}).exec(function (error, obj) {
          if (!error)
            done(null, obj);
          else
            done(error, null);
        });
      }
    }, function (error, result) {
      if (error) {
        return res.notFound('没有此商品');
      } else {
        req.data.goods = result.goods || {};
        req.data.brandlist = result.brandlist || [];
        req.data.typelist = result.typelist || [];
        req.data.lvlist = result.lvlist || [];
        req.data.lvpricelist = result.lvpricelist || [];
        req.data.StringUtil = StringUtil;
        return res.view('private/shop/goods/goods/edit', req.data);
      }

    });
  },
  editDo: function (req, res) {
    var body = req.body;
    var id = body.id;
    async.waterfall([function (cb) {
      var y = moment().format('YY');
      var m = moment().format('MM');
      var gsn = y + m;
      var num = 1;
      Shop_goods.findOne(id).exec(function (e, o) {
        cb(e, o);
      });
    }, function (goods, cb) {
      Shop_images.destroy({goodsid: id}).exec(function (de1) {
        Shop_goods_lv_price.destroy({goodsid: id}).exec(function (de3) {
          cb(null, goods);
        });
      });
    }, function (goods, cb) {
      console.log(body);
      var is_spec = body.is_spec == 'true';
      var specs = JSON.parse(body.specs);
      var images = JSON.parse(body.images);
      var prop_values = JSON.parse(body.prop_values);
      var products = [];
      var imgurl = '';
      var dbimgs = [];
      goods.prop = prop_values;
      goods.name = body.name;
      goods.info = body.info;
      goods.note = body.note;
      goods.hotsale = body.hotsale=='1';
      goods.disabled = body.disabled == '1';
      goods.unit = body.unit;
      goods.spec = JSON.parse(body.spec_values);
      goods.classid = StringUtil.getInt(body.classid);
      goods.typeid = StringUtil.getInt(body.typeid);
      goods.brandid = StringUtil.getInt(body.brandid);
      goods.updatedBy = req.session.user.id;
      goods.updatedAt = moment().format('X');
      goods.upAt = moment().format('X');
      goods.is_spec=is_spec;
      var k = 0;
      images.forEach(function (o) {
        var url = o.url.substring(0, o.url.indexOf('?'));
        if (k == 0 || o.d) {
          imgurl = url;
        }
        dbimgs.push(url);
        k++;
      });
      goods.imgurl = imgurl;
      var no_del_productIds = [];
      if (!is_spec) {
        var sobj = specs[0];
        goods.price = StringUtil.getPrice(sobj.price);
        goods.priceMarket = StringUtil.getPrice(sobj.priceMarket);
        goods.priceCost = StringUtil.getPrice(sobj.priceCost);
        goods.weight = StringUtil.getInt(sobj.weight);
        goods.stock = StringUtil.getInt(sobj.stock);
        goods.buyMin = StringUtil.getInt(sobj.buyMin);
        goods.buyMax = StringUtil.getInt(sobj.buyMax);
        var p = {};
        p.goodsid = StringUtil.getInt(id);
        p.price = StringUtil.getPrice(sobj.price);
        p.priceMarket = StringUtil.getPrice(sobj.priceMarket);
        p.priceCost = StringUtil.getPrice(sobj.priceCost);
        p.weight = StringUtil.getInt(sobj.weight);
        p.stock = StringUtil.getInt(sobj.stock);
        p.buyMin = StringUtil.getInt(sobj.buyMin);
        p.buyMax = StringUtil.getInt(sobj.buyMax);
        p.classid = StringUtil.getInt(body.classid);
        p.typeid = StringUtil.getInt(body.typeid);
        p.brandid = StringUtil.getInt(body.brandid);
        p.unit = body.unit;
        p.name = body.name;
        p.gn = sobj.gn;
        p.spec = sobj.spec;
        p.is_default = sobj.is_default;
        p.lvprice = sobj.lvprice;
        p.disabled = sobj.disabled == '1';
        p.id = sobj.id;
        no_del_productIds.push(p.id);
        products.push(p);
      } else {
        specs.forEach(function (sobj) {
          var p = {};
          p.goodsid = StringUtil.getInt(id);
          p.price = StringUtil.getPrice(sobj.price);
          p.priceMarket = StringUtil.getPrice(sobj.priceMarket);
          p.priceCost = StringUtil.getPrice(sobj.priceCost);
          p.weight = StringUtil.getInt(sobj.weight);
          p.stock = StringUtil.getInt(sobj.stock);
          p.buyMin = StringUtil.getInt(sobj.buyMin);
          p.buyMax = StringUtil.getInt(sobj.buyMax);
          p.classid = StringUtil.getInt(body.classid);
          p.typeid = StringUtil.getInt(body.typeid);
          p.brandid = StringUtil.getInt(body.brandid);
          p.unit = body.unit;
          p.name = body.name;
          p.gn = sobj.gn;
          p.spec = sobj.spec;
          p.lvprice = sobj.lvprice;
          p.is_default = sobj.is_default;
          p.disabled = sobj.disabled == '1';
          if(sobj.id){
            p.id = sobj.id;
            no_del_productIds.push(p.id);
          }
          if (sobj.is_default) {
            goods.price = StringUtil.getPrice(sobj.price);
            goods.priceMarket = StringUtil.getPrice(sobj.priceMarket);
            goods.priceCost = StringUtil.getPrice(sobj.priceCost);
            goods.weight = StringUtil.getInt(sobj.weight);
            goods.stock = StringUtil.getInt(sobj.stock);
            goods.buyMin = StringUtil.getInt(sobj.buyMin);
            goods.buyMax = StringUtil.getInt(sobj.buyMax);
          }
          products.push(p);
        });
      }
      if(no_del_productIds.length>0){
        Shop_goods_products.destroy({id: {'!': no_del_productIds}, goodsid: id}).exec(function (e_del) {
          return cb(null,products,goods,dbimgs);
        });
      }else{
        Shop_goods_products.destroy({goodsid: id}).exec(function (e_del) {
          return cb(null,products,goods,dbimgs);
        });
      }
    }, function (products,goods,dbimgs, cb) {
      Shop_goods.update(id, goods).exec(function (e1, o1) {
        if (o1) {
          var i = 0;
          products.forEach(function (sobj) {
            sobj.goodsid = id;
            sobj.location = i;
            sobj.updatedBy = req.session.user.id;
            sobj.updatedAt = moment().format('X');
            sobj.upAt = moment().format('X');
            if (sobj.id) {
              sails.log.debug('sobj::' + JSON.stringify(sobj));

              Shop_goods_products.update({id: sobj.id}, sobj).exec(function (e2, o2) {
                //sails.log.debug('o2::' + JSON.stringify(o2));
                if (o2 && o2.length > 0) {
                  var lvprice = sobj.lvprice || [];
                  lvprice.forEach(function (lv) {
                    Shop_goods_lv_price.create({
                      goodsid: id,
                      productid: o2[0].id,
                      lvid: lv.lv_id,
                      price: StringUtil.getPrice(lv.lv_price)
                    }).exec(function (e3, o3) {
                    });
                  });
                }
              });
              i++;
            } else {
              Shop_goods_products.create(sobj).exec(function (e2, o2) {
                //sails.log.debug('e2::'+JSON.stringify(e2));
                if (o2) {
                  var lvprice = sobj.lvprice || [];
                  lvprice.forEach(function (lv) {
                    Shop_goods_lv_price.create({
                      goodsid: id,
                      productid: o2.id,
                      lvid: lv.lv_id,
                      price: StringUtil.getPrice(lv.lv_price)
                    }).exec(function (e3, o3) {
                    });
                  });
                }
              });
              i++;
            }

          });

          dbimgs.forEach(function (imgurl) {
            var imgobj = {};
            imgobj.imgurl = imgurl;
            imgobj.goodsid = id;
            Shop_images.create(imgobj).exec(function (e3, o3) {
            });
          });
          if (i == products.length) {
            return cb(e1, id);
          }
        } else {
          return cb(e1, 0);
        }
      });
    }], function (err, goodsid) {
      if (err) {
        return res.json({code: 1, msg: '保存失败 err::' + JSON.stringify(err)});
      } else {
        return res.json({code: 0, msg: '保存成功', goodsid: goodsid});
      }
    });

  },
  getClass: function (req, res) {
    var id = req.params.id;
    Shop_goods_class.findOne(id).populate('typeid').exec(function (e, o) {
      if (e)return res.json({code: 1, msg: JSON.stringify(e)});
      return res.json({code: 0, msg: '', data: o});
    });
  },
  getType: function (req, res) {
    var id = req.params.id;
    Shop_goods_type.findOne(id).exec(function (e, o) {
      if (e)return res.json({code: 1, msg: JSON.stringify(e)});
      return res.json({code: 0, msg: '', data: o});
    });
  },
  getProps: function (req, res) {
    var id = req.params.id;
    Shop_goods_type_props.find({typeid: id}).sort({location: 'asc'}).populate('values', {sort: {location: 'asc'}}).exec(function (e, o) {
      if (e)return res.json({code: 1, msg: JSON.stringify(e)});
      return res.json({code: 0, msg: '', data: o});
    });
  },
  spec: function (req, res) {
    var id = req.params.id;
    async.waterfall([function (cb) {
      Shop_goods_type_spec.find({typeid: id}).sort({location: 'asc'}).exec(function (e, o) {
        cb(e, o);
      });
    }, function (list, cb) {
      var ids = [];
      if (list) {
        list.forEach(function (sp) {
          ids.push(sp.specid);
        });
      }
      Shop_goods_spec.find({id: ids}).sort({location: 'asc'}).populate('values', {sort: {location: 'asc'}}).exec(function (e, o) {
        cb(e, o);
      });
    }], function (err, o) {
      Shop_member_lv.find({disabled: false}).exec(function (error, lvlist) {
        req.data.list = o || [];
        req.data.lvlist = lvlist || [];
        return res.view('private/shop/goods/goods/spec', req.data);
      });

    });
  },
  data: function (req, res) {
    var pageSize = StringUtil.getInt(req.body.length);
    var start = StringUtil.getInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = StringUtil.getInt(req.body.draw);
    var name = req.body.name || '';
    var typeid = req.body.typeid || '';
    var stock = StringUtil.getInt(req.body.stock);
    var stock_type = req.body.stock_type || '';
    var price = StringUtil.getInt(req.body.price) * 100;
    var price_type = req.body.price_type || '';
    var disabled = req.body.disabled || '';
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {};
    var p_where = {};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    sort['id'] = 'desc';
    if (name) {
      where.name = {like: '%' + name + '%'};
    }
    if (disabled == 'true') {
      where.disabled = true;
    }
    if (disabled == 'false') {
      where.disabled = false;
    }
    if(typeid && typeid>0) {
      where.typeid = typeid;
    }
    async.waterfall([function (cb) {
      var goodsids = [];
      if (stock > 0) {
        if (stock_type == 'lthan') {
          p_where.stock = {'<=': stock};
        } else if (stock_type == 'gthan') {
          p_where.stock = {'>=': stock};
        } else if (stock_type == 'than') {
          p_where.stock = {'<': stock};
        } else if (stock_type == 'bthan') {
          p_where.stock = {'>': stock};
        }
      }
      if (price > 0) {
        if (price_type == 'lthan') {
          p_where.price = {'<=': price};
        } else if (price_type == 'gthan') {
          p_where.price = {'>=': price};
        } else if (price_type == 'than') {
          p_where.price = {'<': price};
        } else if (price_type == 'bthan') {
          p_where.price = {'>': price};
        }
      }
      if (JSON.stringify(p_where) != '{}') {
        Shop_goods_products.find({select: ['goodsid'], where: p_where}).exec(function (pe, pc) {
          if (pc && pc.length > 0) {
            pc.forEach(function (go) {
              goodsids.push(go.goodsid);
            });
            cb(null, goodsids);
          } else cb(null, goodsids);
        });
      } else cb(null, goodsids);
    }, function (goodsids, cb) {
      if (JSON.stringify(p_where) != '{}' && goodsids.length > 0) {
        where.id = goodsids;
      } else if (JSON.stringify(p_where) != '{}') {
        where.id = 0;
      }
      cb(null);
    }
    ], function (aserr, asres) {
      Shop_goods.count(where).exec(function (err, count) {
        if (!err && count > 0) {
          Shop_goods.find({
            select: ['id', 'name', 'typeid', 'classid', 'disabled', 'location'],
            sort: sort,
            where: where
          })
            .populate('typeid')
            .populate('classid')
            .paginate({page: page, limit: pageSize})
            .exec(function (err, list) {
              return res.json({
                "draw": draw,
                "recordsTotal": pageSize,
                "recordsFiltered": count,
                "data": list
              });
            });
        } else {
          return res.json({
            "draw": draw,
            "recordsTotal": pageSize,
            "recordsFiltered": 0,
            "data": []
          });
        }
      });
    });
  },
  location: function (req, res) {
    var id = req.body.pk || '0';
    var value = req.body.value || '0';
    var name = req.body.name || '';
    Shop_goods.update(id, {location: StringUtil.getInt(value)}).exec(function (err, obj) {
      return res.json({name: name, pk: id, value: value});

    });
  },
  up: function (req, res) {
    var ids = req.params.id || req.body.ids;
    Shop_goods.update({id: ids}, {disabled: false, upAt: moment().format('X')}).exec(function (err, obj) {
      Shop_goods_products.update(
        {goodsid:ids},
        {disabled:false,upAt:moment().format('X')})
        .exec(function (err, obj){
          return res.json({code: 0, msg: '操作成功'});
        });

    });
  },
  down: function (req, res) {
    var ids = req.params.id || req.body.ids;
    Shop_goods.update({id: ids}, {disabled: true, downAt: moment().format('X')}).exec(function (err, obj) {
      Shop_goods_products.update(
        {goodsid:ids},
        {disabled:true,upAt:moment().format('X')})
        .exec(function (err, obj){
          return res.json({code: 0, msg: '操作成功'});
        });
      });
  },
  delete: function (req, res) {
    var ids = req.params.id || req.body.ids;
    Shop_images.destroy({goodsid: ids}).exec(function (de1) {
      Shop_goods_products.destroy({goodsid: ids}).exec(function (de2) {
        Shop_goods_lv_price.destroy({goodsid: ids}).exec(function (de3) {
          Shop_goods.destroy({id: ids}).exec(function (de4) {
            if (de1 || de2 || de3 || de4) {
              return res.json({code: 1, msg: sails.__('delete.fail')});
            } else {
              return res.json({code: 0, msg: sails.__('delete.ok')});
            }
          });
        });
      });
    });
  }
};
