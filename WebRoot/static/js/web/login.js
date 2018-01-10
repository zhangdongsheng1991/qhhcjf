//点击消息后，消息数减1
function minusreading(userid,messageid,productid,producttype){
	$.ajax({
		type:'POST',
		url:"web/minusreading",
		data:{"userid":userid,"messageid":messageid},
		dataType:'json',
		success:function(data){
			if(data.msg=="ok"){
				window.open("web/goProductInfo?ID="+productid+"&PRODUCTTYPE="+producttype);
			}
		}
	});
}


$(function(){
	$("#down1,#list_account").mouseenter(function(event){
		$("#list_account").css("display","block");
		$("#down1").children('img').attr("src","static/img/web/login/up.png");
	}).mouseleave(function(event){
		$("#down1").children('img').attr("src","static/img/web/login/down.png");
		$("#list_account").css("display","none");
		$("#productinfo_ul,#sysinfo_ul").css("display","none");
	});
	
	$('#nav li').hover(function() {
		$('ul', this).slideDown(200);
		$(this).css("background-color","#f7f7f6");
		$(this).children('a:first').addClass("hov");
	}, function() {
		 $('ul', this).slideUp(100);
		 $(this).css("background-color","#FFF");
		 $(this).children('a:first').removeClass("hov");  
	});
	
	$(".login").hover(function(){
		$(this).css("color","#f49703");
	},function(){
		$(this).css("color","#fff");
	});
	
})