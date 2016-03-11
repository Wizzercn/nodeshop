/**
 * Created by root on 3/10/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
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
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.siteTitle='会员中心_'+req.data.siteTitle;
      if(req.data.member&&req.data.member.memberId>0){
        return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/member_index', req.data);
      }else {
        return res.redirect('/login');
      }
    });
  }
};
