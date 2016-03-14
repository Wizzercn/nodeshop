/**
 * Created by root on 3/13/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  one: function (req, res) {
    var id=req.params.id;
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
      hotGoodsList: function (done) {
        var sort={location:'desc',buy_count:'desc',updatedAt:'desc'};
        Shop_goods.getPageList(sails.config.system.ShopConfig.list_page_size||4,0,{disabled:false},sort, function (obj) {
          done(null, obj);
        });
      },
      goods:function(done){
        Shop_goods.findOne(id).populate('classid').populate('products', {sort: {location: 'asc'}}).populate('images', {sort: {id: 'asc'}}).exec(function (error, obj) {
          if (obj) {
            Shop_goods_type_props.find({typeid: obj.typeid}).sort({location: 'asc'}).populate('values', {sort: {location: 'asc'}}).exec(function (propse, propslist) {
              async.waterfall([function (cb) {
                Shop_goods_type_spec.find({typeid: obj.typeid}).sort({location: 'asc'}).exec(function (e, o) {
                  cb(e, o);
                });
              }, function (list, cb) {
                var ids = [];
                if (list) {
                  list.forEach(function (sp) {
                    ids.push(sp.specid);
                  });
                }
                Shop_goods_spec.find({id: ids}).sort({location: 'asc'}).populate('values', {sort: {location: 'asc'}}).exec(function (e, o) {
                  cb(e, o);
                });
              }], function (err, o) {
                obj.propslist = propslist || [];
                obj.speclist = o || [];
                done(null, obj);
              });


            });

          }
          else
            done('undefined', null);
        });
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.hotGoodsList = result.hotGoodsList || [];
      req.data.goods = result.goods || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.r = '/shopcart/list';
      req.data.siteTitle = req.data.goods.name+'_' + req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/goods_one', req.data);

    });
  }
};
