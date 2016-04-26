/**
 * IndexController
 *
 * @description :: Server-side logic for managing indices
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
module.exports = {
  index: function (req, res) {
    return res.view('private/index.ejs',req.data);
  },
  orderData:function(req,res){
    Shop_order.homeData(function(obj){
      return res.json(obj);
    });
  },
  goodsData:function(req,res){
    Shop_goods.homeData(function(obj){
      return res.json(obj);
    });
  },
  memberData:function(req,res){
    Shop_member.homeData(function(obj){
      return res.json(obj);
    });
  }
};

