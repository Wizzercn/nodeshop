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
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/member_consult', req.data);

    });
  },
  list: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var pageSize = 10;
    var start = StringUtil.getInt(req.query.start);
    var page = Math.floor(start / pageSize) + 1;
    Shop_member_comment.query('SELECT count(*) as c FROM Shop_member_comment WHERE memberId=?',[member.memberId],function (err, c) {
      if (!err && c.length > 0) {
        count=c[0].c;
        var next = 0;
        if ((start + pageSize) < count)next = start + pageSize;
        var totalPage = Math.floor(count / pageSize);
        if (totalPage == 0 || count % pageSize != 0) {
          totalPage++;
        }
        Shop_member_comment.query('SELECT a.comment as consultContent,a.replyNote as note,b.name as name FROM shop_member_comment a,shop_goods b WHERE a.goodsId=b.id AND a.memberId=? ORDER BY a.id desc LIMIT ? OFFSET ?',[member.memberId,pageSize,start],
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
  }
};
