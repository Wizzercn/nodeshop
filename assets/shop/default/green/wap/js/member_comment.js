var is_page=true;
var sorce=new Array();
sorce[1]='一般';
sorce[2]='较好';
sorce[3]='很好';
var totalPage=1;
var page=0;
var pageSize=5;
function list(type){
  if(type=='no'){
    $(".step_nav_box_a a").each(function(){
      $(this).removeClass("on_a");
    });
    $(".step_nav_box_a a").eq(0).addClass("on_a");
  }else if(type=='yes'){
    $(".step_nav_box_a a").each(function(){
      $(this).removeClass("on_a");
    });
    $(".step_nav_box_a a").eq(1).addClass("on_a");
  }
  var start=page*pageSize;
  $("#pBtn1").hide();
  $("#pBtn2").show();
  var url="/public/shop/wap/member/comment/list?type="+type+"&start="+start;
  if(type=='yes'){
    url="/public/shop/wap/member/comment/list_yes?type="+type+"&start="+start;
  }
  $.ajax({
    type: "GET",
    url: url,
    dataType: "json",
    success: function (data) {
        var str='';
        var listObj=data.data;
        page=data.page;
        totalPage=data.totalPage;
        if(totalPage==page){
          $("#pBtn1").hide();
          $("#pBtn2").hide();
        }else {
          $("#pBtn1").show();
          $("#pBtn2").hide();
        }
        if(listObj.length>0){
          $.each(listObj,function(i,o){
            if(type=='no'){
            str+='<li>'+
              '<div class="view_tit">订单编号：<a class="name">'+o.orderId+'</a></div>'+
                '<ul class="count_pro">'+
              '<li>'+
              '<a href="05details.html"><img src="'+o.imgurl+'?type=s" class="pic_100" />'+o.name+'</a>'+
              '<div class="count_pro_r"><ins class="black_text">&yen;<span class="ins_num">'+setPrice(o.price)+'</span></ins><div>&#120;<span class="buy_num">'+o.num+'</span></div></div>'+
              '</li>'+
              '</ul>'+
            '<div class="bottom_info"><a href="javascript:comment('+ o.id+',\''+ o.name+'\');" class="green_btn">评价</a>'+
            '</div>'+
            '</li>';
            }else {
              str+='<li>'+
                '<div class="view_tit">订单编号：<a class="name">'+o.orderId+'</a></div>'+
                '<ul class="count_pro">'+
                '<li>'+
                '<a href="05details.html"><img src="'+o.imgurl+'?type=s" class="pic_100" />'+o.name+'</a>'+
                '<div class="count_pro_r"><ins class="black_text">&yen;<span class="ins_num">'+setPrice(o.price)+'</span></ins><div>&#120;<span class="buy_num">'+o.num+'</span></div></div>'+
                '</li>'+
                '</ul>';
              if(o.comment){
                str+='<div class="view_content"><div class="view_p">'+o.comment+'</div></div>';
              }
                str+='<div class="bottom_info"><span class="orange_text">'+sorce[o.score]+'</span></a>'+
                '</div>'+
                '</li>';
            }
          });
          $("#list").append(str);
        }
      }
  });
}
function comment(id,name){
  $("#pjname").html(name);
  $("#cDiv").show();
  $("#save").unbind("click").on("click",function(){
    var pj=$('input[name=pj]:checked').val();
    $.ajax({
      type : "POST",
      url : "/public/shop/wap/member/comment/save",
      data:{
        score:pj,
        comment:$("#txt").val(),
        id:id
      },
      dataType : "json",
      success : function(data) {
        tip("评论已提交");
        setTimeout(function(){
          reloadList();
        },500);
      }
    });
  });
}
function reloadList(){
  window.location.reload();
}
function ajaxpage(){
  list(type);
}
$(function(){
  ajaxpage();
});
