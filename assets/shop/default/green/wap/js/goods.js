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
    var buy_num=parseInt($("#buy_num").val());
    var s=buy_num-1;
    if(s>0)$("#buy_num").val(s);
  });
  $("#buy_add").on("click",function(){
    var buy_num=parseInt($("#buy_num").val());
    var s=buy_num+1;
    if(s<10000)$("#buy_num").val(s);
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
function buyNow(){
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/shopcart/save?goodsId="+goodsid+"&productId="+productid+"&num="+$("#buy_num").val(),
    data : {
      list:[]
    },
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        window.location.href='/shopcart/buy';
      }else if(data.code==1){
        window.location.href='/login?r=/goods/'+goodsid;
      }else if(data.code==3){
        tip(data.msg);
      }
    }
  });
}
$(function(){
  buyNum();
  view(goodsid);
  commentCount(goodsid);
  ajaxpage();
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
});
