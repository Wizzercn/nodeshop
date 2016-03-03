var keyStr = "ABCDEFGHIJKLMNOP" +  
             "QRSTUVWXYZabcdef" +  
             "ghijklmnopqrstuv" +  
             "wxyz0123456789+/" +  
             "=";  
  
function encode64(input) {  
   input = escape(input);  
   var output = "";  
   var chr1, chr2, chr3 = "";  
   var enc1, enc2, enc3, enc4 = "";  
   var i = 0;  
  
   do {  
      chr1 = input.charCodeAt(i++);  
      chr2 = input.charCodeAt(i++);  
      chr3 = input.charCodeAt(i++);  
  
      enc1 = chr1 >> 2;  
      enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);  
      enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);  
      enc4 = chr3 & 63;  
  
      if (isNaN(chr2)) {  
         enc3 = enc4 = 64;  
      } else if (isNaN(chr3)) {  
         enc4 = 64;  
      }  
  
      output = output +   
         keyStr.charAt(enc1) +   
         keyStr.charAt(enc2) +   
         keyStr.charAt(enc3) +   
         keyStr.charAt(enc4);  
      chr1 = chr2 = chr3 = "";  
      enc1 = enc2 = enc3 = enc4 = "";  
   } while (i < input.length);  
  
   return output;  
}  

$(window).load(function() {
	if(isLogin())$("#qiao-wrap").css('cssText', 'display: block !important');
    NProgress.done();
    
});
$("document").ready(function(){
	$.ajaxSetup({cache:false});
	NProgress.start();
	$(this).ajaxStart(function(a,b){
		NProgress.start();
	}).ajaxStop(function(){
		NProgress.done();
	});
	$(".head-menu-placeholder").addClass("notindex-bg");
	//$(".h-m-i-subitem .hover-panel").addClass("column"+$(".h-m-i-subitem .hover-panel .h-m-i-s-column").length);
	//是否启用菜单停靠
	if($(".slidmenu").length>0){
		$(window).scroll(function(){
			if($(this).scrollTop()>$(".head-menu-placeholder").offset().top){
				$("#h-m-content").addClass("fixed");
				$("#h-m-r-menu").fadeIn();
				$("#h-m-r-search").fadeOut();
			}else{
				$("#h-m-content").removeClass("fixed");
				$("#h-m-r-menu").fadeOut();
				$("#h-m-r-search").fadeIn();
			}
		});
	}
	$(window).scroll();
	$("#head-search-input,#head-search-input2").focus(function(){
		$(this).parent().addClass("focus");
	}).blur(function(){
		$(this).parent().removeClass("focus");
	});
	//这个变量防止重复请求购物车
	var cartPanelShow = false;
	$("#show-cartpanel2 .event-view,#show-cartpanel .event-view").hover(function(event){
		var __this = $(this).parent();
		if(cartPanelShow)return;

		if($(__this).find(".h-u-c-msg").length!=0){
			$(__this).find(".h-u-c-msg").html('<img src="'+staticHost+'/img/loading-cart.gif"/>正在加载购物车...');
		}
		
		if($(__this).find("#cart-hover-panel").length==0){
			$("#cart-hover-panel").appendTo($(__this));
		}
		cartPanelShow = true;
		if($("#cart-hover-panel").attr("loading"))return;
		var login = isLogin();
		if(!login){
			getHeadCartDataInCookies();
		}else{
			getHeadCartData();
		}
	},function(){
		cartPanelShow=false;
	});
	$("#show-userpanel2,#show-userpanel").hover(function(){
		$("#user-hover-panel").appendTo($(this));
	},function(){});
	$("#btn-showservice").click(function(){
		var list = $(this).parent().find(".list");
		var height = list.height();
		if(height==0){
			height=list.children().length*63;
			$(this).parent().find(".icon-downarrow").attr("class","icon-uparrow");
		}else{
			height=0;
			$(this).parent().find(".icon-uparrow").attr("class","icon-downarrow");
		}
		list.animate({
			height: height+"px"
		}, 200, function() {});
	});
	//搜索按钮
	$(".btn-search").click(function(){
		var searchVal = $(this).parent().find("input").val();
		if(searchVal!=""){
			document.location.href = '/items/keywords/'+searchVal+'/0';
		}
	});
	
	//搜索按钮回车事件
	$("#head-search-input2,#head-search-input").keypress(function(e){ 
		var curKey = e.which; 
		if(curKey == 13){
			var searchVal = $(this).val();
			if(searchVal!=""){
				document.location.href = '/items/keywords/'+searchVal+'/0';
			}
		}
	});
	
	//我的客服团队
	//createCustomerService();
	//登录之后的头
	initUserPanel();
	//登录之后更新推荐套餐
	updateRecommendCombos();
	$(".lazyload").lazyload({
		threshold:200
	});
	$(".input-box").inputbox();
	if($.support.opacity){
		$(".hover-product").addClass("animate");
	}
	//社区店需要执行的js
	var shopcfg = $.cookie("x-sunyuki-shopcfg");
	if(shopcfg){
		//初始化
		$(".h-u-logo .hover-icon").css("display","block");
		$(".h-m-i-subitem>a,.event-view,.hover-product .link").each(function(){
			if(!$(this).parent().hasClass("hoverpanel-nohover"))
				$(this).attr("_href",$(this).attr("href")).removeAttr("href");
		});
		$(document).bind("contextmenu",function(){
			return false;
		}).bind("selectstart",function(){
			return false;
		});
		$("a").attr("target","_self");
		
		//修改菜单的事件
		var firstLayer,secondLayer;
		window.hover_product;
		$(".h-m-item,.h-u-download,.h-u-cart,.h-u-user,.icon-wechat,.icon-phone,.h-m-r-menupanel>div").click(function(event){
			if($(this).find(".hover-panel").length==0||$(this).hasClass("pad-parent-hoverpanel-hover")){
				if($(this).find(".event-view").attr("_href"))
					document.location.href=$(this).find(".event-view").attr("_href");
			}else{
//				if($(this).attr("id")=="show-userpanel2")document.location.href=$(this).find(".event-view").attr("_href");
//				$(".pad-parent-hoverpanel-hover").removeClass("pad-parent-hoverpanel-hover");
//				$(".pad-hover-product-hover").removeClass("pad-hover-product-hover");
				padHideHover();
				$(this).addClass("pad-parent-hoverpanel-hover");
				firstLayer = $(this);
				//if(secondLayer)secondLayer.removeClass("pad-parent-hoverpanel-hover");
				secondLayer = undefined;
				event.stopPropagation();
			}
		});
		$(".h-u-cart .hover-panel").click(function(event){event.stopPropagation();});
		$(".icon-phone").click(function(){
			var hoverPanel = $(".h-u-download .hover-panel");
			hoverPanel.css("top",-(hoverPanel.height()+80+15)).appendTo($(this).append('<div style="position:absolute;top:-15px;left:0;width:100%;height:20px;"></div>'));
		});
		$(".h-m-i-subitem").click(function(event){
			if($(this).hasClass("pad-parent-hoverpanel-hover")){
				document.location.href = $(this).find(">a").attr("_href");
			}else{
				if(secondLayer)secondLayer.removeClass("pad-parent-hoverpanel-hover");
				if(window.hover_product)window.hover_product.removeClass("pad-hover-product-hover");
				$(this).addClass("pad-parent-hoverpanel-hover");
				secondLayer = $(this);
			}
			event.stopPropagation();
		});
		//下面这段在index.js里也使用了
		$(".hover-product").click(function(event){
			if($(this).hasClass("pad-hover-product-hover")){
				document.location.href=$(this).find(".link").attr("_href");
			}else{
//				if(window.hover_product)window.hover_product.removeClass("pad-hover-product-hover");
//				$(".pad-parent-hoverpanel-hover").removeClass("pad-parent-hoverpanel-hover");
//				$(".pad-hover-product-hover").removeClass("pad-hover-product-hover");
				padHideHover();
				$(this).addClass("pad-hover-product-hover");
				window.hover_product = $(this);
				event.stopPropagation();
			}
		});
		$(document).click(function(){
			padHideHover();
		});
	}else{
		//footer下面的微信hover事件
		$(".icon-phone").hover(function(){
			var hoverPanel = $(".h-u-download .hover-panel");
			hoverPanel.css("top",-(hoverPanel.height()+80+15)).appendTo($(this).append('<div style="position:absolute;top:-15px;left:0;width:100%;height:20px;"></div>'));
		},function(){
			$(this).find('.hover-panel').css("top","49px").appendTo($('.h-u-download'));
			$(this).html("");
		});
	}
	function padHideHover(){
		$(".pad-parent-hoverpanel-hover").removeClass("pad-parent-hoverpanel-hover");
		$(".pad-hover-product-hover").removeClass("pad-hover-product-hover");
		firstLayer = undefined;
		secondLayer = undefined;
		window.hover_product = undefined;
		$('.icon-phone .hover-panel').css("top","49px").appendTo($('.h-u-download'));
		$('.icon-phone .hover-panel').html("");
	}
	$(".window-ticket").each(function(){
		var btn_normal = $(this).find(".btn-normal");
		if(!btn_normal.attr("href")){
			btn_normal.removeAttr("href");
		}
		btn_normal.click(function(){
			$(this).parents(".window").window("hidewindow");
		});
	});
	
	//当前所在地区
	var currentCode = $.cookie('x-sunyuki-cc');
	if(currentCode){
		var currentCodeObj = $(".address-list a[code='"+currentCode+"']");
		$("#current_address").html(currentCodeObj.html()).attr("code",currentCodeObj.attr("code"));
	}
	$(".address-list a").click(function(){
		$.cookie('x-sunyuki-cc-type',2,{
			domain : domain,
			path:"/"
		});

		changeCityCode($(this).attr("code"));
		document.location.reload();
	});
});
function changeCityCode(code){
	var currentCodeObj = $(".address-list a[code='"+code+"']");
	$.cookie('x-sunyuki-cc',code,{
		domain : domain,
		path:"/"
	});
	$("#current_address").html(currentCodeObj.html()).attr("code",currentCodeObj.attr("code"));
}
function initCardName(){
	$(".small-card-name").each(function(){
		if($(this).attr("init"))return;
		var value = $(this).html();
		if(value.length>4){
			var isLongText = false;
			if(value.length>12){
				isLongText = true;
				value=value.substr(0,11);
			}
			var maxCol = value.length/2+value.length%2;
			var firstRow = value.substr(0,maxCol);
			var temp = value.split(firstRow);
			$(this).html(firstRow+temp.join("<br/>")+(isLongText?"...":""));
			$(this).css({
				"font-size":(70/maxCol>16?16:70/maxCol)+"px",
				"line-height":70/maxCol>=18?"22px":"20px",
				"top":70/maxCol>18?"3px":"5px"
			});
			$(this).attr("init",true);
		}
	});
}
function createCustomerService(data){
	var name = ['销售专员','会籍专员','配送专员','客服专员'];
	if(data&&data.length>0){
		var html = [];
		$.each(data,function(){
			html.push(['<div class="h-u-p-serviceitem">',
							'<h2>'+this.serviceName+' '+this.belongUserName+'</h2>',
							'<h3>'+this.description+'</h3>',
							'<span class="phone">'+this.belongUserPhone+'</span>',
						'</div>'].join(""));
		});
		$("#customer-servicepanel .list").html(html.join(""));
	}else{
		$("#customer-servicepanel").css("display","none");
	}
}

