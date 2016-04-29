/**
 * Created by wizzer on 2016/4/29.
 */
module.exports = {
  index: function (req, res) {
    Shop_config.findOrCreate({id: 1}).exec(function (err, obj) {
      req.data.obj = obj||{};
      Shop_sales_coupon.find({disabled:false}).exec(function(couponErr,couponList){
        req.data.couponList = couponList||[];
        return res.view('private/sales/register/index', req.data);
      });
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    body.member_weixinreg_auto=body.member_weixinreg_auto=='1';
    body.member_sorce_open=body.member_sorce_open=='1';
    Shop_config.update({id: body.id}, body).exec(function (err, obj) {
      if (err)return res.json({code: 1, msg: '保存失败'});
      sails.config.system.ShopConfig=body;
      return res.json({code: 0, msg: '保存成功'});
    });
  }
};
