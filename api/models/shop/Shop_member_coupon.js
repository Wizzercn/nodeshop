/**
 * Created by root on 16/3/16.
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
      index:true
    },
    couponId:{
      model:'Shop_sales_coupon',
      index:true
    },
    couponName:{
      type:'string',
      size:100
    },
    couponPrice: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    orderId: {
      type: 'string',
      size:20
    },
    orderAt: {
      type: 'integer'
    },
    //0未使用  1已使用  2已失效
    status: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    }
  },
  getPageList: function (pageSize, start, where, sort, cb) {
    var page = Math.floor(start / pageSize) + 1;
    Shop_member_coupon.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        var next = 0;
        if ((start + pageSize) < count)next = start + pageSize;
        var totalPage = Math.floor(count / pageSize);
        if (totalPage == 0 || count % pageSize != 0) {
          totalPage++;
        }
        Shop_member_coupon.find({
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
