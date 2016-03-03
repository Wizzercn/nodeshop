$(document).ready(function(){
	           if(typeof($("#cardTipId").val()) != "undefined"){
				   $("#msgwindow").window("showwindow");
				   $("#msgwindow").removeNode();
	           }
           });
		    
		   	
			$(document).ready(function(){
				//清除产地信息的样式
				$("#farm-desc p").removeAttr("style");
				var _height = 0;
				var firstImg = $("#storyContent img:eq(0)");
				firstImg.bind("load",function(event){
					_height+=($(this).height()+parseInt($(this).css("padding-top"))+parseInt($(this).css("margin-top")));
					$("#text-content").css("height",(_height)+"px");
				});
				var allp = $("#storyContent p");
				allp.each(function(index){
					if(index==allp.length-1){
						$("#text-content .icon-end").css("display","none");
					}
					if($(this).find("img").length>0){
						return false;
					}else{
						if($(this).text()!="")
							_height+=($(this).height()+parseInt($(this).css("padding-bottom"))+parseInt($(this).css("padding-top"))+parseInt($(this).css("margin-top"))+parseInt($(this).css("margin-bottom")));
					};
				});
				$("#text-content").css("height",_height+"px");
				firstImg.attr("src",firstImg.attr("_src"));
				
				$("#icon-wechat-s").mouseover(function(){
					jiathis_config.url = "http://www.sunyuki.com/phone/items/9158";
				});
				$("#icon-sina-s,#icon-qzone-s").mouseover(function(){
					jiathis_config.url = undefined;
				});
				$("#text-content .icon-end").click(function(){
					var parent = $(this).parent();
					if($(this).attr("show")){
						parent.height(_height+"px");
						$(this).find("a").html("显示更多");
						$(this).removeAttr("show");
					}else{
						$(this).parent().height("auto");
						$(this).find("a").html("收起");
						$(this).attr("show",true);
						parent.find("img").each(function(){
							if(!$(this).attr("src"))
								$(this).attr("src",$(this).attr("_src"));
						});
					}
				});
				$(".select-box").selectbox();
				$(".number-box2").numberbox2();
				var cart_btn = $("#cart-btn");
				var scrollTop = $(this).scrollTop();
				var scrolled = false;
				$(window).scroll(function(){
					scrolled = Math.abs($(this).scrollTop()-scrollTop)>0; 
					if($(this).scrollTop()>cart_btn.offset().top+cart_btn.height()){
						$(".top-float-menu-placeholder").fadeIn();
					}else{
						if(scrolled)
							$(".top-float-menu-placeholder").fadeOut();
						else
							$(".top-float-menu-placeholder").css("display","none");
					}
				});
				$(window).scroll();
				$(".d-t-l-imgs img").click(function(){
					$("#detailmainimg").attr("src",$(this).attr("_src")+"/480x480");
					$(".d-t-l-imgs .selected").removeClass("selected");
					$(this).addClass("selected");
				});
				
				$(".sb-item").click(function(){
					var itemId = $(this).attr("selectedItemId");
					window.location.href="http://www.sunyuki.com/items/"+itemId;
				});
				
				$("#cart-btn").click(function(){
					if(!$(this).hasClass("btn-normal-disable")){
						var count = $("#itemCount").numberbox2("value");
						var saleType = 1;
						if(saleType == 2){
							addToPreSale($(this).attr("itemid"),count);
						}else if(saleType == 3){
							addToCycleBuy($(this).attr("itemid"));
						}else if(saleType == 1){
							addToCart(1,$(this).attr("itemid"),count,$(this));
						}
						
					}
				});
				
				$(".db-r-listitem .btn-normal").click(function(){
					if(!$(this).hasClass("btn-normal-disable")&&!$(this).hasClass("btn-normal-yellow")){
						var count = $(this).parent().find('.number-box').numberbox2("value");
						var saleType = $(this).attr("saleType");
						var supplyFor = $(this).attr("supplyFor");
						if(supplyFor == 2){
							alert("会员专供，请登录");
							return;
						}
						if(saleType == 2){
							addToPreSale($(this).attr("itemRelativeId"),count);
						}else if(saleType == 3){
							addToCycleBuy($(this).attr("itemRelativeId"));
						}else if(saleType == 1){
							addToCart(1,$(this).attr("itemRelativeId"),count,$(this));
						}
					}
				});
				
				$("#cart-btn-top").click(function(){
					if(!$(this).hasClass("btn-normal-disable")){
						if(1 == 2){
							alert("会员专供，请登录");
							return;
						}
						var saleType = 1;
						if(saleType == 2){
							addToPreSale($(this).attr("itemTopId"),1);
						}else if(saleType == 3){
							addToCycleBuy($(this).attr("itemTopId"));
						}else if(saleType == 1){
							addToCart(1,$(this).attr("itemTopId"),1,$(this));
						}
					}
				});
				$(".btn-ssmall-grey").click(function(){
					if($(this).attr("certificateimg")){
						var windowScale = $(window).width()/$(window).height();
						var imgScale = 1147/860;
						var _imgWidth=0,_imgHeight=0;
						if(windowScale<imgScale){
							//window更高
							_imgWidth = $(window).width()-100;
							_imgHeight = _imgWidth/imgScale;
						}else{
							//window
							_imgHeight = $(window).height()-150;
							_imgWidth = _imgHeight*imgScale;
						}
						$("#certificate-window .window-content").html('<img src="'+$(this).attr("certificateimg")+'" style="width:'+_imgWidth+'px;height:'+_imgHeight+'px;max-width:1147px;max-height:860px;"/>');
						$("#certificate-window").window("showwindow");
					}
				});
				//初始化右边
				var rightitems = $(".db-r-listpanel .db-r-listitem");
				var rightitemspanel = $(".db-r-listpanel").css('min-width',rightitems.length*265);
				if(rightitems.length==1){$(".icon-right").addClass("icon-right-disable");}
				$(".db-r-t-icon a").click(function(){
					var currentIndex = rightitemspanel.attr("currentIndex")?rightitemspanel.attr("currentIndex"):0;
					if($(this).hasClass("icon-left")){
						if($(this).hasClass("icon-left-disable"))return;
						$(".icon-right-disable").removeClass("icon-right-disable");
						currentIndex--;
					}else{
						if($(this).hasClass("icon-right-disable"))return;
						$(".icon-left-disable").removeClass("icon-left-disable");
						currentIndex++;
					}
					$(this).parents(".db-r-title").find(".page").html("["+(currentIndex+1)+"/"+rightitems.length+"]");
					rightitemspanel.animate({
						"margin-left": -265*currentIndex
					},200, function() {
					});
					if(currentIndex==rightitems.length-1){
						$(this).addClass("icon-right-disable");
					}
					
					if(currentIndex==0){
						$(this).addClass("icon-left-disable");
					}
					rightitemspanel.attr("currentIndex",currentIndex);
				});
			});// JavaScript Document