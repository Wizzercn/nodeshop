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
  }
};
