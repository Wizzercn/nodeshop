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
    var endDay = req.body.endDay?moment(req.body.endDay).add(1, 'days').format('X'):endDay = moment().format('X');
    endDay = endDay-1;
    console.log("beginDay::::"+beginDay);
    console.log("endDay::::"+endDay);
    var ssql = "select FROM_UNIXTIME(o.payAt,'%Y%m%d') as date,IFNULL(sum(o.payAmount),0) as amount,";
    ssql += "sum(IFNULL(hp.money,0)) as payment,sum(IFNULL(hr.money,0)) as refund,IFNULL(count(1),0) as countOrder"
    ssql += " from shop_order o left join shop_history_payments hp on o.id=hp.orderId";
    ssql += " left join shop_history_refunds hr on o.id=hr.orderId";
    ssql += " where o.disabled=0 and o.payStatus<>0";
    ssql += " and o.payAt<=" + endDay;
    ssql += " and o.payAt>=" + beginDay;
    ssql += " group by FROM_UNIXTIME(o.payAt,'%Y%m%d')";
    ssql += " order by FROM_UNIXTIME(o.payAt,'%Y%m%d')";
    Shop_order.query(ssql,function (err,obj) {
      var ssqlpay = "select o.payType,sum(IFNULL(hp.money,0))-sum(IFNULL(hr.money,0)) payAmount";
      ssqlpay += " from shop_order o left join shop_history_payments hp on o.id=hp.orderId";
      ssqlpay += " left join shop_history_refunds hr on o.id=hr.orderId";
      ssqlpay += " where o.disabled=0 and o.payStatus<>0";
      ssqlpay += " and o.payAt<=" + endDay;
      ssqlpay += " and o.payAt>=" + beginDay;
      ssqlpay += " group by o.payType";
      var data = {};
      Shop_order.query(ssqlpay,function (e,opay) {
        for (var i = 0; i < opay.length; i++) {
          switch (opay[i].payType) {
            case 'pay_alipay':
              data.pay_alipay = StringUtil.setPrice(opay[i].payAmount);
              break;
            case 'pay_wxpay':
              data.pay_wxpay = StringUtil.setPrice(opay[i].payAmount);
              break;
            case 'pay_money':
              data.pay_money = StringUtil.setPrice(opay[i].payAmount);
              break;
            case 'pay_cash':
              data.pay_cash = StringUtil.setPrice(opay[i].payAmount);
              break;
            default:

          }
        }
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
    });
  },
  orderexport:function(req,res){
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
      type:'number',
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
      type:'number',
      width:20.85
    },{
      caption:'运费',
      type:'number',
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
    var endDay = req.query.endDay?moment(req.query.endDay).add(1, 'days').format('X'):endDay = moment().format('X');
    Shop_order.find({
      disabled:0,
      status:{'!':'dead'},
      payStatus:1,
      payAt:{'>=':beginDay,'<=':endDay},
    }).populate('memberId')
    .exec(function(err,obj){
      console.log(obj);
      if(obj.length>0){
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
              StringUtil.setPrice(row.finishAmount),
              row.payType,
              moment.unix(row.payAt).format("YYYY-MM-DD HH:mm:ss"),
              StringUtil.setPrice(row.goodsAmount),
              StringUtil.setPrice(row.freightAmount),
              row.addrName,
              row.addrMobile,
              row.addrAddr,
              row.memo|| '无'
          ]
        );
        if (i >= obj.length){
          var result = exportExcel.execute(conf);
          var fireName = "order"+moment.unix(beginDay).format("YYYYMMDD")+"-"+moment.unix(endDay).add(-1,'day').format("YYYYMMDD")+".xlsx";
          res.setHeader('Content-Type', 'application/vnd.openxmlformats');
          res.setHeader("Content-Disposition", "attachment; filename=" + fireName);
          res.end(result, 'binary');
        }
        i++;
      });
    }else {
      console.log(1231111111111111111111111111111111111);
      var result = exportExcel.execute(conf);
      var fireName = "order"+moment.unix(beginDay).format("YYYYMMDD")+"-"+moment.unix(endDay).add(-1,'day').format("YYYYMMDD")+".xlsx";
      res.setHeader('Content-Type', 'application/vnd.openxmlformats');
      res.setHeader("Content-Disposition", "attachment; filename=" + fireName);
      res.end(result, 'binary');
    }
    });
  },
  goodsexport:function(req,res){
    var conf ={};
    conf.cols = [
      {
        caption:'货品编号',
        type:'string',
        width:20.85
      },
      {
        caption:'商品名称',
        type:'string',
        width:20.85
      },{
        caption:'规格',
        type:'string',
        width:20.85
      },{
        caption:'单价',
        type:'number',
        width:20.85
      },{
        caption:'数量',
        type:'number',
        width:20.85
      },{
        caption:'总额',
        type:'number',
        width:20.85
      }];
      conf.rows = [];
      var beginDay = req.query.beginDay?moment(req.query.beginDay).format('X'):beginDay = moment().add(-30, 'days').format('X');
      var endDay = req.query.endDay?moment(req.query.endDay).add(1,'day').format('X'):endDay = moment().format('X');
      var ssql = "SELECT p.gn,p.name,p.spec,p.price,SUM(p.num) AS num,SUM(p.amount) AS amount ";
      ssql += "FROM shop_order_goods p,shop_order o ";
      ssql += "WHERE o.payStatus=1 AND o.disabled=0 ";
      ssql += " and o.payAt<=" + endDay;
      ssql += " and o.payAt>=" + beginDay;
      ssql += " GROUP BY p.gn,p.name,p.spec,p.price";
      Shop_order_goods.query(ssql,function(err,obj){
        if(obj.length>0){
        var i = 1;
        obj.forEach(function (row) {
          conf.rows.push(
            [
              row.gn+"",
              row.name || '',
              row.spec+"",
              StringUtil.setPrice(row.price),
              row.num,
              StringUtil.setPrice(row.amount)
            ]
          );

          if (i >= obj.length){
            var result = exportExcel.execute(conf);
            var fireName = "goods"+moment.unix(beginDay).format("YYYYMMDD")+"-"+moment.unix(endDay).add(-1,'day').format("YYYYMMDD")+".xlsx";
            res.setHeader('Content-Type', 'application/vnd.openxmlformats');
            res.setHeader("Content-Disposition", "attachment; filename="+fireName);
            res.end(result, 'binary');
          }
          i++;
        });
      }else {
        var result = exportExcel.execute(conf);
        var fireName = "goods"+moment.unix(beginDay).format("YYYYMMDD")+"-"+moment.unix(endDay).add(-1,'day').format("YYYYMMDD")+".xlsx";
        res.setHeader('Content-Type', 'application/vnd.openxmlformats');
        res.setHeader("Content-Disposition", "attachment; filename="+fireName);
        res.end(result, 'binary');
      }
      });
    }
  };
