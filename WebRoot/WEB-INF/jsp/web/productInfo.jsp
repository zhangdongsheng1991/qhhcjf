<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">	
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta charset="utf-8">
<link rel="Shortcut Icon" href="static/img/web/logo2.ico"> 
<title>${var.PRODUCTREFERRED }_${pd.LOCATIONTWO }_环成金服</title>

<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
<link rel="stylesheet" type="text/css" href="static/css/web/trust.css">
<link rel="stylesheet" type="text/css" href="static/css/web/trustProductDetail.css">
    <script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="static/js/web/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="static/js/web/owl.carousel.min.js" type="text/javascript"></script>
    <script src="static/js/web/gjf_index.js" type="text/javascript"></script>
   <%@include file="baidusq.jsp"%>
</head>

<body style=" background-color:#fcfcfc;">
  	<script type="text/javascript">
        //  频道tab切换控制
        registerChannelEvent('channel-orange');
        registerChannelEvent('channel-blue');
    </script>
    <%@include file="head.jsp"%>
     <div id="container" style="border: none; background: none;">
<!-- 当前位置 -->
    <div id="common_currentlocation" class=" clearb">
        <div id="ctl00_ContentPlaceHolder1_Location_common_currentlocation_list" class=" w1200 mauto h48 lh48 fs14 c666666">
        	<div class=" fl">当前位置：</div>
            <div class=" fl ml10"><a href="web/index">首页</a></div>
            <div class=" fl ml10">&gt;</div>
			<%-- <div class=" fl ml10"><a>${pd.LOCATION }</a></div> --%>
			<div class=" fl ml10"><a href="${pd.LOCATIONTWOURL }">${pd.LOCATIONTWO }</a></div>
			<div class=" fl ml10">&gt;</div><div class=" fl ml10"><a href="javascript:{location.reload();}">>${var.PRODUCTREFERRED }</a></div>
		</div>
    </div>
    
    <!-- 复制的内容 -->
    <script>
	    function jsCopy(){ 
	        var e=document.getElementById("content");//对象是content
	        e.style.display ='block';        
	        e.select(); //选择对象 
	        document.execCommand("Copy"); //执行浏览器复制命令
	        e.style.display ='none';
	       	alert("复制成功!"); 
	    } 
    </script>
    <textarea style="display:none" id="content">
    	【发行机构】${var.THEISSUERNAME }
    	【产品名称】${var.PRODUCTREFERRED }
    	【收益基准】${var.RETURNSBENCHMARK }
    	【产品期限】${var.PRODUCTDEADLINE }
    	【大小配比】严格匹配
    	【预计发行规模】${var.EXPECTISSUANCE }
    	【最低认购金额】${var.INVESTMENTSTARTING }
    	【产品点评】${var.PRODUCTREVIEWS }
    	【产品详情】
   ${tem_DETAILS }
    </textarea>
    <div class=" h10 clearb">
        </div>
        <div>
            <div class=" w1200 mauto">
                <!-- 左侧 -->
                <div class=" fl">
               
                	<!-- 产品简介 -->
                    <div class=" w920">
                        <div id="ctl00_ContentPlaceHolder1_trust_productdetail_sketch_server" class="trust_productdetail_sketch pl20 pr20 w878 ">
                        <div class=" h100 lh54 bbsdedede">
							<div class=" h32"></div>
							<div>
								<div class=" fl h40 ml5 mt6"><img src="${var.THEISSUERIMGURL }" width="40" height="40" border="0"></div>
								<div class="trust_productdetail_sketch_title h54 fl ml10 fs24 fwb">${var.PRODUCTREFERRED }</div>
							</div>
						</div>
                        
                        <div class=" w640 h85 ml120 mt15 bgf6f6f6 clearb">
                        <div class=" fl w640 h85">
                        <div class=" fl w640 h85">
                            <div class=" fl w210 h85 brddedede">
                            <div class=" tac fs16 h36 lh36 c999999">收益基准</div>
                            <div class=" tac fs28 h48 lh48 fwb cff6c00">${var.RETURNSBENCHMARKMAX }<span class=" fs18 ml5"></span></div>
                            </div>
                            <div class=" fl w210 h85 brddedede">
                            <div class=" tac fs16 h36 lh36 c999999">投资起点</div>
                            <div class=" tac fs28 h48 lh48 fwb cff6c00">${var.INVESTMENTSTARTING }<span class=" fs18 ml5"></span></div>
                            </div>
                            <div class=" fl w210 h85">
                            <div class=" tac fs16 h36 lh36 c999999">产品期限</div>
                            <div class=" tac fs28 h48 lh48 fwb cff6c00">${var.PRODUCTDEADLINE }<span class=" fs18 ml5"></span></div>
                            </div>
                        </div>
                        </div>
                        </div>
                        <div class=" fs14 clearb">
                            <div class=" h20"></div>
                            <div class=" ml40 h24 lh24 c999999">产品点评：</div>
                            <div class=" ml40  lh32 c666666">${var.PRODUCTREVIEWS }</div>
                        </div>
                        </div>
                    </div>
                     
                    <div class=" h15 clearb">
                    </div>
                    
                    <div class="trust_companydetail_intro w920">
                        <!-- 产品简介 -->
                        <div class="bbs0068ff h36">
                           <div class=" fl h36 lh36 c3a8eff fs24 fwb">
                                基本信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            <div id="ctl00_ContentPlaceHolder1_trust_productdetail_ztjs_server" class=" fl">
                                
                            </div>
                        </div>
                        <div id="ctl00_ContentPlaceHolder1_trust_productdetail_intro_server" class=" clearb w920"><table class="trust_companydetail_table w920 fs14 c999999" cellpadding="0" cellspacing="0">
