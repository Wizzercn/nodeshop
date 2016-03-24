/**
 * Created by root on 3/23/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    var m=req.session.member;
    if(!m|| m.memberId<1){
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
      dbMember:function(done){
        Shop_member.findOne(m.memberId).populate('lv_id').exec(function(e,o){
          done(null,o);
        });
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.dbMember=result.dbMember||{};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.siteTitle='我的订单_'+req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/member_order', req.data);

    });
  },
  list:function(req,res){
    var member=req.session.member;
    if(!member||member.memberId<1){
      return res.json({code:1,msg:''});
    }
    var pageSize=5;
    var start=StringUtil.getInt(req.query.start);
    var sort={createdAt:'desc'};
    var where={memberId:member.memberId,disabled:false};
    var type=req.query.type;
    if(type=='nopay'){
      where.status='active';
      where.payStatus=0;
      where.shipStatus=0;
    }
    if(type=='ship'){
      where.status='active';
      where.shipStatus=[1,2];
    }
    Shop_order.getPageList(pageSize, start, where, sort, function(obj){
      return res.json({code:0,msg:'',data:obj});
    });
  }
};
