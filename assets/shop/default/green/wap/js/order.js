/**
 * Created by wizzer.cn on 7/4/16.
 */
var is_sendSMS=false;
var is_pay=false;
var is_wxpay=false;
var timer_wxpay;
var timer_alipay;
function getSmscode(){
  if(is_sendSMS){
    tip('请勿重复提交');
    return false;
  }
  is_sendSMS=true;
  $.post(
    "/public/shop/wap/account/getSmscodeMember",
    {type:'check'},
    function(result){
      if(result.code==0){
        $("#smscode").focus();
        tip('短信发送成功');
      }else if(result.code==1){
        window.location.href='/wap/login?r=/wap/shopcart/order/'+orderId;
      }else if(result.code==2){
        is_sendSMS=false;
        tip('短信未发送成功，请重试');
      }
    },'json'
  );
}
function payOnline(){
  tip('提交中..');
  var payType=$('input[name=payType]:checked').val();
  if(payType=='pay_money'){
    if(is_pay){
      return false;
    }
    if(!browse_is_weixin&&$("#smscode").val().length!=6){
      $("#smscode_tip").html('请输入短信验证码');
      $("#smscode_tip").show();
      $("#smscode").focus();
      return false;
    }
    is_pay=true;
    $("#smscode_tip").hide();
    $.post(
      "/public/shop/wap/shoppay/payMoney/"+orderId,
      {smscode:$("#smscode").val()},
      function(result){
        if(result.code==0){
          window.location.reload();
        }else if(result.code==1){
          window.location.href='/wap/login?r=/wap/shopcart/order/'+orderId;
        }else if(result.code==2){
          is_pay=false;
          $("#smscode_tip").html('短信验证码不正确，请重新输入');
          $("#smscode_tip").show();
        }else if(result.code==3){
          is_pay=false;
          tip("您的余额不足，请充值");
        }else if(result.code==4){
          is_pay=false;
          tip("付款失败，请重试或联系客服");
        }else {
          window.location.reload();
        }
      },'json'
    );
  }
  if(payType=='pay_cash'){
    $.get(
      "/public/shop/pc/shoppay/payCash/"+orderId,
      function(result){
        window.location.reload();
      },'json'
    );
  }
  if(payType=='pay_alipay'){
    $("#tip1").show();
    //$("#payForm").submit();
    document.forms['payForm'].submit();
  }
  if(payType=='pay_wxpay'){
    wxPay();
  }
}
function aliPay(){
  $("#tip1").show();
  //$("#payForm").submit();
  document.forms['payForm'].submit();
  timer_alipay=setInterval(function(){
    $.get(
      "/public/shop/pc/shoppay/payStatus/"+orderId,
      function(d){
        if(d.code==0){
          window.location.reload();
        }
      },'json'
    );
  },2345);
}
function binClick(){
  var payType=$('input[name=payType]:checked').val();
  if(timer_wxpay){
    clearInterval(timer_wxpay);
  }
  if(timer_alipay){
    clearInterval(timer_alipay);
  }
  if(payType=='pay_alipay'){
    $('#sendMsg').hide();
  }else if(payType=='pay_wxpay'){
    $('#sendMsg').hide();
    wxPay();
  }else if(payType=='pay_cash'){
    $('#sendMsg').hide();
  }else if(payType=='pay_money'){
    $('#sendMsg').show();
  }
}
$(function(){
  $(".line_box input[type=radio]").on("click",function(){
    binClick();
  });

});
