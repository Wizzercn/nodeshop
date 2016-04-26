/**
 * IndexController
 *
 * @description :: Server-side logic for managing indices
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
module.exports = {
  index: function (req, res) {
    var data=req.data;
    data.myMenus=req.session.myMenus||[];
    return res.view('private/index.ejs',data);
  },
  orderData:function(req,res){
    Shop_order.homeData(function(obj){
      return res.json(obj);
    });
  }
};

