/**
 * 会员积分变动日志表
 * Created by root on 18/3/16.
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
      index: true
    },
    orderId: {
      model: 'Shop_order',
      index: true,
      size: 20,
      defaultsTo: function () {
        return 0;
      }
    },
    oldScore:{
      type: 'integer'
    },
    newScore:{
      type: 'integer'
    },
    diffScore:{
      type: 'integer'
    },
    note:{
      type:'string',
      size:255
    },
    //若管理员调整则记录管理员id
    createdBy: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
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
    Shop_member_score_log.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        var next = 0;
        if ((start + pageSize) < count)next = start + pageSize;
        var totalPage = Math.floor(count / pageSize);
        if (totalPage == 0 || count % pageSize != 0) {
          totalPage++;
        }
        Shop_member_score_log.find({
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
