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
     	<base href="<%=basePath%>">
     	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta charset="UTF-8">
        <meta name="keywords" content="私募,私募股权,私募冠军,天使投资,风险投资,股权投资,PEVC,并购基金,乐视体育,顺丰定增,阿里巴巴,聚美优品,雷军,徐小平,孙正义,百万理财,百万资产">
        <meta name="description" content="市场和政策双丰收，股权投资最佳时机！环成金服，您值得信赖的财富管家。">
        <title>股权投资虚位以待--环成金服</title>
        
        <script src="static/js/web/wealth/wealth_js.js"></script>
       
        <link rel="stylesheet" type="text/css" href="static/css/web/index.css">
		<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
		<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
		<link rel="stylesheet" href="static/css/web/wealth/wealth_css.css" type="text/css">
         <%@include file="baidusq.jsp"%>
        <script>
	        $(function(){
	        	$('#succ').click(function(){
	        		$('.pop-by,.pop-mnc,#succ').css('display','none');
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
					var consultType;
					if(childval!=4){
						consultType= $('.project-name').eq(childval-1).html();
					}else{
						consultType= '股权投资';					
					}
					$.ajax({
                        url: "web/activityApply",
                        type: "post",
                        data: {
                           "NAME": val_name,
                            "PHONE": val_phone,
                            "SHAREHOLDERSBACKGROUND": consultType,
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
                                $('#zx').css('display','none');
                                $('#succ').css('display','block');
                            }else{
                             alert(data.msg);
                            }
                           
                        }
                    });
					
				});
			})
        </script>
        <link rel="Shortcut Icon" href="static/img/web/logo2.ico">
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
       <div class="content content_1">
        	<div class="biaoti">他们为什么要投资股权？</div>
            
            <div class="PE-example">
            	<img src="static/img/web/wealth/list-1.png" alt="阿里巴巴,聚美优品,YY,孙正义,徐小平,雷军">
            </div>
        </div>
		<div class="content content_2">
        	<div class="biaoti">私募股权究竟是何方神圣？</div>
            
            <div class="what-PE">
            	<img src="static/img/web/wealth/what-PE.png" alt="简称PE，即“私募股权投资”，是指投资于非上市股权，或者上市公司非公开交易股权，通过上市或者并购退出，获得高额收益的一种投资方式。">
            </div>
        
        </div>        
        <div class="content content_3">
        	<div class="biaoti">私募股权如何退出盈利？</div>
            
            <div class="PE-money">
            	<img src="static/img/web/wealth/PE-money.png" alt="IPO退出,并购,股票回购,清算">
            </div>
        </div>
        <div class="content content_4">
        	<div class="biaoti">股权投资真的万众瞩目？</div>
            
            <div class="PE-follow">
            	<img src="static/img/web/wealth//PE-follow.png" alt="根据基金业协会数据显示，截至2016年12月底，私募基金行业认缴规模为10.24万亿，较2015年底增长了5.17万亿，增幅为101.88%，其中股权类私募为主要推动力，2016年私募股权管理规模增加了3.88万亿，增幅达138.48%！"/>
            </div>
            
            <div class="minister-say">
            	<img src="static/img/web/wealth/minister-say.png" alt="3月5日，李克强总理作政府工作报告时提到，要推进资产证券化，加大股权融资力度。早在去年两会上，李克强就提出鼓励股权投资基金的设立，引导股权投资基金良性发展。连续两年两会，“股权投资”均成为万众瞩目的热词。"/>
            
            </div>
           </div>
          <div class="content content_5">
        		<div class="biaoti">股权投资项目有哪些？</div>
            
	            <div class="PE-star">
	                 <img src="static/img/web/wealth/PE-star.png" alt="360,京东金融,滴滴,蚂蚁金服,微众银行,唱吧,淘票票,美团,分众传媒,微影时代,乐视体育,巨人网络"/>
	            </div>
                <button class="PE-star-btn">立即了解咨询</button>

		</div>
		<div class="content content_6">
        	<div class="biaoti">环成金服优选股权项目</div>
			
            <div class="project-box">
            	<div class="project-Frame-1">
                	<div class="project-Frame-2">
                    
                    	<a href="http://www.qhhcjf.com/web/goProductInfo?ID=13d627fbab8f452e81e4cc5df1b5dbfa&PRODUCTTYPE=2" target="_blank" class="project-name" >大白北汽新能源股权投资</a>
                        <div class="project-exp">
                            <p>收益超过10%的部分由管理人收取超额</p>
                            <p>收益中的10%作为管理人业绩报酬</p>
                        </div>
                        <ul class="project-bg">
                        
                            <li class="pro-prv">
                                <p class="pro-bold">5000万</p>
                                <p class="pro-normal">融资规模</p>
                            </li>
                            
                            <li class="pro-mid">
                                <img src="static/img/web/wealth/project-line.png"/>
                            </li>
                            
                            <li class="pro-next">
                                <p class="pro-bold">
                                    2+1<span>年</span>
                                </p>
                                <p class="pro-normal">产品期限</p>
                            </li>
                            
                        </ul>
                        <button class="PE-btn" value="1"> 立即咨询 </button>
                        
                    
                    </div>
                
                </div>
            
            	<div class="project-Frame-1 project-Frame ">
                	<div class="project-Frame-2">
                    	
                        <a href="http://www.qhhcjf.com/web/goProductInfo?ID=b60650eb8b68417fb0ff6e3c25e0bce2&PRODUCTTYPE=2" target="_blank" class="project-name" >360金融:互联网金融</a>
                        <div class="project-exp">
                            <p>基金净值1—1.5（含）之间的超额收</p>
                            <p>益部分，管理人提取20%</p>
                        </div>
                        <ul class="project-bg">
                        
                            <li class="pro-prv">
                                <p class="pro-bold">5000万</p>
                                <p class="pro-normal">融资规模</p>
                            </li>
                            
                            <li class="pro-mid">
                                <img src="static/img/web/wealth/project-line.png"/>
                            </li>
                            
                            <li class="pro-next">
                                <p class="pro-bold">
                                    3+2<span>年</span>
                                </p>
                                <p class="pro-normal">产品期限</p>
                            </li>
                            
                        </ul>
                        <button class="PE-btn" value="2"> 立即咨询 </button>
                        
                    
                    </div>
                
                </div>
            
            
            	<div class="project-Frame-1">
                	<div class="project-Frame-2">
                    	
                        <a href="http://www.qhhcjf.com/web/goProductInfo?ID=57a32923e2644f348fb90d178f9a2172&PRODUCTTYPE=2" target="_blank" class="project-name" >神州优车专项股权投资</a>
                        <div class="project-exp">
                            <p>中国最大的B2C出行共享平台，财务表现出色，</p>
                            <p>盈利能力强；战略股东实力雄厚，退出灵活</p>
                        </div>
                        <ul class="project-bg">
                        
                            <li class="pro-prv">
                                <p class="pro-bold">2625万</p>
                                <p class="pro-normal">融资规模</p>
                            </li>
                            
                            <li class="pro-mid">
                                <img src="static/img/web/wealth/project-line.png"/>
                            </li>
                            
                            <li class="pro-next">
                                <p class="pro-bold">
                                    2+1年<span>年</span>
                                </p>
                                <p class="pro-normal">产品期限</p>
                            </li>
                            
                        </ul>
                        <button class="PE-btn" value='3'> 立即咨询 </button>
                    
                    </div>
                
                </div>
            
            </div>
            
                <p class="PE-tip">风险提示：投资股权基金具有较高风险和较低的流动性，投资人取得的权益并无可公开交易的市场，投资人应为投资目的而认缴基金出资。本基金不对投资人的最低投资收益作任何承诺，亦不保证投资本金可被全部或部分收回。投资人应有充分的资金实力及意愿承担投资风险。在做出投资决定之前，投资人请详阅基金合同。
                </p>
		</div>

       <!--End 正文主体-->
       <div class="pop-by"></div>	
      
        <div class="pop-mnc">
        	<div>
        		<img id='succ' style="display: none" src="static/img/web/query/succ.png"/>
        	</div>
        	<div id='zx'>
            <h3 class="pop-tt">预约咨询</h3>
            <div class="pop-hide" ></div>
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
                    <input id="yuyue_submit1" type="button" class="pop-but" value="立即咨询">
                </li>
            </ul>
            <!-----提交成功------>
	        </div>
        </div>
			
        
        <script>
            //弹框
            var popClose = $('.pop-hide');
            function popHide() {
                $('.pop-by,.pop-mnc,.pop-succ,#zx,#succ').fadeOut();
            }
            function yuyue() {
                $('.pop-by,.pop-mnc,#zx').css('display','block');
            }
            function succ() {
                $('.pop-mnc').fadeOut();
                $('.pop-by,.pop-succ').fadeIn();
            }

          	popClose.click(function() {
                popHide();
            });
			var childval;
            $('.PE-btn').click(function() {
            	childval=$(this).val();
                var product_title = $(this).attr("_title");
                $("#yuyue_zhuang_ti").val(product_title);
                yuyue();
            })
			
			$('.PE-star-btn').click(function() {
				childval=4;
                var product_title = $(this).attr("_title");
                $("#yuyue_zhuang_ti").val(product_title);
                yuyue();
            })
            
        </script>	
       
  <%@include file="bottom.jsp"%>     
    </body>
</html>
