
$(function(){
	var TRUSTNAME="";
	var SHAREHOLDERSBACKGROUND="";
	$('.Choice_1 li').click(function(){
		$(this).addClass('default').siblings().removeClass('default');
	})
	
	$('.but_1').click(function(){
		 TRUSTNAME = $(this).parent().children().eq(0).html().substr(0,4);
		 SHAREHOLDERSBACKGROUND = "产品咨询";
         $('.opt,.openWindow').show();
	})
	
	
	$('.but_2').click(function(){
		 SHAREHOLDERSBACKGROUND = "收益查询";
         $('.opt,.openWindow').show();
	})
	
	$('.but_4').click(function(){
		TRUSTNAME = $(this).parent().parent().prev().children().eq(0).html(); 
		SHAREHOLDERSBACKGROUND = "火爆产品推荐";
        $('.opt,.openWindow').show();
	})
	
	 $('.openWindow button').click(function() {
		 var data = {};
		 if(SHAREHOLDERSBACKGROUND == "收益查询"){
			 data.SHAREHOLDERSBACKGROUND="收益查询";
	         data.INVESTMENTTHRESHOLD = $("#INVESTMENTTHRESHOLD .default").html();
	         data.PRODUCTDEADLINE = $("#PRODUCTDEADLINE .default").html();
	         data.RETURNSBENCHMARK = $("#RETURNSBENCHMARK .default").html();
	         data.PAYINTERESTWAY = $("#PAYINTERESTWAY .default").html();
	         data.INVESTMENTFIELD = $("#INVESTMENTFIELD .default").html();
		 }else if(SHAREHOLDERSBACKGROUND == "产品咨询"){
			 data.SHAREHOLDERSBACKGROUND="产品咨询";
			 data.TRUSTNAME = TRUSTNAME;
		 }else{
			 data.SHAREHOLDERSBACKGROUND="火爆产品推荐";
			 data.TRUSTNAME = TRUSTNAME;
		 }
         var NAME = $("#name").val();
         var PHONE = $("#mobile").val();
         var nameReg = /^[\u4e00-\u9fa5]+$/;
         var mobileReg = /^[1-9][0-9]{10}$/;
         if (!NAME || NAME.trim() == "" || NAME.trim().length < 2) {
             alert("请输入2-5字中文姓名");
             return;
         }
         if (!nameReg.test(NAME.trim())) {
             alert("请输入中文姓名");
             return;
         }
         if (!PHONE || PHONE.trim() == "") {
             alert("手机号不能为空");
             return;
         }
         if (!mobileReg.test(PHONE.trim())) {
             alert("请输入正确的手机号码");
             return;
         }
         data.NAME = NAME;
         data.PHONE = PHONE;
         $.ajax({
             url: "web/submitConsult",
             type: "post",
             data: data,
             dataType: "json",
             success: function(data) {
                 $("#name").val("");
                 $("#mobile").val("");
                 $('.opt,.openWindow').hide();
                 $('.tijiao-ok').show();
             }
         });
     });
});






















