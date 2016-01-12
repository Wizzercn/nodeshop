/**
 * Created by root on 9/9/15.
 */
var OAuth = require('wechat-oauth');
module.exports = {
  index: function (req, res) {
    var id = req.params.id;
    var code = req.query.code;
    Wx_sales.findOne({select: ['id', 'name', 'wxid'], where: {id: id}}).exec(function (err, sales) {
      if (err) {
        req.data.sales = {};
        return res.view('public/wx/sales/xiren/index', req.data);
      } else {
        req.data.sales = sales;
        Wx_sales_log.create({wxid: sales.wxid, salesid: sales.id,ip:req.ip}).exec(function (e, log) {
          Wx_config.findOne(sales.wxid).exec(function (ec, oc) {
            var api = new OAuth(oc.appid, oc.appsecret);
            api.getAccessToken(code, function (ew, ow) {
              sails.log.warn(JSON.stringify(ow));
              if (code&&ow) {
                var openid = ow.data.openid;
                Wx_sales_log.update({id: log.id}, {openid: openid}).exec(function (eu, ou) {

                });
              }
            });
          });
          req.data.log = log;
          return res.view('public/wx/sales/xiren/index', req.data);
        });
      }
    });
  }
};
