var is_page=true;
var sorce=new Array();
sorce[1]='差评';
sorce[2]='中评';
sorce[3]='好评';
function list(type,start){
  if(type=='no'){
    $(".member_crs a").each(function(){
      $(this).removeClass("member_crsi");
    });
    $(".member_crs a").eq(0).addClass("member_crsi");
  }else if(type=='yes'){
    $(".member_crs a").each(function(){
      $(this).removeClass("member_crsi");
    });
    $(".member_crs a").eq(1).addClass("member_crsi");
  }
  if(!start){
    start=0;
  }
  $("#list").html("");
  var url="/public/shop/pc/member/comment/list?type="+type+"&start="+start;
  if(type=='yes'){
    url="/public/shop/pc/member/comment/list_yes?type="+type+"&start="+start;
  }
  $.ajax({
    type: "GET",
    url: url,
    dataType: "json",
    success: function (data) {
        var str='';
        var listObj=data.data;
        if(listObj.length>0){
          $.each(listObj,function(i,o){
              str += '<tr class="t_second">' +
                '<td>' +
                '<dl class="member_cdss">' +
                '<dt><img src="'+o.imgurl+'?type=s"></dt>' +
                '<dd><p><a href="/goods/'+o.goodsId+'" target="_blank">'+o.name+'</a></p></dd>' +
                '</dl>' +
                '</td>' +
                '<td><span class="number_text">'+o.num+'</span></td>';
              if(type=='yes'){
                str+= '<td><span class="number_text">'+sorce[o.score]+'</span></td>';
                str+= '<td><span class="number_text2">'+o.comment+'</span></td>';
              }else {
                str+= '<td><a href="javascript:comment('+ o.id+',\''+ o.name+'\');" class="bor_o bg00aa30 mt10">评价</a></td>';
              }
              str+='</tr>';
          });

          $("#list").html(str);
          if(data.total>0&&is_page){
            is_page=false;
            $(".tcdPageCode").createPage({
                pageCount:data.totalPage,
              current:data.page,
              backFn:function(p){
              var pageSize=data.size;
              var s=(p-1)*pageSize;
                list(type,s);
              }
            });
          }
        }
      }
  });
}
function closePj(){
  $("#pageOverlay").hide();
  $("#pjname").html("");
  $("#pjdiv").hide();
}
function comment(id,name){
  $("#pageOverlay").show();
  $("#pjname").html(name);
  $("#pjdiv").show();
  $("#save").unbind("click").on("click",function(){
    var pj=$('input[name=pj]:checked').val();
    $.ajax({
      type : "POST",
      url : "/public/shop/pc/member/comment/save",
      data:{
        score:pj,
        comment:$("#txt").val(),
        id:id
      },
      dataType : "json",
      success : function(data) {
        reloadList();
      }
    });
  });
}
function reloadList(){
  window.location.reload();
}
$(function(){
  list(type);
  $(".member_cml .per-navs").eq(0).find('p').removeClass("per-titles");
  $(".member_cml .per-navs").eq(0).find('p').addClass("per-title");
  $(".member_cml .per-navs").eq(0).find('a').eq(2).addClass("per-linkon");
});
