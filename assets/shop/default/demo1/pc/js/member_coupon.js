/**
 * Created by wizzer.cn on 3/27/16.
 */
var is_page=true;
function list(start){
  if(!start)start=0;
  $("#list").html("");
  $.ajax({
    type: "GET",
    url: "/public/shop/pc/member/coupon/list?start=" + start,
    dataType: "json",
    success: function (data) {
      if (data.code == 0) {
        var str='';
        var listObj=data.data.data;
        if(listObj.length>0) {
          str+='<ul class="cf2 gife_list">';

          $.each(listObj, function (i, o) {
            str+='<li>';
            if(o.status==1||o.status==2) {
              str += '<dl class="dl_kbg">';
            }else {
              str += '<dl>';

            }
              str+='<dt>'+ o.couponName+'</dt>'+
              '</dl>';
              if(o.status==1){
                str+='<div class="dl_kbgl">已使用</div>';
              }else if(o.status==2){
                str+='<div class="dl_kbgl">已过期</div>';
              }
              str+='</li>';
          });
          str+='</ul>';
          $("#list").html(str);
          if(data.data.total>0&&is_page){
            is_page=false;
            $(".tcdPageCode").createPage({
              pageCount:data.data.totalPage,
              current:data.data.page,
              backFn:function(p){
                var pageSize=data.data.size;
                var s=(p-1)*pageSize;
                list(s);
              }
            });
          }
        }
      }
    }
  });
}
$(function(){
  list();
  $(".member_cml .per-navs").eq(1).find('p').removeClass("per-titles");
  $(".member_cml .per-navs").eq(1).find('p').addClass("per-title");
  $(".member_cml .per-navs").eq(1).find('a').eq(3).addClass("per-linkon");
});
