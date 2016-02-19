/**
 * Created by root on 2/1/16.
 */
var moment = require('moment');
var async=require('async');
module.exports = {
  index: function (req, res) {
    return res.view('private/shop/goods/goods/index', req.data);
  },
  add: function (req, res) {
    async.parallel({
      typelist:function(done){
        Shop_goods_type.find().exec(function (error, obj) {
          if(!error)
            done(null,obj);
          else
            done(error,null);
        });
      },
      brandlist:function(done){
        Shop_goods_brand.find().exec(function (error, obj) {
          if(!error)
            done(null,obj);
          else
            done(error,null);
        });
      },
      lvlist:function(done){
        Shop_member_lv.find({disabled:false}).exec(function (error, obj) {
          if(!error)
            done(null,obj);
          else
            done(error,null);
        });
      }
    },function(error,result){
      req.data.typelist = result.typelist||[];
      req.data.brandlist = result.brandlist||[];
      req.data.lvlist = result.lvlist||[];
      return res.view('private/shop/goods/goods/add', req.data);
    });
  },
  getClass:function(req,res){
    var id=req.params.id;
    Shop_goods_class.findOne(id).populate('typeid').exec(function (e, o) {
      if(e)return res.json({code:1,msg:JSON.stringify(e)});
      return res.json({code:0,msg:'',data:o});
    });
  },
  getType:function(req,res){
    var id=req.params.id;
    Shop_goods_type.findOne(id).exec(function (e, o) {
      if(e)return res.json({code:1,msg:JSON.stringify(e)});
      return res.json({code:0,msg:'',data:o});
    });
  },
  getProps:function(req,res){
    var id=req.params.id;
    Shop_goods_type_props.find({typeid:id}).sort({location:'asc'}).populate('values',{sort:{location:'asc'}}).exec(function (e, o) {
      if(e)return res.json({code:1,msg:JSON.stringify(e)});
      return res.json({code:0,msg:'',data:o});
    });
  }
};
