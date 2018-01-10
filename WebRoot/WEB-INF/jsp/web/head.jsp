<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fh.entity.system.Reading,com.fh.entity.system.UserManageMent,com.fh.entity.system.MessageManagement,com.fh.service.system.usermanagement.UserManageMentService,java.util.List,java.util.ArrayList,com.fh.service.system.usermanagement.MessageManagementService"  %>
<%@ page import="com.fh.service.system.product.AppProductStableService,com.fh.service.system.product.AppProductService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>  
<%@page import="org.springframework.context.ApplicationContext"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="static/js/web/login.js"></script>  
<link rel="stylesheet" href="static/css/web/login.css">
	<!-- top -->
    <div id="index_logo_fixed" class="clearb" style="display: none; top: -70px;">
  
<!-- logo -->
	    <div class="clearb" style=" background-color:#fff;height:50px" >
	       <!-- 
	       	<div class="index_logo_li" style=" height:80px">
            <div class="w1200 mauto">
                <div class="h20"></div>
                <div>
                    <div class="fl"><a ><img src="static/img/web/img_index_logo_sign.png" alt="logo"></a></div>-->
                    <!--<div class="fl ml20"><img src=""></div>-->
                    <form action="web/searchList" method="post" name="userForm" id="userForm">
                    	<input type="hidden" name="NAME" id="NAME" value="">
                    	<input type="hidden" name="PRODUCTTYPES" id="PRODUCTTYPES" value="0">
						<input type="hidden" name="HTYPE" id="HTYPE" value="0">
                    </form>
                   
               <!-- <div class="fr w385 h44">
                        <div class="h8"></div>
                        <div class=" w380 h40 lh40 fs14" style=" border:2px solid #f49703;">
                            <div class=" w75 h40 fl">
                                <dl class="l-select fl">
						        <dt class="l-selectdt"><span class="l-selectdt-span">综合▼</span><i></i></dt>
						        <dd class="l-selectdd" style="display:none;">
							        <p>综合</p>
							        <p>信托产品</p>
							        <p>资管产品</p>
							        <p>契约产品</p>
							        <p>股权投资</p>
							        <p>政府债产品</p>
							        <p>对冲•定增</p>
							       <!--  <p>新闻资讯</p> -->
						        <!-- </dd>
					            </dl>
                            </div>
                            <div class=" w220 h40 fl ml10"><input type="text" id="searchName" class=" w220 h40 lh39 c999999" placeholder="请输入关键字"></div>
                            <div class=" w65 h40 fr"><input type="button" class=" w65 h40 lh40 fs16" value="搜索" style=" color:#fff; background:#f49703;" onclick="clickGetName('searchName',1)"></div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>-->
        
	        <div class="index_navlist_li clearb">
	            <div class=" w1200 mauto h48">
	                <div id="ctl00_ContentPlaceHolder1_Top_index_top_nav" class="index_navlist_li_left"><ul>
						<li class="index_navlist_li_left_list"><a id="WEBTYPES1" href="web/index">首页</a></li>
						<li class="index_navlist_li_left_list"><a id="WEBTYPES2" href="web/trust">信托</a></li>
						<li class="index_navlist_li_left_list"><a id="WEBTYPES3" href="web/mislist">资管</a></li>
						<li class="index_navlist_li_left_list"><a id="WEBTYPES4" href="web/covenant">契约型</a></li>
						<li class="index_navlist_li_left_list"><a id="WEBTYPES5" href="web/privateEquitylist">股权投资</a></li>
						<li class="index_navlist_li_left_list"><a id="WEBTYPES6" href="web/setincreaseList">政府债</a></li>
						<li class="index_navlist_li_left_list"><a id="WEBTYPES7" href="web/offsetList">对冲•定增</a></li>
						<li class="index_navlist_li_left_list"><a id="WEBTYPES8" href="web/hotList" rel="nofollow">热销产品</a></li></ul>
					</div>
	            <div class="index_navlist_li_right">
	                    <ul>
	                        <li><a href="web/newsList">新闻资讯</a></li>
	                        <!-- <li><a href="web/teamList">核心团队</a></li> -->
	                        <li><a href="web/paiming">信托公司排名</a></li>
	                        <li><a href="web/aboutUsList">关于我们</a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
    
    
    <div iid="index_logo_fixed" class="clearb" style="display: block; top: 0px;">
    	<div id="index_top">
        <div class="w1200 mauto">
            <div class="fl lh30 c666666" style="color:#fff;">您好，欢迎来到环成金服-中国信托、资管、私募股权一站式咨询服务平台！</div>
            
            <div class="fr">
                <div class="fs14">
                	<% 
                		int messagecount=0;
	                	int syscount = 0;
	       				int productcount = 0;
	       				List productList = new ArrayList();
	       				List sysList = new ArrayList();
                		if(session.getAttribute("sessionWebUser")==null){ %>
	                	<div id="login_but" class="w50 fl lh30 borderline" style="text-align: right;"><a class="login" href="web/login" style="color:#fff;">登录&nbsp;&nbsp;</a></div>
	                    <div id="register_but" class="w50 fl lh30 borderline" style="text-align: left;"><a class="login" href="web/register" style="color:#fff;">&nbsp;注册</a></div>
                    <% }else{
                    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    	UserManageMent user = (UserManageMent)session.getAttribute("sessionWebUser");
                    	ServletContext sc = this.getServletContext();  
                   	    ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sc);  
                   		
                   	    UserManageMentService usermanagementService = (UserManageMentService) ac.getBean("usermanagementService");
                   		MessageManagementService messagemanagementService = (MessageManagementService) ac.getBean("messagemanagementservice");
                   		AppProductService appproductService = (AppProductService) ac.getBean("productService");
                   		AppProductStableService appProductStableService = (AppProductStableService) ac.getBean("productStableService");
          				//根据当前用户获取一周内未读消息
                   		List list = usermanagementService.findMessageByPhone(user.getU_phone());
           				if(list!=null&&!list.isEmpty()){
           					for(int i=0;i<list.size();i++){
           						Reading r = (Reading)list.get(i);
           						//"0"产品信息
           						if(r.getMessagetype().equals("0")){
           							String messageid =  r.getMessageid();
           							MessageManagement mm = (MessageManagement)messagemanagementService.findMessageById(messageid);
           							productList.add(mm);
           							productcount++;
           						}else{
           							String messageid =  r.getMessageid();
           							MessageManagement mm = (MessageManagement)messagemanagementService.findMessageById(messageid);
           							sysList.add(mm);
           							syscount++;
           						}
           				}
	           					messagecount = list.size();
	           				}
                    %>
                    	<script>
                    		function home(phone){
                    			$("#home_form").submit();
                    		}
                    	//使用ajax轮询，获取消息数
                    		function getcount(){
                    			$.ajax({
                                    url: "web/getSelfMessagesCount",
                                    type: "post",
                                    data: {"phone": '<%=user.getU_phone()%>'},
                                    dataType: "json",
                                    success: function(data) {
                                    	$("#productinfo_ul").empty();
										$("#sysinfo_ul").empty();
										$("#messagecount").html(data.all);
										$("#productcount").html(data.productcount);
										$("#syscount").html(data.syscount);
										var productlist = data.productList;
										for(var i=0;i<productlist.length;i++){
											if(productlist[i].subject.length>6){
												$("#productinfo_ul").append(""+
													"<li  class='second_ul_li'>"+
														"<a  class='second_ul_li_a' onclick=\"minusreading('<%=user.getU_phone()%>','"+productlist[i].id+"','"+productlist[i].productids+"','"+productlist[i].PRODUCTTYPE+"')\">["+
															productlist[i].sendtime.substr(0,10)+"] "+productlist[i].subject.substr(0,6)+"..."+
														"</a></li>");
											}else{
												$("#productinfo_ul").append(""+
														"<li  class='second_ul_li'>"+
															"<a  class='second_ul_li_a' onclick=\"minusreading('<%=user.getU_phone()%>','"+productlist[i].id+"','"+productlist[i].productids+"','"+productlist[i].PRODUCTTYPE+"')\">["+
																productlist[i].sendtime.substr(0,10)+"] "+productlist[i].subject+
															"</a></li>");
											}
										}
										var syslist = data.sysList;
										for(var i=0;i<syslist.length;i++){
											if(syslist[i].subject.length>6){
												$("#sysinfo_ul").append("<li class='second_ul_li'><a  class='second_ul_li_a' href='#'>["+syslist[i].sendtime.substr(0,10)+"] "+syslist[i].subject.substr(0,6)+"..."+"</a></li>");
											}else{
												$("#sysinfo_ul").append("<li class='second_ul_li'><a  class='second_ul_li_a' href='#'>["+syslist[i].sendtime.substr(0,10)+"] "+syslist[i].subject+"</a></li>");
											}
										}
                                    }
                                });
                    		}
                    		setInterval(getcount, 10000);
                    </script>
                    	<div  id="down1"  class="w70 fl lh30 borderline" style="cursor:pointer;  text-align: right;width:230px">
	                    	<span style="color:#fff;">
	                    		<%=user.getU_phone() %>
	                    	</span>
	                    	<img style="float: right" src="static/img/web/login/down.png">
	                    	<span id="messagecount" class="icon-car-count" style="font-size: 18px">
	                    		<%=messagecount%>
	                    	</span>
	                    	
                    	</div>
                    	<!-- 账号信息 -->
                    	<div id="list_account" class="list_account">
                    		<form id="home_form" method="post" action="/home">
                    			<input type="hidden" name="u_phone" value="<%=user.getU_phone() %>" />
                    		</form>
                    		<ul id="nav" style="padding-top:0;">
                    			<li id="account_home" onclick="home()" class="first_ul_li">
                    				账号管理
                    			</li>
                    			<li id="productinfo" class="first_ul_li">
                    				产品消息
                    				<span id="productcount" class="icon-car-count">
                    					<%=productcount%>
	                    			</span>
	                    			<ul id="productinfo_ul" class="second_ul">
	                    				<%if(productList!=null&&!productList.isEmpty()){
	                    					for(int i=0;i<productList.size();i++){
	                    						MessageManagement mm = (MessageManagement)productList.get(i);
	                    						if(appproductService.findByIdStr(mm.getProductids())!=null){
	                    						%>
	                    							<li class="second_ul_li" >
	                    								<a  class="second_ul_li_a" onclick="minusreading('<%=user.getU_phone() %>','<%=mm.getId() %>','<%=mm.getProductids()%>','1')">
	                    									[<%=sdf.format(sdf.parse(mm.getSendtime()))%>]&nbsp;<%=mm.getSubject().length()>6?mm.getSubject().substring(0,6)+"..." :mm.getSubject()%>
	                    								</a>
	                    							</li>
	                    						<%	
	                    						}else{
	                    						%>
	                    							<li class="second_ul_li">
	                    								<a  class="second_ul_li_a" onclick="minusreading('<%=user.getU_phone() %>','<%=mm.getId() %>','<%=mm.getProductids()%>','2')" >
	                    									[<%=sdf.format(sdf.parse(mm.getSendtime()))%>]&nbsp;<%=mm.getSubject().length()>6?mm.getSubject().substring(0,6)+"...":mm.getSubject() %>
	                    								</a>
	                    							</li>
	                    					
	     	               					<%}} }%>
									</ul>
	                    		</li>
	                    		
                    			<li id="sysinfo" class="first_ul_li">
                    				系统消息
                    				<span id="syscount" class="icon-car-count">
                    					<%=syscount%>
	                    			</span>
	                    			<ul id="sysinfo_ul" class="second_ul">
	                    				<%if(sysList!=null&&!sysList.isEmpty()){
	                    					for(int i=0;i<sysList.size();i++){
	                    						MessageManagement mm = (MessageManagement)sysList.get(i);
	                    				%>
	                    					<li class="second_ul_li">
	                    						<a class="second_ul_li_a" href="#">
	                    							[<%=sdf.format(sdf.parse(mm.getSendtime()))%>]&nbsp;<%=mm.getSubject().length()>6?mm.getSubject().substring(0,6)+"..." :mm.getSubject()+"..." %>
	                    						</a>
	                    					</li>
	                    					
	                    				<%} 
	                    				}%>
									</ul>
                    			</li>
                    		</ul>
                    	</div>
                    	<div class="w70 fl lh30 borderline" style="width:50px"><a href="web/logout" style="color:#fff;">退出</a></div>
                    <%}%>
                    
                    <div class="w25 fl topnav_tips_bd mr10 mt5" style="position:relative;">
                        <!--<div class="fl cpointer"><img src="static/img/web/img_topnav_weixin1.png"></div>-->
                        <div id="tips_bd" class="tips_bd " style=" width:140px; height:195px; border:1px solid #e1e1e1;background-color:#fff;position:absolute;top:30px;left:-60px;z-index:1001;">
                            <em class="arrow_up" style="width:17px;height:9px;margin-left:-9px;background:url(images/hd_arrow_1.png) no-repeat;position:absolute;top:-9px;left:70px;z-index:1002"></em>
                            <img src="static/img/web/index_weixin_code.png" width="140" height="140">
                            <p style=" width:120px; height:56px; background:#fff; margin:0px auto; line-height:24px;text-align:center;font-size:14px;color:#3D9FE1">深圳前海环成投资咨询有限公司</p>
                        </div>
                    </div>
