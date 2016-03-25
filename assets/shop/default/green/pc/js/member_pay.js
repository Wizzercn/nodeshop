function binPay(){
  var payType=$('input[name=payType]:checked').val();
  if(payType=='pay_alipay'){
    $('#wxLi').hide();
    $('#alLi').show();
  }
  if(payType=='pay_wxpay'){
    $('#alLi').hide();
    var a=/^[0-9]*(\.[0-9]{1,2})?$/;
    if($("#money").val()==''||!a.test($("#money").val()))
    {
      $("#money").focus();
      $("#error").show();
      $('#wxLi').hide();
      return false;
    }
    $('#wxLi').show();
    wxPay();
  }
}

function wxPay(){
  var a=/^[0-9]*(\.[0-9]{1,2})?$/;
  if($("#money").val()==''||!a.test($("#money").val()))
  {
    $("#money").focus();
    $("#error").show();
    $('#wxLi').hide();
    return false;
  }
  $("#error").hide();
  $.get(
    "/public/shop/pc/member/pay/payWxpay?money="+$("#money").val(),
    function(result){
      if(result.code==0){
        $("#qrCode").html("");
        $("#qrCode").qrcode({width: 200,height: 200,text: result.code_url});
      }else{
        $("#qrCode").html("微信支付不可用，请使用其他支付方式");
      }
    },'json'
  );
}
$(function(){
  $(".member_cml .per-navs").eq(1).find('p').removeClass("per-titles");
  $(".member_cml .per-navs").eq(1).find('p').addClass("per-title");
  $(".member_cml .per-navs").eq(1).find('a').eq(1).addClass("per-linkon");
  $(".g_zhifu img").on("click",function(){
    var type=$(this).attr("data-id");
    $('input[name=payType][value='+type+']').attr('checked',true);
    binPay();
  });
  $("input[name=payType]").eq(0).prop("checked",true);
  binPay();
  $("#payOnline").on("click",function(){
    var a=/^[0-9]*(\.[0-9]{1,2})?$/;
    if($("#money").val()==''||!a.test($("#money").val()))
    {
      $("#money").focus();
      $("#error").show();
      $('#wxLi').hide();
      return false;
    }
    $("#error").hide();
    document.forms['payForm'].submit();
  });
  $("#money").on("keypress",function(){
    $("#error").hide();
    $('#wxLi').hide();
  });
  $("#money").focus();
});
