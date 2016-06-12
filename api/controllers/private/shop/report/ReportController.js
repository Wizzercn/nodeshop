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
    var beginDay = req.body.beginDay ? moment(req.body.beginDay).format('X') : beginDay = moment().add(-30, 'days').format('X');
    var endDay = req.body.endDay ? moment(req.body.endDay).format('X') : endDay = moment().format('X');
    var ssql = "select m.nickname nickname,l.name name,sum(o.finishAmount) amount from shop_member m,shop_order o,shop_member_lv l ";
    ssql += " where o.memberId=m.id and m.lv_id=l.id and o.status <> 'dead' and o.disabled=0";
    ssql += " and o.createdAt<=" + endDay;
    ssql += " and o.createdAt>=" + beginDay;
    ssql += " group by m.nickname,l.name order by sum(o.finishAmount) desc";
    Shop_order_goods.query(ssql,function (err, o) {
      if (!err && o.length > 0) {
        var ssql1 = "select m.nickname nickname,l.name name,sum(o.finishAmount) amount from shop_member m,shop_order o,shop_member_lv l ";
        ssql1 += " where o.memberId=m.id and m.lv_id=l.id and o.status <> 'dead' and o.disabled=0";
        ssql1 += " and o.createdAt<=" + endDay;
        ssql1 += " and o.createdAt>=" + beginDay;
        ssql1 += " group by m.nickname,l.name order by sum(o.finishAmount) desc";
        ssql1 += " LIMIT "+pageSize+" OFFSET "+start;
        var list = [];
        Shop_order_goods.query(ssql1, function (err, obj) {
          for (var i = 0; i < obj.length; i++) {
            list.push(
              {
                index: i + 1+(page-1)*pageSize,
                nickname: obj[i].nickname,
                name:obj[i].name,
                amount: StringUtil.setPrice(obj[i].amount)
              }
            );
          }
          return res.json({
            "draw": draw,
            "recordsTotal": pageSize,
            "recordsFiltered": o.length,
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
