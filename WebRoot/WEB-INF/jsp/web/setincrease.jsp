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
<title>信托理财产品预约_资管产品预约_信托理财投资 ——环成金服</title>
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
        	<div class=" fl">当前位置：</div><div class=" fl ml10"><a href="web/index">首页</a></div>
			<div class=" fl ml10">&gt;</div><div class=" fl ml10"><a href="javascript:{location.reload();}">政府债产品</a></div>
		</div>
    </div>
    <div class=" w1198 mauto bgffffff bse1e1e1 tac h110 lh110 fs24" style=" margin-top:15px;"><span class="c000000">${folatDetails.PRODUCTREFERRED}财通基金-富春定增1588号资产管理计划</span></div>
    <div class=" h10 clearb">
        </div>
        <div>
            <div class=" w1200 mauto">
                <!-- 左侧 -->
                <div class=" fl">
                    <!-- 产品简介 -->
                    
                    <div class="clearb">
                    </div>
                    
                    <div class="trust_companydetail_intro w920">
                        <!-- 产品简介 -->
                        <div class="bbs0068ff h36">
                           <div class=" fl h36 lh36 c3a8eff fs24 fwb">基本信息</div>
                            <div id="ctl00_ContentPlaceHolder1_trust_productdetail_ztjs_server" class=" fl">
                                
                            </div>
                        </div>
                        <div id="ctl00_ContentPlaceHolder1_trust_productdetail_intro_server" class=" clearb w920"><table class="trust_companydetail_table w920 fs14 c999999" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td class=" bgfafafa"><div class=" tar mr20">产品全称：</div></td>
			<td class=" bgffffff c666666" colspan="3"><div class=" tal ml40">${folatDetails.PRODUCTNAME}吉林信托-汇融16 号中弘矿业信托贷款集合资金信托计划</div></td>
		</tr>
		<tr>
			<td width="18%" class=" bgfafafa"><div class=" tar mr20">发行机构：</div></td>
			<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${folatDetails.THEISSUER}吉林信托</div></td>
			<td width="18%" class=" bgfafafa"><div class=" tar mr20">预计发行规模：</div></td>
			<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${folatDetails.EXPECTISSUANCE}2.2亿</div></td>
		</tr>
		<tr>
			<td width="18%" class=" bgfafafa"><div class=" tar mr20">最低认购金额：</div></td>
			<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${folatDetails.INVESTMENTSTARTING}100万</div></td>
			<td width="18%" class=" bgfafafa"><div class=" tar mr20">利息分配：</div></td>
			<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${folatDetails.INTERESTDISTRIBUTIONSTATE}每半年付息</div></td>
		</tr>
		<tr>
			<td width="18%" class=" bgfafafa"><div class=" tar mr20">产品期限：</div></td>
			<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${folatDetails.PRODUCTDEADLINE}1+1年</div></td>
			<td width="18%" class=" bgfafafa"><div class=" tar mr20">信托类型：</div></td>
			<td width="32%" class=" bgffffff c666666"><div class=" tal ml40">${folatDetails.TRUSTTYPE}工商企业类</div></td>
		</tr>
		<tr>
			<td width="18%" class=" bgfafafa">
			 <div class=" tar mr20">收益基准：</div>
			</td>
			<td width="32%" class=" bgffffff c666666">
				${folatDetails.RETURNSBENCHMARK}
			</td>
			<td width="18%" class=" bgfafafa"><div class=" tar mr20">产品状态：</div></td>
			<td width="32%" class=" bgffffff c666666"><div class=" tal ml40"><span class="cff6c00">${folatDetails.PRODUCTSTATUS}预约中</span></div></td>
		</tr>
	</tbody>
</table>
</div>
<div id="ctl00_ContentPlaceHolder1_trust_productdetail_content_server"><div class=" pl20 pr20 bbsdedede">
<div class=" h10"></div>
<div class=" h48 lh48 c3a8eff fs24">资金用途是什么？</div>
<div class=" lh32 fs14 c666666"><p>
	信托贷款发放给中弘矿业，中弘矿业将该笔信托贷款用于偿还公司的债务。
</p></div>
<div class=" h30"></div>
</div>
<div class=" pl20 pr20 bbsdedede">
<div class=" h10"></div>
<div class=" h48 lh48 c3a8eff fs24">还款来源有哪些？</div>
<div class=" lh32 fs14 c666666"><p>
	1、中弘矿业未来两年贸易现金收入；
</p>
<p>
	2、中弘矿业其他融资渠道现金流收入；
</p>
<p>
	3、上市公司中弘股份之业务经营收入及筹资等。
</p></div>
<div class=" h30"></div>
</div>
<div class=" pl20 pr20 bbsdedede">
<div class=" h10"></div>
<div class=" h48 lh48 c3a8eff fs24">风控措施如何？</div>
<div class=" lh32 fs14 c666666"><p>
	<strong>增信措施</strong> 
