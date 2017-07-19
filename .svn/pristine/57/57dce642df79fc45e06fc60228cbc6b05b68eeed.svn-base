  var main_height = document.body.scrollHeight;
      var lunbo_height = main_height/3.6;
      var content_Height = main_height/1.56-7.8;
      var menu_Height = main_height/10.5; 
      var content_title_list = content_Height/4;

		/*alert("全页面"+main_height);   
		alert("轮播图"+lunbo_height); 
		alert("内容"+content_Height); 
		alert("每个条目是多高"+content_title_list);
		alert("底部导航"+menu_Height);    
		alert("最终结果"+(lunbo_height+content_Height+menu_Height));*/
	 document.getElementById('mains').style.height = (main_height+"px");
  document.getElementById('contents').style.height = (content_Height+"px");
 document.getElementById('bottom_menu').style.height = (menu_Height+"px");
 
 
 var list_height = document.getElementsByClassName('content_list');
for(var i=0;i<list_height.length;i++){
		list_height[i].style.height = (content_title_list+"px");
}
	var imgs = document.getElementsByClassName('title_imgs');
	for(var i=0;i<imgs.length;i++){
		imgs[i].style.height = (lunbo_height+"px");
}
