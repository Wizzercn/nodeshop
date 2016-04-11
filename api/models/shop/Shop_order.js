/**
 * Created by root on 3/15/16.
 */
var StringUtil = require('../../common/StringUtil');
var moment = require('moment');
module.exports = {
  schema: true,
  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      type: 'string',
      size:20,
      primaryKey: true
    },
    cityId: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //订单状态
    status:{
      type: 'string',
      enum: ['active','dead','finish'],
      size: 10,
      index:true
    },
    //订单重量
    weight:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    score:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //商品总额
    goodsAmount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //运费
    freightAmount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //优惠金额
    discountAmount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //订单总额
    finishAmount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //支付金额 会发生部分支付的情况，如：余额支付
    payAmount:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //付款状态 0 待付款 1已付款 2申请退款 3已退款
    payStatus:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      },
      index:true
    },
    //支付方式
    payType:{
      type: 'string',
      size:100
    },
    //发货状态
    shipStatus:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      },
      index:true
    },
    //配送方式id
    shiptypeId:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //配送方式
    shiptypeName:{
      type: 'string',
      size:100
    },
    //物流单号
    shiptypeNo:{
      type: 'string',
      size:100
    },
    addrId:{
      model: 'Shop_member_addr'
    },
    //收货地区
    addrProvince:{
      type: 'string',
      size:30
    },
    //收货地区
    addrCity:{
      type: 'string',
      size:30
    },
    //收货地区
    addrArea:{
      type: 'string',
      size:30
    },
    //收货地址
    addrAddr:{
      type: 'string',
      size:255
    },
    //收货人
    addrName:{
      type: 'string',
      size:100
    },
    //收货人电话
    addrMobile:{
      type: 'string',
      size:20
    },
    //配送时间
    addrTime:{
      type: 'string',
      size:100
    },
    //0  1企业 2个人
    taxType:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //企业税务号
    taxNo:{
      type: 'string',
      size:100
    },
    //发票抬头
    taxTitle:{
      type: 'string',
      size:100
    },
    //发票内容
    taxCentent:{
      type: 'string',
      size:255
    },
    createdIp:{
      type: 'string',
      size:100
    },
    //创建时间
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      },
      index:true
    },
    //收货时间要求
    receivedTime: {
      type: 'integer'
    },
    //收货状态   0  1
    receivedStatus:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      },
      index:true
    },
    //收货时间
    receivedAt: {
      type: 'integer',
      index:true
    },
    //状态更新时间
    updateAt: {
      type: 'integer',
      index:true
    },
    //会员ID
    memberId: {
      model: 'Shop_member',
      index:true
    },
    //订单备注
    memo:{
      type:'string',
      size:500
    },
    //订单来源
    source:{
      type: 'string',
      enum: ['pc','wap','weixin'],
      size: 10
    },
    //删除订单
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      },
      index:true
    },
    //收款单
    goods: {
      collection: 'Shop_order_goods',
      via: 'orderId'
    },
    //收款单
    payments: {
      collection: 'Shop_history_payments',
      via: 'orderId'
    },
    //收款单
    refunds: {
      collection: 'Shop_history_refunds',
      via: 'orderId'
    }
  },
  getOrderId:function(cb){
    var s=moment().format('YYMMDDHHmm');
    var n=StringUtil.getUuid(5,10);
    var sn=s+n;
    Shop_order.findOne(sn).exec(function(e,o){
      if(o){
        Shop_order.getOrderId(function(ss){
          return cb(ss);
        });
      }else{
        return cb(sn);
      }
    });
  },
  getPageList: function (pageSize, start, where, sort, cb) {
    var page = Math.floor(start / pageSize) + 1;
    Shop_order.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        var next = 0;
        if ((start + pageSize) < count)next = start + pageSize;
        var totalPage = Math.floor(count / pageSize);
        if (totalPage == 0 || count % pageSize != 0) {
          totalPage++;
        }
        Shop_order.find({
            sort: sort,
            where: where
          })
          .populate('goods', {sort: {productId: 'asc'}})
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
  },
  enumStatus:function(s){
    var arr= new Array();
    arr['active']='活动订单';
    arr['dead']='已作废';
    arr['finish']='已完成';
    return arr[s];
  },
  enumPayStatus:function(s){
    var arr= new Array();
    arr[0]='未支付';
    arr[1]='已支付';
    arr[2]='已付款至到担保方';
    arr[3]='部分付款';
    arr[4]='部分退款';
    arr[5]='全额退款';
    return arr[s];
  },
  enumShipStatus:function(s){
    var arr= new Array();
    arr[0]='未发货';
    arr[1]='已发货';
    arr[2]='部分发货';
    arr[3]='部分退货';
    arr[4]='已退货';
    return arr[s];
  }

};
