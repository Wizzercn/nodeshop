function loadProvince(){
  $.ajax({
    type : "GET",
    url : "/public/shop/pc/member/area/getArea",
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        $.each(data.list,function(i,o){
          $("#_province").append('<option value="'+ o.name+'">'+ o.name+'</option>');
        });
      }
    }
  });
  $("#_province").on("change",function(){
    if($(this).val()==''){
      $("#_city").val('');
      $("#_area").val('');
      return false;
    }
    $.ajax({
      type : "GET",
      url : "/public/shop/pc/member/area/getArea?name="+$(this).val(),
      dataType : "json",
      success : function(data) {
        if(data.code==0){
          $("#_city").empty();
          $("#_city").append('<option value="">请选择市</option>');
          $.each(data.list,function(i,o){
            $("#_city").append('<option value="'+ o.name+'">'+ o.name+'</option>');
          });
        }
      }
    });
  });
  $("#_city").on("change",function(){
    if($(this).val()==''){
      $("#_area").val('');
      return false;
    }
    $.ajax({
      type : "GET",
      url : "/public/shop/pc/member/area/getArea?name="+$(this).val(),
      dataType : "json",
      success : function(data) {
        if(data.code==0){
          $("#_area").empty();
          $("#_area").append('<option value="">请选择区县</option>');
          $.each(data.list,function(i,o){
            $("#_area").append('<option value="'+ o.name+'">'+ o.name+'</option>');
          });
        }
      }
    });
  });
}
function checkNickname(){
  $("#_nickname_tip").hide();
  if($("#nickname").val()==''){
    $("#_nickname_tip").html("昵称不可为空");
    $("#_nickname_tip").show();
    return false;
  }
  return true;
}
function isChinaOrLett(s) {//判断是否是汉字、字母组成
  var regu = "^[a-zA-Z\u4e00-\u9fa5]+$";
  var re = new RegExp(regu);
  if (re.test(s)) {
    return true;
  } else {
    return false;
  }
}
function checkRealName() {
  var realName = $.trim($("#realname").val());
  $("#_realname_tip").hide();
  if (!isChinaOrLett(realName)) {
    $("#_realname_tip").html("真实姓名只能输入中文、英文");
    $("#_realname_tip").show();
    return false;
  }
}
function checkEMail(){
  var email = $.trim($("#email").val());
  $("#_email_tip").hide();
  if(email){
    var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if(!reg.test(email)){
      $("#_email_tip").html("请输入正确的Email");
      $("#_email_tip").show();
      return false;
    }
  $.post("/public/shop/pc/member/profile/checkEmail", {
    email : email
  }, function(data) {
     if(data.code==2){
       $("#_email_tip").html("邮箱已经存在");
       $("#_email_tip").show();
     }

  });}
}
function save(){
  var is_submit=true;
  var sex=$('input[name=sex]:checked').val()||0;
  $(".error").each(function(){
    if($(this).is(":hidden")==false){
      is_submit=false;
      $(this).prev().find("input").focus();
      return false;
    }
  });
  if(checkNickname()&&is_submit){
    $.ajax({
      type : "POST",
      url : "/public/shop/pc/member/profile/save",
      data:{
        nickname:$("#nickname").val(),
        province:$("#_province").val(),
        city:$("#_city").val(),
        area:$("#_area").val(),
        addr:$("#_addr").val(),
        sex:sex,
        wdate:$("#wdate").val(),
        realname:$("#realname").val(),
        email:$("#email").val()
      },
      dataType : "json",
      success : function(data) {
        if(data.code==0){
          $("#left_nickname").html($("#nickname").val());
          $("#tip .oc_pro_a").html("保存成功");
          $("#tip").show();
          $("#tip input[type=button]").eq(0).unbind("click").on("click",function(){
            $("#tip").hide();
          });
          $("#tip input[type=button]").eq(1).unbind("click").on("click",function(){
            $("#tip").hide();
          });
        }else {
          $("#tip .oc_pro_a").html("保存失败");
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
  $(".member_cml .per-navs").eq(2).find('a').eq(0).addClass("per-linkon");
  loadProvince();
});
