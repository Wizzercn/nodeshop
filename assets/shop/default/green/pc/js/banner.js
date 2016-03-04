/**
 * Created by root on 3/3/16.
 */
$(function(){
  $("#h-m-content .c_shop").mouseover(function(){
    $(this).children(".nav_li").removeClass("c_hide");
    $(this).children().children(".icon_san").removeClass("c_hide");
    $(this).mouseout(function(){
      $(this).children(".nav_li").addClass("c_hide");
      $(this).children().children(".icon_san").addClass("c_hide");
    });
  });
});
