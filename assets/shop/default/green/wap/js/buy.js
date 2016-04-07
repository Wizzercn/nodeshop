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
$(function(){

});
