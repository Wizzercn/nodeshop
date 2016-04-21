var is_page=true;
function list(start){
  if(!start){
    start = 0;
  }
  $("#list").html("");
  var url="/public/shop/pc/member/consult/list?&start="+start;
  $.ajax({
    type: "GET",
    url: url,
    dataType: "json",
    success: function (data) {
        var str='';
        var listObj=data.data;
        if(listObj.length>0) {
          $.each(listObj, function (i, o) {
            var note = o.note || '';
            str += '<dl class="s_zixun cf clear">' +
              '<dt><img src="' + imgPath2 + '"><i>咨询内容</i><span>' +
              o.consultContent + '<font color="#ff0000">(' + o.name + ')</font>' + '</span></dt>';
            str += '<dd class="cf2"><img src="' + imgPath3 + '"><i>回复内容</i><span>' +
              note + '</span></dd></dl>';
          });
          $("#list").html(str);
           if (data.total > 0 && is_page) {
             is_page = false;
             $(".tcdPageCode").createPage({
               pageCount: data.totalPage,
               current: data.page,
               backFn: function (p) {
                 var pageSize = data.size;
                 var s = (p - 1) * pageSize;
                 list(s);
               }
             });
           }
        }
      }
  });
}

function reloadList(){
  window.location.reload();
}

$(function(){
  list(0);
  $(".member_cml .per-navs").eq(0).find('p').removeClass("per-titles");
  $(".member_cml .per-navs").eq(0).find('p').addClass("per-title");
  $(".member_cml .per-navs").eq(0).find('a').eq(3).addClass("per-linkon");
});
