$(window).scroll(function() {
	var top = document.body.scrollTop | document.documentElement.scrollTop;
    if(top>80){
        $("#scrollSearchDiva").stop();
        $("#scrollSearchDiva").animate({"top":"0"});
        $("#scrollSearchDiva").addClass("scoll_add");
         $("#scrollSearchDiva").addClass("head_bg");
       $("#scrollSearchDiva").removeClass("c_hide");
    }
    else{
        $("#scrollSearchDiva").stop();
        $("#scrollSearchDiva").animate({"top":"-90px"});
        $("#scrollSearchDiva").removeClass("scoll_add");
       $("#scrollSearchDiva").removeClass("head_bg");
       $("#scrollSearchDiva").addClass("c_hide");
    }

if(top<3000){
	 $("#nav_c li").children().parents("#nav_ce").addClass("on").siblings().removeClass("on");}
if(top<2200){
	 $("#nav_c li").children().parents("#nav_cd").addClass("on").siblings().removeClass("on");
}
if(top<1500){
	 $("#nav_c li").children().parents("#nav_cc").addClass("on").siblings().removeClass("on");
}
if(top<1050){
	 $("#nav_c li").children().parents("#nav_cb").addClass("on").siblings().removeClass("on");
}
if(top<300){
	 $("#nav_c li").children().parents("#nav_ca").addClass("on").siblings().removeClass("on");
}

if(top<80){
	$("#nav_c li").children().parents("#nav_cm").addClass("on").siblings().removeClass("on");
}




});
