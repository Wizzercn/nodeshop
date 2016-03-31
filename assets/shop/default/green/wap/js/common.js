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
function tip(word){
  $('#tip').find('span').html(word);
  $('#tip').show();
  setTimeout("$('#tip').hide()",2500);
}
function addToCarShop(obj, goodsId,productId, num) {
  flyImg(obj,goodsId,productId, num);
}
function flyImg(goodsId,productId, num){
  addToCarData(goodsId,productId,num);
}
function addToCarData(goodsId,productId,num){
  if(!num){
    num=1;
  }
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/shopcart/addGoods",
    data : {
      goodsId : goodsId,
      productId : productId,
      num : num
    },
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        showCartNum();
        tip("添加成功");
      }else if(data.code==2){
        tip("库存不足");
      }
    }
  });
  cart_is_change=true;
}
function showCartNum(){
  if($("#cartNum").length<1)return false;
  $.ajax({
    type : "POST",
    url : "/public/shop/wap/shopcart/cartNum",
    data : {
    },
    dataType : "json",
    success : function(data) {
      if(data.code==0){
        $("#cartNum").html(data.num||'');
      }
    }
  });
}
function removeGoods(goodsId,productId){
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
      showCart();
    }
  });
}
function changeNum(goodsId,productId,num){
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
      showCart();
    }
  });
}
$(function(){
  $.ajaxSetup({cache:false});
  showCartNum();
});