<tbody><tr>
<td class=" bgfafafa"><div class=" tar mr20">产品全称：</div></td>
<td class=" bgffffff c666666" colspan="3"><a  onclick="jsCopy()" style="
width: 130px; 
height: 30px;
float: right;
margin-top: 15px;
cursor:pointer;
background:url('static/img/web/copy.png') no-repeat;"></a><div class=" tal ml40">${var.PRODUCTNAME }</div></td>
</tr>
<tr>
<td width="18%" class=" bgfafafa"><div class=" tar mr20">发行机构：</div></td>
<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${var.THEISSUERNAME }</div></td>
<td width="18%" class=" bgfafafa"><div class=" tar mr20">预计发行规模：</div></td>
<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${var.EXPECTISSUANCE }</div></td>
</tr>
<tr>
<td width="18%" class=" bgfafafa"><div class=" tar mr20">最低认购金额：</div></td>
<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${var.INVESTMENTSTARTING }</div></td>
<td width="18%" class=" bgfafafa"><div class=" tar mr20">利息分配：</div></td>
<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${var.TINTERESTDISTRIBUTIONSTATENAME }</div></td>
</tr>
<tr>
<td width="18%" class=" bgfafafa"><div class=" tar mr20">产品期限：</div></td>
<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${var.PRODUCTDEADLINE }</div></td>
<td width="18%" class=" bgfafafa"><div class=" tar mr20">信托类型：</div></td>
<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${var.TRUSTTYPENAME }</div></td>
</tr>
<tr>
<td width="18%" class=" bgfafafa"><div class=" tar mr20">收益基准：</div></td>
<td width="32%" class=" bgffffff c666666"><div class=" tal ml40 lh28"><p>
	${var.RETURNSBENCHMARK }
