
$(function(){
  $(".member_cml .per-navs").eq(1).find('p').removeClass("per-titles");
  $(".member_cml .per-navs").eq(1).find('p').addClass("per-title");
  $(".member_cml .per-navs").eq(1).find('a').eq(1).addClass("per-linkon");
  $(".g_zhifu img").on("click",function(){
    var type=$(this).attr("data-id");
    $('input[name=payType][value='+type+']').attr('checked',true);
  });
  $("input[name=payType]").eq(0).prop("checked",true);
});
