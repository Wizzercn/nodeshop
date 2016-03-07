/**
 * Created by root on 3/2/16.
 */
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    console.log('req.data::' + JSON.stringify(req.data));
    var i = 0;
    async.parallel({
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      allClassList: function (done) {
        Shop_goods_class.getAllClass(function (list) {
          done(null, list);
        });
      },
      hotGoodsList:function(done){
        Shop_goods.getHotGoods(4,function (list) {
          done(null, list);
        });
      },
      indexClassList: function (done) {
        Shop_goods_class.getIndexClass(function (list) {
          done(null, list);
        });
      },
      bannerLinkList:function(done){
        Cms_linkClass.getLinkList('首页Banner',function(list){
          done(null, list);
        });
      }
    }, function (err, result) {

      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.indexClassList = result.indexClassList || [];
      req.data.hotGoodsList = result.hotGoodsList || [];
      req.data.bannerLinkList = result.bannerLinkList || [];
      req.data.StringUtil=StringUtil;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/index', req.data);
    });
  }
};