<!--                    <div class="w70 fl lh30 borderline" ><a href="web/aboutUsList#href7" style="color:#fff;">联系我们</a></div>
                    <div class="w70 fl lh30 borderline" ><a href="web/aboutUsList" style="color:#fff;">加入我们</a></div>
-->                    
                    <div class="w90 fl lh30 borderline" ><a href="web/financing" style="color:#f49703;">融资服务咨询</a></div>
                </div>
            </div>
        </div>
    </div>


<!-- logo -->
    <div id="index_logo" class="clearb">
        <div class="index_logo_li">
            <div class="w1200 mauto">
                <div class="h24"></div>
                <div>
                    <div class="fl"><a href=""><img src="static/img/web/img_index_logo_sign.png" alt="logo"></a></div>
                    <!--<div class="fl ml20"><img src=""></div>-->
                    
                    <div class="w385 h44" style=" margin-left:480px;"><div class="fr ml5" style=" margin-top:5px"><img src="static/img/web/img_index_top_tel1.png" alt="金服电话"></div>
                        <div class="h8"></div>
                        <div class=" w380 h40 lh40 fs14" style=" border:2px solid #f49703;">
                            <div class=" w75 h40 fl">
                                <dl class="l-select fl">
						        <dt class="l-selectdt"><span class="l-selectdt-span">综合▼</span><i></i></dt>
						        	<dd class="l-selectdd" style="display:none;">
							        <p>综合</p>
							        <p>信托产品</p>
							        <p>资管产品</p>
							        <p>契约产品</p>
							        <p>股权投资</p>
							        <p>政府债产品</p>
							        <p>对冲•定增</p>
							        <!-- <p>新闻资讯</p> -->
						        </dd>
					            </dl>
                            </div>
                            <div class=" w220 h40 fl ml10"><input type="text" id="searchName1" class=" w220 h40 lh39 c999999" placeholder="请输入关键字"></div>
                            <div class=" w65 h40 fr"><input type="button" class=" w65 h40 lh40 fs16" value="搜索" style=" color:#fff; background:#f49703;" onclick="clickGetName('searchName1')" ></div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <div class="index_navlist_li clearb">
            <div class=" w1200 mauto h48">
                <div id="ctl00_ContentPlaceHolder1_Top_index_top_nav" class="index_navlist_li_left"><ul>
					<li class="index_navlist_li_left_list"><a id="WEBTYPE1" href="web/index">首页</a></li>
					<li class="index_navlist_li_left_list"><a id="WEBTYPE2" href="web/trust">信托</a></li>
					<li class="index_navlist_li_left_list"><a id="WEBTYPE3" href="web/mislist">资管</a></li>
					<li class="index_navlist_li_left_list"><a id="WEBTYPE4" href="web/covenant">契约型</a></li>
					<li class="index_navlist_li_left_list"><a id="WEBTYPE5" href="web/privateEquitylist">股权投资</a></li>
					<li class="index_navlist_li_left_list"><a id="WEBTYPE6" href="web/setincreaseList">政府债</a></li>
					<li class="index_navlist_li_left_list"><a id="WEBTYPE7" href="web/offsetList">对冲•定增</a></li>
					<li class="index_navlist_li_left_list"><a id="WEBTYPE8" href="web/hotList" rel="nofollow">热销产品</a></li></ul>
				</div>
            <div class="index_navlist_li_right">
                    <ul>
                        <li><a href="web/newsList">新闻资讯</a></li>
                       <!--  <li><a href="web/teamList">核心团队</a></li> -->
                        <li><a href="web/paiming">信托公司排名</a></li>
                        <li><a href="web/aboutUsList">关于我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- 弹框 -->
  <div id="EjectContact_jquery-yuyue">
    <div id="EjectContact_jquery-overlay" style="width: 1906px; height: 3988px; display: none;">
    </div>
    <div id="EjectContact_jquery-lightbox" style="display: none;">
        <div id="EjectContact_lightbox-container-image-data-box">
            <div class="EjectContact_lightbox-container_box_left">
                立即预约</div>
            <div class="EjectContact_lightbox-container_box_right">
                <a id="EjectContact_lightbox-secNav-btnClose" >
                    <img onclick="clous()" style="cursor: pointer;" src="static/img/web/lightbox-btn-close.png">
                </a>
            </div>
        </div>
        <div id="EjectContact_lightbox-container-image-box">
            <div class=" h15"></div>
            <div>
                <div style="width: 60%; margin: 0 auto; height: 36px; font-size:16px; line-height: 36px; text-align: left; color:#333333;">
                    姓名：</div>
                <div style="width: 60%; margin: 0 auto;">
                    <input type="text" id="LCSYYNAME" style="border: 1px solid #f49703; width: 100%; height: 36px; color:#999999;
                        -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" placeholder="请输入您的姓名"></div>
                <div style="width: 60%; margin: 5px auto 0px; height: 36px; font-size:16px; line-height: 36px; text-align: left; color:#333333;">
                    手机号：</div>
                <div style="width: 60%; margin: 0 auto;">
                    <input type="text" id=LCSYYPHONE style="border: 1px solid #f49703; width: 100%; color:#999999;
                        height: 36px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" placeholder="请输入您的手机号"></div>
                        <div style="width: 60%; margin: 5px auto 0px; height: 36px; font-size:16px; line-height: 36px; text-align: left; color:#333333;">
                    留言：</div>
                <div style="width: 60%; margin: 0 auto;">
                    <input type="text" id="LCSYYLY" style="border: 1px solid #f49703; width: 100%; color:#999999;
                        height: 36px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" placeholder="请输入您想说的话"></div>
                <div style="width: 60%; margin: 20px auto 0px;">
                    <div style="background: #f49703; border: none; width: 70%; height: 36px; margin: 0 auto; line-height: 36px;
                        color: #fff; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; cursor:pointer;
                        margin-top: 20px;" onclick="LCSYYTJ()">
                        立即预约</div>
                </div>
                <div class=" h54 fs14 lh24 mt30 tac c666666">想了解更多产品详细资料<br>请拨打全国免费咨询热线：<span class="cff6c00 fwb fs18">400-009-6880</span></div>
            </div>
        </div>
    </div>
