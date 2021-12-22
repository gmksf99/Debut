$(function(){
  var beforeEl;
  $("#gnb>li>a").on("mouseover focus",function(){
   if(beforeEl) beforeEl.children("img").attr("src",beforeEl
   .children("img").attr("src").replace("over.png","out.png"));
   $("#gnb ul:visible").slideUp("fast");

   $("img",this).attr("src",$("img",this).attr("src").replace("out.png","over.png"));

   $(this).next().stop().slideDown("normal");
    beforeEl=$(this);
  });
  $("#gnb").on("mouseleave",function(){
     $("#gnb ul:visible").slideUp("fast");

   if(beforeEl) beforeEl.children("img").attr("src",beforeEl
   .children("img").attr("src").replace("over.png","out.png"));
  });
});