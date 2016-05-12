/**
* Created by root on 20/4/16.
*/
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {

      req.data.moment = moment;
      req.data.StringUtil = StringUtil;
      return res.view('private/shop/report/sale/index', req.data);
  },
  saleDate: function (req,res) {
    var beginDay = req.body.beginDay?moment(req.body.beginDay).format('X'):beginDay = moment().add(-30, 'days').format('X');
    var endDay = req.body.endDay?moment(req.body.endDay).format('X'):endDay = moment().format('X');
    var ssql = "select FROM_UNIXTIME(o.createdAt,'%Y%m%d') as date,IFNULL(sum(o.finishAmount),0) as amount,";
    ssql += "sum(IFNULL(hp.money,0)) as payment,sum(IFNULL(hr.money,0)) as refund,IFNULL(count(1),0) as countOrder"
    ssql += " from shop_order o left join shop_history_payments hp on o.id=hp.orderId";
    ssql += " left join shop_history_refunds hr on o.id=hr.orderId";
    ssql += " where o.status!='dead' and o.payStatus=1";
    ssql += " and o.createdAt<=" + endDay;
    ssql += " and o.createdAt>=" + beginDay;
    ssql += " group by FROM_UNIXTIME(createdAt,'%Y%m%d')";
    Shop_order.query(ssql,function (err,obj) {
      var data = {};
      var sale = [];
      var day = [];
      var payment = 0;
      var refund = 0;
      var countOrder = 0;
      var sum = 0;
      for (var i = 0; i < obj.length; i++) {
        day.push(obj[i].date);
        sale.push(obj[i].amount/100);
        sum += obj[i].amount/100;
        payment += obj[i].payment/100;
        refund += obj[i].refund/100;
        countOrder += obj[i].countOrder;
      }
      data.amountSum = sum;
      data.sale = sale;
      data.day = day;
      data.payment = payment;
      data.refund = refund;
      data.countOrder = countOrder;
      console.log(data);
      return res.json(data);
    });
  },
  data: function (req,res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {};
    var status = req.body.status||'0';
    if(req.body.id){
      where.id = req.body.id;
    }
    // var where = {shipStatus:orderStatus};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Shop_order.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_order.find(where)
        .sort(sort)
        .sort('createdAt desc')
        .paginate({page: page, limit: pageSize})
        .exec(function (err, list) {
          return res.json({
            "draw": draw,
            "recordsTotal": pageSize,
            "recordsFiltered": count,
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
  },

}
