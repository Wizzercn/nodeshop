/**
* Created by root on 20/4/16.
*/
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
var exportExcel = require('excel-export');
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
    ssql += " where o.status!='dead' and o.payStatus=1 and o.disabled=0";
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
        sale.push(StringUtil.setPrice(obj[i].amount));
        sum += obj[i].amount;
        payment += obj[i].payment;
        refund += obj[i].refund;
        countOrder += obj[i].countOrder;
      }
      data.amountSum =  StringUtil.setPrice(sum);
      data.sale = sale;
      data.day = day;
      data.payment =  StringUtil.setPrice(payment);
      data.refund =  StringUtil.setPrice(refund);
      data.countOrder = countOrder;
      return res.json(data);
    });
  },
  export:function(req,res){
    var conf ={};
    // uncomment it for style example
    // conf.stylesXmlFile = "styles.xml";
    conf.cols = [
    {
      caption:'订单号',
      type:'string',
      width:15
    },{
      caption:'用户名',
      type:'string',
      width:20.85
    },{
      caption:'下单时间',
      type:'string',
      width:20.85
    },{
      caption:'订单状态',
      type:'string',
      width:20.85
    },{
      caption:'订单金额',
      type:'string',
      width:20.85
    },{
      caption:'支付方式',
      type:'string',
      width:20.85
    },{
      caption:'支付时间',
      type:'string',
      width:20.85
    },{
      caption:'商品总额',
      type:'string',
      width:20.85
    },{
      caption:'运费',
      type:'string',
      width:20.85
    },{
      caption:'收货人',
      type:'string',
      width:20.85
    },{
      caption:'收货人手机',
      type:'string',
      width:20.85
    },{
      caption:'收货地址',
      type:'string',
      width:20.85
    },{
      caption:'备注',
      type:'string',
      width:20.85
    }];
    conf.rows = [
      // ['1', 001, true, 3],
      // ["2", 002, false, 215163],
      // ["3", 003, false, 148]
    ];
    var beginDay = req.query.beginDay?moment(req.query.beginDay).format('X'):beginDay = moment().add(-30, 'days').format('X');
    var endDay = req.query.endDay?moment(req.query.endDay).format('X'):endDay = moment().format('X');
    Shop_order.find({
      disabled:0,
      status:{'!':'dead'},
      payStatus:1,
      payAt:{'>=':beginDay,'<=':endDay},
    }).populate('memberId')
    .exec(function(err,obj){
      var i = 1;
      obj.forEach(function (row) {
        if(!row.memberId){
          row.memberId={};
        }
        conf.rows.push(
          [
              row.id,
              row.memberId.nickname || '',
              moment.unix(row.createdAt).format("YYYY-MM-DD HH:mm:ss"),
              row.status,
              row.finishAmount+'',
              row.payType,
              moment.unix(row.payAt).format("YYYY-MM-DD HH:mm:ss"),
              row.goodsAmount+'',
              row.freightAmount+'',
              row.addrName,
              row.addrMobile,
              row.addrAddr,
              row.memo|| '无'
          ]
        );

        if (i == obj.length){
          console.log(conf);
          var result = exportExcel.execute(conf);
          res.setHeader('Content-Type', 'application/vnd.openxmlformats');
          res.setHeader("Content-Disposition", "attachment; filename=" + "Report.xlsx");
          res.end(result, 'binary');
        }
        i++;
      });
    });
  }
};
