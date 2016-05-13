/**
* Created by root on 20/4/16.
*/
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
// var util = require('weixin-pay/lib/util');
// var WXPay = require('weixin-pay');
module.exports = {
  memberSale: function (req, res) {
    req.data.moment = moment;
    return res.view('private/shop/report/memberSale.ejs', req.data);
  },
  memberSaleData: function (req, res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {status: {'!': 'dead'}};
    Shop_order.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        var beginDay = req.body.beginDay ? moment(req.body.beginDay).format('X') : beginDay = moment().add(-30, 'days').format('X');
        var endDay = req.body.endDay ? moment(req.body.endDay).format('X') : endDay = moment().format('X');
        endDay += 1000 * 3600 * 24 - 1;
        var ssql = "select m.nickname nickname,m.lv_id,sum(o.finishAmount) amount from shop_member m,shop_order o ";
        ssql += "where o.memberId=m.id and  o.status <> 'dead' and o.disabled=0";
        ssql += " and o.createdAt<=" + endDay;
        ssql += " and o.createdAt>=" + beginDay;
        ssql += " group by m.nickname,m.lv_id order by sum(o.finishAmount) desc";
        console.log(ssql);
        var list = [];
        Shop_order_goods.query(ssql, function (err, obj) {
          console.log(obj);
          for (var i = 0; i < obj.length; i++) {
            list.push(
              {
                index: i + 1,
                nickname: obj[i].nickname,
                lv_id:obj[i].lv_id,
                amount: StringUtil.setPrice(obj[i].amount)
              }
            );
          }
          console.log(list);
          return res.json({
            "draw": draw,
            "recordsTotal": pageSize,
            "recordsFiltered": obj.length,
            "data": list
          });
        });
      } else {
        return res.json({
          "draw": draw,
          "recordsTotal": pageSize,
          "recordsFiltered": 0,
          "data": []
        });
      }
    });
  }
};
