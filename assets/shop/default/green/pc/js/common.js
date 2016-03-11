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
    url : "/shopcart/addToShopping",
    data : {
      goodsId : goodsId,
      productId : productId,
      num : num
    },
    dataType : "json",
    success : function(data) {
      //if ($("#cart-num1").length>0) {
      //  if(isSlide){
      //    showCart();
      //  }else{
      //    $('#cart-num1').html(data.count);
      //    $('.che1').children('.che1-box3').html(data.count);
      //  }
      //}
    }
  });
  hasChange = true;
}
$(function(){
  $.ajaxSetup({cache:false});
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
