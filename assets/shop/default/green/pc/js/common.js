var cart_is_change=true;
Date.prototype.Format = function (fmt) {
  var o = {
    "M+": this.getMonth() + 1, //月份
    "d+": this.getDate(), //日
    "h+": this.getHours(), //小时
    "m+": this.getMinutes(), //分
    "s+": this.getSeconds(), //秒
    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
    "S": this.getMilliseconds() //毫秒
  };
  if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
  return fmt;
};
function setPrice(str){
  if (typeof str == 'string' && str.length > 2) {
    return str.substring(0, str.length - 2) + '.' + str.substring(str.length - 2);
  }else if(typeof str == 'string' && str.length == 2){
    return '0.'+str;
  }else if(typeof str == 'string' && str.length == 1){
    return '0.0'+str;
  }else if(typeof str == 'string'){
    return '0.00';
  }
  if (typeof str == 'number') {
    var s = str.toString();
    return setPrice(s);
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
  if(!num){
    num=1;
  }
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
        showCartNum();
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
  $("#search").on("click",function(){
    if($("#search_name").val()==''){
      $("#search_name").focus();
    }else {
      window.location.href='/search?search_name='+$("#search_name").val();
    }
  });
  $('#search_name').bind('keypress',function(event){
    if(event.keyCode == "13")
    {
      $("#search").trigger("click");
    }
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
