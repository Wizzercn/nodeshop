/**
 * Created by wizzer.cn on 3/23/16.
 */
var enumPayStatus= new Array();
enumPayStatus[0]='未支付';
enumPayStatus[1]='已支付';
enumPayStatus[2]='已付款至到担保方';
enumPayStatus[3]='部分付款';
enumPayStatus[4]='部分退款';
enumPayStatus[5]='全额退款';
var enumStatus= new Array();
enumStatus['active']='活动订单';
enumStatus['dead']='已作废';
enumStatus['finish']='已完成';
var enumPayType= new Array();
enumPayType['pay_cash']='货到付款';
enumPayType['pay_money']='余额支付';
enumPayType['pay_alipay']='支付宝支付';
enumPayType['pay_wxpay']='微信支付';
var is_page= true;
function list(type,start){
  if(type=='nopay'){
    $(".member_crs a").eq(0).addClass("member_crsi");
    $(".member_crs a").eq(1).removeClass("member_crsi");
  }else if(type=='ship'){
    $(".member_crs a").eq(1).addClass("member_crsi");
    $(".member_crs a").eq(0).removeClass("member_crsi");
  }
  if(!start){
    start=0;
  }
  $("#list").html("");
  $.ajax({
    type: "GET",
    url: "/public/shop/pc/member/order/list?type="+type+"&start="+start,
    dataType: "json",
    success: function (data) {
      if(data.code==0){
        var str='';
        var listObj=data.data.data;
        if(listObj.length>0){
          $.each(listObj,function(i,o){

        str+='<div class="t_table_m">'+
          '<div class="member_cdf">订单编号：'+ o.id+'<span>  下单时间：'+new Date(o.createdAt*1000).Format("yyyy-MM-dd hh:mm:ss")+'</span></div>'+
          '<table class="t_main">';
            $.each(o.goods,function(j,goods) {
              str += '<tr class="t_second">' +
                '<td>' +
                '<dl class="member_cdss">' +
                '<dt><img src="'+goods.imgurl+'?type=s"></dt>' +
                '<dd><p><a href="/goods/'+goods.goodsId+'" target="_blank">'+goods.name+'</a></p></dd>' +
                '</dl>' +
                '</td>' +
                '<td><span class="number_text">'+goods.num+'</span></td>' +
                '<td><span class="number_text">'+setPrice(goods.price)+'</span></td>';
                if(j==0) {
                  str+='<td rowspan="' + o.goods.length + '"><span style="color: #dc4e4b;font-size: 14px;">' + setPrice(o.finishAmount) + '</span>'+'<br><br>(运费:' + setPrice(o.freightAmount) +')<br>(优惠:' + setPrice(o.discountAmount) +')<br>'+enumPayType[o.payType]+'</td>' +
                  '<td rowspan="' + o.goods.length + '">' + enumPayStatus[o.payStatus] + '</td>' +
                  '<td rowspan="' + o.goods.length + '">' + enumStatus[o.status] + '</td>' +
                  '<td rowspan="' + o.goods.length + '">';
                  if(o.payStatus==0&&o.payType!='pay_cash'){
                  str+='<a href="/shopcart/order/'+ o.id+'" target="_blank" class="bor_o bg00aa30 mt10">去支付</a>';
                  }
                  if(o.shipStatus==0) {
                    //未支付并且未发货，可以取消订单（注意：货到付款也是未支付状态）
                    str += '<a href="javascript:dead(\'' + o.id + '\')" class="mo-del">取消</a>';
                  }else if(o.receivedStatus==0){
                    str+='<a href="javascript:receive(\'' + o.id + '\')" class="bor_o bg00aa30 mt10">确认收货</a>';
                  }
                  str+='</td>';
                }
              str+='</tr>';
            });
            str+='</table>'+
               '</div>';
          });

          $("#list").html(str);
          if(data.data.total>0&&is_page){
            is_page=false;
            $(".tcdPageCode").createPage({
                pageCount:data.data.totalPage,
              current:data.data.page,
              backFn:function(p){
                var pageSize=data.data.size;
                var s=(p-1)*pageSize;
                list(type,s);
              }
            });
          }
        }
      }
    }
  });
}
function receive(id){
  $("#tip .oc_pro_a").html("确定收货？");
  $("#tip").show();
  $("#tip input[type=button]").eq(0).unbind("click").on("click",function(){
    $.ajax({
      type: "GET",
      url: "/public/shop/pc/member/order/receive/" +id,
      dataType: "json",
      success: function (data) {
        if(data.code==0){
          $("#tip .oc_pro_a").html("操作成功");
          $("#tip").show();
          $("#tip input[type=button]").eq(0).unbind("click").on("click",function(){
            window.location.reload();
          });
          $("#tip input[type=button]").eq(1).unbind("click").on("click",function(){
            window.location.reload();
          });
        }else {
          $("#tip .oc_pro_a").html(data.msg);
          $("#tip").show();
          $("#tip input[type=button]").eq(0).unbind("click").on("click",function(){
            $("#tip").hide();
          });
          $("#tip input[type=button]").eq(1).unbind("click").on("click",function(){
            $("#tip").hide();
          });
        }
      }
    });
  });
  $("#tip input[type=button]").eq(1).unbind("click").on("click",function(){
    $("#tip").hide();
  });

}
function dead(id){
  $("#tip .oc_pro_a").html("确定取消订单？");
  $("#tip").show();
  $("#tip input[type=button]").eq(0).unbind("click").on("click",function(){
    $.ajax({
      type: "GET",
      url: "/public/shop/pc/member/order/dead/" +id,
      dataType: "json",
      success: function (data) {
        if(data.code==0){
          $("#tip .oc_pro_a").html("操作成功");
          $("#tip").show();
          $("#tip input[type=button]").eq(0).unbind("click").on("click",function(){
            window.location.reload();
          });
          $("#tip input[type=button]").eq(1).unbind("click").on("click",function(){
            window.location.reload();
          });
        }else {
          $("#tip .oc_pro_a").html(data.msg);
          $("#tip").show();
          $("#tip input[type=button]").eq(0).unbind("click").on("click",function(){
            $("#tip").hide();
          });
          $("#tip input[type=button]").eq(1).unbind("click").on("click",function(){
            $("#tip").hide();
          });
        }
      }
    });
  });
  $("#tip input[type=button]").eq(1).unbind("click").on("click",function(){
    $("#tip").hide();
  });

}
$(function(){
  list(orderType);
  $(".member_cml .per-navtop p").removeClass("per-titles");
  $(".member_cml .per-navtop p").addClass("per-title");
});
