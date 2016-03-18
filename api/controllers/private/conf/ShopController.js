/**
 * Created by root on 11/5/15.
 */
module.exports = {
  index: function (req, res) {
    Shop_config.findOrCreate({id: 1}).exec(function (err, obj) {
      req.data.obj = obj;
      return res.view('private/conf/shop/index', req.data);
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    body.list_quick_buy=body.list_quick_buy=='1';
    body.freight_disabled=body.freight_disabled=='1';
    body.tax_disabled=body.tax_disabled=='1';
    body.pay_cash=body.pay_cash=='1';
    body.pay_money=body.pay_money=='1';
    body.pay_alipay=body.pay_alipay=='1';
    body.pay_wxpay=body.pay_wxpay=='1';
    body.pay_alipay_info=JSON.parse(body.pay_alipay_info)||{};
    body.pay_wxpay_info=JSON.parse(body.pay_wxpay_info)||{};

    Shop_config.update({id: body.id}, body).exec(function (err, obj) {
      if (err)return res.json({code: 1, msg: sails.__('update.fail')});
      sails.config.system.ShopConfig=body;
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  }
};
