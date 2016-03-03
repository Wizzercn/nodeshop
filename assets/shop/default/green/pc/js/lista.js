    	$('document').ready(function() {
			var num = 0;
			var slidetimer = null;
			var slider = {
					sliderInde:function(){
							
						if(num<0){
						num=$('.ulSmallPicm>li').length-5;
							};
						
						if(num>$('.ulSmallPicm>li').length-1){ num=0};
						$('.ulSmallPicm>li').removeClass('liSelectedm')
					$('.ulSmallPicm>li').eq(num).addClass('liSelectedm')
						$('.ulBigPicm').stop().animate({
							left:-($('.ulBigPicm>li').width()*num)
							},1000);
							if(num<$('.ulSmallPicm>li').length-4||num<=0){
								$('.ulSmallPicm').stop().animate({
									left:-(($('.ulSmallPicm>li').width()+5)*num)
									},1000);
							}
						}
				};
			$('.ulBigPicm').css({width:$('.ulBigPicm>li>a>img').width()*$('.ulBigPicm>li').length});
				$('.ulSmallPicm').css({width:($('.ulSmallPicm>li').width()+30)*$('.ulSmallPicm>li').length});
				$('.ulSmallPicm>li').on('click',function(){
					if(num==$(this).index()){return};
					num = $(this).index();
					slider.sliderInde();
					});
					
				$('.sRightBtnBm').on('click',function(){		//下一张
						num++;
						slider.sliderInde();
					});		
				$('.sLeftBtnBm').on('click',function(){//上一张
					num--;
					if($('.ulSmallPicm>li').length<5){num=$('.ulSmallPicm>li').length};
					slider.sliderInde();
				});
			slidetimer=setInterval(function(){
					num++;
					slider.sliderInde();
				},3000);										//更改时间
			$('.scrolltabm').hover(function(){
					clearInterval(slidetimer);
				},function(){
					slidetimer=setInterval(function(){
					num++;
					slider.sliderInde();
				},3000);									//更改时间
				});	
		});
