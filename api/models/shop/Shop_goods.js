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
      index:true,
      comment:'商品编号'
    },
    //商品名称
    name: {
      type: 'string',
      size: 255,
      required: true
    },
    //销售价格(单位:分)
    price:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //市场价(单位:分)
    priceMarket:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //成本价(单位:分)
    priceCost:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //重量
    weight:{
      type:'string',
      size:20
    },
    //计量单位
    unit:{
      type:'string',
      size:20
    },
    //库存
    stock:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //积分
    score:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //最小购买数量
    buyMin:{
      type:'integer',
      defaultsTo: function () {
        return 1;
      }
    },
    //最大购买数量
    buyMax:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //分类
    classid: {
      model: 'Shop_goods_class'
    },
    //类型
    typeid: {
      model: 'Shop_goods_type'
    },
    //品牌
    brandid: {
      model: 'Shop_goods_brand'
    },
    //二维码
    qrcode:{
      type:'string'
    },
    //商品图片
    imageid: {
      model: 'Img_image',
      size:50
    },
    //商品图册
    images: {
      collection: 'Img_image',
      via: 'id'
    },
    //是否下架
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    //上架时间
    upAt:{
      type:'integer'
    },
    //下架时间
    downAt:{
      type:'integer'
    },
    //详细介绍
    note:{
      type:'text'
    },
    //规格详情
    spec:{
      type:'json'
    },
    //排序字段
    location: {
      type: 'boolean',
      defaultsTo: function () {
        return 0;
      }
    },
    //修改人
    updatedBy:{
      type: 'integer'
    },
    //修改时间
    updatedAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    },
    products:{
      collection: 'Shop_goods_products',
      via: 'goodsid'
    }

  }
};
