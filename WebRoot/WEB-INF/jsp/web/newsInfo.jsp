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
<title>${var.NAME }_${var.TYPENAME } ——环成金服</title>

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
<%@include file="head.jsp"%>
        <!-- 内容部分 -->
    <div id="container" style="border: none; background: none;">
        <!-- banner -->
        <div id="trust_index_banner" class="clearb" style="width:100%; height:200px; background: url(static/img/web/img_aboutus_banner_02.jpg) no-repeat top center;"></div>
        
<!-- 右侧悬浮按钮 -->

<!-- 代码 开始 -->


        <!-- 新闻列表、本周热销产品、财经排行版 -->
        <div class=" h10"></div>
        <div class=" w1200 mauto">
            <div class=" fl w910">
                <!-- 新闻列表 -->
                <div id="ctl00_ContentPlaceHolder1_common_currentlocation_list" class=" w910 mauto h36 lh36 fs14 c666666 bbse1e1e1"><div class=" fl">当前位置：</div>
                    <div class=" fl ml5"><a href="web/index" class=" c666666">首页</a></div>
                    <div class=" fl ml5">&gt;</div>
                    <div class=" fl ml5"><a href="web/newsList" class=" c666666">资讯</a></div>
                    <div class=" fl ml5">&gt;</div>
                    <div class=" fl ml5"><a href="javascript:{location.reload();}"></a>正文</div>
                </div>
                <div class=" h12">
                </div>
                <div id="ctl00_ContentPlaceHolder1_news_detail_server"><div class=" h10"></div>
<div class=" h44 lh44 c333333 fs24 fwb">${var.NAME }</div>
<div class=" h10"></div>
<div class=" h32 lh32 c999999">
<div class=" fl">发布时间：${var.CTDATE }</div>
<div class=" fl ml40">来源：${var.SOURCE }</div>
<div class=" fl ml40">阅读量：${var.PVIEWS }</div>
</div>

 	
 	<c:if test="${tagList!=null&&!tagList.isEmpty()}">
 		<div class="TAG" style="height:20px; margin:10px 0;">  
	 		<b style="color:#666; ">标签：</b>
	 		<c:forEach var="tag" items="${tagList }">
				<c:if test="${!tag.TAGNAME.equals('')}">
		 		<a class="TAG_Label" href='${tag.TAGURL}' style="color:#FFF; font-size:14px; background:#f49703; display:inline-block; height:20px; padding:0 5px;" target="_blank">${tag.TAGNAME}</a>
				</c:if>
		 	</c:forEach>
	 	</div>	
 	</c:if>
	 

<div class=" h10"></div>
<div id="newsdetail_ArticleContent" class=" news_detail_ArticleContent c333333 fs14 lh36">
	${var.DETAILED }
</div>
<div class=" h20 bbsdedede"></div>
<div class=" h54 lh54 c666666 fs12">
<c:choose>
	<c:when test="${not empty var.XID}">
		<a  href="web/goNewsInfo?ID=${var.XID}" style="width:410px; overflow:hidden; float:left; font-size:14px;">
		上一篇：
		<c:if test="${fn:length(var.XNAME) > 15 }">
			${fn:substring(var.XNAME,0,15)}...
		</c:if>
		<c:if test="${fn:length(var.XNAME)  <= 15 }">
			${var.XNAME}
		</c:if>
		</a> 
	</c:when>
	<c:otherwise>
		<a style="width:410px; overflow:hidden; float:left; font-size:14px;">上一篇：没有了</a> 
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${not empty var.SID}">
		<a href="web/goNewsInfo?ID=${var.SID}" style="width:410px; overflow:hidden; float:right;" ><div class=" fr w400 fs14">
		下一篇：
		<c:if test="${fn:length(var.SNAME) > 15 }">
			${fn:substring(var.SNAME,0,15)}...
		</c:if>
		<c:if test="${fn:length(var.SNAME)  <= 15 }">
			${var.SNAME}
		</c:if>
		</div></a> 
	</c:when>
	<c:otherwise>
		<a style="width:410px; overflow:hidden; float:left; font-size:14px;">下一篇：没有了</a> 
	</c:otherwise>
