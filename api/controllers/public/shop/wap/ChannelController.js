/**
 * 栏目列表 单条直接显示则多条分页
 * Created by root on 3/8/16.
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
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/channel', req.data);
    });
  },
  one: function (req, res) {
    var id = req.params.id || '';
    var start = StringUtil.getInt(req.query.start);
    var channelId = 0;
    var channel={};
    var where = {};
    if (id == 'news') {
      where = {name: '活动资讯', disabled: false};
    } else if (id == 'about') {
      where = {name: '关于我们', disabled: false};
    } else if (id == 'user') {
      where = {name: '用户协议', disabled: false};
    } else {
      where = {id: StringUtil.getInt(id), disabled: false};
    }
    async.parallel({
      infoList: function (done) {
        async.waterfall([function (cb) {
          Cms_channel.findOne(where).exec(function (e, o) {
            if(o){
              channel=o;
              if(o.parentId>0){
                Cms_channel.findOne({id:o.parentId}).exec(function (e2, o2) {
                  channel.parentChannel=o2;
                  cb(null, o.id);
                });
              }else {
                cb(null, o.id);
              }

            }else {
              cb(null, 0);
            }
          });
        }, function (id, cb) {
          channelId=id;
          Cms_article.getPageList(10, start, {channelId: id, disabled: false}, {createdAt: 'desc'}, function (list) {
            cb(null, list);
          });
        }], function (err, list) {
          done(null, list);
        });
      }
    }, function (err, result) {
      req.data.infoList = result.infoList || [];
      req.data.channelId = channelId;
      req.data.channel = channel||{};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/channel_one', req.data);
    });
  }
};
