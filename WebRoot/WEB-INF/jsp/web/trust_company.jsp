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
        <meta name='keywords' content='信托，信托公司，信托产品'/>
        <meta name='description' content='盘点实力信托公司，坐享6%-13%预期收益·迄今100%到期兑付'/>
        <title>环成金服盘点实力信托公</title>
        <script src="static/js/web/trust_company/trust_company.js"></script>
       
        <link rel="stylesheet" type="text/css" href="static/css/web/index.css">
		<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
		<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
		<link rel="stylesheet" href="static/css/web/trust_company/trust_company.css" type="text/css">
		<link rel="Shortcut Icon" href="static/img/web/logo2.ico">
         <%@include file="baidusq.jsp"%>
        <script>
        	
	        $(function(){
	        	$('#succ').click(function(){
	        		$('#trust_company_pop-by,#trust_company_pop-mnc,#succ,#zx').css('display','none');
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
					var consultType = a_value;
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
                
                <ul class="trust_list1">
                	<li><a class="daohang" href="http://www.qhhcjf.com/web/trust" target="_blank">信托</a></li>
                    <li><a class="daohang" href="http://www.qhhcjf.com/web/mislist" target="_blank">资管</a></li>
                    <li><a class="daohang" href="http://www.qhhcjf.com/web/covenant" target="_blank">契约型</a></li>
                    <li><a class="daohang" href="http://www.qhhcjf.com/web/privateEquitylist" target="_blank">股权投资</a></li>
                    <li><a class="daohang" href="http://www.qhhcjf.com/web/index" target="_blank">首页</a></li>
                </ul>
            </div>
		</div>

		<div class="banner"></div>

		<div class="Lead">
        	<h3>导语</h3>
            <p>根据中国信托业协会发布的最新数据，截至2017年1季度末，全国68家信托公司管理的信托资产规模为21.97万亿元（平均每家信托公司3230.43亿元），同比增长32.48%，环比增长8.65%。这意味着，信托业正式步入“22万亿时代”。</p>
        </div>


		<div class="tiaoxuan"></div>


		<div class="biaoti1"></div>

		<div class="xintuochanping">
        	<div class="Company_title">
            	<img class="tubiao" src="/static/img/web/truts_company/guangda.png" title="光大信托" alt="光大信托" />
            </div>
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=a1ee3d24f422429c8e99b4d8e41072b0&PRODUCTTYPE=0" target="_blank">润泽金汇5号</a></div>
                <div class="con_2">
                	<div class="con_2_1">8.1%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">24个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">3000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=5e50fc9f2a004da2b65eb06eae56e308&PRODUCTTYPE=0" target="_blank">千山并购</a></div>
                <div class="con_2">
                	<div class="con_2_1">7.3%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">12个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">3000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=6de910d019384e3a93a2187e3af7ad72&PRODUCTTYPE=0" target="_blank">金阳光2号</a></div>
                <div class="con_2">
                	<div class="con_2_1">9.5%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">24个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">4000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=ef72428bcbd34527bc6ef06355a87fb6&PRODUCTTYPE=0" target="_blank">龙腾川渝3号</a></div>
                <div class="con_2">
                	<div class="con_2_1">10%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">24个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">5000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
        </div>
        
        		<div class="xintuochanping">
        	<div class="Company_title">
            	<img class="tubiao" src="/static/img/web/truts_company/zhongrong.png" title="中融信托" alt="中融信托" />
            </div>
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=2ce6098c466e4873ae6d9393984f5654&PRODUCTTYPE=1" target="_blank">兴创60号第二期</a></div>
                <div class="con_2">
                	<div class="con_2_1">7.6%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">18个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">4000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=8cc3613d8502413db5633733603af14c&PRODUCTTYPE=1" target="_blank">融雅35号</a></div>
                <div class="con_2">
                	<div class="con_2_1">10.5%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">12个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">5000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=68118a1a83794c7294405ee70defbcae&PRODUCTTYPE=1" target="_blank">立泽1号</a></div>
                <div class="con_2">
                	<div class="con_2_1">7.2%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">12个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">4000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=b2ddb3aece0f4986a02dcbdfe8df9af5&PRODUCTTYPE=1" target="_blank">融盈安泰38号</a></div>
                <div class="con_2">
                	<div class="con_2_1">7.4%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">300.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">24个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">4000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
        </div>
        
        
        		<div class="xintuochanping">
        	<div class="Company_title">
            	<img class="tubiao" src="/static/img/web/truts_company/zhongxin.png" title="中信信托" alt="中信信托" />
            </div>
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=074472f122144e10b3e2272e7ba4f1a2&PRODUCTTYPE=1" target="_blank">民生34号</a></div>
                <div class="con_2">
                	<div class="con_2_1">7.0%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">24个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">4000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=867659b2102747b9b0a5c524696432bc&PRODUCTTYPE=1" target="_blank">民生16号</a></div>
                <div class="con_2">
                	<div class="con_2_1">9.0%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">24个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">5000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=f87454df517f4330b1dcf38f52775499&PRODUCTTYPE=1" target="_blank">中信佳源</a></div>
                <div class="con_2">
                	<div class="con_2_1">9.8%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">26至24个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">5000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
            <div class="xintuochanping_kuang" onmouseover="this.style.backgroundColor='#f9f9f9'"  onmouseout="this.style.backgroundColor='#FFFFFF'">
            	<div class="con_1"><a href="/web/goProductInfo?ID=6521ce6512154abbaf94cfcbf1fb4005&PRODUCTTYPE=1" target="_blank">创悦武安工创</a></div>
                <div class="con_2">
                	<div class="con_2_1">6.2%</div>
                    <div class="con_2_2">预计年化收益</div>
                </div>
                <div class="con_3">
                	<div class="con_3_1">
                    	<span class="touzi1">投资起点： </span>
                        <span class="touzi2">100.00万</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">投资期限： </span>
                        <span class="touzi2">24个月</span>
                    </div>
                    <div class="con_3_1">
                    	<span class="touzi1">返现金额： </span>
                        <span class="touzi2">3000元</span>
                    </div>
                </div>
                
                <button class="PE-btn"> 立即咨询 </button>
                
            </div>
            
            
        </div>
        



       
              <!--End 正文主体-->
       <div id='trust_company_pop-by' class="pop-by"></div>
        <div id='trust_company_pop-mnc' class="pop-mnc">
        	<div>
      			<img id='succ' style="display: none" src="static/img/web/query/succ.png"/>
      		</div>
            
            <div class="pop-hide"></div>
            <ul id="zx" class="pop-form">
            	<h3 class="pop-tt">预约咨询</h3>
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
                    <input id="yuyue_submit1" type="button" class="pop-but" value="立即咨询" >
                </li>
            </ul>
        </div>

        
        
        <script>
            //弹框
            var popClose = $('.pop-hide');
            function popHide() {
                $('.pop-by,#trust_company_pop-mnc,.pop-succ,#succ').fadeOut();
            }
            function yuyue() {
                $('.pop-by,#trust_company_pop-mnc,#zx').fadeIn();
            }
            function succ() {
                $('#trust_company_pop-mnc').fadeOut();
                $('.pop-by,.pop-succ').fadeIn();
            }

            popClose.click(function() {
                popHide()
            });
			
            var a_value;
            $('.PE-btn').click(function() {
            	var $parent = $(this).parent();
            	var $firstDiv = $parent.children(":first");
            	var a_obj = $firstDiv.children(":first");
            	a_value = a_obj.html();
                var product_title = $(this).attr("_title");
                $("#yuyue_zhuang_ti").val(product_title);
                yuyue();
            })
			 
			 
			 //鼠标划过
	//		 $('.xintuochanping_kuang').hover(function(){
//				 	.css('background','#ccc' )
//			     },function(){
//				 
//				 })
			 
			 
			            
        </script>
        



<%@include file="bottom.jsp"%>  

</body>
</html>