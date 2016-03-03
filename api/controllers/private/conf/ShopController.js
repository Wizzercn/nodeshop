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
    Shop_config.update({id: body.id}, body).exec(function (err, obj) {
      if (err)return res.json({code: 1, msg: sails.__('update.fail')});
      sails.config.system.ShopConfig=body;
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  }
};
