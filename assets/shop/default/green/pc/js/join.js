/**
 * Created by root on 3/9/16.
 */
function loadimage(obj) {
  var $obj = $(obj);
  if($obj.is('img'))
    $obj.attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
  else
    $obj.prev().attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
}
function checkMobile(){
  var self=$("#mobile");
  var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
  if(!myreg.test(self.val()))
  {
    $("#mobile_tip").html('<span class="errorn">请输入有效的手机号码</span>');
    $("#mobile_tip").show();
    self.focus();
    return false;
  }
  return true;
}
function checkVercode(){
  var self=$("#vercode");
  if(self.val().length!=4){
    $("#vercode_tip").html('<span class="errorn">请输入验证码</span>');
    $("#vercode_tip").show();
    self.focus();
    return false;
  }
  return true;
}
function checkSmscode(){
  var self=$("#smscode");
  if(self.val().length!=6){
    $("#smscode_tip").html('<span class="errorn">请输入手机效验码</span>');
    $("#smscode_tip").show();
    self.focus();
    return false;
  }
  return true;
}
function checkLoginname(){
  $("#mobile_tip").hide();
  var self=$("#mobile");
  if(self.val().length==11&&checkMobile()){
    $.post(
      "/public/shop/pc/account/checkLoginname/"+self.val(),
      function(result){
        if(result.code==1){
          $("#mobile_tip").html('<span class="errorn">帐号已存在，请更换号码注册</span>');
          $("#mobile_tip").show();
        }
      },'json'
    );
  }
}
function checkPass(){
  if($("#pass1").val().length<6){
    $("#pass1_tip").html('<span class="errorn">请设置六位数以上的密码</span>');
    $("#pass1_tip").show();
    $("#pass1_tip").focus();
    return false;
  }
  if($("#pass2").val()!=$("#pass1").val()){
    $("#pass2_tip").html('<span class="errorn">两次输入的密码不一致</span>');
    $("#pass2_tip").show();
    $("#pass2_tip").focus();
    return false;
  }
  return true;
}
function getSmscode(){
  if(checkMobile()&&checkVercode()){
    $.post(
      "/public/shop/pc/account/getSmscode",
      {'mobile':$("#mobile").val(),'vercode':$("#vercode").val()},
      function(result){
        if(result.code==0){
          $("#tip .oc_pro_a").html("短信发送成功，请在5分钟内完成注册");
          $("#tip").show();
          $("#smscode").focus();
        }else if(result.code==1){
          $("#vercode_tip").html('<span class="errorn">验证码不正确，请重新输入</span>');
          $("#vercode_tip").show();
          $("#vercode").val("");
          $("#vercode").focus();
          $("#vercode_img").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
        }if(result.code==2){
          $("#smscode_tip").html('<span class="errorn">短信未发送成功，请重试</span>');
          $("#smscode_tip").show();
          $("#vercode").val("");
          $("#vercode").focus();
          $("#vercode_img").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
        }
      },'json'
    );
  }
}
$(function(){
  $("#dojoin").on("click",function(){
    if(checkMobile()&&checkSmscode()&&checkPass()){

    }
  });
  $("#mobile").on("keyup",checkLoginname).on("blur",checkLoginname);
  $("#getSmscode").on("click",getSmscode);
  $("#vercode").on("keyup",function(){$("#vercode_tip").hide()});
  $("#pass1").on("keyup",function(){$("#pass1_tip").hide()});
  $("#pass2").on("keyup",function(){$("#pass2_tip").hide()});
  $("#tip input[type=button]").on("click",function(){
    $("#tip").hide();
  });
  setTimeout(function(){$("#vercode_img").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime())},200);
});
