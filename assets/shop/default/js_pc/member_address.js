/**
 * Created by wizzer.cn on 3/28/16.
 */
function closeAddr(){
  $("#pageOverlay").hide();
  $("#addr").hide();
  $("#addr").find("form").each(function(){this.reset();});
}
function addAddr(){
  $("#addr").find("form").each(function(){this.reset();});
  $("#save").unbind("click").on("click",function(){
    saveAddr();
  });
  $('#_province').attr('value','');
  $('#_city').attr('value','');
  $('#_area').attr('value','');
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
  var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
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
      postcode:$("#_postcode").val(),
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
function editAddr(){
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/member/area/editAddr",
    data:{
      id:$("#_id").val(),
      name:$("#_name").val(),
      mobile:$("#_mobile").val(),
      province:$("#_province").val(),
      city:$("#_city").val(),
      area:$("#_area").val(),
      addr:$("#_addr").val(),
      postcode:$("#_postcode").val(),
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
function edit(id){
  var obj=$("#d"+id);
  $("#_id").val(id);
  $("#_name").val(obj.attr('data-name'));
  $("#_province").append("<option value='"+obj.attr('data-province')+"' selected>"+obj.attr('data-province')+"</option>");
  $("#_city").append("<option value='"+obj.attr('data-city')+"' selected>"+obj.attr('data-city')+"</option>");
  $("#_area").append("<option value='"+obj.attr('data-area')+"' selected>"+obj.attr('data-area')+"</option>");
  $("#_addr").val(obj.attr('data-addr'));
  $("#_mobile").val(obj.attr('data-mobile'));
  $("#_postcode").val(obj.attr('data-postcode'));
  if("true"==obj.attr('data-default')){
    $("#_is_default").prop("checked",true);
  }
  $("#save").unbind("click").on("click",function(){
    editAddr();
  });
  $("#pageOverlay").show();
  $("#addr").show();
}
function del(id){
  $.ajax({
    type : "GET",
    url : "/public/shop/pc/member/area/del/"+id,
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        closeAddr();
        listAddr();
      }
    }
  });
}
function setDefault(id){
  $.ajax({
    type : "GET",
    url : "/public/shop/pc/member/area/setDefault/"+id,
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
          str+='<dl id="d'+ o.id+'" data-name="'+o.name+'" data-province="'+o.province+'" data-city="'+o.city+'" data-area="'+o.area+'" data-addr="'+o.addr+'" data-mobile="'+ o.mobile+'" data-postcode="'+ o.postcode+'" data-default="'+o.is_default+'" class="adress_m">'+
            '<dd class="adress_f1">'+ o.name+'</dd>'+
            '<dd class="adress_f2">'+ o.province+ o.city+ o.area+'<br>'+ o.addr+'</dd>'+
            '<dd class="adress_f3">'+ o.mobile+'</dd>'+
            '<dd class="adress_f3">'+ (o.is_default==true?'默认':'')+'</dd>'+
            '<dd class="adress_f5"><a href="javascript:setDefault('+ o.id+');">设为默认</a> | '+
            '<a href="javascript:edit('+ o.id+');">编辑&nbsp;</a> | '+
            '<a href="javascript:del('+ o.id+');">&nbsp;删除</a></dd>'+
            '</dl>';
        });
        $("#addrList").html(str);
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
$(function(){
  listAddr();
  loadProvince();
  $(".member_cml .per-navs").eq(2).find('p').removeClass("per-titles");
  $(".member_cml .per-navs").eq(2).find('p').addClass("per-title");
  $(".member_cml .per-navs").eq(2).find('a').eq(1).addClass("per-linkon");
});
