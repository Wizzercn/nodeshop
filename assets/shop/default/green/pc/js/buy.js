/**
 * Created by root on 3/17/16.
 */
function closeAddr(){
  $("#pageOverlay").hide();
  $("#addr").hide();
  $("#addr").find("form").each(function(){this.reset();});
}
function addAddr(){

  $("#pageOverlay").show();
  $("#addr").show();
}
function saveAddr(){
  if($("#_name").val().length<2){
    $("#_name_tip").html("请输入收货人姓名/最少不能低于2个字");
    $("#_name").focus();
    $("#_name_tip").show();
    return false;
  }else {
    $("#_name_tip").hide();
  }
  if($("#_province").val()==""||$("#_city").val()==""||$("#_area").val()==""){
    $("#_area_tip").html("请选择省、市、区县！");
    $("#_area_tip").show();
    return false;
  }else {
    $("#_area_tip").hide();
  }
  if($("#_addr").val().length<5||$("#_addr").val().length>119){
    $("#_addr_tip").html("最少5个字，最多不能超过120个字！");
    $("#_addr").focus();
    $("#_addr_tip").show();
    return false;
  }else {
    $("#_addr_tip").hide();
  }
  var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
  if(!myreg.test($("#_mobile").val()))
  {
    $("#_mobile_tip").html('请输入有效的手机号码');
    $("#_mobile").focus();
    $("#_mobile_tip").show();
    return false;
  }else {
    $("#_mobile_tip").hide();
  }
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/member/area/saveAddr",
    data:{
      name:$("#_name").val(),
      mobile:$("#_mobile").val(),
      province:$("#_province").val(),
      city:$("#_city").val(),
      area:$("#_area").val(),
      addr:$("#_addr").val(),
      is_default:$("#_is_default").prop("checked")
    },
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        closeAddr();
        listAddr();
      }
    }
  });
}
function listAddr(){
  $.ajax({
    type : "GET",
    url : "/public/shop/pc/member/area/listAddr",
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        var str='';
        var df=0;
        $.each(data.list,function(i,o){
          if(i==0)
            df= o.id;
          if(o.is_default)
            df= o.id;
          str+='<li id="add_l_'+o.id+'"><span><em>'+ o.name+'</em><i>'+ o.mobile+'</i></span><p>'+ o.province+ o.city+ o.area+ o.addr+'</p></li>';
        });
        $("#addrList").html(str);
        $("#add_l_"+df).addClass("z_dizhi_firston");
        $(".z_dizhi_second a").click(function(){
          $(this).children(".mi").toggle("img_line");
          $(this).children(".mm").toggle("img_line");
          $(this).parent().parent().parent().children(".z_dizhi_first").toggleClass("height_auto")
        });
        $(".z_dizhi_first li").click(function(){
          $(this).addClass("z_dizhi_firston").siblings().removeClass("z_dizhi_firston");
        });
      }
    }
  });
}
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
function setPrice(str){
  if(typeof str=='string'&&str.length>2){
    return str.substring(0,str.length-2)+'.'+str.substring(str.length-2);
  }
  if(typeof str=='number'){
    var s=str.toString();
    return s.substring(0,s.length-2)+'.'+s.substring(s.length-2);
  }
}
function doCoupon(){
  var id=$("#youhuiquan").val();
  if(id!=''){
    var p=0;
    $.each(couponList,function(i,o){
      if(o.id==parseInt(id)){
        p= o.couponPrice;
      }
    });
    $("#discountAmount").html("-&yen;"+setPrice(p.toString()));
    $("#finishAmount").html("&yen;"+setPrice((totalMoney-p).toString()));
  }else {
    $("#discountAmount").html("-&yen;0.00");
    $("#finishAmount").html("&yen;"+setPrice((totalMoney).toString()));
  }
}
$(function(){
  $("#cartDiv").unbind("mouseover");
  listAddr();
  loadProvince();
  $("#chkFapiao").on("click",function(){
    if($(this).prop("checked")){
      $(".fapiao").show();
    }else {
      $(".fapiao").hide();
    }
  });
  console.log("%c%s","color: red; background: yellow; font-size: 24px; font-weight: bold;","\u5b89\u5168\u8b66\u544a!"),console.log("%c%s","color: black; font-size: 18px;","\u8bf7\u52ff\u5728\u6b64\u63a7\u5236\u53f0\u8f93\u5165\u6216\u7c98\u8d34\u4f60\u4e0d\u660e\u767d\u7684\u4ee3\u7801\uff0c\u4ee5\u907f\u514d\u653b\u51fb\u8005\u7a83\u53d6\u4f60\u7684\u4fe1\u606f\u6765\u5192\u5145\u4f60\u3002");

});