function initUserPanel() {
	if(isLogin()){
		//$("#show-userpanel2 .event-view").attr("href",secureHost+"/member");
		//$("#show-cartpanel2 .event-view").attr("href",secureHost+"/cart");
		if($("#user-hover-panel").length!=0||$("#userPanel").length!=0)
		$.ajax({
			url : "/home/my_account.json",
			beforeSend : function(xhr) {
				//xhr.overrideMimeType("text/plain; charset=x-user-defined");
			}
		}).done(function(data) {
			if($("#userPanel").length>0){
				var html = ['<img class="i-i-avatar" src="'+data.avatar+'/80x80" />',
				           '<div class="i-i-u-text">',
				           (data.nickName ? data.nickName : data.name) + '<br /> 本月你为家人买过<span class="font-color1">'+data.orderCount+'</span>次菜<br />',
				           '<a href="' + secureHost + '/member" class="font-color1">进入个人中心</a>', 
				           '</div>'].join("");
				$("#userPanel .i-i-user-top").html(html);
			}
			//$("#show-userpanel .icon,#show-userpanel .h-u-user-icon,#show-userpanel2 .icon,#show-userpanel2 .h-u-user-icon").remove();
			//$("#show-userpanel .event-view,#show-userpanel2 .event-view").prepend('<img class="h-u-user-icon" src="'+data.avatar+'"/>');
			$("#user-hover-panel .user-avatar").html('<img src="'+data.avatar+'/80x80"/>');
			$("#user-hover-panel .user-name").html(data.nickName ? data.nickName : data.name);
			if(data.redPointIndex){
				//TODO  未显示出来
				$("#show-userpanel").append('<span class="red-circle"></span>');
			}
			$("#show-userpanel").css("display",'block');
			createCustomerService(data.memberTeams);
		});
	}else{
		//$("#show-userpanel2 .event-view").attr("href",secureHost+"/login");
		//$("#show-cartpanel2 .event-view").attr("href",secureHost+"/login");
		$("#show-userpanel").addClass('hoverpanel-nohover').html('<a class="event-view" href="' + secureHost + '/login">你好［请登录］</a>');
		$("#userPanel .i-i-user-top").addClass("i-i-userlogin").html([
			'<span class="icon-defaultava"></span>',
			'<div class="i-i-u-text">',
				'<a href="' + secureHost + '/login" class="font-white">立即登录</a>',
			'</div>'].join(""));
		$("#show-userpanel").css("display",'block');
	}
}
function updateRecommendCombos(){
	var shopcfg = $.cookie("x-sunyuki-shopcfg");
	var rcombospanel = $(".gp-b-itempanel");
	if(rcombospanel.length>0){
		$.ajax({
			url: '/home/combos_recommend.json',
			success:function(data){
				var html = [];
				if(data.length!=0){
					$.each(data,function(){
						html.push(['<div class="gp-b-item">',
									'<a href="'+ websiteHost +'/combos/',this.id,'" target="'+(shopcfg?"_self":"_blank")+'">',
										'<img src="',this.img,'/100x100"><span>',this.name,'</span>',
										'<div class="hover-bgmask"></div>',
									'</a>',
									'<span class="price">¥ ',parseFloat(this.finalPrice).toFixed(2),'</span>',
								'</div>'].join(''));
					});
					rcombospanel.html(html.join(''));
					$(".gp-bottom").css("display","block");
				}
			}
		});
	}
}
function isLogin(){
	var authCookie = $.cookie('x-' + cookieKey + '-authtoken');
	if(authCookie!=undefined && authCookie.length>0){
		return true;
	}
	return false;
}
Calendar = {
	getTotalDayForMonth:function(year,month){
		var _year=year,_month=month;
		if(typeof year=="object"){
			_year = year.getFullYear();
			_month = year.getMonth();
		}
		var _date = new Date();
		_date.setYear(_year);
		_date.setMonth(_month+1);
		_date.setDate(0);
		return _date.getDate();
	},
	getWeekForMonthFirstday:function(year,month){
		var _year=year,_month=month;
		if(typeof year=="object"){
			_year = year.getFullYear();
			_month = year.getMonth();
		}
		var _date = new Date();
		_date.setYear(_year);
		_date.setMonth(_month);
		_date.setDate(1);
		return _date.getDay();
	},
	getWeekForMonthLastday:function(year,month){
		var _year=year,_month=month;
		if(typeof year=="object"){
			_year = year.getFullYear();
			_month = year.getMonth();
		}
		_date = new Date();
		_date.setYear(_year);
		_date.setMonth(_month);
		_date.setDate(Calendar.getTotalDayForMonth(year,month));
		return _date.getDay();
	},
	dateStrToDate:function(dateStr){
		var dateStrs = dateStr.split("-");
		var date = new Date();
		if(dateStrs[0]){
			date.setFullYear(dateStrs[0]);
		}
		if(dateStrs[1]){
			date.setMonth(parseInt(dateStrs[1])-1);
		}
		if(dateStrs[2]){
			date.setDate(dateStrs[2]);
		}
		return date;
	},
	getWeekStrWidthDateStr:function(dateStr){
		var weekStrs = ["周日","周一","周二","周三","周四","周五","周六"];
		var dateStrs = dateStr.split("-");
		var date = new Date();
		date.setFullYear(dateStrs[0]);
		date.setMonth(parseInt(dateStrs[1])-1);
		date.setDate(parseInt(dateStrs[2]));
		return weekStrs[date.getDay()];
	}
};
Date.prototype.isSameDay = function(date){
	return this.getFullYear()==date.getFullYear()&&this.getMonth()==date.getMonth()&&this.getDate()==date.getDate();
};
Date.prototype.isMoreThanDate = function(date){
	return this.getFullYear()>=date.getFullYear()&&this.getMonth()>=date.getMonth()&&this.getDate()>date.getDate();
};
Date.prototype.isLessThanDate = function(date){
	return this.getFullYear()<=date.getFullYear()&&this.getMonth()<=date.getMonth()&&this.getDate()<date.getDate();
};
(function($) {
	$.ajax.interval = 800;
	$.ie7 = window.navigator.userAgent.toLowerCase().indexOf("msie 7")>=0;
	$.firefox = window.navigator.userAgent.toLowerCase().indexOf("firefox")>=0;
	$.jsonToString = function(json){
		function parser(json){
			for(var key in json){
				
			}
		}
	}
	$.radiobox = {
		click:function(event){
			if(!$(this).hasClass("disable")&&!$(this).hasClass("radio-box-checked")){
				var checked = $('.radio-box-checked[name="'+$(this).attr("name")+'"]');
				var beforeindex = $('.radio-box[name="'+$(this).attr("name")+'"]').index(checked);
				checked.removeClass("radio-box-checked");
				$(this).addClass("radio-box-checked");
				var index = $('.radio-box[name="'+$(this).attr("name")+'"]').index($(this));
				if($.radiobox[$(this).attr("name")])
					$.radiobox[$(this).attr("name")]($(this),checked,index,beforeindex);
			}
			event.stopPropagation();
		}
	};
	/*
	 * 用来保存changebox的change事件，有name就优先用name保存，无name则用id，无id则创建随即id
	 * 但是如果在用的过程中动态设置了name和id，并且这个id和name和已设change事件的name id一样则会自动增加这个change事件
	 * 这个id和name的在保存过程中唯一，就是之后的change事件会覆盖之前的change事件
	 * ex: $(".checkbox").checkbox("change",function(){console.log(1);});
	 *     $(".checkbox").checkbox("change",function(){console.log(2);});
	 *     只会打印2，未经测试。。。理论上
	 * */
	$.checkbox = {
		click:function(event){
			if(!$(this).hasClass("disable")){
				$(this).toggleClass("check-box-checked");
				var name = $(this).attr("name");
				var id = $(this).attr("id");
				if($.checkbox.changeByName[name]){
					$.checkbox.changeByName[name].call(this,$(this).hasClass("check-box-checked"));
				}else if($.checkbox.changeById[id]){
					$.checkbox.changeById[id].call(this,$(this).hasClass("check-box-checked"));
				}
//				if(this.change)
//					this.change($(this).hasClass("check-box-checked"));
			}
			event.stopPropagation();
		},
		changeByName:{},
		changeById:{}
	};
	$.selectbox = {
		changeevent:{}
	};
	$.numberbox2 = {
		changeevent:{}
	};
	$.getId = function(){
		return parseInt(Math.random()*100000);
	};
	$.fn.extend({
		syk_opacity_fadeIn:function(time,fun){
			if($.support.opacity){
				this.fadeIn(time,fun);
			}else{
				this.show();
				if(typeof time=="function"){
					time.call(this);
				}
				if(fun)fun.call(this);
			}
		},
		syk_opacity_fadeOut:function(time,fun){
			if($.support.opacity){
				this.fadeOut(time,fun);
			}else{
				this.hide();
				if(typeof time=="function"){
					time.call(this);
				}
				if(fun)fun.call(this);
			}
		},
		pager:function() {
			//alert(arguments);
			var startIndex = parseInt(this.attr("startIndex"));
			var limit = parseInt(this.attr("limit"));
			var startPage = parseInt(startIndex/limit);
			var totalSize = parseInt(this.attr("totalSize"));
			totalSize = totalSize==0?1:totalSize;
			var totalPage = parseInt(totalSize/limit)+(totalSize%limit>0?1:0);
			var html = ['<a class="previous '+(startIndex==0?"disable":"")+'">上一页</a><div>'];
			var leftSize = 0;
			var showLast = false;
			if(totalPage>9){
				showLast = true;
				if(startPage>4){
					leftSize = startPage-4;
				}
				if(totalPage-1-startPage<=4){
					leftSize = leftSize-(5-(totalPage-startPage));
					showLast = false;
				}
			}
			if(leftSize>0){
				html.push('<a class="first">...</a>');
			}
			for(var i=0;i<(totalPage>9?9:totalPage);i++){
				html.push('<a '+(leftSize+i==startPage?'class="current"':'')+'>'+(leftSize+i+1)+'</a>');
			}
			html.push('</div>');
			if(showLast){
				html.push('<a class="last">...</a>');
			}
			html.push('<a class="next '+(startIndex==(totalPage-1)*limit?"disable":"")+'">下一页</a>');
			this.html(html.join(""));
			this.find("a").click(function(){
				var parent = $(this).parents(".paging");
				var _limit = parseInt(parent.attr("limit"));
				if($(this).hasClass("disable"))return;
				if($(this).hasClass("previous")){
					window[parent.attr("navEvent")](parseInt(parent.attr("startIndex"))-_limit,parent.attr("limit"),parent.attr("totalSize"));
				}else if($(this).hasClass("next")){
					window[parent.attr("navEvent")](parseInt(parent.attr("startIndex"))+_limit,parent.attr("limit"),parent.attr("totalSize"));
				}else if($(this).hasClass("first")){
					window[parent.attr("navEvent")](0,parent.attr("limit"),parent.attr("totalSize"));
				}else if($(this).hasClass("last")){
					window[parent.attr("navEvent")]((totalPage-1)*_limit,parent.attr("limit"),parent.attr("totalSize"));
				}else{
					window[parent.attr("navEvent")]((parseInt($(this).html())-1)*_limit,parent.attr("limit"),parent.attr("totalSize"));
				}
			});
			this.value = function(){
				
			};
		},
		/*
		 * 初始化:$(".select-box").selectbox();
		 * 设置:$(".select-box").selectbox("value","1");//优先考虑item的value属性，没找到value属性再找item的文本，都没找到的情况下为空字符串。类似html的select标签
		 * 获取:$(".select-box").selectbox("value");//优先返回选择item的value属性，没有则返回文本
		 * */
		selectbox:function(key,value){
			this.each(function(i){
				if(!$(this).attr("init")){
					//添加滚动条
					var itembox = $(this).find(".sb-item-box");
					
					itembox.html(['<div class="sb-item-top"><span class="left"></span><span class="right"></span></div>',
					              '<div class="sb-item-bottom"><span class="left"></span><span class="right"></span></div>',
					              '<div class="sb-item-content" style="height:'+itembox.find('.sb-item').length*40+'px;">',
					              	'<div class="sb-item-c-box">',
										itembox.html(),
										'</div>',
									'</div>'].join(""));
					var childrencount = itembox.find(".sb-item-c-box").children().length;
					itembox.css("height",((childrencount>10?10:childrencount)*40+6)+"px");
					if(childrencount>10){
						itembox.append('<div class="sb-scroller"><span></span></div>');
						if($.firefox){
							itembox.bind("DOMMouseScroll",mousewheel);
						}else{
							itembox.bind("mousewheel",mousewheel);
						}
						itembox.find(".sb-scroller span").mousedown(function(event){
							$.selectbox.movescroll = true;
							$.selectbox.clientY = event.clientY;
							$.selectbox.offsetY = parseInt($(this).css("top"));
							$.selectbox.offsetY = isNaN($.selectbox.offsetY)?0:$.selectbox.offsetY;
							$(document).bind("selectstart",function(){
								return false;
							});
						})
						itembox.find(".sb-scroller").mousedown(function(event){
						});
					}
					
					this.onselectstart = function(){return false;}
					window.currentSelectbox;
					$(this).find(".sb-text").click(function(event){
						if(window.currentSelectbox)window.currentSelectbox.removeClass("sb-active");
						var currentSB = $(this).parents(".select-box");
						currentSB.addClass("sb-active");
						window.currentSelectbox = currentSB;
						event.stopPropagation();
					});
					$(this).on("click",".sb-item",function(event){
						var sbbox = $(this).parents(".select-box");
						if(sbbox.hasClass("sb-active"))
							event.stopPropagation();
						sbbox.find(".sb-textnode").html($(this).text());
						if($(this).attr("value"))
							sbbox.find(".sb-textnode").attr("value",$(this).attr("value"));
						else
							sbbox.find(".sb-textnode").removeAttr("value");
						sbbox.removeClass("sb-active");
						window.currentSelectbox = undefined;
//						alert($.selectbox.changeevent[sbbox.attr("id")]+"--"+sbbox.attr("id"));
						if(parseInt(sbbox.attr("selectedindex"))!=$(this).index()&&$.selectbox.changeevent[sbbox.attr("id")]){
							$.selectbox.changeevent[sbbox.attr("id")](sbbox.selectbox("value"),sbbox);
						}
						sbbox.attr("selectedindex",$(this).index());
					});
					$(this).attr("init",true);
				}
			});
			if(!$.selectbox.bindedEvent){
				$.selectbox.bindedEvent = true;
				$(document).mousemove(function(event){
					if(window.currentSelectbox&&$.selectbox.movescroll){
						var scrollerbtn = window.currentSelectbox.find(".sb-scroller span");
						if(scrollerbtn.length>0){
							var itemcontent = window.currentSelectbox.find(".sb-item-c-box");
							var top = $.selectbox.offsetY+(event.clientY-$.selectbox.clientY);
							if(top<=0){
								top=0;
							}else if(top>=338){
								top=338;
							}
							var itemcontentTop = -(itemcontent.height()-400)*top/338;
							scrollerbtn.css("top",top);
							itemcontent.css("top",itemcontentTop);
						}
					}
				}).mouseup(function(){
					$(document).unbind("selectstart");
					
					if(window.currentSelectbox){
						if($.selectbox.movescroll){
							$.selectbox.movescroll = false;
						}else{
							window.currentSelectbox.removeClass("sb-active");
							window.currentSelectbox = undefined;	
						}
					}
				});
			}
			function mousewheel(e){
				var itemcontent = $(this).find(".sb-item-c-box");
				var maxScrollY = parseInt(itemcontent.height()) - 400;
				var isUp,base,baseSize=40;
				if($.firefox){
					isUp = e.originalEvent.detail<0;
					base = -e.originalEvent.detail/3;
				}else{
					isUp = e.originalEvent.wheelDelta>0;
					base = e.originalEvent.wheelDelta/120;
				}
				if(isUp){//deltaY
					//if(parseInt(itemcontent.css("top"))>=0)return true;
					if(parseInt(itemcontent.css("top"))+base*baseSize>0){
						itemcontent.css("top",0);
					}else{
						itemcontent.css("top",parseInt(itemcontent.css("top"))+base*baseSize);
					}
				}else{
					//if(parseInt(itemcontent.css("top"))<=-maxScrollY)return true;
					
					if(parseInt(itemcontent.css("top"))+base*baseSize<=-maxScrollY){
						itemcontent.css("top",-maxScrollY);
					}else{
						itemcontent.css("top",parseInt(itemcontent.css("top"))+base*baseSize);	
					}
				}
				var scrollerbtn = $(this).find(".sb-scroller span");
				scrollerbtn.css('top',(-parseInt(itemcontent.css('top'))/maxScrollY)*(404-scrollerbtn.height()));
				return false;
			}
			var __this = this;
			this.value = function(_key,_value){
				if(_value!=undefined){
					var citem = __this.find(".sb-item[value='"+_value+"']");
					if(citem.length==0){
						__this.find(".sb-item").each(function(i){
							if($(this).text()==_value){
								citem = $(this);
								return false;
							}
						});
					}
					__this.find(".sb-textnode").html(citem.length==0?_value:citem.text());
					if(citem.attr("value"))
						__this.find(".sb-textnode").attr("value",citem.attr("value"));
					else
						__this.find(".sb-textnode").removeAttr("value");
				}else{
					if(__this.find('.sb-textnode').attr("value"))
						return __this.find('.sb-textnode').attr("value");
					else
						return __this.find('.sb-textnode').text();
				}
			};
			this.textvalue = function(){
				return $.trim(__this.find('.sb-textnode').text());
			};
			this.change = function(_key,_value){
				__this.each(function(i){
					var id = $(this).attr("id");
					if(_value){
						if(!id)id = $.getId();
						$(this).attr("id",id);
						$.selectbox.changeevent[id] = _value;
					}else{
						if($.selectbox.changeevent[id])$.selectbox.changeevent[id]($(this).selectbox("value"),$(this));
					}
				});
			};
			this.appenditems = function(_key,_value){
				var itemcbox = __this.find(".sb-item-c-box");
				var itembox = __this.find(".sb-item-box");
				var scroll = __this.find(".sb-scroller");
				var html = [];
				$.each(_value,function(){
					html.push('<span class="sb-item" value="'+this.value+'">'+this.text+'<span class="right"></span></span>');
				});
				itemcbox.css("top","0").append(html.join(""));
				var parentitembox = $(this).find(".sb-item-box");
				var childrencount = $(this).find(".sb-item-c-box").children().length;
				scroll.find('a').css('top',0);
				if(childrencount>10){
					if(scroll.length==0)
						itembox.append('<div class="sb-scroller"><span></span></div>');
					itembox.unbind("mousewheel",mousewheel).bind("mousewheel",mousewheel);
				}else{
					itembox.unbind("mousewheel");
					scroll.remove();
				}
				parentitembox.css("height",((childrencount>10?10:childrencount)*40+6)+"px");
				$(this).find(".sb-item-content").css("height",((childrencount>10?10:childrencount)*40)+"px");
			};
			this.applyitems = function(_key,_value){
				__this.find(".sb-item-c-box").html("");
				__this.appenditems(_key, _value);
			};
			if(this[key]){
				var r = this[key](key,value);
				value = undefined;
				return r;	
			}
		},
		window:function(mname,value){
			//$("body").css("overflow","hidden");
			var d_width = $(window).width();
			var d_height = $(document).height();
			var w_height = $(window).height();
			var id = this.attr("id");
			var __this = this;
			if(!id){
				id = "w"+$.getId();
				this.attr("id",id);
			}
			if($("#mask"+id).length==0){
				$('<div style="width:'+d_width+'px;height:'+d_height+'px;" class="window-mask" id="mask'+id+'"></div>').appendTo("body").click(function(){
					if(value)return;
					__this.hidewindow();
				});
			}
			if(value==undefined){
				if(this.find(".window-close").length==0)
				$('<span class="window-close"></span>').appendTo(this).click(function(){
					__this.hidewindow();
				});
			}else{
				if(typeof value!="function")
					this.find(".window-close").remove();
			}
			if(value>1){
				setTimeout(function(){
					__this.hidewindow();
				},value);
			}
			this.hidewindow = function(){
				__this.syk_opacity_fadeOut(200);
				$("#mask"+__this.attr("id")).syk_opacity_fadeOut(200);
				if($.windowCloseEvent&&$.windowCloseEvent[__this.attr("id")])$.windowCloseEvent[__this.attr("id")]();
			}
			this.showwindow = function(){
				__this.css({
					left:(d_width-__this.width())/2,
					top:(w_height-__this.height())/2
				});
				__this.syk_opacity_fadeIn(200);
				$("#mask"+__this.attr("id")).syk_opacity_fadeIn(200);	
			}
			this.onclose = function(_key,_value){
				if(!$.windowCloseEvent)$.windowCloseEvent = {};
				$.windowCloseEvent[__this.attr("id")] = _value;
			};
			if(this[mname])
				this[mname](mname,value);
		},
		
		radiobox:function(key,value){
			var __this = this;
			this.each(function(){
				if(key=="change"){
					$.radiobox[$(this).attr("name")] = value;
				}
				if(!$(this).attr("init")){
					var selected = $(this).attr("selected")?$(this).attr("selected"):this.selected;//ie取值用this.checked
					if(selected||$(this).hasClass("radio-box-checked")){
						var checked = $(".radio-box-checked[name='"+$(this).attr("name")+"']").removeClass("radio-box-checked");
						var current = $(this).addClass("radio-box-checked");
						$(this).removeAttr("selected");
						if($.radiobox[$(this).attr("name")])
							$.radiobox[$(this).attr("name")](current,checked);
					}
					$(this).attr("init",true);
				}
			});
			this.change = function(_key,_value){
				for(var i=0;i<__this.length;i++){
					$.radiobox[$(__this[i]).attr("name")] = _value;
				}
			};
			this.checked = function(_key,_value){
				$(__this[_value]).click();
			};
			this["value-object"] = function(){
				var checked = $('.radio-box-checked[name="'+$(__this).attr("name")+'"]');
				if(checked.length==0)return undefined;
				return checked;
			};
			this["value-index"] = function(){
				var checked = $('.radio-box-checked[name="'+$(__this).attr("name")+'"]');
				return $('.radio-box[name="'+$(__this).attr("name")+'"]').index(checked);
			};
			this.unbind("click",$.radiobox.click).bind("click",$.radiobox.click);
			if(this[key])
				return this[key](key,value);
		},
		checkbox:function(key,value){
			this.each(function(i){
				if(!$(this).attr("init")){
					var checked = $(this).attr("checked")?$(this).attr("checked"):this.checked;//ie取值用this.checked
					if(checked){
						$(this).addClass("check-box-checked");
					}
					$(this).bind("click",$.checkbox.click);
					$(this).attr("init",true);
				}
			});
			var __this = this;
			this.value = function(_key,_value){
				if(_value!=undefined){
					if(value){
						this.addClass("check-box-checked");
					}else{
						this.removeClass("check-box-checked");
					}
				}else{
					return this.hasClass("check-box-checked");
				}
			};
			/*
			 * 增加这个的意义在于购物车里面点全选就不需要触发产品checkbox的change，触发展品的change事件会立马发n个请求
			 * 这里只需要改变显示状态，为什么只需要只改变显示状态，因为何川说立马给用户反馈会造成比较好的体验，做个标记。。。
			 * 再由于周期购订单需要这个东西，反正一抹多的需求
			 * setValueAndDispatchChange慎用 可能会造成死循环
			 **/
			this.setValueAndDispatchChange = function(_key,_value){
				if(_value!=undefined){
					this.each(function(){
						var needDispatchChange = false;
						if(_value){
							if(!$(this).hasClass("check-box-checked")){
								$(this).addClass("check-box-checked");
								needDispatchChange = true;
							}
						}else{
							if($(this).hasClass("check-box-checked")){
								$(this).removeClass("check-box-checked");
								needDispatchChange = true;
							}
						}
						if(needDispatchChange){
							var name = $(this).attr("name");
							var id = $(this).attr("id");
							if($.checkbox.changeByName[name]){
								$.checkbox.changeByName[name].call(this,$(this).hasClass("check-box-checked"));
							}else if($.checkbox.changeById[id]){
								$.checkbox.changeById[id].call(this,$(this).hasClass("check-box-checked"));
							}
						}
					});
				}else{
					return this.hasClass("check-box-checked");
				}
			}
			this.change = function(_key,_value){
				__this.each(function(){
					if($(this).attr("name")){
						$.checkbox.changeByName[$(this).attr("name")] = _value;
					}else if($(this).attr("id")){
						$.checkbox.changeById[$(this).attr("id")] = _value;
					}else{
						var id = $.getId();
						$(this).attr("id",id);
						$.checkbox.changeById[id] = _value;
					}
				});
			};
			this["value-object"] = function(){
				var result = [];
				__this.each(function(){
					if($(this).hasClass("check-box-checked")){
						result.push($(this));
					}
				});
				return result;
			};
			if(this[key])
				return this[key](key,value);
		},
		numberbox:function(key,value){
//			<span class="nb-content">1</span>
//			<span class="nb-add"></span><span class="nb-reduce"></span>
			this.each(function(i){
				if(!$(this).attr("init")){
					if($(this).attr("min")!=undefined&&parseInt($(this).find('.nb-content').html())==parseInt($(this).attr('min'))){
						$(this).find('.nb-reduce').addClass("nb-reduce-disable");
					}
					this.onselectstart = function(){return false;}
					$(this).find('.nb-content').html(parseInt($(this).find('.nb-content').html())+$(this).attr("unit"));
					$(this).find('.nb-reduce').click(function(){
						if($(this).hasClass("nb-reduce-disable"))return;
						var nbbox = $(this).parent();
						var min = nbbox.attr("min")==undefined?0:parseInt(nbbox.attr("min"));
						var cnumber = parseInt(nbbox.find(".nb-content").html());
						if(cnumber>0){
							nbbox.find(".nb-content").html((cnumber-1)+nbbox.attr("unit"));
						}
						if(cnumber==1+min){
							$(this).addClass("nb-reduce-disable");
						}
					});
					$(this).find('.nb-add').click(function(){
						var nbbox = $(this).parent();
						var cnumber = parseInt(nbbox.find(".nb-content").html());
						nbbox.find(".nb-content").html((cnumber+1)+nbbox.attr("unit"));
						nbbox.find(".nb-reduce-disable").removeClass("nb-reduce-disable");
					});
					$(this).attr("init",true);
				}
			});
			var __this = this;
			this.value = function(_key,_value){
				if(_value!=undefined&&!isNaN(parseInt(_value))){
					__this.find(".nb-content").html(_value+__this.attr("unit"));
				}else{
					return parseInt(__this.find(".nb-content").html());
				}
			};
			if(this[key])return this[key](key,value);
		},
		/*
		 * 初始化: $(".number-box2").numberbox2();
		 * 取值: $("#number1").numberbox2("value");
		 * 赋值: $("#number1").numberbox2("value",123);
		 * */
		numberbox2:function(key,value){
			this.each(function(){
				if(!$(this).attr("init")){
					var left = $(this).find('.nb2-left');
					var text = $(this).find('.nb2-text');
					var right = $(this).find('.nb2-right');
					text.html(parseInt(text.html())+($(this).attr("unit")?$(this).attr("unit"):""));
					this.onselectstart = function(){return false;}
					if(parseInt(text.html())<=parseInt($(this).attr("min"))||parseInt(text.html())==0)left.addClass("nb2-left-disable");
					left.unbind("click").click(function(){
						var nbbox = $(this).parent();
						var unit = nbbox.attr("unit");
						unit = unit?unit:"";
						if($(this).hasClass("nb2-left-disable")||nbbox.hasClass("disable"))return;
						
						var v = $(this).parent().find(".nb2-text");
						var value = parseInt(v.html());
						if(value>0){
							v.html((value-1)+unit);
						}
						if($.numberbox2.changeevent[nbbox.attr("id")]){
							if($.numberbox2.changeevent[nbbox.attr("id")](nbbox,-1)){
								v.html(value);
							}
						}
						if(value-1<=parseInt(nbbox.attr("min"))||v.html()=="0")$(this).addClass("nb2-left-disable");
					});
					right.unbind("click").click(function(){
						var nbbox = $(this).parent();

						var unit = nbbox.attr("unit");
						unit = unit?unit:"";
						
						if($(this).hasClass("nb2-right-disable")||nbbox.hasClass("disable"))return;
						var v = nbbox.find(".nb2-text");
						var value = parseInt(v.html());
						v.html((value+1)+unit);
						if($.numberbox2.changeevent[nbbox.attr("id")]){
							if($.numberbox2.changeevent[nbbox.attr("id")](nbbox,1)){
								v.html(value);
							}
						}
						nbbox.find('.nb2-left-disable').removeClass("nb2-left-disable");
						if(nbbox.attr("max")){
							if(value+1>=parseInt(nbbox.attr("max"))){
								$(this).addClass("nb2-right-disable");
							}
						}
					});
					$(this).attr("init",true);
				}
			});
			var __this = this;
			this.value = function(_key,_value){
				if(_value!=undefined){
					var unit = __this.attr("unit");
					__this.find(".nb2-text").html(_value+(unit?unit:""));
					var min = __this.attr("min")?__this.attr("min"):0;
					if(_value<=min){
						__this.find(".nb2-left").addClass("nb2-left-disable");
					}else{
						__this.find(".nb2-left").removeClass("nb2-left-disable");
					}
				}else{
					var value = parseInt(__this.find(".nb2-text").html());
					if(isNaN(value))return 0;
					else return value;
				}
			};
			this.change = function(_key,_value){
				__this.each(function(){
					var id = $(this).attr("id");
					if(!id){
						id = $.getId();
						$(this).attr("id",id);
					}
					$.numberbox2.changeevent[id] = _value;
				});
			};
			this.max = function(){
				__this.attr("max",value);
				__this.each(function(){
					if(parseInt($(this).find(".nb2-text").html())>=value){
						$(this).find(".nb2-right").addClass("nb2-right-disable");
					}
				});
			};
			this["disable-left"] = function(){
				__this.find(".nb2-left").addClass("nb2-left-disable");
			};
			this["remove-disable-left"] = function(){
				__this.find(".nb2-left-disable").removeClass("nb2-left-disable");
			};
			this["disable-right"] = function(){
				__this.find(".nb2-right").addClass("nb2-right-disable");
			};
			this["remove-disable-right"] = function(){
				__this.find(".nb2-right-disable").removeClass("nb2-right-disable");
			};
			if(this[key])
				return this[key](key,value);
		},
		validate:function(){
			this.find(".input-box input").blur();
			return !this.find(".input-box").hasClass("ib-error");
		},
		inputbox:function(key,value){
			this.each(function(){
				if(!$(this).attr("init")){
					var input = $(this).find("input[type!='hidden']");
					input.focus(function(){
						if(!$(this).parents(".input-box").hasClass("disable"))
						$(this).parents(".input-box").addClass("ib-focus");
					}).blur(function(){
						if(!$(this).parents(".input-box").hasClass("disable"))
						$(this).parents(".input-box").removeClass("ib-focus");
						var inputbox = $(this).parents(".input-box");
						var val = $.trim($(this).val());
						if(inputbox.attr("required")){
							if(val==""){
								inputbox.inputbox("error",inputbox.attr("reqmsg"));
								return;
							}else{
								inputbox.removeClass("ib-error");
							}
						}
						if(inputbox.attr("minLength")){
							if(val.length<6){
								inputbox.inputbox("error",inputbox.attr("mlmsg"));
								return;
							}else{
								inputbox.removeClass("ib-error");
							}
						}
						if(inputbox.attr("validate")){
							var re = eval(inputbox.attr("validate"));
							if(re.test(val)){
								inputbox.removeClass("ib-error");
							}else{
								inputbox.inputbox("error",inputbox.attr("errormsg"));
							}
						}
					});
					var id = $(this).attr("id");
					if(!id){
						id=$.getId();
						$(this).attr("id",id);
					}
					if($("#pl"+id).length==0&&!("placeholder" in document.createElement("input"))){
						$('<span id="pl'+id+'" style="display:'+(input.val()==""?"block":"none")+'" class="ib-placeholder"></span>').appendTo($(this).find(".ib-input")).html($(this).find("input").attr("placeholder"));
						input.keyup(function(){
							if($(this).val()!=""){
								$(this).parent().find(".ib-placeholder").css("display","none");
							}else{
								$(this).parent().find(".ib-placeholder").css("display","block");
							}
						});
						input.bind("cut paste",function(e){
							var __this = this;
							setTimeout(function(){
								if($(__this).val()!=""){
									$(__this).parent().find(".ib-placeholder").css("display","none");
								}else{
									$(__this).parent().find(".ib-placeholder").css("display","block");
								}
							},0);
						});
					}
				}
				$(this).attr("init",true);
			});
			var __this = this;
			this.error = function(_key,_value){
				if($(this).find(".ib-msg").length==0)
					$(this).append('<div class="ib-msg"></div><div class="ib-msgright"></div>');
				__this.find(".ib-msg").html(_value);
				__this.addClass("ib-error");
			};
			if(this[key])
				return this[key](key,value);
		},
		textareabox:function(key,value){
			this.each(function(){
				if(!$(this).attr("init")){
					var textarea = $(this).find("textarea");
					textarea.focus(function(){
						$(this).parent().addClass("tab-focus");
					}).blur(function(){
						$(this).parent().removeClass("tab-focus");
					}).css({
						"max-width":$(this).width(),
						"max-height":$(this).height()
					});

					if($(this).find(".tab-placeholder").length==0&&!("placeholder" in document.createElement("textarea"))){
						$('<span class="tab-placeholder">'+textarea.attr("placeholder")+'</span>').appendTo($(this));
						textarea.keyup(function(){
							if($(this).val()!=""){
								$(this).parent().find(".tab-placeholder").css("display","none");
							}else{
								$(this).parent().find(".tab-placeholder").css("display","block");
							}
						});
					}
					$(this).attr("init",true);
				}
			});
			if(this[key])
				return this[key](key,value);
		}
	});
})(jQuery);

