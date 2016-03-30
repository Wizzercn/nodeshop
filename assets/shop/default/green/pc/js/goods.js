/**
 * Created by wizzer.cn on 3/14/16.
 */

function picLunbo(){
  var num = 0;
  var slidetimer = null;
  var slider = {
    sliderInde:function(){

      if(num<0){
        num=$('.ulSmallPicm>li').length-1;
      }

      if(num>$('.ulSmallPicm>li').length-1){ num=0}

      $('.ulSmallPicm>li').removeClass('liSelectedm');
      $('.ulSmallPicm>li').eq(num).addClass('liSelectedm');
      $('.ulBigPicm').stop().animate({
        left:-($('.ulBigPicm>li').width()*num)
      },1000);
      if(num==$('.ulSmallPicm>li').length-1&&$('.ulSmallPicm>li').length>5){
        $('.ulSmallPicm').stop().animate({
          left:-(($('.ulSmallPicm>li').width()+4)*(num-4))+'px'
        },1000);
      }else{
        if(num<$('.ulSmallPicm>li').length-4){
          $('.ulSmallPicm').stop().animate({
            left:-(($('.ulSmallPicm>li').width()+4)*num)+'px'
          },1000);
        }

      }
    }
  };
  $('.ulBigPicm').css({width:$('.ulBigPicm>li>a>img').width()*$('.ulBigPicm>li').length});
  $('.ulSmallPicm').css({width:($('.ulSmallPicm>li').width()+30)*$('.ulSmallPicm>li').length});
  $('.ulSmallPicm>li').on('click',function(){
    if(num==$(this).index()){return};
    num = $(this).index();
    slider.sliderInde();
  });

  $('.sRightBtnBm').on('click',function(){		//下一张
    num++;
    slider.sliderInde();
  });
  $('.sLeftBtnBm').on('click',function(){//上一张
    num--;

    slider.sliderInde();
  });
}
function quickBuy(){
  if($(".top-float-menu-placeholder").length<1)return false;
  var cart_btn = $("#cart-btn");
  var scrollTop = $(this).scrollTop();
  var scrolled = false;
  $(window).scroll(function(){
    scrolled = Math.abs($(this).scrollTop()-scrollTop)>0;
    if($(this).scrollTop()>cart_btn.offset().top+cart_btn.height()){
      $(".top-float-menu-placeholder").fadeIn();
    }else{
      if(scrolled)
        $(".top-float-menu-placeholder").fadeOut();
      else
        $(".top-float-menu-placeholder").css("display","none");
    }
  });
  $(window).scroll();
}
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
    url : "/public/shop/pc/goods/view/"+goodsId,
    dataType : "json",
    success : function(data) {

    }
  });
}
function commentCount(goodsId){
  $.ajax({
    type : "GET",
    url : "/public/shop/pc/goods/commentCount/"+goodsId,
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
function formatDate(now) {
  return new Date(parseInt(now) * 1000).toLocaleString().replace(/年|月/g, "-").replace(/日|上午|下午/g, " ");
}
var is_page=true;
function commentData(goodsId,start){
  var score=0;
  $("#pj .tab3").find("a").each(function() {
    var self = $(this);
    if(self.hasClass("on3")){
      score=self.attr("data-id");
    }
  });
  $.ajax({
    type : "GET",
    url : "/public/shop/pc/goods/commentAjax/"+goodsId+"?start="+start+"&score="+score,
    dataType : "json",
    success : function(data) {
      var obj=data.data;
      if(obj){
        var str='';
        $.each(obj.data,function(i,o) {
          var s='很好';
          if(o.score==2){
            s='较好';
          }else if(o.score==1){
            s='一般';
          }
          str += '<div class="s_pinglunsl cf2">' +
            '<ul class="s_pinglunld">' +
            '<li class="s_pinglunlf">' +
            '<i class="zc_pin">'+s+'</i>' +
            '<span>'+ o.memberNickname+', 评论时间：'+ new Date(o.createdAt*1000).Format("yyyy-MM-dd hh:mm:ss")+'</span>' +
            '</li>' +
            '<li class="s_pinglung">'+ o.comment+'</li>' +
            '</ul>' +
            '</div>';
        });
        $("#pj_list").html(str);
        if(is_page){
          is_page=false;
          $(".tcdPageCode").createPage({
            pageCount:obj.totalPage,
            current:obj.page,
            backFn:function(p){
              commentLoad(goodsId,(p-1)*10);
            }
          });
        }
      }
    }
  });
}
function commentLoad(goodsId,start){
  $("#pj_list").html('<img src="'+csspath+'/pc/img/pj_loading.gif"/>');
  setTimeout("commentData("+goodsId+","+start+")",300);
}
$(function(){
  $("#cart-btn").on("click",function(){
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
          $("#tip .oc_pro_a").html(data.msg);
          $("#tip").show();
          $("#tip input[type=button]").eq(0).unbind("click").on("click",function(){
            $("#tip").hide();
          });
          $("#tip input[type=button]").eq(1).unbind("click").on("click",function(){
            $("#tip").hide();
          });
        }
      }
    });
  });
  $("#tab1").on("click",function(){
    $("#tab2").removeClass("s_detaila");
    $("#tab1").addClass("s_detaila");
    $("#xq").show();
    $("#pj").hide();
  });
  $("#tab2").on("click",function(){
    $("#tab1").removeClass("s_detaila");
    $("#tab2").addClass("s_detaila");
    $("#pj").show();
    $("#xq").hide();
  });
  $("#pj .tab3").find("a").each(function(){
    var self=$(this);
    self.on("click",function(){
      $("#pj .tab3").find("a").each(function(){
        $(this).removeClass("on3");
      });
      $(this).addClass("on3");
      commentLoad(goodsid,0);
    });
  });
  picLunbo();
  buyNum();
  quickBuy();
  view(goodsid);
  commentCount(goodsid);
  commentLoad(goodsid,0);
  console.log("%c%s","color: red; background: yellow; font-size: 24px; font-weight: bold;","\u5b89\u5168\u8b66\u544a!");
  console.log("%c%s","color: black; font-size: 18px;","\u8bf7\u52ff\u5728\u6b64\u63a7\u5236\u53f0\u8f93\u5165\u6216\u7c98\u8d34\u4f60\u4e0d\u660e\u767d\u7684\u4ee3\u7801\uff0c\u4ee5\u907f\u514d\u653b\u51fb\u8005\u7a83\u53d6\u4f60\u7684\u4fe1\u606f\u6765\u5192\u5145\u4f60\u3002");

});
