/**
 * Created by root on 3/16/16.
 */
function removeGoodsList(goodsId,productId){
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
      showCartList();
    }
  });
}
function changeNumList(goodsId,productId,num){
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
    url : "/public/shop/pc/shopcart/delCart",
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
    url : "/public/shop/pc/shopcart/clearCart",
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
          html+='<ul class="w1200 shop_f1s cf2" data-goodsid="'+o.goodsId+'" data-productid="'+o.productId+'" data-num="'+o.num+'">'+
            '<li class="shop_f1so">'+
            '<table><tr><td><span class="set-btn"><input name="ids" type="checkbox" checked></span></td>'+
            '<td><span class="shop_img"><a href="/goods/'+o.goodsId+'" target="_blank"><img src="'+o.imgurl+'?type=s" height="70" width="70"></a></span></td>'+
          '<td><span class="shop-title"><a href="/goods/'+o.goodsId+'" target="_blank">'+o.name+'</a></span></td></tr></table>'+
          '</li>'+
          '<li class="z_guige">'+
          '</li>'+
          ' <li class="shop_f1st">'+(o.weight*o.num/1000)+'kg</li>'+
          ' <li class="shop_f1st">￥'+o.showPrice+'</li>'+
          ' <li class="shop_f1ss">'+
          ' <input type="button" class="num_btn" value="-" onclick="changeNumList('+o.goodsId+','+o.productId+',-1)">'+
          ' <input type="text" class="num_text" value="'+o.num+'" readonly>'+
          '<input type="button" class="num_btn" value="+"  onclick="changeNumList('+o.goodsId+','+o.productId+',1)"></li>'+
          '  <li class="shop_f1sf">￥'+o.showSumPrice+'</li>'+
          '  <li class="shop_f1sfi"><a href="javascript:removeGoodsList('+o.goodsId+','+o.productId+')">删除</a></li>'+
          ' </ul>';
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
        var s='<span style="font-size: 26px;float: left;padding-left: 100px;padding-top: 20px;height: 70px;width: 100%;">购物车中还没有商品，赶紧选购吧</span>';
        $("#tag1").html('0');
        $("#tag2").html('0.00');
        $("#tag3").html('0.00');
        $("#tag4").html('0.00');
        $("#cart_list").html(s);
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
    url : "/public/shop/pc/shopcart/readGoods",
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
$(function(){
  $("#cartDiv").unbind("mouseover");
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