</p></div></td>
<td width="18%" class=" bgfafafa"><div class=" tar mr20">产品状态：</div></td>
<td width="32%" class=" bgffffff c666666"><div class=" tal ml40"><span class="cff6c00">${var.PRODUCTSTATUSNAME }</span></div></td>
</tr>
</tbody></table>
</div>
	<div class=" h15 clearb"></div>
	<div class=" fl h36 lh36 c3a8eff fs24 fwb">产品详情</div>
	
	<div id="ctl00_ContentPlaceHolder1_trust_productdetail_content_server" style="background: #fff;margin-top: 50px; border: 1px solid #ccc;border-top:1px solid #f49703; padding: 20px;line-height: 30px;font-size:18px">
		
		<!-- <div class=" pl20 pr20 bbsdedede">
			<div class=" h10"></div>
			
		</div> -->
		${var.DETAILS }
	</div>
                        <div class="h20"></div>
                       
                      
                    </div>
                </div>
                
                 <!-- 右侧 -->
                <div class=" fr">
                    <div class=" w270">
                        <!-- 产品预约 -->
			<div class=" bg29a2e9">
                            <div class=" h10">
                            </div>
                            <div class=" h40 lh40 ml20 fs24 cffffff">
                                产品预约</div>
                            <div class=" ml20 h32 lh32 cffffff">
                                最低认购标准：${var.INVESTMENTSTARTING }</div>
                            <div class=" w240 h40 ml20">
                                
                                <div class=" fl w220 h40">
                                    <input  type="text" id="NAMES"  placeholder="请输入您的姓名" class=" trust_productdetail_input_bg"></div>
                                <div class=" fl cffffff m15 lh40 fs18">
                                    *</div>
                            </div>
                            <div class=" h15 clearb">
                            </div>
                            <div class=" w240 h40 ml20">
                               
                                <div class=" fl w220 h40">
                                    <input  type="text" id="PHONE"  placeholder="请输入您的手机号" class=" trust_productdetail_input_bg"></div>
                                <div class=" fl cffffff ml1 lh40 fs18">
                                   *</div>
                            </div>
                            <div class=" h15 clearb">
                            </div>
                            <div class=" w240 h40 ml20">
                              <div class=" fl w180 h40">
                                    <input  type="number" id="MONEY"  placeholder="请输入您的预约额度"  class=" trust_productdetail_input_bg"></div>
                            </div>
                            
                            <div class=" h24 clearb">
                            </div>
                            <div class=" w200 h40 ml30">
                                <input type="button" onclick="cpyy()" name="ctl00$ContentPlaceHolder1$lbLogin" value="立即预约" class="btnlogin w200 h40 lh40 tac fs16 fwb cffffff  bradius5 cpointer bg29a2e9" style=" border:2px solid #fff;"></div>
                            <div class=" h24 clearb">
                            </div>
                            
                           
                        </div>
                        <!--  理财师推荐-start  -->
                    <div class="fp-recommend">
                        <div class="recommend-title">
                            <span class="icon-title recommend-title-icon"></span>
                            <h3>理财师推荐</h3>
                        </div>
                        <ul id="ctl00_ContentPlaceHolder1_fp_recommend" class="financial-planner-list align-center">
                        	<c:forEach items="${financialplannerList}" var="var" varStatus="vs">
		                        <li class="financial-planner">
									<img src="${var.IMGURL }" alt="">
									<h4 class="financial-planner-name">${var.NAME }</h4>
									<p class="financial-planner-post">${var.POSITION }</p>
									<a href="javascript: void(0); "  class="btn btn-link"  onclick="javascript:showDiv('${var.ID}','${var.NAME }')">立即预约</a>
								</li>
							</c:forEach>
						</ul>
                    </div>
                    
            </div>
                </div>
            </div>
        </div>
        <div class=" h15 clearb"></div>          
<!--  相关产品-start  -->
     <div id="trust_index_introduce" class="bgfafafa">
    <div class=" w1200 mauto">
        <div class=" w1200" id="trust_index_introduce_liserver">
            <!--  产品推荐-start  -->
        <div class=" w1200 mauto">
        		 <c:choose>
					<c:when test="${not empty list}">
						 <div class="production-recommend position-relative">
				          	<span class="icon-title production-recommend-icon"></span>
				           	<h3 class="production-recommend-title">产品推荐</h3>
				         </div>
				         <div id="ctl00_ContentPlaceHolder1_production_recommend" class=" w1200">
          					<c:forEach items="${list}" var="var" varStatus="vs">
	            				<div class="trust_index_introduce_li fl">
					                <div class=" h15"></div>
					                <div class="trust_index_introduce_li_title c00aeff lh34 h34">
					                <div class=" fl w34 h34 ml10 trust-index-introduce-li-title-icon"><img src="${var.THEISSUERIMGURL }"></div>
					                <div class=" fl ml5 fs16 trust-index-introduce-li-title"><a class="c000000 trust-index-introduce-li-title-a">${var.PRODUCTREFERRED }</a></div>
					                </div>
					                <div class="h10"></div>
					                <div class=" w190 mauto tac lh36 cff6c00 fs26 fwb">${var.RETURNSBENCHMARKMAX }</div>
					                <div class="h16"></div>
					                <div class=" w250 h24 lh24 c333333 fs14">
					                <div class=" fl w120 brd999999 tac">门槛：${var.INVESTMENTSTARTING }</div>
					                <div class=" fl w120  tac">期限：${var.PRODUCTDEADLINE }</div>
					                </div>
					                <div class=" h10"></div>
					                <div class="production-recommend-desc" title="${var.PRODUCTREVIEWS }">
						            	<c:if test="${fn:length(var.PRODUCTREVIEWS) > 45 }">
											${fn:substring(var.PRODUCTREVIEWS,0,45)}...
										</c:if>
										<c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 45 }">
											${var.PRODUCTREVIEWS}
										</c:if>
					                </div>
					                <div class=" h20"></div>
					                <a href='web/goProductInfo?ID=${var.ID }&PRODUCTTYPE=${pd.PRODUCTTYPE}' target='_blank' ><div class=" w120 h32 lh32 mauto tac cffffff trust_index_introduce_btn">查看详情</div></a>
					                <div class=" h22 clearb"></div>
					            </div>
				            </c:forEach>
				 	 	</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
</div>
        </div>
 
</div></div></div>
<div class=" h30 clearb"></div>


