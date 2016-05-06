/**
 * Created by wizzer.cn on 3/28/16.
 */
var is_sendSMS=false;
function checkPassword(){
  $("#newpassword_tip").hide();
  $("#newpassword2_tip").hide();
  $("#smscode_tip").hide();
  if($("#newpassword").val().length<6){
    $("#newpassword_tip").html("请输入6位以上新密码");
    $("#newpassword_tip").show();
    return false;
  }
  if($("#newpassword").val()!=$("#newpassword2").val()){
    $("#newpassword2_tip").html("两次输入密码不一致");
    $("#newpassword2_tip").show();
    return false;
  }
  if($("#smscode").val().length<6){
    $("#smscode_tip").html("请输入短信验证码");
    $("#smscode_tip").show();
    return false;
  }
  return true;
}
function sendMsg(){
  if(is_sendSMS){
    $("#smscode_tip").html('<span class="errorn">请勿重复提交</span>');
    $("#smscode_tip").show();
    return false;
  }
  is_sendSMS=true;
  $.post(
    "/public/shop/pc/account/getSmscodeMember",
    {type:'check'},
    function(result){
      if(result.code==0){
        $("#smscode").focus();
        var s=5*60;
        var time1=setInterval(function(){
          s--;
          $("#btnSms").val(""+s+"秒");
          if(s<1){
            $("#btnSms").val("发送验证码");
            is_sendSMS=false;
            clearInterval(time1);
          }
        },1000);
      }else if(result.code==1){
        window.location.href='/login?r=/shopcart/order/'+orderId;
      }else if(result.code==2){
        is_sendSMS=false;
        $("#smscode_tip").html('<span class="errorn">短信未发送成功，请重试</span>');
        $("#smscode_tip").show();
      }
    },'json'
  );
}
function save(){
  if(checkPassword()){
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/member/password/save",
    data:{
      newpassword:$("#newpassword").val(),
      smscode:$("#smscode").val()
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
}
$(function(){
  $(".member_cml .per-navs").eq(2).find('p').removeClass("per-titles");
  $(".member_cml .per-navs").eq(2).find('p').addClass("per-title");
  $(".member_cml .per-navs").eq(2).find('a').eq(2).addClass("per-linkon");
});
