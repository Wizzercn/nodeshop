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
        Shop_goods.findOne(id).populate('classid').populate('products', {where:{is_default:true},sort: {location: 'asc'}}).populate('images', {sort: {id: 'asc'}}).exec(function (error, obj) {
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
              },function(speclist,cb){
                //查会员价
                var member=req.session.member;
                var productId=obj.products[0].id;
                if(member&&member.lvId>0){
                  Shop_goods_lv_price.findOne({lvid:member.lvId,productId:productId,goodsid:id}).exec(function(es,os){
                    Shop_member_lv.findOne(member.lvId).exec(function(elv,olv){
                      obj.lvprice={member_lv:olv||{},product_lv:os||{}};
                      cb(null, speclist);
                    });
                  });
                }else {
                  cb(null, speclist);
                }
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
      req.data.hotGoodsList = result.hotGoodsList || {};
      req.data.goods = result.goods || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.r = '/goods/'+id;
      req.data.siteTitle = req.data.goods.name+'_' + req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/goods_one', req.data);

    });
  },
  view:function(req,res){
    var id=req.params.id||0;
    Shop_goods.query('update Shop_goods set view_count=view_count+1 WHERE id = ?', [id], function(err, results) {
      return res.json({code:0,msg:''});
    });
  },
  commentCount:function(req,res){
    var id=req.params.id||0;
    var obj={};
    Shop_member_comment.count({goodsId:id,score:3}).exec(function(e3,c3){
      Shop_member_comment.count({goodsId:id,score:2}).exec(function(e3,c2){
        Shop_member_comment.count({goodsId:id,score:1}).exec(function(e3,c1){
          var allCount=c3+c2+c1;
          var goodRate=Math.round((c3+c2)/allCount*100);
          obj.c3=c3;
          obj.c2=c2;
          obj.c1=c1;
          obj.allCount=allCount;
          obj.goodRate=goodRate||100;
          return res.json({code:0,msg:'',data:obj});
        });
      });
    });
  },
  commentAjax:function(req,res){
    var id=StringUtil.getInt(req.params.id);
    var start=StringUtil.getInt(req.query.start);
    var score=StringUtil.getInt(req.query.score);
    var sort={score:'desc',createdAt:'desc'};
    var where={disabled:false,type:1,goodsId:id};
    if(score>0){
      where.score=score;
    }
    Shop_member_comment.getPageList(10,start,where,sort,function(l){
      return res.json({code:0,msg:'',data:l});
    });
  }
};
