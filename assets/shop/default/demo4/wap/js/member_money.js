/**
 * Created by root on 4/7/16.
 */
var totalPage=1;
var page=0;
var pageSize=5;
function ajaxpage(){
  var start=page*pageSize;
  $("#pBtn1").hide();
  $("#pBtn2").show();
  $.ajax({
    type: "GET",
    url: "/public/shop/wap/member/money/list?start="+start,
    dataType: "json",
    success: function (data) {
      if (data.code == 0) {
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
        if(listObj.length>0) {
          $.each(listObj, function (i, o) {
            if(o.newMoney-o.oldMoney>0){
              str+='<div class="jifen_s">'+
                '<div class="cf2"><p class="jifen_s1"><i class="public_color">'+ o.note+'</i></p>'+
                '<p class="jifen_s2 public_color">+'+setPrice(o.diffMoney)+'</p></div>'+
                '<div class="cf2 jifen_sa"><p class="jifen_s1">'+new Date(o.createdAt*1000).Format("yyyy-MM-dd hh:mm:ss")+'</p></div>'+
                '</div>';
            }else {
              str+='<div class="jifen_s">'+
                '<div class="cf2"><p class="jifen_s1"><ins>'+ o.note+'</ins></p>'+
                '<p class="jifen_s2">-'+setPrice(+o.diffMoney)+'</p></div>'+
                '<div class="cf2 jifen_sa"><p class="jifen_s1">'+new Date(o.createdAt*1000).Format("yyyy-MM-dd hh:mm:ss")+'</p></div>'+
                '</div>';
            }
          });

          $("#list").append(str);
        }
      }
    }
  });
}
function showPay(){
  $("#payDiv").show();
  $("#money").focus();
}
function savePay(){
  var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
  if(!exp.test($("#money").val())||parseFloat($("#money").val())<=0){
    tip("请填写正确的充值金额");
    return false;
  }
  window.location.href='/wap/member/pay?money='+$("#money").val();
}
$(function(){
  ajaxpage();
});
