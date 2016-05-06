function buyNum(){
  $("#buy_num").on("keyup",function(){
    var buy_num=parseInt($(this).val());
    if(buy_num==1&&$(this).val().length==1){
    }else if(buy_num>0){
      $(this).val(buy_num);
    }else {
      $(this).val(1);
    }
  });
  $("#buy_sub").on("click",function(){
    var self=$("#buy_num");
    var buy_num=parseInt(self.val());
    var s=buy_num-1;
    if(s>0)self.val(s);
  });
  $("#buy_add").on("click",function(){
    var self=$("#buy_num");
    var buy_num=parseInt(self.val());
    var s=buy_num+1;
    if(s<10000)self.val(s);
  });
}
function view(goodsId){
  $.ajax({
    type : "GET",
    url : "/public/shop/wap/goods/view/"+goodsId,
    dataType : "json",
    success : function(data) {

    }
  });
}
function commentCount(goodsId){
  $.ajax({
    type : "GET",
    url : "/public/shop/wap/goods/commentCount/"+goodsId,
    dataType : "json",
    success : function(data) {
      var obj=data.data;
      if(obj){
        $("#goodRate").html(obj.goodRate+"%");
        $("#c0").html(obj.allCount);
        $("#c3").html(obj.c3);
        $("#c2").html(obj.c2);
        $("#c1").html(obj.c1);
      }
    }
  });
}
var totalPage=1;
var page=0;
var pageSize=5;
function ajaxpage(){
  var start=page*pageSize;
  var score=0;
  $("#pj").find("a").each(function() {
    var self = $(this);
    if(self.hasClass("active")){
      score=self.attr("data-id");
    }
  });
  $("#pBtn1").hide();
  $("#pBtn2").show();
  $.ajax({
    type : "GET",
    url : "/public/shop/wap/goods/commentAjax/"+goodsid+"?start="+start+"&score="+score,
    dataType : "json",
    success : function(data) {
      var obj=data.data;
      if(obj){
        page=obj.page;
        totalPage=obj.totalPage;
        if(totalPage==page){
          $("#pBtn1").hide();
          $("#pBtn2").hide();
        }else {
          $("#pBtn1").show();
          $("#pBtn2").hide();
        }
        var str='';
        $.each(obj.data,function(i,o) {
          str+='<li class="wb">'+
            '<seciton class="wbw">'+
            '<div class="view_name">'+o.memberNickname+'</div>'+
            ''+o.comment+''+
            '<div class="bottom_info">'+ new Date(o.createdAt*1000).Format("yyyy-MM-dd hh:mm:ss")+'</div>'+
            '</seciton>'+
            '</li>';
        });
        $("#pj_list").append(str);
        try{
        var bd = document.getElementById("tabBox-bd");
        bd.parentNode.style.height = bd.children[1].children[0].offsetHeight+"px";
        }catch(e) {}
      }
    }
  });
}

var totalPages=1;
var pages=0;
var pageSizes=5;
function con_ajaxpage(){
  var start=pages*pageSizes;
  $.ajax({
    type : "GET",
    url : "/public/shop/wap/goods/consultAjax/"+goodsid+"?start="+start,
    dataType : "json",
    success : function(data) {
      var obj=data.data;
      if(obj){
        pages=obj.page;
        totalPages=obj.totalPage;
        if(totalPages==pages){
          $("#pBtn3").hide();
          $("#pBtn4").hide();
        }else {
          $("#pBtn3").show();
          $("#pBtn4").hide();
        }
        var str='';
        $.each(obj.data,function(i,o) {
          var note = o.replyNote || '';
          str += '<li><dl class="ask_item que_dl"><dt>咨询内容：</dt><dd class="wbw">' +
            o.comment + '</dd></dl><dl class="ans_item que_dl"><dt>回复内容：</dt><dd class="wbw">' +
            note + '</dd></dl></li>';
        });
        $("#zx_list").append(str);
        try{
          var bd = document.getElementById("tabBox-bd");
          bd.parentNode.style.height = bd.children[1].children[0].offsetHeight+"px";
        }catch(e) {}
      }
    }
  });
}

