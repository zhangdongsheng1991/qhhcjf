$(function(){
	$("#_type").children().click(function(){
		$(this).addClass("moren");
		$(this).siblings().removeClass("moren");
		var _val = $(this).children().html();
		window.open("web/newsList?typename="+encodeURI(encodeURI(_val,"utf-8"),"utf-8"),"_self");
	})
	
})