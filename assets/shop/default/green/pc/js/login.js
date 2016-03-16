/**
 * Created by root on 3/10/16.
 */
function checkLoginName(){
  if($("#login_name").val()==""){
    $("#login_name_tip").html('<span class="errorn">请输入用户名</span>');
    $("#login_name_tip").show();
    $("#login_name").focus();
    return false;
  }
  return true;
}
function checkLoginPass(){
  if($("#login_pass").val()==""){
    $("#login_pass_tip").html('<span class="errorn">请输入密码</span>');
    $("#login_pass_tip").show();
    $("#login_pass").focus();
    return false;
  }
  return true;
}
function checkVercode(){
  if($("#vercode").val()==""){
    $("#vercode_tip").html('<span class="errorn">请输入验证码</span>');
    $("#vercode_tip").show();
    $("#vercode").focus();
    return false;
  }
  return true;
}
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
function checkSmsVercode(){
  var self=$("#vercode_mobile");
  if(self.val().length!=4){
    $("#vercode_mobile_tip").html('<span class="errorn">请输入验证码</span>');
    $("#vercode_mobile_tip").show();
    self.focus();
    return false;
  }
  return true;
}
function checkSmscode(){
  var self=$("#smscode");
  if(self.val().length!=6){
    $("#smscode_tip").html('<span class="errorn">请输入手机动态密码</span>');
    $("#smscode_tip").show();
    self.focus();
    return false;
  }
  return true;
}
$(function(){
  $("#doLoginMobile").on("click",function(){
    if(checkMobile()&&checkSmscode()){
      $.post(
        "/public/shop/pc/account/doLoginMobile",
        {'mobile':$("#mobile").val(),'smscode':$("#smscode").val()},
        function(result){
          if(result.code==0){
            window.location.href=$("#r").val()||'/member';
          }else if(result.code==1) {
            $("#smscode_tip").html('<span class="errorn">手机动态密码不正确，请重新输入或重新获取</span>');
            $("#smscode_tip").show();
            $("#smscode").val("");
            $("#smscode").focus();
          }else{
            $("#tip .oc_pro_a").html(result.msg);
            $("#tip").show();
            $("#vercode_mobile").val("");
            $("#vercode_mobile").focus();
            $("#vercode_img_mobile").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
          }
        },'json'
      );
    }
  });
  $("#getSmscode").on("click",function(){
    if(checkMobile()&&checkSmsVercode()){
      $.post(
        "/public/shop/pc/account/getSmscode",
        {'mobile':$("#mobile").val(),'vercode':$("#vercode_mobile").val(),type:'login'},
        function(result){
          if(result.code==0){
            $("#tip .oc_pro_a").html("短信发送成功，请在5分钟内完成登录");
            $("#tip").show();
            $("#smscode").focus();
          }else if(result.code==1){
            $("#vercode_mobile_tip").html('<span class="errorn">验证码不正确，请重新输入</span>');
            $("#vercode_mobile_tip").show();
            $("#vercode_mobile").val("");
            $("#vercode_mobile").focus();
            $("#vercode_img_mobile").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
          }if(result.code==2){
            $("#smscode_tip").html('<span class="errorn">短信未发送成功，请重试</span>');
            $("#smscode_tip").show();
            $("#vercode_mobile").val("");
            $("#vercode_mobile").focus();
            $("#vercode_img_mobile").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
          }
        },'json'
      );
    }
  });
  $("#doLogin").on("click",function(){
    if(checkLoginName()&&checkLoginPass()&&checkVercode()){
      $.post(
        "/public/shop/pc/account/doLogin",
        {'login_name':$("#login_name").val(),'login_pass':$("#login_pass").val(),'vercode':$("#vercode").val(),saveLoginname:$("#saveLoginname").prop("checked")},
        function(result){
          if(result.code==0){
            window.location.href=$("#r").val()||'/member';
          }else if(result.code==1){
            $("#vercode_tip").html('<span class="errorn">验证码不正确，请重新输入</span>');
            $("#vercode_tip").show();
            $("#vercode").val("");
            $("#vercode").focus();
            $("#vercode_img").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
          }else{
            $("#tip .oc_pro_a").html(result.msg);
            $("#tip").show();
            $("#vercode").val("");
            $("#vercode").focus();
            $("#vercode_img").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());

          }
        },'json'
      );
    }
  });
  $("#mobile").on("keyup",function(){$("#mobile_tip").hide()});
  $("#vercode_mobile").on("keyup",function(){$("#vercode_mobile_tip").hide()});
  $("#smscode").on("keyup",function(){$("#smscode_tip").hide()});
  $("#login_name").on("keyup",function(){$("#login_name_tip").hide()});
  $("#login_pass").on("keyup",function(){$("#login_pass_tip").hide()});
  $("#vercode").on("keyup",function(){$("#vercode_tip").hide()}).on("keypress",function(e){if(e.keyCode=='13'){$("#doLogin").trigger("click");}});
  $("#tip input[type=button]").on("click",function(){$("#tip").hide();});
  $(".land-add a").click(
    function () {
      $(this).removeClass("land-addon").siblings().addClass("land-addon");
    });

  $(".land-addr").click(
    function () {

      $(".login-mains").removeClass("c_hide");
      $(".login-mainf").addClass("c_hide");
      $("#vercode_img").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
    });
  $(".land-addl").click(
    function () {
      $(".login-mainf").removeClass("c_hide");
      $(".login-mains").addClass("c_hide");
      $("#vercode_img_mobile").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
    });
  setTimeout(function(){$("#vercode_img").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());},200);

});
