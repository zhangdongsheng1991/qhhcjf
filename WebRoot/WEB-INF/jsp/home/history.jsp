<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
    	<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
    	<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
    	<link rel="stylesheet" type="text/css" href="static/css/home/home-history.css">
    	<link rel="Shortcut Icon" href="static/img/web/logo2.ico">
    	<script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
    	<script>
    		$(function(){
    			$(".p-del").click(function(){
    				var val = $(this).attr('id');
    				var vararr = val.split("_");
    				var id = vararr[0];
    				var date = vararr[1];
    				var phone='<%=session.getAttribute("sessionCurrentPhone") %>';
    				$.ajax({
    					type:'post',
    					url:'home/delHistory',
    					data:{'productid':id,'operating_time':date,'operation_staff':phone},
    					dataType:'json',
    					success:function(data){
    						$("#"+id).remove();
    					}
    				})
    			});
    			$(".del-all").click(function(){
    				var date = $(this).attr('id');
    				var phone='<%=session.getAttribute("sessionCurrentPhone") %>';
    				$.ajax({
    					type:'post',
    					url:'home/delHistory',
    					data:{'operating_time':date,'operation_staff':phone},
    					dataType:'json',
    					success:function(data){
    						$("#all"+date).remove();
    					}
    				})
    			});
    			
    		})
    	</script>
	</head>
	<body>
		<div style="width: 100%;height: 231px;line-height: 231px;background: #e3e4e5;border-bottom: solid 1px #ddd;">
			<%@include file="../web/head.jsp"%>
		</div>
		<div class="w">
			<div class="breadcrumb">
		        <a href="home/history">
		        	<strong>我的足迹</strong>
		        </a>&nbsp;&gt;&nbsp;
		    </div>
		</div>
		<!--breadcrumb-->
		<div class="w" id="content-history">
	    <div class="goods">
	        <div class="m">
	            <div class="nav-history">
	                <div class="nh-left main-curr">
	                	<a href="home/history">
	                		全部分类
	                	</a>
	                </div>
	                <div class="nh-center">
	                    <ul>
	                    	<c:forEach var="t" items="${type}"> 
		                    	<li>
		                         	<a href="">
		                         		${t}
		                         	</a>
		                         </li>
	                    	</c:forEach>
	                    </ul>
	                </div>
	            </div>
	       	</div>
	        <!-- 分类 -->
	        <div class="goods-content">
	            <div class="p-line" style="height: 410px;"></div>
	            <div class="p-line-red" style="height: 6px;"></div>
	            <div id="p-list">    
	            	<c:forEach var="productsMap" items="${products}">        
	            	<div id="all${productsMap.key}" class="m goods-item">                
	            		<div class="mt">
							<c:if test="${productsMap.key==today}">
								<h2>今天</h2>
							</c:if>                   
		            		<strong>${productsMap.key}</strong>                    
		            		<span id="${productsMap.key}" class="del-all" >
		            			删除
		            		</span>                    
		            		<i class="line-cur line-b"></i>                
	            		</div> 
	            		<div class="mc">
	            			<ul class="hide" style="display: block;">
	            			<c:forEach var="product" items="${productsMap.value}">             
	            				<li id="${product.ID }" class="">                
	            					<div class="p-img">                    
	            						<a href="//item.jd.com/10808094497.html" target="_blank" title="${product.PRODUCTREFERRED }">                        
	            							<img src="${product.THEISSUERIMGURL }" width="150" height="150">                    
	            						</a>                
	            					</div>                
	            					<div class="p-price">                    
	            						<i class="J-p-10808094497">${product.PRODUCTREFERRED }</i>                
	            					</div>                
	            					<div class="p-same">
	            						<a href="//my.jd.com/history/same/10808094497.html" target="_blank">
	            							${product.THEISSUERNAME}
	            						</a>                
	            					</div>                
	            					<span class="p-del" id="${product.ID}_${productsMap.key}">
	            					</span>                
	            					<div class="p-label">                    
	            						<a href="//my.jd.com/history/list/1315.html">
	            							服饰内衣
	            						</a>                
	            					</div>                
	            					<div class="cover hide">                    
	            						<a href="//item.jd.com/10808094497.html">
	            							V.C惟熙2017秋冬新款宽松单件套头大码高领直筒针织衫女保暖长袖套头毛衣 酒红 F
	            						</a>                    
	            						<span>删除成功</span>                
	            					</div>            
	            				</li>
	            				</c:forEach>        
	            			</ul>
	            		</div>   
	            	</div>
	            	</c:forEach>
	            	
	            </div>
	        </div>
	        <!-- goods-content -->
	        <div class="good-bottom">已到最后，只保存最近 1 个月的浏览记录</div>
	    </div>
	</div><!-- content-history -->
	<script type="text/javascript">
		/*
	    $(function(){
	        $('#content-history .goods').mouseenter(function(){
	        	//alert('dd');
	            getSku($('.goods-content .mc').eq($(this).index()));
	        })
	    });
	    function getSku(t)
	    {
	        var sk = [];
	        if(t.data('loaded') == undefined) 
	        {
	            t.find('li').each(function(){
	                sk.push($(this).attr('sku'));
	            })   
	            getPriceNum(sk, true, t);
	            t.data('loaded', true);
	        }
	    }
		*/
	    var getPriceNum = function(skus, iploc, $wrap, perfix, callback) {
	    skus = typeof skus === 'string' ? [skus]: skus;
	    $wrap = $wrap || $('body');
	    perfix = perfix || 'J-s-';
	
	    var ipLocParam = '';
	
	    if ( iploc !== null ) {
	        if ( readCookie('ipLoc-djd') ) {
	            ipLocParam = '&provinceid=' + readCookie('ipLoc-djd').replace(/-/g, '_').split('_')[0];
	        } else {
	            ipLocParam = '&provinceid=1';
	        }
	    }
	
	    if ( typeof skus === 'undefined' ) {
	        return;
	    }
	    console.log(skus.join(','));
	    var url = '//st.3.cn/gsis.html?type=getstocks&skuids=' + skus.join(',') + ipLocParam;
	    //url ='//st.3.cn/gsis.html?type=getstocks&skuids=1004719744,981759,1332027607,202051,1094913,416397,1045206,482143,998693,1130715,937004&provinceid=1';
	    console.log(url);
	    $.ajax({
	        url: url,
	        dataType: 'jsonp',
	        contentType: "application/json; charset=utf-8",
	        success: function (r) {
	        	for(var i in r){
	        	   //var wmaStocks = r[i].StockStateName=='无货'?'卖完了':'';
	        	   if(r[i].StockState==34){
	        	  // var wmaStocks2 = r[i].StockStateName=='无货'?'class="sold-out"':'';
	        	        $wrap.find('#J-s-' + i).html('卖完了');
	        	        $wrap.find('#p-price').html('');
	        	       }
	        	   
	        	}
	        },
	      error:function(XHR, textStatus, errorThrown){
	            console.log('error: ' + errorThrown+'textStatus:'+textStatus);
	         }
	    });
		var priceUrl = '//p.3.cn/prices/mgets?type=1&skuIds=J_' + skus.join(',J_') + ipLocParam;
		$.ajax({
			url: priceUrl,
			dataType: 'jsonp',
			success: function (r) {
				if (!r && !r.length) {
					return false;
				}
	 
				for (var i = 0; i < r.length; i++) {
					if ( !r[i].id ) {
						return false;
					}
					var sku = r[i].id.replace('J_', '');
					var wmePrice = parseFloat(r[i].p);
					var wmaPrice = parseFloat(r[i].m);
					if (wmePrice > 0) {
						$wrap.find('.J-p-' + sku).html('￥' + r[i].p + '');
					} else {
	        	        $wrap.find('#J-s-' + sku).html('卖完啦');
					}
					if ( typeof callback === 'function' ) {
						callback(sku, r[i], priceUrl);
					}
				}
			}
		});
	
		};
	$(function(){
		var sk = [];
		//$('li[name=sockId]').each(function(){
	    	//sk.push($(this).attr('sku'));
		//});
		//getPriceNum(sk, true, $('li[name=sockId]'));
	});
	</script>
	<!--footer end-->
	<script src="//payrisk.jd.com/js/td.js"></script>
	<script src="https://payrisk.jd.com/y.html?v=0.08442245442521035&amp;o=my.jd.com/history/list.html"></script>
	<div style="width:1px;height:1px;background:#FFF;display:inline-block;position:absolute;left:-2000px;top:-2000px;">
	<object type="application/x-shockwave-flash" data="https://payrisk.jd.com/JdGiaFP.swf" id="jd_jr_td_flash" width="1" height="6">
	<param name="movie" value="https://payrisk.jd.com/JdGiaFP.swf">
	<param name="allowScriptAccess" value="always">
	</object>
	</div>
	<%@include file="../web/bottom.jsp"%>
	</body>
</html>
