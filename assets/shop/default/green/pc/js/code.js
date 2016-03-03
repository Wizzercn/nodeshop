// iframe 弹出层

var code = {
	show : function(width, height, url, title){
		var w = width || 500;
		var h = height || 300;
		var u = url || "#";
		var t = title || "";
		
		var wh = $("body").height() < $(window).height() ? $(window).height() : $("body").height();
		//var wt = ($(window).height()-h)/2 + $(window).scrollTop();
		var wt = ($(window).height()-h)/2;
		var wl = ($(window).width()-w)/2;
		
		var d = '';
		d += '<div id="code" style="height:'+wh+'px"><div class="code_bg" style="height:'+wh+'px"></div>';
		d += '<div class="code_show" style="width:'+w+'px;height:'+h+'px;top:'+wt+'px;left:'+wl+'px;position:fixed;_position:absolute;_bottom:auto;_top:expression(eval(document.documentElement.scrollTop+(document.documentElement.clientHeight-this.offsetHeight)/2));">';
		
		d += '<div class="code_title">';
		if(t.length > 0){
			d += '<strong>'+ t +'</strong>';
		}
		d += '<span onclick="code.exit()" class="exit">X</span></div>';
		
		if(t.length > 0){
			h = h-30;
		}
		d += '<div class="code_data" style="height:'+(h-30)+'px;"><iframe style="height:'+h+'px;" src="'+ u +'" width="100%" height="266" scrolling="no" frameborder="0"></iframe></div>';
		d += '</div>'
		d += '</div>'
		$("body").append(d);
	},
	exit : function(){
		$("#code").remove();
	}
}


// iframe 弹出层

var code1 = {
	show : function(width, height, url, title){
		var w = width || 500;
		var h = height || 300;
		var u = url || "#";
		var t = title || "";
		
		var wh = $("body").height() < $(window).height() ? $(window).height() : $("body").height();
		//var wt = ($(window).height()-h)/2 + $(window).scrollTop();
		var wt = ($(window).height()-h)/2;
		var wl = ($(window).width()-w)/2;
		
		var d = '';
		d += '<div id="code1" style="height:'+wh+'px"><div class="code1_bg" style="height:'+wh+'px"></div>';
		d += '<div class="code1_show" style="width:'+w+'px;height:'+h+'px;top:'+wt+'px;left:'+wl+'px;position:fixed;_position:absolute;_bottom:auto;_top:expression(eval(document.documentElement.scrollTop+(document.documentElement.clientHeight-this.offsetHeight)/2));">';
		
		d += '<div class="code1_title">';
		if(t.length > 0){
			d += '<strong>'+ t +'</strong>';
		}
		d += '<span onclick="code1.exit()" class="exit">X</span></div>';
		
		if(t.length > 0){
			h = h-30;
		}
		d += '<div class="code1_data" style="height:'+(h-30)+'px;"><iframe style="height:'+h+'px;" src="'+ u +'" width="100%" height="266" scrolling="no" frameborder="0"></iframe></div>';
		d += '</div>'
		d += '</div>'
		$("body").append(d);
	},
	exit : function(){
		$("#code11").remove();
	}
}// JavaScript Document