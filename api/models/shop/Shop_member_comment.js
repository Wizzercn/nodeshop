/**
 * Created by root on 3/8/16.
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
    //1评价  2咨询
    type: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    // 3  2  1
    score: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //评论内容
    comment:{
      type: 'string',
      size:255
    },
    //联系方式
    contact:{
      type: 'string',
      size:255
    },
    memberId: {
      model: 'Shop_member',
      index:true
    },
    memberNickname:{
      type: 'string',
      size:100
    },
    goodsId: {
      model: 'Shop_goods',
      index:true
    },
    productId: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }

    },
    orderId: {
      type: 'string',
      size:20
    },
    createIp:{
      type:'string'
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    },
    replyId:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    replyNickname:{
      type:'string',
      size:100
    },
    replyNote:{
      type:'string',
      size:500
    },
    replyAt: {
      type: 'integer'
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
    Shop_member_comment.count(where).exec(function (err, count) {
    if (!err && count > 0) {
      var next = 0;
      if ((start + pageSize) < count)next = start + pageSize;
      var totalPage = Math.floor(count / pageSize);
      if (totalPage == 0 || count % pageSize != 0) {
        totalPage++;
      }
      Shop_member_comment.find({
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
