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
var is_page=true;
var totalPage=1;
var page=0;
var pageSize=5;
function list(type){
  if(type=='all'){
    $(".step_nav_box_a a").each(function(){
      $(this).removeClass("on_a");
    });
    $(".step_nav_box_a a").eq(0).addClass("on_a");
  }else if(type=='nopay'){
    $(".step_nav_box_a a").each(function(){
      $(this).removeClass("on_a");
    });
    $(".step_nav_box_a a").eq(1).addClass("on_a");
  }else if(type=='ship'){
    $(".step_nav_box_a a").each(function(){
      $(this).removeClass("on_a");
    });
    $(".step_nav_box_a a").eq(2).addClass("on_a");
  }else if(type=='finish'){
    $(".step_nav_box_a a").each(function(){
      $(this).removeClass("on_a");
    });
    $(".step_nav_box_a a").eq(3).addClass("on_a");
  }else if(type=='dead'){
    $(".step_nav_box_a a").each(function(){
      $(this).removeClass("on_a");
    });
    $(".step_nav_box_a a").eq(4).addClass("on_a");
  }
  var start=page*pageSize;
  $("#pBtn1").hide();
  $("#pBtn2").show();
  $.ajax({
    type: "GET",
    url: "/public/shop/wap/member/order/list?type="+type+"&start="+start,
    dataType: "json",
    success: function (data) {
      if(data.code==0){
        var str='';
        var listObj=data.data.data;
        page=data.data.page;
        totalPage=data.data.totalPage;
        if(totalPage==page){
          $("#pBtn1").hide();
          $("#pBtn2").hide();
        }else {
          $("#pBtn1").show();
          $("#pBtn2").hide();
        }
        if(listObj.length>0){
          $.each(listObj,function(i,o){
            str+='<li>'+
              '<div class="data_dl">订单编号：<div class="wbw">'+ o.id+'</div><span class="orange_text">' + enumStatus[o.status] + '</span></div>'+
              '<ul class="count_pro">';
            $.each(o.goods,function(j,goods) {
              str+='<li>' +
              '<a><img src="'+goods.imgurl+'?type=s" class="pic_100" />'+goods.name+'</a>' +
              '<div class="count_pro_r"><ins class="black_text">&yen;<span class="ins_num">'+setPrice(goods.price)+'</span></ins><div>&#120;<span class="buy_num">'+goods.num+'</span></div></div>' +
              '</li>';
            });
            str+='</ul>'+
              '<div class="bottom_info black_text">(运费:' + setPrice(o.freightAmount) +')&nbsp;(优惠:' + setPrice(o.discountAmount) +')<br>&nbsp;'+enumPayType[o.payType]+'<span class="orange_text">[' + enumPayStatus[o.payStatus] + ']</span><br><span class="ml_30">合计：<ins>&yen;<span class="ins_num">' + setPrice(o.finishAmount) + '</span></ins></span></div>'+
              '<div class="bottom_info">';
            if(o.status=='active'&&o.shipStatus==0) {
              //未支付并且未发货，可以取消订单（注意：货到付款也是未支付状态）
              str += '<a href="javascript:dead(\'' + o.id + '\')" class="white_btn">取消</a>';
            }else if(o.status=='active'&&o.receivedStatus==0){
              str+='<a href="javascript:receive(\'' + o.id + '\')" class="green_btn">确认收货</a>';
            }
            if(o.status=='dead'){
              str += '<a href="javascript:del(\'' + o.id + '\')" class="white_btn">删除</a>';
            }
            if(o.status=='active'&&o.payStatus==0&&o.payType!='pay_cash'){
              str+='<a href="/wap/shopcart/order/'+ o.id+'" class="green_btn">去支付</a>';
            }
            str+='</div></li>';
          });
          $("#list").append(str);
        }else {
          $("#list").html('<div class="order_n"><img src="'+csspath+'/wap/images/icon_public/order_k.png"><p>您还没有订单，去看看有哪些想买的</p><a href="/wap/">随便逛逛</a></div>');
        }
      }
    }
  });
}
function receive(id){
  $("#tip1 .tan_main_second").html("确定收货？");
  $("#tip1").show();
  $("#btn1").unbind("click").on("click",function(){
    $.ajax({
      type: "GET",
      url: "/public/shop/wap/member/order/receive/" +id,
      dataType: "json",
      success: function (data) {
        if(data.code==0){
          $("#tip1").hide();
          $("#tip1 .tan_main_second").html("订单已完成，现在去评价商品？");
          $("#tip1").show();
          $("#btn1").unbind("click").on("click",function(){
            window.location.href='/member/comment';
          });
          $("#btn2").unbind("click").on("click",function(){
            window.location.reload();
          });
        }else {
          $("#tip1 .tan_main_second").html(data.msg);
          $("#tip1").show();
          $("#btn1").unbind("click").on("click",function(){
            $("#tip1").hide();
          });
          $("#btn2").unbind("click").on("click",function(){
            $("#tip1").hide();
          });
        }
      }
    });
  });
  $("#btn2").unbind("click").on("click",function(){
    $("#tip1").hide();
  });

}
function del(id){
  $("#tip1 .tan_main_second").html("确定删除订单？");
  $("#tip1").show();
  $("#btn1").unbind("click").on("click",function(){
    $.ajax({
      type: "GET",
      url: "/public/shop/wap/member/order/del/" +id,
      dataType: "json",
      success: function (data) {
        if(data.code==0){
          $("#tip1").hide();
          reloadList();
        }else {
          $("#tip1 .tan_main_second").html(data.msg);
          $("#tip1").show();
          $("#btn1").unbind("click").on("click",function(){
            $("#tip1").hide();
          });
          $("#btn2").unbind("click").on("click",function(){
            $("#tip1").hide();
          });
        }
      }
    });
  });
  $("#btn2").unbind("click").on("click",function(){
    $("#tip1").hide();
  });

}
function dead(id){
  $("#tip1 .tan_main_second").html("确定取消订单？");
  $("#tip1").show();
  $("#btn1").unbind("click").on("click",function(){
    $.ajax({
      type: "GET",
      url: "/public/shop/wap/member/order/dead/" +id,
      dataType: "json",
      success: function (data) {
        if(data.code==0){
          $("#tip1").hide();
          reloadList();
        }else {
          $("#tip1 .tan_main_second").html(data.msg);
          $("#tip1").show();
          $("#btn1").unbind("click").on("click",function(){
            reloadList();
          });
          $("#btn2").unbind("click").on("click",function(){
            reloadList();
          });
        }
      }
    });
  });
  $("#btn2").unbind("click").on("click",function(){
    $("#tip1").hide();
  });

}
function reloadList(){
  window.location.reload();
}
function ajaxpage(){
  list(orderType);
}
$(function(){
  ajaxpage();
});
