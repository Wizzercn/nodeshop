/**
 * 商城首页
 * Created by root on 3/2/16.
 */
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    //console.log('req.data::' + JSON.stringify(req.data));
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      //获取cms栏目内容
      centerChannel: function (done) {
        Cms_channel.getChannelByName('关于我们', 1, function (list) {
          done(null, list);
        });
      },
      //获取cms栏目内容
      buttomChannel: function (done) {
        Cms_channel.getChannelByName('活动资讯', 3, function (list) {
          done(null, list);
        });
      },
      //获取所有商品分类
      allClassList: function (done) {
        Shop_goods_class.getAllClass(function (list) {
          done(null, list);
        });
      },
      //获取热卖商品
      hotGoodsList: function (done) {
        Shop_goods.getHotGoods(4, function (list) {
          done(null, list);
        });
      },
      //获取首页显示的商品分类、子分类及商品
      indexClassList: function (done) {
        Shop_goods_class.getIndexClass(function (list) {
          async.waterfall([function (cb) {
            var l = [];
            var j = 0;
            if (list.length > 0) {
              list.forEach(function (obj) {
                var ids = [];
                ids.push(obj.id);
                if (obj.hasChildren) {
                  Shop_goods_class.getChildrenClassByPath({'like':obj.path+'_%'}, function (clist) {
                    obj.children = clist;
                    var k = 0;
                    clist.forEach(function (cobj) {
                      ids.push(cobj.id);
                    });
                    obj.id = ids;
                    l.push(obj);
                    j++;
                    if (j == list.length) {
                      cb(null, l);
                    }
                  });
                } else cb(null, list);
              });
            } else cb(null, l);
          }, function (list, cb) {
            var l = [];
            var j = 0;
            if (list.length > 0) {
              list.forEach(function (obj) {
                var ids = obj.id;
                Shop_goods.getGoodsList(ids, 8, function (clist) {
                  obj.goodslist = clist || [];
                  l.push(obj);
                  j++;
                  if (j == list.length) {
                    cb(null, l);
                  }
                });
              });
            } else cb(null, l);
          }], function (index_err, list) {
            done(null, list);
          });
        });
      },
      //获取首页banner，根据名称固定
      bannerLink: function (done) {
        Cms_linkClass.getLinkList('首页Banner', function (list) {
          done(null, list);
        });
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.indexClassList = result.indexClassList || [];
      req.data.hotGoodsList = result.hotGoodsList || [];
      req.data.bannerLink = result.bannerLink || {};
      req.data.centerChannel = result.centerChannel || [];
      req.data.buttomChannel = result.buttomChannel || [];
      req.data.StringUtil = StringUtil;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/index', req.data);
    });
  }
};
