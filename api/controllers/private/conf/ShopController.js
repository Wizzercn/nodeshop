/**
 * Created by root on 11/5/15.
 */
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    async.parallel({
      shop:function(done){
        Shop_config.findOrCreate({id: 1}).exec(function (err, obj) {
          done(null,obj);
        });
      },
      sms:function(done){
        Sms_config.findOrCreate({id: 1}).exec(function (err, obj) {
          done(null,obj);
        });
      },
      imgs:function(done){
        Img_config.findOrCreate({id: 1}).exec(function (err, obj) {
          done(null,obj);
        });
      }
    },function(err,result){
      req.data.obj = result.shop||{};
      req.data.sms = result.sms||{};
      req.data.imgs = result.imgs||{};
      return res.view('private/conf/shop/index', req.data);
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    body.list_quick_buy=body.list_quick_buy=='1';
    body.display_hot_sale=body.display_hot_sale=='1';
    body.freight_disabled=body.freight_disabled=='1';
    body.tax_disabled=body.tax_disabled=='1';
    body.pay_cash=body.pay_cash=='1';
    body.pay_money=body.pay_money=='1';
    body.pay_alipay=body.pay_alipay=='1';
    body.pay_wxpay=body.pay_wxpay=='1';
    body.oauth_open=body.oauth_open=='1';
    body.oauth_weixin=body.oauth_weixin=='1';
    body.oauth_qq=body.oauth_qq=='1';
    body.logistics_open=body.logistics_open=='1';
    body.pay_alipay_info=JSON.parse(body.pay_alipay_info)||{};
    body.pay_wxpay_info=JSON.parse(body.pay_wxpay_info)||{};
    body.logistics_info=JSON.parse(body.logistics_info)||{};
    var shop = {
      'shop_templet':body.shop_templet,
      'shop_css':body.shop_css,
      'shop_stock':body.shop_stock,
      'list_load_type':body.list_load_type,
      'list_page_size':body.list_page_size,
      'list_quick_buy':body.list_quick_buy,
      'display_hot_sale':body.display_hot_sale,
      'freight_disabled':body.freight_disabled,
      'freight_type':body.freight_type,
      'freight_price':body.freight_price,
      'freight_num':body.freight_num,
      'tax_disabled':body.tax_disabled,
      'tax_price':body.tax_price,
      'pay_cash':body.pay_cash,
      'pay_money':body.pay_money,
      'pay_alipay':body.pay_alipay,
      'pay_alipay_info':body.pay_alipay_info,
      'pay_wxpay':body.pay_wxpay,
      'pay_wxpay_info':body.pay_wxpay_info,
      'member_sorce_open':body.member_sorce_open,
      'member_reg_coupon':body.member_reg_coupon,
      'member_reg_score':body.member_reg_score,
      'member_weixinreg_auto':body.member_weixinreg_auto,
      'member_weixinreg_coupon':body.member_weixinreg_coupon,
      'member_weixinreg_score':body.member_weixinreg_score,
      'oauth_open':body.oauth_open,
      'oauth_weixin':body.oauth_weixin,
      'oauth_qq':body.oauth_qq,
      'logistics_open':body.logistics_open,
      'logistics_info':body.logistics_info
    };
    var img = {
      's_width':body.s_width,
      's_height':body.s_height,
      'm_width':body.m_width,
      'm_height':body.m_height,
      'wk_url':body.wk_url,
      'wk_type':body.wk_type,
      'wk_txt':body.wk_txt,
      'updatedAt':moment().format('X')
    };
    var sms = {
      'app_type':body.app_type,
      'app_key':body.app_key,
      'app_secret':body.app_secret,
      'sms_sign_name':body.sms_sign_name,
      'sms_reg_template':body.sms_reg_template,
      'sms_check_template':body.sms_check_template,
      'sms_login_template':body.sms_login_template,
      'sms_password_template':body.sms_password_template
    }
    Shop_config.update({id: body.id},shop).exec(function (err, obj) {
      if (err)return res.json({code: 1, msg: '保存失败'});
      sails.config.system.ShopConfig=obj[0];
      Sms_config.update({id: body.id}, body).exec(function (err, objs) {
        if (err)return res.json({code: 1, msg: sails.__('update.fail')});
        sails.config.system.SmsConfig=objs[0];
        Img_config.update({id: body.id}, body).exec(function (err, objss) {
          if (err)return res.json({code: 1, msg: sails.__('update.fail')});
          return res.json({code: 0, msg: sails.__('update.ok')});
        });
      });
      //return res.json({code: 0, msg: '保存成功'});
    });
  }
};