/*json转换*/
if (typeof JSON !== 'object') {
    JSON = {};
}
(function () {
    'use strict';
    function f(n) {
        return n < 10 ? '0' + n : n;
    }
    if (typeof Date.prototype.toJSON !== 'function') {
        Date.prototype.toJSON = function () {
            return isFinite(this.valueOf())
                ? this.getUTCFullYear()     + '-' +
                    f(this.getUTCMonth() + 1) + '-' +
                    f(this.getUTCDate())      + 'T' +
                    f(this.getUTCHours())     + ':' +
                    f(this.getUTCMinutes())   + ':' +
                    f(this.getUTCSeconds())   + 'Z'
                : null;
        };
        String.prototype.toJSON      =
            Number.prototype.toJSON  =
            Boolean.prototype.toJSON = function () {
                return this.valueOf();
            };
    }

    var cx,
        escapable,
        gap,
        indent,
        meta,
        rep;


    function quote(string) {

        escapable.lastIndex = 0;
        return escapable.test(string) ? '"' + string.replace(escapable, function (a) {
            var c = meta[a];
            return typeof c === 'string'
                ? c
                : '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
        }) + '"' : '"' + string + '"';
    }


    function str(key, holder) {
        var i,          // The loop counter.
            k,          // The member key.
            v,          // The member value.
            length,
            mind = gap,
            partial,
            value = holder[key];
        if (value && typeof value === 'object' &&
                typeof value.toJSON === 'function') {
            value = value.toJSON(key);
        }

        if (typeof rep === 'function') {
            value = rep.call(holder, key, value);
        }

        switch (typeof value) {
        case 'string':
            return quote(value);

        case 'number':
            return isFinite(value) ? String(value) : 'null';

        case 'boolean':
        case 'null':

            return String(value);


        case 'object':

            if (!value) {
                return 'null';
            }

            gap += indent;
            partial = [];

            if (Object.prototype.toString.apply(value) === '[object Array]') {

                length = value.length;
                for (i = 0; i < length; i += 1) {
                    partial[i] = str(i, value) || 'null';
                }

                v = partial.length === 0
                    ? '[]'
                    : gap
                    ? '[\n' + gap + partial.join(',\n' + gap) + '\n' + mind + ']'
                    : '[' + partial.join(',') + ']';
                gap = mind;
                return v;
            }


            if (rep && typeof rep === 'object') {
                length = rep.length;
                for (i = 0; i < length; i += 1) {
                    if (typeof rep[i] === 'string') {
                        k = rep[i];
                        v = str(k, value);
                        if (v) {
                            partial.push(quote(k) + (gap ? ': ' : ':') + v);
                        }
                    }
                }
            } else {

// Otherwise, iterate through all of the keys in the object.

                for (k in value) {
                    if (Object.prototype.hasOwnProperty.call(value, k)) {
                        v = str(k, value);
                        if (v) {
                            partial.push(quote(k) + (gap ? ': ' : ':') + v);
                        }
                    }
                }
            }

// Join all of the member texts together, separated with commas,
// and wrap them in braces.

            v = partial.length === 0
                ? '{}'
                : gap
                ? '{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}'
                : '{' + partial.join(',') + '}';
            gap = mind;
            return v;
        }
    }

// If the JSON object does not yet have a stringify method, give it one.

    if (typeof JSON.stringify !== 'function') {
        escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
        meta = {    // table of character substitutions
            '\b': '\\b',
            '\t': '\\t',
            '\n': '\\n',
            '\f': '\\f',
            '\r': '\\r',
            '"' : '\\"',
            '\\': '\\\\'
        };
        JSON.stringify = function (value, replacer, space) {

            var i;
            gap = '';
            indent = '';

            if (typeof space === 'number') {
                for (i = 0; i < space; i += 1) {
                    indent += ' ';
                }

            } else if (typeof space === 'string') {
                indent = space;
            }

            rep = replacer;
            if (replacer && typeof replacer !== 'function' &&
                    (typeof replacer !== 'object' ||
                    typeof replacer.length !== 'number')) {
                throw new Error('JSON.stringify');
            }

            return str('', {'': value});
        };
    }

    if (typeof JSON.parse !== 'function') {
        cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
        JSON.parse = function (text, reviver) {

            var j;

            function walk(holder, key) {

                var k, v, value = holder[key];
                if (value && typeof value === 'object') {
                    for (k in value) {
                        if (Object.prototype.hasOwnProperty.call(value, k)) {
                            v = walk(value, k);
                            if (v !== undefined) {
                                value[k] = v;
                            } else {
                                delete value[k];
                            }
                        }
                    }
                }
                return reviver.call(holder, key, value);
            }

            text = String(text);
            cx.lastIndex = 0;
            if (cx.test(text)) {
                text = text.replace(cx, function (a) {
                    return '\\u' +
                        ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
                });
            }

            if (/^[\],:{}\s]*$/
                    .test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@')
                        .replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']')
                        .replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
                j = eval('(' + text + ')');

                return typeof reviver === 'function'
                    ? walk({'': j}, '')
                    : j;
            }

            throw new SyntaxError('JSON.parse');
        };
    }
}());

