document.body.addEventListener("touchstart",function(){});

// slide
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
};
// end slide

if(typeof $ != "undefined"){
;$(function(){

// select
$(".sel_box select").change(function(){
	$(this).parents(".sel_box").find(".i_text").val($(this).children("option:selected").text());
});
// end select

// 数量
$(".reduce_num, .reduce_num2").click(function(){
	var input = $(this).next();
	if(parseInt(input.val()) == 1) return;
	input.val(parseInt(input.val()) - 1);
});
$(".add_num, .add_num2").click(function(){
	var input = $(this).prev();
	input.val(parseInt(input.val()) + 1);
});
// end 数量


});
};