</div>
    <!-- 代码 开始 -->
<div id="side-bar" class="side-pannel ">
    <!-- <div><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1103508939&site=qq&menu=yes"><img src="static/img/web/zixun.jpg"></a></div> -->
    <div id="goWeiXin" class=" mt5">
        <img src="static/img/web/img_index_float_zcweixin.jpg" width="100%">
        <div class="tips_bd" style=" width:140px; height:140px; border:1px solid #e1e1e1;background-color:#fff;position:absolute;top:-40px;left:-152px;z-index:1001;">
            <em class="arrow_up" style="width:17px;height:17px;margin-left:70px;background:url(static/img/web/img_index_float_zcweixin.jpg) no-repeat -8px;position:absolute;top:62px;left:70px;z-index:1000"></em>
            <img src="static/img/web/index_weixin_code.png" width="140" height="140">
        </div>
    </div>
    
    <div class=" mt5"><a  target="_blank"><img onclick="yuyue()" src="static/img/web/img_index_float_wjdc.jpg" width="100%"></a></div>
    <div class="side-bar"><a href="javascript:window.scrollTo( 0, 0 );" class="gotop" ><s class="g-icon-top" style='background-image: url(static/img/web/img_index_float_gotop.jpg);'></s></a></div>
</div>
    <script type="text/javascript">
    $(function () {
        //精致优选产品推荐
        $(".index_navlist_li .index_navlist_li_left_list").each(function () {
            $(this).mouseover(function () {
                $(this).addClass("index_navlist_li_left_list_over").siblings("li").removeClass("index_navlist_li_left_list_over");
            });
            $(this).mouseout(function () {
                $(this).removeClass("index_navlist_li_left_list_over");
            });
        });
        $(".index_navlist_fixed_li .index_navlist_li_left_list").each(function () {
            $(this).mouseover(function () {
                $(this).addClass("index_navlist_li_left_list_over").siblings("li").removeClass("index_navlist_li_left_list_over");
            });
            $(this).mouseout(function () {
                $(this).removeClass("index_navlist_li_left_list_over");
            });
        });

        // 搜索框前产品下拉
        $(".l-selectdt").click(function () {
            if ($(".l-selectdd").is(":visible") == false) {
                $(".l-selectdd").show();
                $(".l-select").addClass("cur");
            } else {
                $(".l-selectdd").hide();
                $(".l-select").removeClass("cur");
            }
        });

        $(".l-selectdd p").hover(function () {
            $(this).addClass("on").siblings('').removeClass("on")
        });

        $(".l-selectdd p").click(function () {
        	console.log("3");
            var btxt = $(this).text();
            $(".l-selectdt-span").html(btxt);
            $(".l-selectdd").hide();
            $(".l-select").removeClass("cur");
            var PRODUCTTYPES = 0;
            var HTYPE = 0;
			if(btxt == "综合"){
				PRODUCTTYPES = 1;
				HTYPE = 0;
			}else if(btxt == "信托产品"){
				PRODUCTTYPES = 1;
				HTYPE = 1;
			}else if(btxt == "资管产品"){
				PRODUCTTYPES = 1;
				HTYPE = 2;
			}else if(btxt == "契约产品"){
				PRODUCTTYPES = 1;
				HTYPE = 3;
			}else if(btxt == "股权投资"){
				PRODUCTTYPES = 2;
				HTYPE = 1;
			}else if(btxt == "政府债产品"){
				PRODUCTTYPES = 2;
				HTYPE = 2;
			}else if(btxt == "对冲•定增"){
				PRODUCTTYPES = 2;
				HTYPE = 3;
			}
			$("#PRODUCTTYPES").val(PRODUCTTYPES);
			$("#HTYPE").val(HTYPE);
        });

        // 隐藏的搜索框前产品下拉
        $(".l-selectdt_fixed").click(function () {
            if ($(".l-selectdd_fixed").is(":visible") == false) {
                $(".l-selectdd_fixed").show();
                $(".l-select_fixed").addClass("cur");
            } else {
                $(".l-selectdd_fixed").hide();
                $(".l-select_fixed").removeClass("cur");
            }
        });

        $(".l-selectdd_fixed p").hover(function () {
            $(this).addClass("on").siblings('').removeClass("on")
        });

        $(".l-selectdd_fixed p").click(function () {
            var btxt = $(this).text();
            $(".l-selectdt-span_fixed").html(btxt);
            $(".l-selectdd_fixed").hide();
            $(".l-select_fixed").removeClass("cur");
        });

        // 顶部菜单导航
        $(window).scroll(function (event) {
            var _top = parseInt($(window).scrollTop());
            if (_top > 250) {
                $("#index_logo_fixed").css({ top: '0px' }).css({ display: 'block' });
            } else {
                $("#index_logo_fixed").css({ top: '-70px' }).css({ display: 'none' });
            };
        });
    })
    
    //输入框的enter事件
	$('#searchName').bind('keydown',function(event){
		if(event.keyCode == "13") {
        	clickGetName('searchName');
    	}
	}); 
	$('#searchName1').bind('keydown',function(event){
		if(event.keyCode == "13") {
        	clickGetName('searchName1');
    	}
	});   
	//搜索
    function clickGetName(str) {
    	var NAME = $("#"+str).val();
    	if (!NAME) {
            alert("请输入关键字!");
            return;
        }
        $("#NAME").val(NAME);
        $("#userForm").submit();
	}

					function clickGetNamefixed() {
						var typeSelect = $(".l-selectdt-span_fixed").html();
						var searchKeyword = $("#searchKeyword_fixed").val();
						if (searchKeyword == '请输入关键字') {
							alert("请输入关键字!");
						} else {
							var url = "Search_List.aspx?Oid=1" + "&typeSelect="
									+ typeSelect + "&searchKeyword="
									+ searchKeyword;
							location.href = url;
						}
					}
					$("#searchKeyword")
							.keydown(
									function(event) {
										var e = $.event.fix(event);
										if (e.keyCode == 13) {
											var key = $("#searchKeyword").val();
											if (e.target == $("#searchKeyword")[0]) {
												if (key != ''
														&& typeof (key) != "undefined") {
													var typeSelect = $(
															".l-selectdt-span_fixed")
															.html();
													var url = "Search_List.aspx?Oid=1"
															+ "&typeSelect="
															+ typeSelect
															+ "&searchKeyword="
															+ key;
													location.href = url;
													//window.location.href = '/Search_' + encodeURI(key) + ".html";
													return false;
												} else {
													return false;
												}
											}
										}
									})
					$("#searchKeyword_fixed")
							.keydown(
									function(event) {
										var e = $.event.fix(event);
										if (e.keyCode == 13) {
											var key = $("#searchKeyword_fixed")
													.val();
											if (e.target == $("#searchKeyword_fixed")[0]) {
												if (key != ''
														&& typeof (key) != "undefined") {
													var typeSelect = $(
															".l-selectdt-span_fixed")
															.html();
													var url = "Search_List.aspx?Oid=1"
															+ "&typeSelect="
															+ typeSelect
															+ "&searchKeyword="
															+ key;
													location.href = url;
													//window.location.href = '/Search_' + encodeURI(key) + ".html";
													return false;
												} else {
													return false;
												}
											}
										}
									})
				</script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?7454fdb7778367feccab57c1c3719263";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<script type="text/javascript">
	$(function(){	
		$("#WEBTYPES").children().children().removeClass();
		var ID = "WEBTYPE"+$("#WEBTYPE").val();
		$("#"+ID).addClass("cur");
		ID = "WEBTYPES"+$("#WEBTYPE").val();
		$("#"+ID).addClass("cur");
	});
	function yuyue(){
    	$('#EjectContact_jquery-lightbox').show(); 
    	$('#EjectContact_jquery-overlay').show(); 
    }
    
    function clous(){
    	$("#EjectContact_jquery-overlay").hide();
    	$('#EjectContact_jquery-lightbox').hide();
    }
    function LCSYYTJ(){  
    	//   
		var data={};
		//data.FINANCIALPLANNERID = $("#FINANCIALPLANNERID").val();
		  
		if (!$("#LCSYYNAME").val().trim()) { 
			alert("请输入您的姓名！"); 
			$("#LCSYYNAME").focus(); 
			return false; 
		}
		data.NAME = $("#LCSYYNAME").val();
		if (!$("#LCSYYPHONE").val().match(/^(((1[0-9]{2})|159|153)+\d{8})$/)) {
			alert("手机号码格式不正确！"); 
			$("#LCSYYPHONE").focus(); 
			return false; 
		}
		data.PHONE = $("#LCSYYPHONE").val();
		if($("#LCSYYLY").val()){
			data.COMMENTS = $("#LCSYYLY").val();
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
</script>
