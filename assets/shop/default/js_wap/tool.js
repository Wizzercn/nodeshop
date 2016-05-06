$(function(){
  if (typeof TouchSlide != "undefined") {
    TouchSlide({slideCell:"#focus", titCell:".hd ul", mainCell:".bd ul", effect:"leftLoop", autoPlay:true, autoPage:true, delayTime: 500, interTime:5000});
    //
    TouchSlide({
      slideCell:"#tabBox",
      // defaultIndex: 2,
      endFun:function(i){ //高度自适应
        var bd = document.getElementById("tabBox-bd");
        bd.parentNode.style.height = bd.children[i].children[0].offsetHeight+"px";
        if(i>0)bd.parentNode.style.transition="200ms";//添加动画效果
      }
    });
    //
    TouchSlide({
      slideCell:"#tabBoxa", titCell:".hd a",
      endFun:function(i){ //高度自适应
        var bd = document.getElementById("tabBoxa-bd");
        bd.parentNode.style.height = bd.children[i].children[0].offsetHeight+"px";
        if(i>0)bd.parentNode.style.transition="200ms";//添加动画效果
      }
    });
  }
});
