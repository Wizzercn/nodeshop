/**
 * Created by root on 4/7/16.
 */
function cancelCoupon(){
  $('#div1').hide();
  $("#youhuiquan").val("");
}
function doCoupon(){
  var id=$("#youhuiquan").val();
  if(id!=''){
    var p=0;
    $.each(couponList,function(i,o){
      if(o.id==parseInt(id)){
        p= o.couponPrice;
      }
    });
    var s=totalMoney;
    if(totalMoney-p<0){
      s=1;
    }else {
      s=totalMoney-p;
    }
    $("#discountAmount").html(setPrice(p));
    $("#finishAmount").html("&yen;"+setPrice(s));
  }else {
    $("#discountAmount").html("0.00");
    $("#finishAmount").html("&yen;"+setPrice(totalMoney));
  }
  $("#div1").hide();
}
var is_fapiao=false;
function doFapiao(){
  is_fapiao=true;
  $("#div2").hide();
}
function cancelFapiao(){
  is_fapiao=false;
  $("#div2").hide();
  $("#taxNo").val("");
  $("#taxTitle").val("");
  $("#taxCentent").val("");
}
var is_submit=false;
function doOrder(){
  if(is_submit){
    tip("已提交,请稍等...");
    return false;
  }
  var addId=$(".line_box").attr("data-id");
  if(addId==''||addId==undefined){
    tip("请设置收货地址");
    return false;
  }
  var list=[];
  $("#buyGoods li").each(function(){
    var obj={};
    obj.goodsId= $(this).attr("data-goodsid");
    obj.productId= $(this).attr("data-productid");
    obj.num= $(this).attr("data-num");
    list.push(obj);
  });
  var fapiao={};
  if(is_fapiao){
    fapiao.taxType=$("input[name='taxType']:checked").val();
    fapiao.taxNo=$("#taxNo").val();
    fapiao.taxTitle=$("#taxTitle").val();
    fapiao.taxCentent=$("#taxCentent").val();
  }
  is_submit=true;
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/shopcart/orderSave",
    data:{
      list:list,
      addrId:addId,
      payType:$("input[name='payType']:checked").val(),
      couponId:$("#youhuiquan").val(),
      receivedTime:$("input[name='receivedTime']:checked").val(),
      fapiao:fapiao,
      memo:$("#memo").val()
    },
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        window.location.href='/wap/shopcart/order/'+data.orderId;
      }else if(data.code==1){
        window.location.href='/wap/login';
      }else if(data.code==3){
        is_submit=false;
        tip(data.msg);
      }
    }
  });
}
$(function(){
  $("input[name=payType]").eq(0).prop("checked",true);
});
