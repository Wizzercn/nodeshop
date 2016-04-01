/**
 * Created by root on 3/31/16.
 */
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    async.parallel({
      //获取所有商品分类
      allClassList: function (done) {
        Shop_goods_class.getAllClass(function (list) {
          done(null, list);
        });
      }
    }, function (err, result) {
      req.data.allClassList = result.allClassList || [];
      req.data.StringUtil = StringUtil;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/class', req.data);
    });
  }
};
