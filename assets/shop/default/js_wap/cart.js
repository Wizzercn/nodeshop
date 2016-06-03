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
function clk(id){
  if($("#g_"+id).find("input[type=checkbox]").prop("checked")){
    $("#g_"+id).find("input[type=checkbox]").prop("checked",false);
  }else {
    $("#g_"+id).find("input[type=checkbox]").prop("checked",true);
  }
  readGoods();
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
          var spec = '';
          if(o.spec != ''){
            spec = '('+o.spec+')';
          }
          html+='<div id="g_'+i+'" class="w1200 shop_f1s cf2" data-goodsid="'+o.goodsId+'" data-productid="'+o.productId+'" data-num="'+o.num+'">'+
            '<li class="wb"><input name="ids" type="checkbox" class="i_select" checked/>'+
            '<img onclick="clk('+i+')" src="'+o.imgurl+'?type=s" class="pic_160">'+
            '<section class="wbw"><h3>'+o.name+spec+'</h3>'+
            '<div class="num_item">数量：<span class="numbox">'+
            '<i class="reduce_num" onclick="changeNumList('+o.goodsId+','+o.productId+',-1)"></i>'+
            '<input class="num_text" value="'+o.num+'" readonly="readonly" type="text">'+
            '<i class="add_num" onclick="changeNumList('+o.goodsId+','+o.productId+',1)"></i></span></div>'+
          '<ins class="orange_text" style="">￥'+o.showSumPrice+'</ins>'+
          '</section> <a href="javascript:removeGoodsList('+o.goodsId+','+o.productId+')" class="del_k"><img src="'+csspath+'/wap/images/icon/del.png"></a>  </li> </div>';
        });
        $("#cart_list").html(html);
        $("#tag2").html('含运费'+data.showYunMoney);
        $("#tag4").html('￥'+data.showTotalMoney);
        $("#cart_list input[type=checkbox]").on("click",function(){
          var ck=$(this);
          if(!ck.prop("checked")){
            $("#ck").prop("checked",false);
          }
          readGoods();
        });
        $("#ck").prop("checked",true);
      }else {
        $("#tag2").html('含运费0.00');
        $("#tag4").html('0.00');
        $("#cart_list").html('<div class="order_n"><img src="'+csspath+'/wap/images/icon_public/order_k.png"><p>您还没有选购商品，去看看有哪些想买的</p><a href="/wap/">随便逛逛</a></div>');
      }
    }
  });
}
function readGoods(){
  var list=[];
  $("#cart_list input[type=checkbox]").each(function(){
    var self=$(this);
    if(self.prop("checked")){
      var u=self.closest('div');
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
      $("#tag2").html('含运费'+data.showYunMoney);
      $("#tag4").html('￥'+data.showTotalMoney);
    }
  });
}
function save(){
  var list=[];
  $("#cart_list input[type=checkbox]").each(function(){
    var self=$(this);
    if(self.prop("checked")){
      var u=self.closest('div');
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
          window.location.href='/wap/shopcart/buy';
        }else if(data.code==1){
          window.location.href='/wap/login?r=/wap/shopcart/list';
        }
      }
    });
  }else {
    tip('您还没有选购商品！');
  }
}
$(function(){
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
