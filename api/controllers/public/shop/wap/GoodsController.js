/**
 * Created by root on 3/13/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  one: function (req, res) {
    var id=req.params.id;
    async.parallel({
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
                if(member&&member.memberId>0){
                  Shop_member.findOne(member.memberId).exec(function(mmbErr,mmb){
                    Shop_goods_lv_price.findOne({lvid:mmb.lv_id,productId:productId,goodsid:id}).exec(function(es,os){
                    Shop_member_lv.findOne(mmb.lv_id).exec(function(elv,olv){
                      obj.lvprice={member_lv:olv||{},product_lv:os||{}};
                      cb(null, speclist);
                    });
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
      req.data.goods = result.goods || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.r = '/goods/'+id;
      if(result.goods){
      req.data.siteTitle = result.goods.name+'_' + req.data.siteTitle;
        if(result.goods.disabled==true){
          //未上架商品报404
          return res.notFound('商品未上架');
        }
      }else {
        return res.notFound('无此商品');
      }
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/goods_one', req.data);

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
