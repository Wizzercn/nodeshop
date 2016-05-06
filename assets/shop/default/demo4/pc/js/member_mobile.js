/**
 * Created by wizzer.cn on 3/28/16.
 */
var is_sendSMS=false;
function checkPassword(){
  $("#mobile_tip").hide();
  $("#smscode_tip").hide();
  var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
  if(!myreg.test($("#mobile").val()))
  {
    $("#mobile_tip").html('请输入有效的手机号码');
    $("#mobile").focus();
    $("#mobile_tip").show();
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
    "/public/shop/pc/member/mobile/getSmscodeMobile",
    {type:'check',mobile:$("#mobile").val()},
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
      }else{
        is_sendSMS=false;
        $("#smscode_tip").html('<span class="errorn">'+result.msg+'</span>');
        $("#smscode_tip").show();
      }
    },'json'
  );
}
function save(){
  if(checkPassword()){
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/member/mobile/save",
    data:{
      mobile:$("#mobile").val(),
      smscode:$("#smscode").val()
    },
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        $("#tip .oc_pro_a").html(data.msg);
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
  }
}
$(function(){
  $(".member_cml .per-navs").eq(2).find('p').removeClass("per-titles");
  $(".member_cml .per-navs").eq(2).find('p').addClass("per-title");
  $(".member_cml .per-navs").eq(2).find('a').eq(3).addClass("per-linkon");
});
