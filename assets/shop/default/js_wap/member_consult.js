var is_page=true;
var totalPage=1;
var page=0;
var pageSize=10;
function list(){
  var start=page*pageSize;
  $("#pBtn1").hide();
  $("#pBtn2").show();
  var url="/public/shop/wap/member/consult/list?start="+start;
  $.ajax({
    type: "GET",
    url: url,
    dataType: "json",
    success: function (data) {
        var str='';
        var listObj=data.data;
        page=data.page;
        totalPage=data.totalPage;
        if(totalPage==page){
          $("#pBtn1").hide();
          $("#pBtn2").hide();
        }else {
          $("#pBtn1").show();
          $("#pBtn2").hide();
        }
        if(listObj.length>0){
          $.each(listObj,function(i,o){
            var note = o.note || '';
            str += '<li><dl class="que_dl"><dt>咨询内容：</dt><dd class="wbw">' + o.consultContent + '<font color="#ff0000">(' + o.name + ')</font></dd></dl>';
            str += '<dl class="ans_item que_dl"><dt>回复内容：</dt><dd class="wbw">' + note + '</dd></dl></li>';
          });
          $("#list").append(str);
        }
      }
  });
}

function reloadList(){
  window.location.reload();
}
function ajaxpage(){
  list();
}
$(function(){
  ajaxpage();
});
