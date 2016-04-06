/**
 * Created by wizzer.cn on 4/6/16.
 */
var is_save=false;
function removeGoodsList(goodsId,productId){
  cart_is_change=true;
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/shopcart/delGoods",
    data : {
      goodsId:goodsId,
      productId:productId
    },
    dataType : "json",
    success : function(data) {
      showCartList();
    }
  });
}
function changeNumList(goodsId,productId,num){
  cart_is_change=true;
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/shopcart/changeGoodsNum",
    data : {
      goodsId:goodsId,
      productId:productId,
      num:num
    },
    dataType : "json",
    success : function(data) {
      showCartList();
    }
  });
}
function delCart(){
  var list=[];
  $("#cart_list input[type=checkbox]").each(function(){
    var self=$(this);
    if(self.prop("checked")){
      var u=self.closest('ul');
      var obj={};
      obj.goodsId= u.attr("data-goodsid");
      obj.productId= u.attr("data-productid");
      obj.num= u.attr("data-num");
      list.push(obj);
    }
  });
  if(list.length<1)return false;
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/shopcart/delCart",
    data : {
      list:list
    },
    dataType : "json",
    success : function(data) {
      showCartList();
    }
  });
}
function clearCart(){
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/shopcart/clearCart",
    data : {

    },
    dataType : "json",
    success : function(data) {
      showCartList();
    }
  });
}
function showCartList(){
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/shopcart/showGoods",
    data : {
    },
    dataType : "json",
    success : function(data) {
      var count=data.count;
      $("#cartNum").html(count||'');
      if(count>0){
        var html='';
        $.each(data.list,function(i,o){
          html+='<div class="w1200 shop_f1s cf2" data-goodsid="'+o.goodsId+'" data-productid="'+o.productId+'" data-num="'+o.num+'">'+
            '<li class="wb">'+
            '<input name="ids" type="checkbox" checked>'+
            '<img src="'+o.imgurl+'?type=s" class="pic_160">'+
          '<section class="wbw"><h3>'+o.name+'</h3>'+
          ' <div class="num_item">数量：<span class="numbox">'+
          ' <i class="reduce_num" onclick="changeNumList('+o.goodsId+','+o.productId+',-1)"></i>'+
          ' <input type="text" class="num_text" value="'+o.num+'" readonly>'+
          ' <i class="add_num" onclick="changeNumList('+o.goodsId+','+o.productId+',1)"></i></span></div></section>'+
            ' <ins class="green_text" style="position:absolute;margin-left:-4.4rem;">￥'+o.showSumPrice+'</ins>'+
          '  <li class="shop_f1sfi"><a href="javascript:removeGoodsList('+o.goodsId+','+o.productId+')">删除</a></li>'+
          ' </div>';
        });
        $("#cart_list").html(html);
        $("#tag1").html((data.weight/1000));
        $("#tag2").html(data.showYunMoney);
        $("#tag3").html(data.showAllprice);
        $("#tag4").html(data.showTotalMoney);
        $("#cart_list input[type=checkbox]").on("click",function(){
          var ck=$(this);
          if(!ck.prop("checked")){
            $("#ck").prop("checked",false);
          }
          readGoods();
        });
        $("#ck").prop("checked",true);
      }else {
        var s='<div style="padding-top: 5px;height: 300px;width: 100%;text-align: center;"><img src="'+csspath+'/pc/img/gouwu.jpg"></div>';
        $("#tag1").html('0');
        $("#tag2").html('0.00');
        $("#tag3").html('0.00');
        $("#tag4").html('0.00');
        //$("#cart_list").html(s);
      }
    }
  });
}
function readGoods(){
  var list=[];
  $("#cart_list input[type=checkbox]").each(function(){
    var self=$(this);
    if(self.prop("checked")){
      var u=self.closest('ul');
      var obj={};
      obj.goodsId= u.attr("data-goodsid");
      obj.productId= u.attr("data-productid");
      obj.num= u.attr("data-num");
      list.push(obj);
    }
  });
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/shopcart/readGoods",
    data : {
      list:list
    },
    dataType : "json",
    success : function(data) {
      $("#tag1").html((data.weight/1000));
      $("#tag2").html(data.showYunMoney);
      $("#tag3").html(data.showAllprice);
      $("#tag4").html(data.showTotalMoney);
    }
  });
}
function save(){
  var list=[];
  $("#cart_list input[type=checkbox]").each(function(){
    var self=$(this);
    if(self.prop("checked")){
      var u=self.closest('ul');
      var obj={};
      obj.goodsId= u.attr("data-goodsid");
      obj.productId= u.attr("data-productid");
      obj.num= u.attr("data-num");
      list.push(obj);
    }
  });
  if(list.length>0){
    is_save=true;
    $.ajax({
      type : "POST",
      url : "/public/shop/wap/shopcart/save",
      data : {
        list:list
      },
      dataType : "json",
      success : function(data) {
        if(data.code==0){
          window.location.href='/shopcart/buy';
        }else if(data.code==1){
          window.location.href='/login?r=/shopcart/list';
        }
      }
    });
  }else {
    $("#tip .oc_pro_a").html('购物车中无商品，请先挑选商品加入购物车！');
    $("#tip").show();
  }
}
$(function(){
  $("#save").on("click",function(){
    save();
  });
  showCartList();
  $("#cart_list input[type=checkbox]").on("click",function(){
    var ck=$(this);
    if(!ck.prop("checked")){
      $("#ck").prop("checked",false);
    }
    readGoods();
  });
  $("#ck").on("click",function(){
    var self=$(this);
    if(self.prop("checked")){
      $("#cart_list input[type=checkbox]").prop("checked",true);
    }else {
      $("#cart_list input[type=checkbox]").prop("checked",false);
    }
    readGoods();
  });
});
