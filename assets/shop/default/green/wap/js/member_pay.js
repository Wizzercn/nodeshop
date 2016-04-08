/**
 * Created by root on 4/8/16.
 */
function btnClick1(){
  $("#tip1").hide();
}
function btnClick2(){
  $("#tip1").hide();
  window.location.href='/wap/member/money';
}
function aliPay(){
  $("#tip1").show();
  document.forms['payForm'].submit();
}
function payOnline(){
  var payType=$('input[name=payType]:checked').val();
  if(payType=='pay_alipay'){
    $("#tip1").show();
    aliPay();
  }
  if(payType=='pay_wxpay'){
    wxPay();
  }
}
$(function(){
  $("input[name=payType]").eq(0).prop("checked",true);
});
