/**
 * Created by root on 3/23/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    var m = req.session.member;
    if (!m || m.memberId < 1) {
      return res.redirect('/login');
    }
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      //获取所有商品分类
      allClassList: function (done) {
        Shop_goods_class.getAllClass(function (list) {
          done(null, list);
        });
      },
      dbMember: function (done) {
        Shop_member.findOne(m.memberId).populate('lv_id').exec(function (e, o) {
          done(null, o);
        });
      }
    }, function (err, result) {
      req.data.type=req.query.type||'no';
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.dbMember = result.dbMember || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/member_comment', req.data);

    });
  },
  list: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var pageSize = 5;
    var start = StringUtil.getInt(req.query.start);
    var is_comment = req.query.type=='yes';
    var page = Math.floor(start / pageSize) + 1;
    Shop_order_goods.query('SELECT count(*) as c FROM shop_order_goods a,shop_order b WHERE b.status="finish" and a.orderId=b.id AND b.memberId=? AND a.is_comment=?',[member.memberId,is_comment],function (err, c) {
      if (!err && c.length > 0) {
        count=c[0].c;
        var next = 0;
        if ((start + pageSize) < count)next = start + pageSize;
        var totalPage = Math.floor(count / pageSize);
        if (totalPage == 0 || count % pageSize != 0) {
          totalPage++;
        }
        Shop_order_goods.query('SELECT a.*,b.createdAt as orderAt FROM shop_order_goods a,shop_order b WHERE b.status="finish" and  a.orderId=b.id AND b.memberId=? AND a.is_comment=?  ORDER BY a.createAt desc LIMIT ? OFFSET ?',[member.memberId,is_comment,pageSize,start],
          function (e2, list) {
            return res.json({
              "size": pageSize,
              "total": count,
              "next": next,
              "page": page,
              "totalPage": totalPage,
              "data": list
            });
          });
      } else {
        return res.json({
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
  list_yes: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var pageSize = 5;
    var start = StringUtil.getInt(req.query.start);
    var is_comment = req.query.type=='yes';
    var page = Math.floor(start / pageSize) + 1;
    Shop_order_goods.query('SELECT COUNT(*) AS c FROM shop_order_goods a,shop_order b,shop_member_comment d WHERE a.orderId=b.id AND b.memberId=? AND a.is_comment=? AND d.orderId=a.orderId AND d.goodsId=a.goodsId AND d.productId=a.productId AND d.memberId=b.memberId AND d.type=1',[member.memberId,is_comment],function (err, c) {
      if (!err && c.length > 0) {
        count=c[0].c;
        var next = 0;
        if ((start + pageSize) < count)next = start + pageSize;
        var totalPage = Math.floor(count / pageSize);
        if (totalPage == 0 || count % pageSize != 0) {
          totalPage++;
        }
        Shop_order_goods.query('SELECT a.*,d.* FROM shop_order_goods a,shop_order b,shop_member_comment d WHERE a.orderId=b.id AND b.memberId=? AND a.is_comment=? AND d.orderId=a.orderId AND d.goodsId=a.goodsId AND d.productId=a.productId AND d.memberId=b.memberId AND d.type=1 ORDER BY d.createdAt desc LIMIT ? OFFSET ?',[member.memberId,is_comment,pageSize,start],
          function (e2, list) {
            return res.json({
              "size": pageSize,
              "total": count,
              "next": next,
              "page": page,
              "totalPage": totalPage,
              "data": list
            });
          });
      } else {
        return res.json({
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
  save:function(req,res){
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var score=StringUtil.getInt(req.body.score)||0;
    var id=req.body.id||0;
    var comment=req.body.comment||'';
    Shop_order_goods.findOne(id).exec(function(goodsErr,goods){
      if(goods){
        Shop_member_comment.create({
          type:1,
          score:score,
          comment:comment,
          memberId:member.memberId,
          memberNickname:member.nickname,
          goodsId:goods.goodsId,
          productId:goods.productId,
          orderId:goods.orderId,
          createIp:StringUtil.getIp(req),
          createdAt:moment().format('X'),
          disabled:true
        }).exec(function(cErr,c){
          if(c){
            Shop_order_goods.update(id,{is_comment:true,commentAt:moment().format('X')}).exec(function(e,o){
              Shop_goods.query('UPDATE shop_goods SET comment_count=comment_count+1 WHERE id=?',[id],function(e,o){
              });
              return res.json({code: 0, msg: ''});
            });
          }else {
            return res.json({code: 2, msg: ''});
          }
        });
      }else {
        return res.json({code: 2, msg: ''});
      }
    });
  }
};
