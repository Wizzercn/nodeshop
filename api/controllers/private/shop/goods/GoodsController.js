/**
 * Created by root on 2/1/16.
 */
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    return res.view('private/shop/goods/goods/index', req.data);
  },
  add: function (req, res) {
    Shop_goods_type.find().exec(function (e1, typelist) {
      Shop_goods_brand.find().exec(function (e2, brandlist) {
        req.data.typelist = typelist;
        req.data.brandlist = brandlist;
        return res.view('private/shop/goods/goods/add', req.data);
      });
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
