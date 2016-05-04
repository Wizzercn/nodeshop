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
    name: {
      type:'string',
      size:100
    },
    price:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //最大数量
    maxNum:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //已发放数量
    hasNum:{
      type:'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //是否可用于积分兑换
    is_score:{
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    //兑换需要积分
    score:{
      type:'integer'
    },
    createBy:{
      type: 'integer'
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    }
  },
  getPageList: function (pageSize, start, where, sort, cb) {
    var page = Math.floor(start / pageSize) + 1;
    Shop_sales_coupon.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        var next = 0;
        if ((start + pageSize) < count)next = start + pageSize;
        var totalPage = Math.floor(count / pageSize);
        if (totalPage == 0 || count % pageSize != 0) {
          totalPage++;
        }
        Shop_sales_coupon.find({
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
