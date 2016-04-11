var totalPage=1;
var page=0;
var pageSize=5;
function ajaxpage(){
  var start=page*pageSize;
  $("#pBtn1").hide();
  $("#pBtn2").show();
  $.ajax({
    type: "GET",
    url: "/public/shop/wap/member/coupon/list?start=" + start,
    dataType: "json",
    success: function (data) {
      if (data.code == 0) {
        var str='';
        var listObj=data.data.data;
        page=data.data.page;
        totalPage=data.data.totalPage;
        if(totalPage==page){
          $("#pBtn1").hide();
          $("#pBtn2").hide();
        }else {
          $("#pBtn1").show();
          $("#pBtn2").hide();
        }
        if(listObj.length>0) {
          $.each(listObj, function (i, o) {
            if(o.status==0){
              str+='<li class="enable"><div class="coupon_state_0"><div class="coupon_state_0_text">未使用</div></div><a href="javascript:;" class="wbc">'+
                '<span class="coupon_num">'+o.couponName+'</span>'+
              '</a></li>';
            }else if(o.status==1){
                str+='<li class="disable"><div class="coupon_state"><div class="coupon_state_text">已使用</div></div><a href="javascript:;" class="wbc">'+
                  '<span class="coupon_num">'+o.couponName+'</span>'+
              '</a></li>';
            }else if(o.status==2){
              str+='<li class="disable"><div class="coupon_state"><div class="coupon_state_text">已过期</div></div><a href="javascript:;" class="wbc">'+
                '<span class="coupon_num">'+o.couponName+'</span>'+
                '</a></li>';
            }
          });
          $("#list").append(str);
        }
      }
    }
  });
}
$(function(){
  ajaxpage();
});