function createConsult(goodsId){
  var c_content = $('#c_content').val();
  var c_connect = $('#c_contact').val();
  if(c_content != ''){
    $.ajax({
      type : "POST",
      url : "/public/shop/wap/goods/createConsult",
      dataType : "json",
      data : {
        goodsId : goodsId,
        content : c_content.substring(0,400),
        contact : c_connect.substring(0,40)
      },
      success : function(data) {
        $('#c_content,#c_contact').val('');
        $('#conshow').hide();
        tip(data.msg);
      }
    });
  }else{
    $('#c_content').focus();
  }
}

function buyNow(){
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/shopcart/save?goodsId="+goodsid+"&productId="+productid+"&num="+$("#buy_num").val(),
    data : {
      list:[]
    },
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        window.location.href='/wap/shopcart/buy';
      }else if(data.code==1){
        window.location.href='/wap/login?r=/wap/goods/'+goodsid;
      }else if(data.code==3){
        tip(data.msg);
      }
    }
  });
}
function addNow(){
  addToCarData(goodsid,productid,$("#buy_num").val());
  $(".popup").hide();
}
function buy(){
  $(".popup").show();
  $("#save").unbind("click").on("click",function(){
    buyNow();
  });
}
function add(){
  $(".popup").show();
  $("#save").unbind("click").on("click",function(){
    addNow();
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
          $("#s_province_s").append('<a href="javascript:;" class="s_province_s" onclick="getCity(name)" name="'+ o.name+'">'+ o.name+'</a>');
        });
      }
    }
  });
};

function getCity(name){
  $("a[name='"+name+"']").addClass("add_auto_on").siblings().removeClass("add_auto_on");
  $(".add_autoa").addClass("trans");
  $(".add_autoa").removeClass("width_n");
  $.ajax({
      type: "GET",
      url: "/public/shop/wap/member/area/getArea?name=" + name,
      dataType: "json",
      success: function (data) {
        if (data.code == 0) {
          $("#s_city_s").empty();
          var cityHtml = '';
          $.each(data.list, function (i, o) {
            cityHtml += '<a href="javascript:;" class="s_city_s" onclick="getArea(name)" name="' + o.name + '">' + o.name + '</a>';
          });
          $("#s_city_s").html(cityHtml);
          $("#s_county_s").html("<h3>请先选择市</h3>");
        }
      }
    });
};

function getArea(name){
  $("a[name='"+name+"']").addClass("add_auto_on").siblings().removeClass("add_auto_on");
  $(".add_autob").addClass("trans");
  $(".add_autob").removeClass("width_n");
  $(".add_autoa").addClass("width_n");
  $.ajax({
    type : "GET",
    url : "/public/shop/wap/member/area/getArea?name="+name,
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        $("#s_county_s").empty();
        var countyHtml = '';
        $.each(data.list,function(i,o){
          countyHtml += '<a href="javascript:;" class="s_county_s" onclick="getAreaNext(name)" name="' + o.name + '">'+ o.name+'</a>';
        });
        $("#s_county_s").html(countyHtml);
      }
    }
  });
};

function getAreaNext(name){
  $("a[name='"+name+"']").addClass("add_auto_on").siblings().removeClass("add_auto_on");
  $(".add_tan").removeClass("trans");
  $(".add_tan").addClass("width_n");
  $(".add_autob").addClass("width_n");
};

$(function(){
  buyNum();
  view(goodsid);
  loadProvince();
  commentCount(goodsid);
  ajaxpage();
  con_ajaxpage();
  $("#pj").find("a").each(function(){
    var self=$(this);
    self.on("click",function(){
      $("#pj").find("a").each(function(){
        $(this).removeClass("active");
      });
      $(this).addClass("active");
      page=0;
      $("#pj_list").html("");
      ajaxpage();
    });
  });

  $('#conClose').on('click',function(){
    $('#c_content,#c_contact').val('');
    $('#conshow').hide();
  });

  $('#goCon').on('click',function(){
    $('#conshow').show();
  });

  $(".d_adress").click(function(){
    $(".add_tan").addClass("trans");
    $(".add_tan").removeClass("width_n")
  });
  $(".add_tana .popup_head img").click(function(){
    $(".add_tan").removeClass("trans");
    $(".add_tan").addClass("width_n");
    $(".add_autoa").addClass("width_n");
    $(".add_autob").addClass("width_n");
  });

});
