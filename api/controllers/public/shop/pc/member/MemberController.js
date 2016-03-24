/**
 * Created by root on 3/10/16.
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
      },
      couponNum:function(done){
        Shop_member_coupon.count({memberId:m.memberId,status:0}).exec(function(e,o){
          done(null,o);
        });
      },
      orderNum:function(done){
        Shop_order.count({memberId:m.memberId,disabled:false}).exec(function(e,o){
          done(null,o);
        });
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.dbMember=result.dbMember||{};
      req.data.couponNum=result.couponNum||0;
      req.data.orderNum=result.orderNum||0;
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.siteTitle='会员中心_'+req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/member_index', req.data);

    });
  }
};