<!-- 弹出内容开始 -->
        <div id="jquery-yuyue">
                <div id="jquery-lightbox" style="display:none;">
                    <div id="lightbox-container-image-data-box">
                        <div class="lightbox-container_box_left">
                            预约当前理财师</div>
                        <div class="lightbox-container_box_right">
                            <a id="lightbox-secNav-btnClose" onclick="closeDiv()">
                                <img src="static/img/web/lightbox-btn-close.png">
                            </a>
                        </div>
                    </div>
                    <div id="lightbox-container-image-box">
                    	<input type="hidden" id="FINANCIALPLANNERID">
                        <div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; margin-top: 10px; color:#333333;">
                                理财师：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="OrderPlanner" disabled="true " style="border: 1px solid #F49703; width: 100%; height: 36px; color:#999999; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                姓名：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="USERNAME" placeholder="请输入您的姓名" style="border: 1px solid #F49703; width: 100%; height: 36px; color:#999999;
                                    -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                手机号：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="CONTACTMOBILE" placeholder="请输入您的手机号" style="border: 1px solid #F49703; width: 100%; color:#999999;
                                    height: 36px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                您的要求：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <textarea id="YOURREQUEST" style="border: 1px solid #F49703; width: 100%; height: 64px; color:#999999; line-height:24px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></textarea>
                            </div>
                            <div style="width: 80%; margin: 0 auto;">
                                <div style="background: #F49703; border: none; width: 100%; height: 36px; line-height: 36px;
                                    color: #fff; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                                    margin-top: 20px;" onclick="licaishi_click()">
                                    立即预约</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="bg" style="display:none;position:fixed;background-color: black;width: 100%;top:0;height: 100%;opacity: 0.5;"></div>  
            </div>
        <!-- 弹出内容开结束 -->
<script>    
  function showDiv(ID,NAME){  
    //document.getElementById('jquery-lightbox').style.display='block';  
    $("#jquery-lightbox").show();
    $("#bg").show();
    /* document.getElementById('bg').style.display='block';  */
    $("#OrderPlanner").val(NAME); 
    $("#FINANCIALPLANNERID").val(ID);
}  
function closeDiv(){  
    //document.getElementById('jquery-lightbox').style.display='none';  
    $("#jquery-lightbox").hide();
    $("#bg").hide();
  /*   document.getElementById('bg').style.display='none';   */
}  
</script>   

 <!-- footer -->
<input type="hidden" id="PRODUCTID" value="${var.ID }">
<input type="hidden" id="PRODUCTTYPE" value="${pd.PRODUCTTYPE }">
<%@include file="bottom.jsp"%>
<script type="text/javascript">
	function licaishi_click(){
		var data={};
		data.FINANCIALPLANNERID = $("#FINANCIALPLANNERID").val();
		if (!$("#USERNAME").val().trim()) { 
			alert("请输入您的姓名！"); 
			$("#USERNAME").focus(); 
			return false; 
		} 
		data.NAME = $("#USERNAME").val();
		if (!$("#CONTACTMOBILE").val().match(/^(((1[0-9]{2})|159|153)+\d{8})$/)) {
			alert("手机号码格式不正确！"); 
			$("#CONTACTMOBILE").focus(); 
			return false; 
		}
		data.PHONE = $("#CONTACTMOBILE").val();
		if($("#YOURREQUEST").val()){
			data.COMMENTS = $("#YOURREQUEST").val();
		}
		$.ajax({
				type: "POST",
				url: '<%=basePath%>web/lcsyy',
		    	data: data,
				dataType:'json',
				success: function(data){
					 if(data.result == 01){
					 	alert("预约成功");
					 }else{
					 	alert(data.msg);
					 }
				}
		});
	}

	//产品预约
	function cpyy(){
		var data={};
		if (!$("#NAMES").val().trim()) { 
			alert("请输入您的姓名！"); 
			$("#NAMES").focus(); 
			return false; 
		} 
		data.NAME = $("#NAMES").val();
		if (!$("#PHONE").val().match(/^(((1[0-9]{2})|159|153)+\d{8})$/)) {
			alert("手机号码格式不正确！"); 
			$("#PHONE").focus(); 
			return false; 
		}
		data.PHONE = $("#PHONE").val();
		if($("#MONEY").val()){
			data.MONEY = $("#MONEY").val();
		}
		if($("#PRODUCTID").val()){
			data.PRODUCTID = $("#PRODUCTID").val();
		}
		if($("#PRODUCTTYPE").val()){
			data.TYPE = $("#PRODUCTTYPE").val();
		}
		$.ajax({
				type: "POST",
				url: '<%=basePath%>web/cpyy',
		    	data: data,
				dataType:'json',
				success: function(data){
					 if(data.result == 01){
					 	alert("预约成功");
					 }else{
					 	alert(data.msg);
					 }
				}
		});
	}
</script>
</body>
</html>