</p>
<p>
	1、土地、物业抵押：中弘系子公司（腾龙房地产开发公司）长白
山漫江小镇项目，土地278 亩（住宅用地222.4 亩，商业用地55.6亩）及别墅、商业的在建工程（四证齐全），预估价格为4.4 亿元，抵押率50%。
</p>
<p>
	2、上市公司以及实际控制人担保：中弘股份为其全资子公司中弘矿业此笔信托贷款提供保证担保；企业实际控制人王永红为中弘矿业到期信托贷款提供连带责任保证担保。
</p></div>
<div class=" h30"></div>
</div>
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
                                最低认购标准：100万</div>
                            <div class=" w240 h40 ml20">
                                
                                <div class=" fl w220 h40">
                                    <input  type="text"  value="请输入您的姓名" class=" trust_productdetail_input_bg"></div>
                                <div class=" fl cffffff m15 lh40 fs18">
                                    *</div>
                            </div>
                            <div class=" h15 clearb">
                            </div>
                            <div class=" w240 h40 ml20">
                               
                                <div class=" fl w220 h40">
                                    <input  type="text"  value="请输入您的手机号" class=" trust_productdetail_input_bg"></div>
                                <div class=" fl cffffff ml1 lh40 fs18">
                                   *</div>
                            </div>
                            <div class=" h15 clearb">
                            </div>
                            <div class=" w240 h40 ml20">
                              <div class=" fl w180 h40">
                                    <input  type="text"  value="请输入您的预约额度"  class=" trust_productdetail_input_bg"></div>
                            </div>
                            
                            <div class=" h24 clearb">
                            </div>
                            <div class=" w200 h40 ml30">
                                <input type="submit" name="ctl00$ContentPlaceHolder1$lbLogin" value="提交预约" class="btnlogin w200 h40 lh40 tac fs16 fwb cffffff  bradius5 cpointer bg29a2e9" style=" border:2px solid #fff;"></div>
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
	                        <!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty chooseList}">
									<c:forEach items="${chooseList}" var="var" varStatus="vs">
				                        <li class="financial-planner">
											<img src="${var.IMGURL}" alt="">
											<h4 class="financial-planner-name">${var.NAME}林梦</h4>
											<p class="financial-planner-post">${var.POSITION}营销部总监</p>
											<a href="javascript: void(0); "  class="btn btn-link"  onclick="javascript:showDiv()">立即预约</a>
										</li>
									</c:forEach>
								</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="100" class="center" >没有相关数据</td>
										</tr>
									</c:otherwise>
							</c:choose>
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
            <div class="production-recommend position-relative">
                <span class="icon-title production-recommend-icon"></span>
                <h3 class="production-recommend-title">产品推荐</h3>
            </div>
            <div id="ctl00_ContentPlaceHolder1_production_recommend" class=" w1200">
            <!-- 开始循环 -->	
			<c:choose>
				<c:when test="${not empty floatPush}">
						<c:forEach items="${floatPush}" var="var" varStatus="vs">
				            <div class="trust_index_introduce_li fl">
				                <div class=" h15"></div>
				                <div class="trust_index_introduce_li_title c00aeff lh34 h34">
				                <div class=" fl w34 h34 ml10 trust-index-introduce-li-title-icon"><img src="static/img/web/logo1.jpg"></div>
				                <div class=" fl ml5 fs16 trust-index-introduce-li-title"><a class="c000000 trust-index-introduce-li-title-a" href="web/folatDetails?ID=${var.ID}">${var.PRODUCTNAME}</a></div>
				                </div>
				                <div class="h10"></div>
				                <div class=" w190 mauto tac lh36 cff6c00 fs26 fwb">${var.RETURNSBENCHMARK}</div>
				                <div class="h16"></div>
				                <div class=" w250 h24 lh24 c333333 fs14">
				                <div class=" fl w120 brd999999 tac">门槛：${var.INVESTMENTSTARTING}</div>
				                <div class=" fl w120  tac">期限：${var.PRODUCTDEADLINE}</div>
				                </div>
				                <div class=" h10"></div>
				                <div class="production-recommend-desc">${var.PRODUCTREVIEWS}</div>
				                <div class=" h20"></div>
				                <a href="web/folatDetails?ID=${var.ID}"><div class=" w120 h32 lh32 mauto tac cffffff trust_index_introduce_btn">查看详情</div></a>
				                <div class=" h22 clearb"></div>
				            </div>
            			</c:forEach>
				</c:when>
						<c:otherwise>
								<tr class="main_info">
									<td colspan="100" class="center" >没有相关数据</td>
								</tr>
						</c:otherwise>
			</c:choose>
  </div>
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
                            <a id="lightbox-secNav-btnClose">
                                <img src="static/img/web/lightbox-btn-close.png">
                            </a>
                        </div>
                    </div>
                    <div id="lightbox-container-image-box">
                        <div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; margin-top: 10px; color:#333333;">
                                理财师：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="OrderPlanner" disabled="true " style="border: 1px solid #00a1ff; width: 100%; height: 36px; color:#999999; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                姓名：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="UserName" style="border: 1px solid #00a1ff; width: 100%; height: 36px; color:#999999;
                                    -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" value="请输入您的姓名" onblur="if (value ==&#39;&#39;){value=&#39;请输入您的姓名&#39;}" onfocus="if (value ==&#39;请输入您的姓名&#39;){value =&#39;&#39;}"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                手机号：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <input type="text" id="ContactMobile" style="border: 1px solid #00a1ff; width: 100%; color:#999999;
                                    height: 36px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" value="请输入您的手机号" onblur="if (value ==&#39;&#39;){value=&#39;请输入您的手机号&#39;}" onfocus="if (value ==&#39;请输入您的手机号&#39;){value =&#39;&#39;}"></div>
                            <div style="width: 80%; margin: 0 auto; height: 36px; line-height: 36px; text-align: left; color:#333333;">
                                您的要求：</div>
                            <div style="width: 80%; margin: 0 auto;">
                                <textarea id="YourRequest" style="border: 1px solid #00a1ff; width: 100%; height: 64px; color:#999999; line-height:24px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"></textarea>
                            </div>
                            <div style="width: 80%; margin: 0 auto;">
                                <div style="background: #00a1ff; border: none; width: 100%; height: 36px; line-height: 36px;
                                    color: #fff; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                                    margin-top: 20px;" onclick="licaishi_click()">
                                    立即提交</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="bg" style="display:none;background-color: black;width: 100%;position:fixed;top:0;height: 100%;opacity: 0.5;"></div>  
            </div>
        <!-- 弹出内容开结束 -->
<script>    
  function showDiv(){  
    document.getElementById('jquery-lightbox').style.display='block';  
    document.getElementById('bg').style.display='block';  
}  
function closeDiv(){  
    document.getElementById('jquery-lightbox').style.display='none';  
    document.getElementById('bg').style.display='none';  
}  
</script>   

 <!-- footer -->
<div class="clearb">
    
    <div style="height: 36px; background: #fff;">
    </div>
    <div style="background: #333333;">
        <div class=" w1200 mauto">
            <div class="h40">
            </div>
           
         
            <div class=" clearb" style="">
                <div class=" h24">
                </div>
                <div class=" w290 h12 mauto" style=" font-size:12px;">
                    <ul>
                        <li class=" fl w70 h12 lh12 tac"><a href="http://www.zcscs.com/AboutUs_53_-1_-1_-1.html#联系我们" class="c999999">联系我们</a></li>
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="http://www.zcscs.com/JoinUs_55_52_-1_-1.html" class="c999999">加入我们</a></li>
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="http://www.zcscs.com/Duty.html" class="c999999">免责声明</a></li>
                        
                        
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="http://www.zcscs.com/WebSite.html" class="c999999">网站地图</a></li>
                    </ul>
                </div>
            </div>
            <div class=" h10 clearb">
            </div>
            <div><p class=" tac lh24 c999999" style=" font-size:12px;">
                ©2017 www.qhhc.com 深圳前海环成投资咨询有限公司 版权所有 
                <a href="" class="c999999" target="_blank">粤ICP备 15073245号-1</a>
                <a target="_blank" href="" class=" ml10"><img src="static/img/web/img_sign_gonganbeian.png"><span class="ml5 c999999">粤公网安备 44030702000235号</span></a>
                <a id="___szfw_logo___" href="" target="_blank" class=" ml10"><img src="static/img/web/cert.png" border="0"></a>
		 </p></div>
            <div id="ctl00_Navigation_index_website_server" style=" font-size:12px;"><div><p class=" tac lh24 c999999">本站项目信息(信托理财产品、资管理财产品、信托理财投资产品)来自于知名基金公司、信托公司等提供给环成金服的资料，基金、信托、资管公司等对其提供信息的真实可靠性和完整准确性负责。信托理财、资管理财产品预约的投资者请仔细阅读理财产品的法律文件，了解信托资管理财产品的风险和收益特征等。投资者应根据自身资产状况和风险承受能力选择知合自己的理财产品进行投资。环成金服提供的宣传材料仅供投资者参考，不构成环成金服的任何推荐或者投资建议，信托资管理财投资者应审慎决策、独立承担风险。</p></div>
</div>
            <div class="clearb">
            </div>
        </div>
        <div class=" h40 clearb">
        </div>
    </div>
</div>     
</body>
</html>

