/**
 * Created by wizzer.cn on 3/28/16.
 */
function closeAddr(){
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
  $("#addr").show();
}
function saveAddr(){
  if($("#_name").val().length<2){
    tip("请输入收货人姓名/最少不能低于2个字");
    $("#_name").focus();
    return false;
  }
  var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
  if(!myreg.test($("#_mobile").val()))
  {
    tip('请输入有效的手机号码');
    $("#_mobile").focus();
    return false;
  }
  if($("#_province").val()==""||$("#_city").val()==""||$("#_area").val()==""){
    tip("请选择省、市、区县！");
    return false;
  }
  if($("#_addr").val().length<5||$("#_addr").val().length>119){
    tip("最少5个字，最多不能超过120个字！");
    $("#_addr").focus();
    return false;
  }
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/member/area/saveAddr",
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
    url : "/public/shop/wap/member/area/editAddr",
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
  $("#save").unbind("click").on("click",function(){
    editAddr();
  });
  $("#addr").show();
}
function del(id){
  $.ajax({
    type : "GET",
    url : "/public/shop/wap/member/area/del/"+id,
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
    url : "/public/shop/wap/member/area/setDefault/"+id,
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        window.location.href='/wap/shopcart/buy';
      }
    }
  });
}
function listAddr(){
  $.ajax({
    type : "GET",
    url : "/public/shop/wap/member/area/listAddr",
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        var str='';
        var df=0;
        $.each(data.list,function(i,o){
          str+='<li id="d'+ o.id+'" data-name="'+o.name+'" data-province="'+o.province+'" data-city="'+o.city+'" data-area="'+o.area+'" data-addr="'+o.addr+'" data-mobile="'+ o.mobile+'" data-postcode="'+ o.postcode+'" data-default="'+o.is_default+'" >'+
            '<ul class="user_site_info public_bg1">'+
            '<li class="wb">'+
            '<div class="wb_l"><img src="'+csspath+'/wap/images/icon/shop_s.png" ></div>'+
            '<div class="wb_r"><p class="wb_r1"><span>'+ o.name+'</span>  ｜  '+
          '<span>'+ o.mobile+'</span></p>'+
          '<p>'+ o.province+ o.city+ o.area+'<br>'+ o.addr+'</p>'+
          '</div>'+
          '</li>'+
          '</ul>'+
          '<div class="bottom_info_a public_bg1 cf2">';
          if(o.is_default==true){
            str+=' <span style="color:#fe6000;float:left;">默认地址</span>';
          }
          str+='<span class="r"><a href="javascript:del('+ o.id+');" class="delete white_btn">&nbsp;删除</a>'+
          '<a href="javascript:edit('+ o.id+');" class="addr_edit white_btn public_bg">编辑&nbsp;</a>';
          if(from=='buy'){
            str+='<a href="javascript:setDefault('+ o.id+');" class="addr_edit white_btn public_bg">选择&nbsp;</a></span>';
          }
          str+='</div>'+
          '</li>';
        });
        $("#addrList").html(str);
      }
    }
  });
}
function loadProvince(){
  $.ajax({
    type : "GET",
    url : "/public/shop/wap/member/area/getArea",
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
      url : "/public/shop/wap/member/area/getArea?name="+$(this).val(),
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
      url : "/public/shop/wap/member/area/getArea?name="+$(this).val(),
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
});
