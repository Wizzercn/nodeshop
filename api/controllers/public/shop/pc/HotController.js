/**
 * 新品热卖
 * Created by root on 3/7/16.
 */
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    var start=StringUtil.getInt(req.query.start);
    var sort_name=req.query.sort_name||'default';
    var sort_type=req.query.sort_type||'desc';
    var search_name=req.query.search_name;
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
      //获取首页banner，根据名称固定
      bannerLink: function (done) {
        Cms_linkClass.getLinkList('商品列表Banner', function (list) {
          done(null, list);
        });
      },
      //获取热卖商品
      goodsData: function (done) {
        var sort={location:'desc',updatedAt:'desc'};
        if(sort_name=='buy'){
          sort={buy_count:sort_type};
        }
        if(sort_name=='price'){
          sort={price:sort_type};
        }
        var where={disabled:false};
        if(search_name){
          where.name={like:'%'+search_name+'%'};
        }
        Shop_goods.getPageList(sails.config.system.ShopConfig.list_page_size||8,start,where,sort, function (obj) {
          done(null, obj);
        });
      }
    }, function (err, result) {

      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.goodsData = result.goodsData || {};
      req.data.bannerLink = result.bannerLink || {};
      req.data.sort_name = sort_name;
      req.data.sort_type = sort_type;
      req.data.search_name=search_name;
      req.data.StringUtil = StringUtil;
      req.data.siteTitle='新品热卖_'+req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/hot', req.data);
    });
  },
  ajax:function(req,res){
    var start=StringUtil.getInt(req.query.start);
    var sort_name=req.query.sort_name||'default';
    var sort_type=req.query.sort_type||'desc';
    var search_name=req.query.search_name;
    var sort={location:'desc',updatedAt:'desc'};
    if(sort_name=='buy'){
      sort={buy_count:sort_type};
    }
    if(sort_name=='price'){
      sort={price:sort_type};
    }
    var where={disabled:false};
    if(search_name){
      where.name={like:'%'+search_name+'%'};
    }
    Shop_goods.getPageList(sails.config.system.ShopConfig.list_page_size||8,start,where,sort, function (obj) {
      return res.json(obj);
    });
  }
};
