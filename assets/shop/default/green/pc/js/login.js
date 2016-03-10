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
$(function(){
  $("#doLogin").on("click",function(){
    if(checkLoginName()&&checkLoginPass()&&checkVercode()){
      $.post(
        "/public/shop/pc/account/doLogin",
        {'login_name':$("#login_name").val(),'login_pass':$("#login_pass").val(),'vercode':$("#vercode").val(),saveLoginname:$("#saveLoginname").prop("checked")},
        function(result){
          if(result.code==0){
            window.location.href=$("#r").val()||'/member';
          }else{
            $("#tip .oc_pro_a").html(result.msg);
            $("#tip").show();
            $("#vercode_img").attr("src","/public/shop/pc/account/captcha?" + new Date().getTime());
            $("#vercode").val("");
          }
        },'json'
      );
    }
  });
  $("#login_name").on("keyup",function(){$("#login_name_tip").hide()});
  $("#login_pass").on("keyup",function(){$("#login_pass_tip").hide()});
  $("#vercode").on("keyup",function(){$("#vercode_tip").hide()});
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
