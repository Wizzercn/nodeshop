/**
 * Created by root on 3/23/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    var m = req.session.member;
    if (!m || m.memberId < 1) {
      return res.redirect('/login');
    }
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      //获取所有商品分类
      allClassList: function (done) {
        Shop_goods_class.getAllClass(function (list) {
          done(null, list);
        });
      },
      dbMember: function (done) {
        Shop_member.findOne(m.memberId).populate('lv_id').exec(function (e, o) {
          done(null, o);
        });
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.dbMember = result.dbMember || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.siteTitle = '我的余额_' + req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/member_money', req.data);

    });
  },
  list: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var pageSize = 10;
    var start = StringUtil.getInt(req.query.start);
    var sort = {createdAt: 'desc'};
    var where = {memberId: member.memberId};
    Shop_member_money_log.getPageList(pageSize, start, where, sort, function (obj) {
      return res.json({code: 0, msg: '', data: obj});
    });
  },
  payAlipay: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var money = req.query.money || 0;
    AlipayService.init(function (err, alipay) {
      if (err || e1) {
        return res.serverError('支付宝接口异常');
      } else {
        var s = moment().format('YYMMDDHHmm');
        var n = StringUtil.getUuid(5, 10);
        var sn = s + n;
        var data = {
          out_trade_no: sn
          , subject: member.memberId
          , total_fee: StringUtil.getFloat(StringUtil.setPrice(money))
          , body: '余额充值'
          , show_url: 'http://' + sails.config.system.AppDomain + '/member/money'
        };
        return alipay.create_direct_pay_by_user(data, res);
      }
    });
  },
  payWxpay: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var money = req.query.money || 0;
    WxpayService.init(function (err, wxpay) {
      if (err || e1) {
        return res.json({code: 1, msg: ''});
      } else {
        var s = moment().format('YYMMDDHHmm');
        var n = StringUtil.getUuid(5, 10);
        var sn = s + n;
        wxpay.createUnifiedOrder({
          body: '余额充值',
          out_trade_no: sn,
          total_fee: money*100,
          spbill_create_ip: sails.config.system.AppIp || '127.0.0.1',
          notify_url: 'http://' + sails.config.system.AppDomain + '/public/shop/pc/wxpay/order',
          trade_type: 'NATIVE',
          product_id: member.memberId,
          attach:'余额充值,会员ID:'+member.memberId
        }, function (err, result) {
          sails.log.debug('result::' + JSON.stringify(result));
          if (err)
            return res.json({code: 1, msg: ''});
          if (result.code_url)
            return res.json({code: 0, msg: '', code_url: result.code_url});
          return res.json({code: 2, msg: ''});
        });
      }
    });
  }
};