/* NProgress, (c) 2013, 2014 Rico Sta. Cruz - http://ricostacruz.com/nprogress
 * @license MIT */

(function(root, factory) {

if (typeof define === 'function' && define.amd) {
  define(factory);
  } else if (typeof exports === 'object') {
    module.exports = factory();
  } else {
    root.NProgress = factory();
  }

})(this, function() {
  var NProgress = {};

  NProgress.version = '0.1.6';

  var Settings = NProgress.settings = {
    minimum: 0.08,
    easing: 'ease',
    positionUsing: '',
    speed: 200,
    trickle: true,
    trickleRate: 0.02,
    trickleSpeed: 800,
    showSpinner: true,
    barSelector: '[role="bar"]',
    spinnerSelector: '[role="spinner"]',
    parent: 'body',
    template: '<div class="bar" role="bar"><div class="peg"></div></div><div class="spinner" role="spinner"><div class="spinner-icon"></div></div>'
  };

  /**
   * Updates configuration.
   *
   *     NProgress.configure({
   *       minimum: 0.1
   *     });
   */
  NProgress.configure = function(options) {
    var key, value;
    for (key in options) {
      value = options[key];
      if (value !== undefined && options.hasOwnProperty(key)) Settings[key] = value;
    }

    return this;
  };

  /**
   * Last number.
   */

  NProgress.status = null;

  /**
   * Sets the progress bar status, where `n` is a number from `0.0` to `1.0`.
   *
   *     NProgress.set(0.4);
   *     NProgress.set(1.0);
   */

  NProgress.set = function(n) {
    var started = NProgress.isStarted();

    n = clamp(n, Settings.minimum, 1);
    NProgress.status = (n === 1 ? null : n);

    var progress = NProgress.render(!started),
        bar      = progress.querySelector(Settings.barSelector),
        speed    = Settings.speed,
        ease     = Settings.easing;

    progress.offsetWidth; /* Repaint */

    queue(function(next) {
      // Set positionUsing if it hasn't already been set
      if (Settings.positionUsing === '') Settings.positionUsing = NProgress.getPositioningCSS();

      // Add transition
      css(bar, barPositionCSS(n, speed, ease));

      if (n === 1) {
        // Fade out
        css(progress, { 
          transition: 'none', 
          opacity: 1 
        });
        progress.offsetWidth; /* Repaint */

        setTimeout(function() {
          css(progress, { 
            transition: 'all ' + speed + 'ms linear', 
            opacity: 0 
          });
          setTimeout(function() {
            NProgress.remove();
            next();
          }, speed);
        }, speed);
      } else {
        setTimeout(next, speed);
      }
    });

    return this;
  };

NProgress.isStarted = function() {
    return typeof NProgress.status === 'number';
};

  /**
   * Shows the progress bar.
   * This is the same as setting the status to 0%, except that it doesn't go backwards.
   *
   *     NProgress.start();
   *
   */
NProgress.start = function() {
	if($.ie7)return;
    if (!NProgress.status) NProgress.set(0);

    var work = function() {
      setTimeout(function() {
        if (!NProgress.status) return;
        NProgress.trickle();
        work();
      }, Settings.trickleSpeed);
    };

    if (Settings.trickle) work();

    return this;
  };

  /**
   * Hides the progress bar.
   * This is the *sort of* the same as setting the status to 100%, with the
   * difference being `done()` makes some placebo effect of some realistic motion.
   *
   *     NProgress.done();
   *
   * If `true` is passed, it will show the progress bar even if its hidden.
   *
   *     NProgress.done(true);
   */

  NProgress.done = function(force) {
	if($.ie7)return;
    if (!force && !NProgress.status) return this;

    return NProgress.inc(0.3 + 0.5 * Math.random()).set(1);
  };

  /**
   * Increments by a random amount.
   */

  NProgress.inc = function(amount) {
    var n = NProgress.status;

    if (!n) {
      return NProgress.start();
    } else {
      if (typeof amount !== 'number') {
        amount = (1 - n) * clamp(Math.random() * n, 0.1, 0.95);
      }

      n = clamp(n + amount, 0, 0.994);
      return NProgress.set(n);
    }
  };

  NProgress.trickle = function() {
    return NProgress.inc(Math.random() * Settings.trickleRate);
  };

  /**
   * Waits for all supplied jQuery promises and
   * increases the progress as the promises resolve.
   * 
   * @param $promise jQUery Promise
   */
  (function() {
    var initial = 0, current = 0;
    
    NProgress.promise = function($promise) {
      if (!$promise || $promise.state() == "resolved") {
        return this;
      }
      
      if (current == 0) {
        NProgress.start();
      }
      
      initial++;
      current++;
      
      $promise.always(function() {
        current--;
        if (current == 0) {
            initial = 0;
            NProgress.done();
        } else {
            NProgress.set((initial - current) / initial);
        }
      });
      
      return this;
    };
    
  })();

  /**
   * (Internal) renders the progress bar markup based on the `template`
   * setting.
   */

  NProgress.render = function(fromStart) {
    if (NProgress.isRendered()) return document.getElementById('nprogress');

    addClass(document.documentElement, 'nprogress-busy');
    
    var progress = document.createElement('div');
    progress.id = 'nprogress';
    progress.innerHTML = Settings.template;

    var bar      = progress.querySelector(Settings.barSelector),
        perc     = fromStart ? '-100' : toBarPerc(NProgress.status || 0),
        parent   = document.querySelector(Settings.parent),
        spinner;

    css(bar, {
      transition: 'all 0 linear',
      transform: 'translate3d(' + perc + '%,0,0)'
    });

    if (!Settings.showSpinner) {
      spinner = progress.querySelector(Settings.spinnerSelector);
      spinner && removeElement(spinner);
    }

    if (parent != document.body) {
      addClass(parent, 'nprogress-custom-parent');
    }

    parent.appendChild(progress);
    return progress;
  };

  /**
   * Removes the element. Opposite of render().
   */

  NProgress.remove = function() {
    removeClass(document.documentElement, 'nprogress-busy');
    removeClass(document.querySelector(Settings.parent), 'nprogress-custom-parent')
    var progress = document.getElementById('nprogress');
    progress && removeElement(progress);
  };

  /**
   * Checks if the progress bar is rendered.
   */

  NProgress.isRendered = function() {
    return !!document.getElementById('nprogress');
  };

  /**
   * Determine which positioning CSS rule to use.
   */

  NProgress.getPositioningCSS = function() {
    // Sniff on document.body.style
    var bodyStyle = document.body.style;

    // Sniff prefixes
    var vendorPrefix = ('WebkitTransform' in bodyStyle) ? 'Webkit' :
                       ('MozTransform' in bodyStyle) ? 'Moz' :
                       ('msTransform' in bodyStyle) ? 'ms' :
                       ('OTransform' in bodyStyle) ? 'O' : '';

    if (vendorPrefix + 'Perspective' in bodyStyle) {
      // Modern browsers with 3D support, e.g. Webkit, IE10
      return 'translate3d';
    } else if (vendorPrefix + 'Transform' in bodyStyle) {
      // Browsers without 3D support, e.g. IE9
      return 'translate';
    } else {
      // Browsers without translate() support, e.g. IE7-8
      return 'margin';
    }
  };

  /**
   * Helpers
   */

  function clamp(n, min, max) {
    if (n < min) return min;
    if (n > max) return max;
    return n;
  }

  /**
   * (Internal) converts a percentage (`0..1`) to a bar translateX
   * percentage (`-100%..0%`).
   */

  function toBarPerc(n) {
    return (-1 + n) * 100;
  }


  /**
   * (Internal) returns the correct CSS for changing the bar's
   * position given an n percentage, and speed and ease from Settings
   */

  function barPositionCSS(n, speed, ease) {
    var barCSS;

    if (Settings.positionUsing === 'translate3d') {
      barCSS = { transform: 'translate3d('+toBarPerc(n)+'%,0,0)' };
    } else if (Settings.positionUsing === 'translate') {
      barCSS = { transform: 'translate('+toBarPerc(n)+'%,0)' };
    } else {
      barCSS = { 'margin-left': toBarPerc(n)+'%' };
    }

    barCSS.transition = 'all '+speed+'ms '+ease;

    return barCSS;
  }

  /**
   * (Internal) Queues a function to be executed.
   */

  var queue = (function() {
    var pending = [];
    
    function next() {
      var fn = pending.shift();
      if (fn) {
        fn(next);
      }
    }

    return function(fn) {
      pending.push(fn);
      if (pending.length == 1) next();
    };
  })();

  /**
   * (Internal) Applies css properties to an element, similar to the jQuery 
   * css method.
   *
   * While this helper does assist with vendor prefixed property names, it 
   * does not perform any manipulation of values prior to setting styles.
   */

  var css = (function() {
    var cssPrefixes = [ 'Webkit', 'O', 'Moz', 'ms' ],
        cssProps    = {};

    function camelCase(string) {
      return string.replace(/^-ms-/, 'ms-').replace(/-([\da-z])/gi, function(match, letter) {
        return letter.toUpperCase();
      });
    }

    function getVendorProp(name) {
      var style = document.body.style;
      if (name in style) return name;

      var i = cssPrefixes.length,
          capName = name.charAt(0).toUpperCase() + name.slice(1),
          vendorName;
      while (i--) {
        vendorName = cssPrefixes[i] + capName;
        if (vendorName in style) return vendorName;
      }

      return name;
    }

    function getStyleProp(name) {
      name = camelCase(name);
      return cssProps[name] || (cssProps[name] = getVendorProp(name));
    }

    function applyCss(element, prop, value) {
      prop = getStyleProp(prop);
      element.style[prop] = value;
    }

    return function(element, properties) {
      var args = arguments,
          prop, 
          value;

      if (args.length == 2) {
        for (prop in properties) {
          value = properties[prop];
          if (value !== undefined && properties.hasOwnProperty(prop)) applyCss(element, prop, value);
        }
      } else {
        applyCss(element, args[1], args[2]);
      }
    }
  })();

  /**
   * (Internal) Determines if an element or space separated list of class names contains a class name.
   */

  function hasClass(element, name) {
    var list = typeof element == 'string' ? element : classList(element);
    return list.indexOf(' ' + name + ' ') >= 0;
  }

  /**
   * (Internal) Adds a class to an element.
   */

  function addClass(element, name) {
    var oldList = classList(element),
        newList = oldList + name;

    if (hasClass(oldList, name)) return; 

    // Trim the opening space.
    element.className = newList.substring(1);
  }

  /**
   * (Internal) Removes a class from an element.
   */

  function removeClass(element, name) {
    var oldList = classList(element),
        newList;

    if (!hasClass(element, name)) return;

    // Replace the class name.
    newList = oldList.replace(' ' + name + ' ', ' ');

    // Trim the opening and closing spaces.
    element.className = newList.substring(1, newList.length - 1);
  }

  /**
   * (Internal) Gets a space separated list of the class names on the element. 
   * The list is wrapped with a single space on each end to facilitate finding 
   * matches within the list.
   */

  function classList(element) {
    return (' ' + (element.className || '') + ' ').replace(/\s+/gi, ' ');
  }

  /**
   * (Internal) Removes an element from the DOM.
   */

  function removeElement(element) {
    element && element.parentNode && element.parentNode.removeChild(element);
  }

  return NProgress;
});
