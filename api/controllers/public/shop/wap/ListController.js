/**
 * 商品列表
 * Created by root on 3/7/16.
 */
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    var id=StringUtil.getInt(req.params.id);
    var start=StringUtil.getInt(req.query.start);
    var sort_name=req.query.sort_name||'default';
    var sort_type = 'desc'==req.query.sort_type?'desc':'asc';
    async.parallel({
      classObj:function(done){
        Shop_goods_class.findOne(id).exec(function(err,obj){
          done(null, obj);
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

        async.waterfall([function (cb) {
          var goodsclassids=[];
          goodsclassids.push(id);
          Shop_goods_class.findOne(id).exec(function (err, obj) {
            if (obj && obj.hasChildren) {
              Shop_goods_class.find({parentId: obj.id,disabled:false}).exec(function (err2, list2) {
                var ii = 0;
                list2.forEach(function (obj2) {
                  goodsclassids.push(obj2.id);
                  ii++;
                  if (ii == list2.length) {
                    cb(null, goodsclassids);
                  }
                });

              });
            } else {
              cb(null, goodsclassids);
            }
          });
        },function(ids,cb){
          Shop_goods.getPageList(sails.config.system.ShopConfig.list_page_size||8,start,{classId:ids,disabled:false},sort, function (obj) {
            cb(null, obj);
          });
        }], function (list_err, obj) {
          done(list_err, obj);
        });

      }
    }, function (err, result) {
      req.data.goodsData = result.goodsData || {};
      req.data.classObj = result.classObj || {};
      req.data.sort_name = sort_name;
      req.data.sort_type = sort_type;
      req.data.StringUtil = StringUtil;
      req.data.id = id;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/list', req.data);
    });
  },
  ajax:function(req,res){
    var id=StringUtil.getInt(req.params.id);
    var start=StringUtil.getInt(req.query.start);
    var sort_name=req.query.sort_name||'default';
    var sort_type = 'desc'==req.query.sort_type?'desc':'asc';
    var sort={location:'desc',updatedAt:'desc'};
    if(sort_name=='buy'){
      sort={buy_count:sort_type};
    }
    if(sort_name=='price'){
      sort={price:sort_type};
    }
    async.waterfall([function (cb) {
      var goodsclassids=[];
      goodsclassids.push(id);
      Shop_goods_class.findOne(id).exec(function (err, obj) {
        if (obj && obj.hasChildren) {
          Shop_goods_class.find({parentId: obj.id,disabled:false}).exec(function (err2, list2) {
            var ii = 0;
            list2.forEach(function (obj2) {
              goodsclassids.push(obj2.id);
              ii++;
              if (ii == list2.length) {
                cb(null, goodsclassids);
              }
            });

          });
        } else {
          cb(null, goodsclassids);
        }
      });
    },function(ids,cb){
      Shop_goods.getPageList(sails.config.system.ShopConfig.list_page_size||8,start,{classId:ids,disabled:false},sort, function (obj) {
        cb(null, obj);
      });
    }], function (list_err, obj) {
      return res.json(obj);
    });
  }
};
