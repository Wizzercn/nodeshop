/**
 * Created by wizzer on 2016/5/23.
 */
var StringUtil = require('../../common/StringUtil');
var moment = require('moment');
module.exports = {
  basket: function (req, res) {
    Api_basket.find({select:['id','name','num'],where:{appid:req.appid}}).exec(function(e,l){
      if(e){
        return res.json({code:1,msg:'err:'+e});
      }
      return res.json({code:0,msg:'success',data:l});
    });
  },
  sku:function(req,res){
    try{
      var basketid=req.body.basketid;
      var skus=[];
      Api_basket_products.find({select:['sku'],where:{basketid:basketid}}).exec(function(e,l){
        if(e){
          return res.json({code:1,msg:'err:'+e});
        }
        if(l.length>0){
          l.forEach(function(o){
            skus.push(o.sku);
          });
        }
        return res.json({code:0,msg:'success',data:skus});
      });
    }catch(err){
      return res.json({code:2,msg:'err:'+err});
    }
  },
  detail:function(req,res){
    try{
      var sku=req.body.sku;
      Shop_goods_products.findOne({gn:sku}).populate('goodsid').populate('brandid').exec(function(e,o){
        if(e||!o){
          return res.json({code:1,msg:'err:'+e});
        }
        sails.log.debug(JSON.stringify(o));
        var obj={};
        obj.sku= o.sku;
        obj.weight=o.weight;
        if(o.goodsid&& o.goodsid.imgurl){
          obj.imagePath='http://'+sails.config.system.AppDomain+o.goodsid.imgurl;
        }else{
          obj.imagePath='';
        }
        obj.state=1;
        return res.json({code:0,msg:'success',data:o});
      });
    }catch(err){
      return res.json({code:2,msg:'err:'+err});
    }
  }
};
