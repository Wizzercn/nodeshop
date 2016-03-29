var is_page=true;
function list(start){
  if(!start)start=0;
  $("#list").html("");
  $.ajax({
    type: "GET",
    url: "/public/shop/pc/member/score/list?start="+start,
    dataType: "json",
    success: function (data) {
      if(data.code==0){
        var str='';
        var listObj=data.data.data;
        if(listObj.length>0){
          $.each(listObj,function(i,o){
          str+='<div class="asset_s">'+
          '<div class="asset_s1_a_o">'+ o.id+'</div>'+
          '<div class="asset_s1_m">'+new Date(o.createdAt*1000).Format("yyyy-MM-dd hh:mm:ss")+'</div>'+
          '<div class="asset_s3_m"><span class="colorb">'+(o.newScore-o.oldScore>0?'+':'-')+o.diffScore+'</span></div>'+
          '<div class="assert_s5_a">'+ o.note+'</div>'+
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
                list(s);
              }
            });
          }
        }
      }
    }
  });
}
function closeCoupon(){
  $("#pageOverlay").hide();
  $("#yhq").hide();
}
function showCoupon(){
  $("#pageOverlay").show();
  $("#yhq").show();
}
function saveCoupon(){
  if($("#couponid").val()=='0'){
    $("#_couponid_tip").html("请选择优惠券");
    $("#_couponid_tip").show();
    return false;
  }
  $.ajax({
    type: "GET",
    url: "/public/shop/pc/member/score/saveCoupon?id=" + $("#couponid").val(),
    dataType: "json",
    success: function (data) {
      if (data.code == 0) {
        closeCoupon();
        $("#tip .oc_pro_a").html("兑换成功");
        $("#tip").show();
        $("#tip input[type=button]").eq(0).unbind("click").on("click",function(){
          window.location.reload();
        });
        $("#tip input[type=button]").eq(1).unbind("click").on("click",function(){
          window.location.reload();
        });
      }else if(data.code == 1){
        window.location.reload();
      }else if(data.code == 2){
        $("#_couponid_tip").html(data.msg);
        $("#_couponid_tip").show();
      }else if(data.code == 3){
        $("#_num_tip").html(data.msg);
        $("#_num_tip").show();
      }else if(data.code == 4){
        $("#_score_tip").html(data.msg);
        $("#_score_tip").show();
      }
    }
  });
}
$(function(){
  list();
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
      url: "/public/shop/pc/member/score/coupon?id=" + $(this).val(),
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
  $(".member_cml .per-navs").eq(1).find('p').removeClass("per-titles");
  $(".member_cml .per-navs").eq(1).find('p').addClass("per-title");
  $(".member_cml .per-navs").eq(1).find('a').eq(2).addClass("per-linkon");
});
