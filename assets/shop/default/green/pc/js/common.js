var cart_is_change=true;
function setPrice(str){
  if(typeof str=='string'&&str.length>2){
    return str.substring(0,str.length-2)+'.'+str.substring(str.length-2);
  }
  if(typeof str=='number'){
    var s=str.toString();
    return s.substring(0,s.length-2)+'.'+s.substring(s.length-2);
  }
}
function addToCarShop(obj, goodsId,productId, num) {
  flyImg(obj,goodsId,productId, num);
}
function flyImg(obj,goodsId,productId, num){
  var $carDiv = $('#cartDiv');
  var $obj = $(obj);
  var flyImg_name = undefined;
  if($obj.closest('ul').length<=0){
    var th = $('#thumblist');
    if(th.length>0){
      flyImg_name = th.find("li:first").find('a').find('img').attr('src');
    }
  } else {
    if($obj.closest('ul').length > 0 && $obj.closest('ul').find('img.lazy').length>0){
      flyImg_name = $obj.closest('ul').find('img.lazy').attr('data-original');
    } else if($obj.closest('ul').find('img').attr('src').length>0){
      flyImg_name = $obj.closest('ul').find('img').attr('src');
    } else {
      flyImg_name = "./img/public/z_shop.png";
    }
  }
  var flyImg;
  if($('.flyImg').length!=0){
    flyImg = $('.flyImg');
    flyImg.remove();
    flyImg = $('<img class="flyImg" src="'+flyImg_name+'" style="width:80px;height:80px;"> ');
    flyImg.show();
  }else{
    flyImg = $('<img class="flyImg" src="'+flyImg_name+'" style="width:80px;height:80px;"> ');
  }
  flyImg.css('position','absolute');
  flyImg.css('z-index',8);
  flyImg.css('top',$obj.offset().top);
  flyImg.css('left',$obj.offset().left);
  $('body').append(flyImg);
  flyImg.animate({top:($carDiv.offset().top+20)+'px',left:($carDiv.offset().left+60)+'px'},500,function(){
    flyImg.hide();
    addToCarData(goodsId,productId,num);
  });
}
function addToCarData(goodsId,productId,num){
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/shopcart/addGoods",
    data : {
      goodsId : goodsId,
      productId : productId,
      num : num
    },
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        $("#cartNum").html(parseInt($("#cartNum").text())+1);
      }
    }
  });
  cart_is_change=true;
}
function showCartNum(){
  if($("#cartNum").length<1)return false;
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/shopcart/cartNum",
    data : {
    },
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        $("#cartNum").html(data.num||0);
      }
    }
  });
}
function removeGoods(goodsId,productId){
  cart_is_change=true;
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/shopcart/delGoods",
    data : {
      goodsId:goodsId,
      productId:productId
    },
    dataType : "json",
    success : function(data) {
      showCart();
    }
  });
}
function changeNum(goodsId,productId,num){
  cart_is_change=true;
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/shopcart/changeGoodsNum",
    data : {
      goodsId:goodsId,
      productId:productId,
      num:num
    },
    dataType : "json",
    success : function(data) {
      showCart();
    }
  });
}
function showCart(){
  if(!cart_is_change){
    $("#cartList").show();
    return false;
  }
  cart_is_change=false;
  $.ajax({
    type : "POST",
    url : "/public/shop/pc/shopcart/showGoods",
    data : {
    },
    dataType : "json",
    success : function(data) {
      var count=data.count;
      $("#cartNum").html(count||0);
      if(count>0){
        var html='';
        $.each(data.list,function(i,o){
          html+='<ul>'+
            '<li class="li1"><a href="/goods/'+ o.goodsId+'" target="_blank">'+
          '<img src="'+ o.imgurl+'?type=s" alt="'+ o.name+'">'+
          '</a></li>'+
          '<li class="li2">'+
          '<a href="/goods/'+ o.goodsId+'" title="'+ o.name+'" target="_blank">'+ o.name+'</a><img '+
          'src="'+csspath+'/pc/img/cart_del.png" onclick="removeGoods('+o.goodsId+','+o.productId+')"></li>'+
          '<li class="li3"><img src="'+csspath+'/pc/img/cart_1.png" onclick="changeNum('+o.goodsId+','+o.productId+',-1)"> '+o.num+' <img '+
          'src="'+csspath+'/pc/img/cart_2.png" onclick="changeNum('+o.goodsId+','+o.productId+',1)"> <span>'+o.showPrice+'</span></li>'+
          '</ul>';
        });
        $("#cartList .cart-box1").html(html);
        $("#cartList .z_gou3").html('<span class="z_gou3a">共<i>'+count+'</i>件商品总计<p>￥'+data.showAllprice+'</p></span><input type="button" value="去购物车结算" onclick="window.location.href=\'/shopcart/list\'">');
        $("#cartDiv .z_shops").addClass("z_shopson");
        $("#cartList").show();
      }else {
        var s='购物车中还没有商品，赶紧选购吧';
        $("#cartList .cart-box1").html(s);
        $("#cartList .z_gou3").html('<span class="z_gou3a">共<i>0</i>件商品总计<p>￥0.00</p></span>');
        $("#cartDiv .z_shops").addClass("z_shopson");
        $("#cartList").show();
      }
    }
  });
}
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
$(function(){
  $.ajaxSetup({cache:false});
  showCartNum();
  $("#cartDiv").on("mouseover",function(){
    showCart();
    $("#cartDiv").mouseout(function(){
      $("#cartDiv .z_shops").removeClass("z_shopson");
      $("#cartList").hide();
    });
  });
  $(".i_banner").slide({titCell:".hd ul",autoPage: true, autoPlay: true, effect:"fold", delayTime: 500, interTime: 6000})
  $(".head-menu-placeholder").addClass("notindex-bg");
  //$(".h-m-i-subitem .hover-panel").addClass("column"+$(".h-m-i-subitem .hover-panel .h-m-i-s-column").length);
  //是否启用菜单停靠
  if($(".slidmenu").length>0){
    $(window).scroll(function(){
      if($(this).scrollTop()>$(".head-menu-placeholder").offset().top){
        $("#h-m-content").addClass("fixed");
        $("#h-m-r-menu").fadeIn();
        $("#h-m-r-search").fadeOut();
        $("#goTop").show();
      }else{
        $("#h-m-content").removeClass("fixed");
        $("#h-m-r-menu").fadeOut();
        $("#h-m-r-search").fadeIn();
        $("#goTop").hide();
      }
    });
  }
  $("#goTop").on("click",function(){
    function GoTop() {
      if (document.documentElement.scrollTop + document.body.scrollTop < 1) {
        clearInterval(Timer);
      } else {
        document.documentElement.scrollTop /= 1.1;
        document.body.scrollTop /= 1.1;
      }
    }
    var Timer = setInterval(GoTop, 10);

  });
  $(window).scroll();
  //分类导航
  $("#h-m-content .c_shop").mouseover(function(){
    $(this).children(".nav_li").removeClass("c_hide");
    $(this).children().children(".icon_san").removeClass("c_hide");
    $(this).mouseout(function(){
      $(this).children(".nav_li").addClass("c_hide");
      $(this).children().children(".icon_san").addClass("c_hide");
    });
  });
});
