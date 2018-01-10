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
		<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
    	<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
    	<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
    	<link rel="stylesheet" type="text/css" href="static/css/home/home-common.css">
    	<link rel="stylesheet" type="text/css" href="static/css/home/home-collectionproducts.css">
    	<link rel="Shortcut Icon" href="static/img/web/logo2.ico">
    	<script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    	<script>
    	
	    	$(function(){
	    		if(${li!=null}){
	    			$("#"+'${li}').addClass("selected");
	    		}else{
	    			$("#qb").addClass("selected");
	    		}
				$('dd').mouseenter(function(){
					$(this).removeClass("home-dd");
					$(this).addClass("hover-nav");
				}).mouseleave(function(){
					$(this).removeClass("hover-nav");
					$(this).addClass("home-dd");
				});
				
				$('dd').click(function(){
					$('dd').removeClass("selected-nav");
					$('dd').css("font-weight","normal");
					$('dd').css("font-size","14px");
					$(this).removeClass("home-dd");
					$(this).addClass("selected-nav");
					$(this).css("font-weight","bold");
					$(this).css("font-size","15px");
					
			    });
			})
			function changeU_name(){
	    		$("#changeU_name").css("display","none");
	    		$("#strong_u_name").css("display","none");
	    		$("#u_name").css("display","block");
	    		$("#prompt").css("display","block");
	    		$("#u_name")[0].focus(); 
	    	}
	    	function checkU_name(){
	    		var u_name = $("#u_name").val();
	    		var uPattern = /^[a-z\u4e00-\u9fa5A-Z0-9_-]{3,20}$/;
		    	if(u_name.trim().length>=3&&u_name.trim().length<20){	
	    			if(!uPattern.test(u_name)){
	    				$("#u_name").css("border","1px solid red");
			    		$("#prompt").css("color","red");
			    		return false;
		    		}else{
		    			$("#u_name").css("border","1px solid green");
			    		$("#prompt").css("display","none");
			    		$("#prompt").css("color","#666");
			    		return true;
		    		}
		    	}else{
		    		$("#u_name").css("border","1px solid red");
		    		$("#prompt").css("color","red");
		    		return false;
		    	}
	    	}
	    	function collectionProducts(obj){
	    		var val = obj.childNodes[1].value;
	    		location.href = "home/collectionProducts?t="+val;
	    	}
	    	function delcollection(obj,productId){
	    		if(confirm("您确定要取消收藏吗?")){
		    		var phone = '<%=session.getAttribute("sessionCurrentPhone") %>';
			    	$.ajax({
						type:'POST',
						url:'web/collectionProduct',
						data:{'productId':productId,'collection':'yes','phone':phone},
						dataType:'json',
						success:function(data){
							obj.parentNode.parentNode.parentNode.remove();
						}
					});
	    		}
	    	}
    	</script>
	</head>
	<body style="background-color:#f3f3f3;    color: #666;">
		<%@include file="../web/head.jsp"%>
		<div id="container" style="border: none; background: none;">
            <div class="home-topnav">
             	<div style="margin-left:110px" class=" fl">&nbsp;</div>
                <div class=" fl" style="color:#666655">当前位置：</div>
                <div class=" fl ml5"><a href="web/index">首页</a></div>
                <div class=" fl ml5">&gt;</div>
                <div class=" fl ml5"  style="color:#666655">账号管理</div>
                <div class=" fl ml5">&gt;</div>
                <div class=" fl ml5"></div>
            </div>
		</div>
        <div class="home-main">
       	 <!--主导航 -->
        	<div style="display:none" class="home-mainnav">
		     
		    </div>
		    <div style="height:12px">
        	</div>
        	 <!--左侧导航 -->
			<div class="home-subnav">
				<dl>	
					<dt>
						账户中心
					</dt>
					<dd class="home-dd" onclick="location.href='/home?u_phone=<%=session.getAttribute("sessionCurrentPhone") %>'">
						我的账户
					</dd>
					<dd class="home-dd">
						账户设置
					</dd>
				</dl>
				<dl>
					<dt>
						关注中心
					</dt>
					<dd class="selected-nav" onclick="location.href='home/collectionProducts'">
						收藏的产品
					</dd>
					<dd class="home-dd" >
						关注的公司
					</dd>
					<dd class="home-dd" onclick="window.open('home/history')">
						浏览历史
					</dd>
				</dl>
				<dl>
					<dt>
						消息中心
					</dt>
					<dd class="home-dd">
						所有消息
					</dd>
					<dd class="home-dd">
						产品消息
					</dd>
					<dd class="home-dd">
						系统消息
					</dd>
				</dl>
			</div>
			<!--内容 -->
			<div class="home-content" style="height:100%">
				<div style="width:1060px" class="myfollow-wrap">
					<div class="myfollow-hd">
					    <div class="m-tab-wrap clearfix">    <!--  页签 -->
					        <div class="m-tab">
								<ul class="tab-trigger">
									<li class="trig-curr  trig-item"><a href="home/collectionProducts" class="text">收藏的产品</a></li>
									<li class="trig-item"><a href="javascript:void(0)" class="text">关注的公司</a></li>
									<li class=" trig-item"><a href="home/history" target="_blank" class="text">浏览历史</a></li>
								</ul>
								<!-- <ul class="tab-others">
					                <li class=" item" id="f_similar"><a href="" target="_blank" class="text">找相似</a><i class="i-new"></i></li>
					        	</ul> -->
							</div>
					        <!-- <div class="myfollow-search">
					            <input id="selCids" name="selCids" value="" type="hidden">
					            	<input class="search-input" name="q" id="q" value="" placeholder="请输入店铺名称" onkeydown="if(event.keyCode==13) {$(this).next().trigger(&quot;click&quot;);}" type="text">
					                <a href="javascript:void(0)" class="search-btn" onclick="searchData(this);">搜索</a>
					        </div> -->
					    </div>
					</div>
					<div class="myfollow-bd">
        				<div class="mf-selector mf-s-goods">
							<div class="mf-selector-line" id="categoryFilter">
								<div class="s-main"> 
									<ul class="mf-selector-list up">  
										<li id="qb"> 
											<a class="search" target="_self" href="home/collectionProducts">
												全部产品
											</a> 
										</li>
										<c:forEach items="${productCount}" var="productCount">  
											<c:if test="${productCount.key=='信托'}">
												<li id="xt">
											</c:if>
											<c:if test="${productCount.key=='资管'}">
												<li id="zg">
											</c:if>
											<c:if test="${productCount.key=='契约型'}">
												<li id="qyx">
											</c:if>
											<c:if test="${productCount.key=='股权投资'}">
												<li id="gqtz">
											</c:if>
											<c:if test="${productCount.key=='政府债'}">
												<li id="zfz">
											</c:if>
											<c:if test="${productCount.key=='对冲定增'}">
												<li id="dcdz">
											</c:if>
												<a class="search" target="_self" href="javascript:void(0)" onclick="collectionProducts(this)">
													${productCount.key}
													(${productCount.value})
													<c:if test="${productCount.key=='信托'}">
														<input type="hidden" value="xt"/>
													</c:if>
													<c:if test="${productCount.key=='资管'}">
														<input type="hidden" value="zg"/>
													</c:if>
													<c:if test="${productCount.key=='契约型'}">
														<input type="hidden" value="qyx"/>
													</c:if>
													<c:if test="${productCount.key=='股权投资'}">
														<input  type="hidden" value="gqtz"/>
													</c:if>
													<c:if test="${productCount.key=='政府债'}">
														<input type="hidden" value="zfz"/>
													</c:if>
													<c:if test="${productCount.key=='对冲定增'}">
														<input  type="hidden" value="dcdz"/>
													</c:if>
													
												</a>
											</li>   
										</c:forEach>
										 
										
									</ul> 
								</div> 
							</div>
        				</div>
						<div class="myfollow-main mf-goods">
   							<div class="mf-goods-list clearfix ">
   								<c:forEach  items="${productList }" var="product">
	   								<div class="mf-goods-item" id="goods_312606">
	                					<div class="item-inner">
		                    				<div class="p-img">
		                       	 				<a href="web/goProductInfo?ID=${product.ID }&PRODUCTTYPE=${product.PRODUCTTYPE}" target="_blank">
		                            				<img src="${product.THEISSUERIMGURL}"  width="160" height="160">
		                        				</a>
		                    				</div>
		                    			<div class="p-name">
		                        			<a href="web/goProductInfo?ID=${product.ID }&PRODUCTTYPE=${product.PRODUCTTYPE}" target="_blank" title="${product.PRODUCTNAME}" >
		                        				${product.PRODUCTREFERRED}
		                        			</a>
		                    			</div>
		                    			<div class="p-price">
		                    				<strong price="28.30">
		                    					${product.THEISSUERNAME}
		                    				</strong>
		                    			</div>
		                    			<div class="p-operate">
		                        			<a href="javascript:void(0);"  onclick="delcollection(this,'${product.ID}')" target="_self" style="text-align: center;" class="op-btn btn-cart">
		                        					取消收藏
		                        			</a>
		                        			<a href="web/goProductInfo?ID=${product.ID }&PRODUCTTYPE=${product.PRODUCTTYPE}" target="_blank" class="op-btn btn-compare J_contrast" style="text-align: center">
		                        					前往预约
		                        			</a>
		                    			</div>
	                				</div>
								</div>
							</c:forEach>
					</div>            
				</div>
			</div>
			<!-- <div class="mf-promotion">
				<div class="promo-hd">
					<h5>根据您的关注为您推荐</h5>
					<div class="promo-page">
						<span class="page-index"><em class="ftc1 page-curr">1</em> / 
							<em class="psum">4</em>
						</span>
						<span class="page-btn">
							<span class="disable J-promotion-prev">&lt;</span>
							<span class="J-promotion-next">&gt;</span>
						</span>
					</div>
				</div>
				<div class="promo-bd" style="position: relative;">
					<ul class="goods-list J-promotion-ul" style="width: 4340px; left: 0px; position: absolute;">  
						<li class="J-promotion-li ui-switchable-panel-selected" clk="//mercury.jd.com/log.gif?t=rec.201000&amp;v=src=rec$action=1$reqsig=5a7e329ed8bbdead377f4422aa3e6f5f5e2babaa$enb=1$sku=0$skus=312606,13938460662,385620$p=201000$pin=stan_eminem$uuid=1118587982$csku=1006037088$index=0$st=0$adcli=$expid=20100000014072805$im=&amp;rid=3742385810937138872&amp;ver=1&amp;sig=30767e4d444d7583d9833a605535544ba7ea4e5a" style="float: left; display: list-item;"> 
							<div class="p-img"> 
								<a href="//item.jd.com/1006037088.html" target="_blank"> 
									<img src="//img11.360buyimg.com/n2/jfs/t7819/231/1234358406/299957/525b0972/599b8676Nb09f1ff6.jpg" alt="云南白药牙膏 留兰香型  180g*3支   清洁口腔 口腔问题  送竹炭软毛牙刷"> 
								</a> 
							</div> 
							<div class="p-name">
								<a href="//item.jd.com/1006037088.html">
									云南白药牙膏 留兰香型  180g*3支   清洁口腔 口腔问题  送竹炭软毛牙刷
								</a>
							</div> 
							<div class="p-price">
								¥
								<strong>
									84.90
								</strong>
							</div> 
							<a href="//cart.jd.com/gate.action?pid=1006037088&amp;pcount=1&amp;ptype=1&amp;r=1507690041857" class="btn-cart" target="_blank"> 
								<i class="btnico"></i>
								<em class="btntxt">加入购物车</em> 
							</a> 
						</li>  
						<li class="J-promotion-li" clk="//mercury.jd.com/log.gif?t=rec.201000&amp;v=src=rec$action=1$reqsig=5a7e329ed8bbdead377f4422aa3e6f5f5e2babaa$enb=1$sku=0$skus=312606,13938460662,385620$p=201000$pin=stan_eminem$uuid=1118587982$csku=11276252378$index=1$st=0$adcli=$expid=20100000014072805$im=&amp;rid=3742385810937138872&amp;ver=1&amp;sig=d31b04108466b5cfc39bf77b13827c0c2355523b" style="float: left; display: list-item;"> 
							<div class="p-img"> 
								<a href="//item.jd.com/11276252378.html" target="_blank"> 
									<img src="//img11.360buyimg.com/n2/jfs/t10903/13/958254100/187760/72b48b83/59daea62Nfff5c4d5.jpg" alt="AK男装2017新品军事轻复古MA-1胸前绣花标飞行员夹克1704001 浅灰绿  预售预计10.30发货 L"> 
								</a> 
							</div> 
							<div class="p-name">
								<a href="//item.jd.com/11276252378.html">
									AK男装2017新品军事轻复古MA-1胸前绣花标飞行员夹克1704001 浅灰绿  预售预计10.30发货 L
								</a>
							</div> 
							<div class="p-price">
								¥
								<strong>
									599.00
								</strong>
							</div> 
							<a href="//cart.jd.com/gate.action?pid=11276252378&amp;pcount=1&amp;ptype=1&amp;r=1507690041857" class="btn-cart" target="_blank"> 
								<i class="btnico"></i>
								<em class="btntxt">
								加入购物车
								</em> 
							</a> 
						</li>  
					</ul>
				</div>
			</div>-->
     	</div> 
  	</div>
  </div>
        <%@include file="../web/bottom.jsp"%>
        
	</body>
	</html>