/**
 * Created by root on 1/28/16.
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
    //商品编号
    gn: {
      type: 'string',
      size: 100,
      required: true,
      unique: true,
      index: true
    },
    //商品名称
    name: {
      type: 'string',
      size: 255,
      required: true
    },
    //商品简介
    info: {
      type: 'string'
    },
    //销售价格(单位:分)
    price: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //市场价(单位:分)
    priceMarket: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //成本价(单位:分)
    priceCost: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //重量
    weight: {
      type: 'string',
      size: 20
    },
    //计量单位
    unit: {
      type: 'string',
      size: 20
    },
    //库存
    stock: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //积分
    score: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //最小购买数量
    buyMin: {
      type: 'integer',
      defaultsTo: function () {
        return 1;
      }
    },
    //最大购买数量
    buyMax: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //分类
    classid: {
      model: 'Shop_goods_class',
      index: true
    },
    //类型
    typeid: {
      model: 'Shop_goods_type'
    },
    //品牌
    brandid: {
      model: 'Shop_goods_brand'
    },
    //商品默认图片
    imgurl: {
      type: 'string',
      size: 255
    },
    //商品图册
    images: {
      collection: 'Shop_images',
      via: 'goodsid'
    },
    //是否下架
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    //上架时间
    upAt: {
      type: 'integer'
    },
    //下架时间
    downAt: {
      type: 'integer'
    },
    //详细介绍
    note: {
      type: 'text'
    },
    //属性详情
    prop: {
      type: 'json'
    },
    //规格详情
    spec: {
      type: 'json'
    },
    is_spec: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    view_count: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    buy_count: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    comment_count: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //排序字段
    location: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //修改人
    updatedBy: {
      type: 'integer'
    },
    //修改时间
    updatedAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      },
      index: true
    },
    products: {
      collection: 'Shop_goods_products',
      via: 'goodsid'
    }

  },
  getHotGoods: function (num, cb) {
    Shop_goods.find({
        select: ['id', 'gn', 'name', 'info', 'price', 'priceMarket', 'is_spec', 'weight', 'unit', 'stock', 'buyMin', 'buyMax', 'imgurl', 'location'],
        where: {disabled: false},
        limit: num || 4
      })
      .sort('location desc')
      .sort('updatedAt desc').exec(function (err, list) {
      return cb(list);
    });
  },
  getGoodsList: function (classid, num, cb) {
    Shop_goods.find({
        select: ['id', 'gn', 'name', 'info', 'price', 'priceMarket', 'is_spec', 'weight', 'unit', 'stock', 'buyMin', 'buyMax', 'imgurl', 'location'],
        where: {disabled: false, classid: classid},
        limit: num || 4
      })
      .sort('location desc')
      .sort('updatedAt desc').exec(function (err, list) {
      sails.log.warn('getGoodsList.err::' + JSON.stringify(err));
      return cb(list);
    });
  },
  getPageList: function (pageSize, start, where, sort, cb) {
    var page = Math.floor(start / pageSize) + 1;
    Shop_goods.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        var next = 0;
        if ((start + pageSize) < count)next = start + pageSize;
        var totalPage = Math.floor(count / pageSize);
        if (totalPage == 0 || count % pageSize != 0) {
          totalPage++;
        }
        Shop_goods.find({
            select: ['id', 'gn', 'name', 'info', 'price', 'priceMarket', 'is_spec', 'weight', 'unit', 'stock', 'buyMin', 'buyMax', 'imgurl', 'location'],
            sort: sort,
            where: where
          })
          .paginate({page: page, limit: pageSize})
          .exec(function (err, list) {
            cb({
              "size": pageSize,
              "total": count,
              "next": next,
              "page": page,
              "totalPage": totalPage,
              "data": list
            });
          });
      } else {
        cb({
          "size": pageSize,
          "total": 0,
          "next": 0,
          "page": 1,
          "totalPage": 1,
          "data": []
        });
      }
    });
  }
};
