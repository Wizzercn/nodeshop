/**
 * Created by root on 3/20/16.
 */
var is_sendSMS=false;
var is_pay=false;
var is_wxpay=false;
var timer_wxpay;
var timer_alipay;
function sendMsg(){
  if(is_sendSMS){
    $("#smscode_tip").html('<span class="errorn">请勿重复提交</span>');
    $("#smscode_tip").show();
    return false;
  }
  is_sendSMS=true;
  $.post(
    "/public/shop/pc/account/getSmscodeMember",
    {type:'check'},
    function(result){
      if(result.code==0){
        $("#smscode").focus();
        var s=5*60;
        var time1=setInterval(function(){
          s--;
          $("#btnSms").val("短信发送成功，请在"+s+"秒内输入短信验证码");
          if(s<1){
            $("#btnSms").val("发送验证码");
            is_sendSMS=false;
            clearInterval(time1);
          }
        },1000);
      }else if(result.code==1){
        window.location.href='/login?r=/shopcart/order/'+orderId;
      }else if(result.code==2){
        is_sendSMS=false;
        $("#smscode_tip").html('<span class="errorn">短信未发送成功，请重试</span>');
        $("#smscode_tip").show();
      }
    },'json'
  );
}
function payOnline(){
  var payType=$('input[name=payType]:checked').val();
  if(payType=='pay_money'){
    if(is_pay){
      return false;
    }
    is_pay=true;
    if($("#smscode").val().length!=6){
      $("#smscode_tip").html('<span class="errorn">请输入短信验证码</span>');
      $("#smscode_tip").show();
      $("#smscode").focus();
      return false;
    }
    $("#smscode_tip").hide();
    $.post(
      "/public/shop/pc/shoppay/payMoney/"+orderId,
      {smscode:$("#smscode").val()},
      function(result){
        if(result.code==0){
          window.location.reload();
        }else if(result.code==1){
          window.location.href='/login?r=/shopcart/order/'+orderId;
        }else if(result.code==2){
          is_pay=false;
          $("#smscode_tip").html('<span class="errorn">短信验证码不正确，请重新输入</span>');
          $("#smscode_tip").show();
        }else if(result.code==3){
          is_pay=false;
          $("#tip .oc_pro_a").html("您的余额不足，请充值");
          $("#tip").show();
          $("#tip .oc_pro").on("click",function(){
            window.location.href='/member/pay';
          });
          $("#tip .oc_pro1").on("click",function(){
            $("#tip").hide();
          });
        }else if(result.code==4){
          is_pay=false;
          $("#tip .oc_pro_a").html("付款失败，请重试或联系客服");
          $("#tip").show();
          $("#tip .oc_pro").on("click",function(){
            window.location.reload();
          });
          $("#tip .oc_pro1").on("click",function(){
            $("#tip").hide();
          });
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
    $("#payForm").submit();
  }
}
function aliPay(){
  $("#tip1").show();
  $("#payForm").submit();
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
function wxPay(){
  if(is_wxpay)
  {
    return false;
  }
  is_wxpay=true;
  $.get(
    "/public/shop/pc/shoppay/payWxpay/"+orderId,
    function(result){
      if(result.code==0){
        $("#qrCode").html("");
        $("#qrCode").qrcode({width: 200,height: 200,text: result.code_url});
        timer_wxpay=setInterval(function(){
          $.get(
            "/public/shop/pc/shoppay/payStatus/"+orderId,
            function(d){
              if(d.code==0){
                window.location.reload();
              }
            },'json'
          );
        },2345);
      }else if(result.code==2){
        $("#tip .oc_pro_a").html("订单异常，请重下下单或联系客服");
        $("#tip").show();
        $("#tip .oc_pro").on("click",function(){
          window.location.reload();
        });
        $("#tip .oc_pro1").on("click",function(){
          $("#tip").hide();
        });
      }else{
        is_wxpay=false;
        $("#tip .oc_pro_a").html("微信支付不可用，请使用其他支付方式");
        $("#tip").show();
        $("#tip .oc_pro").on("click",function(){
          $("#tip").hide();
        });
        $("#tip .oc_pro1").on("click",function(){
          $("#tip").hide();
        });
      }
    },'json'
  );
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
    $('#sendMsgLi').hide();
    $('#wxLi').hide();
    $('#payLi').show();
  }else if(payType=='pay_wxpay'){
    $('#sendMsgLi').hide();
    $('#payLi').hide();
    $('#wxLi').show();
    wxPay();
  }else if(payType=='pay_cash'){
    $('#sendMsgLi').hide();
    $('#wxLi').hide();
    $('#payLi').show();
  }else if(payType=='pay_money'){
    $('#sendMsgLi').show();
    $('#wxLi').hide();
    $('#payLi').show();
  }
}
$(function(){
  $("#cartDiv").unbind("mouseover");
  $("#payOnline").on("click",function(){
    payOnline();
  });
  $(".g_zhifu input[type=radio]").on("click",function(){
    binClick();
  });
  $(".g_zhifu img").on("click",function(){
    var type=$(this).attr("data-id");
    $('input[name=payType][value='+type+']').attr('checked',true);
    binClick();
  });
  console.log("%c%s","color: red; background: yellow; font-size: 24px; font-weight: bold;","\u5b89\u5168\u8b66\u544a!"),console.log("%c%s","color: black; font-size: 18px;","\u8bf7\u52ff\u5728\u6b64\u63a7\u5236\u53f0\u8f93\u5165\u6216\u7c98\u8d34\u4f60\u4e0d\u660e\u767d\u7684\u4ee3\u7801\uff0c\u4ee5\u907f\u514d\u653b\u51fb\u8005\u7a83\u53d6\u4f60\u7684\u4fe1\u606f\u6765\u5192\u5145\u4f60\u3002");

});
