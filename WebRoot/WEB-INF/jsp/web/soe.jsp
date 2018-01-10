<!-- <!DOCTYPE html> -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
    <head>
     	<base href="<%=basePath%>"/>
     	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta charset="UTF-8">
        <meta name="keywords" content="私募,私募股权,私募冠军,天使投资,风险投资,股权投资,PEVC,并购基金,乐视体育,顺丰定增,阿里巴巴,聚美优品,雷军,徐小平,孙正义,百万理财,百万资产">
        <meta name="description" content="市场和政策双丰收，股权投资最佳时机！环成金服，您值得信赖的财富管家。">
        <title>环成金服--国企控股</title>
        <link rel="stylesheet" href="static/css/web/soe/SOE-css.css" type="text/css">
        <script src="static/js/web/soe/SOE-js.js"></script>
       
		<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
		<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
        <link rel="Shortcut Icon" href="static/img/web/logo2.ico">
		<%@include file="baidusq.jsp"%>
        <script>
	        $(function(){
	        	$('#soe_succ').click(function(){
	        		$('#soe_pop-by,#soe_pop-mnc,#soe_succ,#cx').css('display','none');
	        	});
				$('#yuyue_submit1').click(function(){
					var name = $('#yuyue_name');
					var val_name=name.val();
					var reg = /^[\u4E00-\u9FA5]{2,5}$/;
					if(!reg.test(val_name.trim())){
						alert("请输入2-5字中文姓名");
						return;
					};
					var phone =$('#yuyue_phone');
					var val_phone=phone.val();
					var reg = /^1\d{10}$/;
					if(!reg.test(val_phone.trim())){
						alert("请输入11位手机号码");
						return;
					};
					$.ajax({
                        url: "web/activityApply",
                        type: "post",
                        data: {
                           "NAME": val_name,
                            "PHONE": val_phone,
                            "SHAREHOLDERSBACKGROUND": '贵州通达投资飞凤湖项目',
                            "INVESTMENTTHRESHOLD": '',
                            "RETURNSBENCHMARK": '',
                            "PRODUCTDEADLINE": '',
                            "TRUSTNAME":''
                        },
                        dataType: "json",
                        success: function(data) {
                          // flag = true;
                           
                            if (data.result == 01) { 
                                $("#reportName").val("");
                                $("#reportMobile").val("");
                                $("#soe_succ").css('display','block');
                                $("#cx").css('display','none');
                            }else{
                             	alert(data.msg);
                            }
                           
                        }
                    });
				});
			})
        </script>
    </head>
    <body>
    	<div class="top">
        	<div class="top_box">
            	<a href="http://www.qhhcjf.com/web/index" target="_blank">
            		<div class="logo">环成金服</div>
            	</a>
            </div>
		</div>

		<div class="banner"></div>

		<div class="conter">
        	<img class="img1" src="static/img/web/soe/2.gif" >
        </div>
        
        <div class="conter">
        	<img class="img1" src="static/img/web/soe/3.gif" >
        </div>
        
        <div class="conter">
        	<img class="img1" src="static/img/web/soe/4.gif" >
        </div>
        
        <div class="conter">
        	<img class="img1" src="static/img/web/soe/5.gif" >
        </div>
        
        <div class="conter">
        	<img class="img1" src="static/img/web/soe/6.gif" >
        </div>
        
        <div class="conter">
        	<img class="img1" src="static/img/web/soe/7.gif" >
        </div>
        
        <div class="conter">
        	<img class="img1" src="static/img/web/soe/8.gif" >
        </div>
        
        <div class="conter">
        	<img class="img1" src="static/img/web/soe/9.jpg" >
        </div>
        
<!--         <div class="conter">
        	<img  class="img1" src="static/img/web/soe/10.gif" >
        </div>
 -->        
        <div class="but-box">
                <button class="PE-btn"></button>
        </div>

       <!--End 正文主体-->
       <div id='soe_pop-by'  class="pop-by"></div>
       	
        <div id='soe_pop-mnc' class="pop-mnc">
        	<div>
      			<img id='soe_succ' style="display: none" src="static/img/web/query/succ.png"/>
      		</div>
            <div class="pop-hide"></div>
            <div id='cx'>
            	<h3 class="pop-tt">预约咨询</h3>
	            <ul class="pop-form">
	                <li class="clearfix relative">
	                    <i class="name-i1">您的姓名：</i>
	                    <input type="hidden" name="yuyue_zhuang_ti" id="yuyue_zhuang_ti" value="软件下载"/>
	                    <input name="yuyue_name" id="yuyue_name" class="pop-inp fl name ipt" placeholder="请输入您的姓名">
	                    <span class="name-tip" id="yuyue_name_tip"></span>
	                </li>
	                <li class="clearfix relative">
	                    <i class="phone-i1">您的手机：</i>
	                    <input name="yuyue_phone" id="yuyue_phone" class="pop-inp fl phone" placeholder="请输入您的电话">
	                    <span class="name-tip" id="yuyue_phone_tip"></span>
	                </li>
	                <li class="clearfix">
	                    <input id="yuyue_submit1" type="button" class="pop-but" >
	                </li>
	            </ul>
	         	
        </div>
		 
         
        <script>
            //弹框
            var popClose = $('.pop-hide');
            function popHide() {
                $('.pop-by,.pop-mnc,.pop-succ,#soe_succ').fadeOut();
            }
            function yuyue() {
                $('.pop-by,.pop-mnc,#cx').fadeIn();
            }
            function succ() {
                $('.pop-mnc').fadeOut();
                $('.pop-by,.pop-succ').fadeIn();
            }

            popClose.click(function() {
                popHide()
            });

            $('.PE-btn').click(function() {
                var product_title = $(this).attr("_title");
                $("#yuyue_zhuang_ti").val(product_title);
                yuyue();
            })
			            
        </script>	
    </body>
    </div><%@include file="bottom.jsp"%>
</html>
