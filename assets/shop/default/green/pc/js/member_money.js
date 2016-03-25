
function list(start){
  if(!start)start=0;
  $("#list").html("");
  $(".tcdPageCode").html("");
  $.ajax({
    type: "GET",
    url: "/public/shop/pc/member/money/list?start="+start,
    dataType: "json",
    success: function (data) {
      if(data.code==0){
        var str='';
        var listObj=data.data.data;
        if(listObj.length>0){
          $.each(listObj,function(i,o){
          str+='<div class="asset_s">'+
          '<div class="asset_s1_a_o">'+ o.id+'</div>'+
          '<div class="asset_s1_m">'+new Date(o.createdAt*1000).Format("yyyy-MM-dd hh:mm:ss")+'</div>'+
          '<div class="asset_s3_m"><span class="colorb">'+(o.newMoney-o.oldMoney>0?'+'+setPrice(o.diffMoney):'0')+'</span></div>'+
          '<div class="asset_s3_m"><span class="colorr">'+(o.newMoney-o.oldMoney>0?'0':'-'+setPrice(o.diffMoney))+'</span></div>'+
          '<div class="assert_s5_a">'+ o.note+'</div>'+
          '</div>';
          });
          $("#list").html(str);
          if(data.data.total>0){
            var is_page=false;
            $(".tcdPageCode").createPage({
                pageCount:data.data.totalPage,
              current:data.data.page,
              backFn:function(p){
                console.log(is_page);
                if(is_page)
                  return false;
                is_page=true;
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
  $(".member_cml .per-navs").eq(1).find('a').eq(0).addClass("per-linkon");
});