</c:choose>
<!-- <a style="width:410px; overflow:hidden; float:left; font-size:14px;">上一篇：没有了</a> 
<a style="width:410px; overflow:hidden; float:right;" href=""><div class=" fr w400 fs14">下一篇：假婚买房如何封堵:专家建议离婚半年内限制..</div></a>  -->
</div>
</div>
<!--分享代码-->
<div class="bdsharebuttonbox"><a href=" " class="bds_more" data-cmd="more"></a ><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a ><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a ><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a ><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a ><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a ></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

<!--<script language="javascript">
	(function () {
var p = {
  shareTo:1,/*1:论坛  2:微博*/
  appkey:"",/*用于显示来源(可选)*/
  title:document.title,/*转发内容标题*/
  url:location.href,/**转发内容地址，默认为当前地址*/
  picUrl:[],/*分享图片地址,数组形式表示(可选)*/
  flashVideoUrl:"",/*分享视频地址（可以直接填写视频页面地址或.swf地址，推荐前者），分享视频时，会自动添加到视频应用中*/
  tagName:[],/*视频的标签名称*/
  relateTYUserName:""/*分享后显示提示关注的用户名称*/
},s = [];
for(var n in p){if(typeof p[n]=="object"){for(var i in p[n]){p[n][i] = encodeURIComponent(p[n][i]||"");}s.push(n+"="+p[n].join(","));}else{s.push(n+"="+encodeURIComponent(p[n]||""));}}
document.write('<a href="http://open.tianya.cn/widget/send_for.php?action=send-html&'+ s.join("&") +'" target="_blank" onfocus="this.blur();" title="转发到天涯"><img src="http://open.tianya.cn/static/images/send/btn_bbs_l.png" alt="转发到天涯" style="border:0 none;"/></a>');
})();
</script>-->

 <div class=" h40"></div>
</div>
 <div class=" fr w275">
                <c:choose>
					<c:when test="${not empty newsList}">
						 <!-- 点击排行 -->
                <div class=" h36 lh32">
                    <div class=" h18 fl bls3ba7ef mt7 ml5"></div>
                    <div class=" h32 fl ml10 fs18 c333333 fwb">点击排行</div>
                </div>
                 <div id="ctl00_ContentPlaceHolder1_index_news_RankingList_click_server" class="bse1e1e1"><div class=" h10"></div>
					<ul>
						<c:forEach items="${newsList}" var="var" varStatus="vs">
							<li class=" h32 lh32">
								<div class="  bgf7f7f7 fl c333333"><span class=" ml8">${vs.index+1 }</span></div>
								<div class=" fl ml5 c999999 w230" title="${var.NAME }">
									<a href="web/goNewsInfo?ID=${var.ID}" target="_blank" class="c999999" target="_blank">
										<c:if test="${fn:length(var.NAME) > 15 }">
											${fn:substring(var.NAME,0,15)}...
										</c:if>
										<c:if test="${fn:length(var.NAME)  <= 15 }">
											${var.NAME}
										</c:if>
									</a>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class=" h10"></div>
				</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
                <div class=" h30"></div>
            </div>
        </div>
    </div>
  <div class="clearb"></div>  
   <div class=" h15 clearb"></div>   
  <div id="container" style="border: none; background: none;">
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
						            	<c:if test="${fn:length(var.PRODUCTREVIEWS) > 35 }">
											${fn:substring(var.PRODUCTREVIEWS,0,35)}...
										</c:if>
										<c:if test="${fn:length(var.PRODUCTREVIEWS)  <= 35 }">
											${var.PRODUCTREVIEWS}
										</c:if>
					                </div>
					                <div class=" h20"></div>
					                <a href='web/goProductInfo?ID=${var.ID }&PRODUCTTYPE=1' target='_blank' ><div class=" w120 h32 lh32 mauto tac cffffff trust_index_introduce_btn">查看详情</div></a>
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
    <!-- footer -->
    <%@include file="bottom.jsp"%>
</body>
</html>
