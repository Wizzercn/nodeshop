var totalPage=1;
var page=0;
var pageSize=5;
function ajaxpage(){
  var start=page*pageSize;
  $("#pBtn1").hide();
  $("#pBtn2").show();
  $.ajax({
    type: "GET",
    url: "/public/shop/wap/member/score/list?start="+start,
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
            if(o.newScore-o.oldScore>0){
            str+='<div class="jifen_s">'+
              '<div class="cf2"><p class="jifen_s1"><i class="public_color">'+ o.note+'</i></p>'+
              '<p class="jifen_s2 public_color">+'+o.diffScore+'</p></div>'+
              '<div class="cf2 jifen_sa"><p class="jifen_s1">'+new Date(o.createdAt*1000).Format("yyyy-MM-dd hh:mm:ss")+'</p></div>'+
              '</div>';
            }else {
              str+='<div class="jifen_s">'+
                '<div class="cf2"><p class="jifen_s1"><ins>'+ o.note+'</ins></p>'+
                '<p class="jifen_s2">-'+o.diffScore+'</p></div>'+
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
function saveCoupon(){
  if($("#couponid").val()=='0'){
    tip("请选择优惠券");
    return false;
  }
  $.ajax({
    type: "GET",
    url: "/public/shop/wap/member/score/saveCoupon?id=" + $("#couponid").val(),
    dataType: "json",
    success: function (data) {
      if (data.code == 0) {
        $('.popup').hide();
        tip("兑换成功");
        setTimeout(function(){
          window.location.reload();
        },1000);
      }else if(data.code == 1){
        window.location.reload();
      }else{
        tip(data.msg);
      }
    }
  });
}
$(function(){
  ajaxpage();
  $("#couponid").on("change",function(){
    $("#_couponid_tip").hide();
    $("#_num_tip").hide();
    $("#_score_tip").hide();
    $("#num").html("0");
    $("#score").html("0");
    if($(this).val()=='0'){
      return false;
    }
    $.ajax({
      type: "GET",
      url: "/public/shop/wap/member/score/coupon?id=" + $(this).val(),
      dataType: "json",
      success: function (data) {
        if (data.code == 0) {
          var obj=data.data;
          $("#num").html((obj.maxNum-obj.hasNum));
          $("#score").html(obj.score);
        }
      }
    });
  });
});
