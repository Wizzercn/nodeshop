/**
 * Created by root on 3/28/16.
 */
function save(){
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/member/password/save",
    data:{
      oldpassword:$("#oldpassword").val(),
      newpassword:$("#newpassword").val()
    },
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        $("#tip .oc_pro_a").html("修改成功");
        $("#tip").show();
        $("#tip input[type=button]").eq(0).unbind("click").on("click",function(){
          $("#tip").hide();
        });
        $("#tip input[type=button]").eq(1).unbind("click").on("click",function(){
          $("#tip").hide();
        });
      }else {
        $("#tip .oc_pro_a").html("修改失败，请重试");
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
}
$(function(){
  $(".member_cml .per-navs").eq(2).find('p').removeClass("per-titles");
  $(".member_cml .per-navs").eq(2).find('p').addClass("per-title");
  $(".member_cml .per-navs").eq(2).find('a').eq(2).addClass("per-linkon");
});
