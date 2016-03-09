/**
 * Created by root on 3/8/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    var id = req.params.id || '';
    var channelId = 0;
    var channel = {};
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
      infoList: function (done) {
        async.waterfall([function (cb) {
          Cms_article.findOne(id).populate('contentId').exec(function (e, o) {
            cb(null, o || {});
          });
        }, function (article, cb) {
          Cms_channel.findOne(article.channelId).exec(function (e, o) {
            if (o) {
              channel = o;
              if (o.parentId > 0) {
                Cms_channel.findOne({id: o.parentId}).exec(function (e2, o2) {
                  channel.parentChannel = o2;
                  cb(null, article);
                });
              } else {
                cb(null, article);
              }

            } else {
              cb(null, article);
            }
          });
        }, function (article, cb) {
          channelId = article.channelId;
          cb(null, {
            "size": 1,
            "total": 1,
            "next": 0,
            "page": 1,
            "totalPage": 1,
            "data": [article]
          });
        }], function (err, list) {
          done(null, list);
        });
      }
    }, function (err, result) {

      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.infoList = result.infoList || [];
      req.data.channelId = channelId;
      req.data.channel = channel || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.action = 'info';
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/channel', req.data);
    });
  }
};
