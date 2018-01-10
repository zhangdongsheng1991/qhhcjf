<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>  
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page import="com.fh.util.PageData,com.fh.service.system.friendlylink.FriendlyLinkService,java.util.List,java.util.ArrayList"%>
<link rel="stylesheet" type="text/css" href="static/css/web/main.css">
<!-- 底部页 -->
<!-- footer -->

	

<div class="clearb">
    <div class=" h130 btse1e1e1 bgffffff">
        <div class=" w1200 mauto">
            <div class="fl disblock cpointer">
                <img src="static/img/web/img_trustdetail_procedure_01.png"></div>
            <div class="fl disblock cpointer">
                <img src="static/img/web/img_trustdetail_procedure_02.png"></div>
            <div class="fl disblock cpointer">
                <img src="static/img/web/img_trustdetail_procedure_03.png"></div>
            <div class="fl disblock cpointer">
                <img src="static/img/web/img_trustdetail_procedure_04.png"></div>
            <div class="fl disblock cpointer">
                <img src="static/img/web/img_trustdetail_procedure_05.png"></div>
        </div>
    </div>
    
    </div>
    <div style="background: #333333;">
        <div class=" w1200 mauto">
            <div class="h40">
            </div>
           <div style="background: #333333;">
        <div class=" w1200 mauto">
            <div class="h40">
            </div>
            <div style="height: 140px; border-bottom:1px solid #4b4b4b;">
                
                
               
               
                <div class="fr" style="width: 365px;">
                   
                    
                    <div class=" h36 lh36">
                        <div class="fl h36">
                            <img src="static/img/web/img_index_footer_tel.jpg" width="36" height="36"></div>
                        <div class="fl fs14 ml10 h36 c999999">
                           资讯热线：</div>
                        <div class="fl h36 fwb ml10 fs18" style="color: #b5b5b5;">
                           400-0096-880</div>
                    </div>
                    <div class=" h10 clearb">
                    </div>
                    <div class=" h36 lh36">
                        <div class="fl h36">
                            <img src="static/img/web/img_index_footer_email.jpg" width="36" height="36"></div>
                        <div class="fl fs14 ml10 h36 c999999">
                            E-mail: huanchengjinfu@163.com</div>
                    </div>
					<div class=" h10 clearb">
                    </div>
                    <!--<div class=" h36 lh36">
                        <div class="fl h36">
                            <img src="static/img/web/img_index_footer_link.png" width="36" height="36"></div>
                        <div class="fl fs14 ml10 h36 c999999">
                           友情链接：</div>
                        <div class="fl fs14 ml10 h36 c999999" style="color: #b5b5b5;">
                           <a href="http://www.jiazeh.com/" target="_blank" >深圳嘉泽汇资产管理有限公司 </a>
						   </div>
                    </div>-->
					<div class=" h15 clearb">
                    </div>
                     
                </div>
                 <div class="fl" style="width: 340px;">
                   
                    <div class=" w250 h80 mauto">
                        <img src="static/img/web/img_index_footer_logo.jpg" ></div>
                </div>	
                 <div class="fl" style="width: 340px; margin-left:100px">
                    
                    <div class="fl" id="footer_tips_bd">
                            <div>
                                <div><img src="static/img/web/img_index_footer_weixin.jpg" width="65" height="65"></div>
                                <div class=" h36 lh36 tac fs14 c999999">环成微信</div>
                            </div>
                            <div id="tips_bd" class="tips_bd " style=" width:140px; height:175px; border:1px solid #e1e1e1;background-color:#fff;position:absolute;top:80px;left:-38px;z-index:1001;">
                                <em class="arrow_up" style="width:17px;height:9px;margin-left:-9px;background: url(static/img/web/index_weixin_code.png) no-repeat;position:absolute;top:-9px;left:70px;z-index:1002"></em>
                                <img src="static/img/web/index_weixin_code.png" width="140" height="140">
                                <p style=" width:120px; height:36px; background:#fff; margin:0px auto; line-height:24px;text-align:center;font-size:14px;color:#3D9FE1">环成金服微信</p>
                            </div>
                        </div>
                        <div class="fl ml40">
                            <div>
                                <a href="web/aboutUsList">
                                    <img src="static/img/web/img_index_footer_aboutus.jpg" width="65" height="65"></a></div>
                            <div class=" h36 lh36 tac fs14">
                                <a href="" class="c999999" rel="nofollow">关于环成</a></div>
                        </div>
                        <div class="fl ml40">
                            <div>
                                <a href="web/aboutUsList">
                                    <img src="static/img/web/img_index_footer_address.jpg" width="65" height="65"></a></div>
                            <div class=" h36 lh36 tac fs14">
                                <a href="" class="c999999" rel="nofollow">公司地址</a></div>
                        </div>
                </div>
                
            </div>
         
           <div style="height: 60px; border-bottom:1px solid #4b4b4b;">

            	<ul style="line-height:60px; color:#999999; ">
                	<li style="float:left; margin:0 10px; "> 友情链接： </li>
                    
                	<li style="float:left; margin:0 10px; ">
                    	<a style="color:#999999;" href="http://www.jiazeh.com/" target="_blank" >深圳嘉泽汇资产管理有限公司 </a>
                    </li>
                    <%
	                    ServletContext sc = this.getServletContext();  
	               	    ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sc);
                    	FriendlyLinkService friendlyLinkService = (FriendlyLinkService) ac.getBean("friendlylinkService");
                    	String temp = "";
                    	List<PageData> listall = new ArrayList<PageData>();
                    	try{
                    		 listall = friendlyLinkService.listAll(temp);
                    	}catch(Exception e){
                    		e.printStackTrace();
                    	}
                    	for(int i=0;i<listall.size();i++){
                    		PageData pd = listall.get(i);
                    %>
                    	<li style="float:left; margin:0 10px; ">
                    		<a style="color:#999999;" href="<%=pd.getString("WEBADDRESS")%>" target="_blank" ><%=pd.getString("WEBSITENAME")%></a>
                    	</li>
                    <%		
                    	}
                    %>


                </ul>	

            </div>
         
            <div class=" clearb" style="">
                <div class="h40">
            </div>

                <div class=" w290 h12 mauto" style=" font-size:12px;">
                    <ul>
                        <li class=" fl w70 h12 lh12 tac"><a href="web/aboutUsList" class="c999999">联系我们</a></li>
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="web/aboutUsList" class="c999999">加入我们</a></li>
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="" class="c999999">免责声明</a></li>
                        
                        
                        <li class=" fl w70 h12 lh12 tac bls999999"><a href="http://www.qhhcjf.com/sitemap.html" target="_blank" class="c999999">网站地图</a></li>
                    </ul>
                </div>
            </div>
            <div class=" h10 clearb">
            </div>
            <div><p class=" tac lh24 c999999" style=" font-size:12px;">
                ©2017 www.qhhcjf.com 深圳前海环成投资咨询有限公司 版权所有 
                <a href="" class="c999999" target="_blank">粤ICP备 17043698号-1</a>
                <a target="_blank" href="" class=" ml10"><img src="static/img/web/img_sign_gonganbeian.png"><span class="ml5 c999999">粤公网安备 44030702000235号</span></a>
                <a id="___szfw_logo___" href="" target="_blank" class=" ml10"><img src="static/img/web/cert.png" border="0"></a>
		 </p></div>
            <div id="ctl00_Navigation_index_website_server" style=" font-size:12px;"><div><p class=" tac lh24 c999999">本站项目信息(信托理财产品、资管理财产品、信托理财投资产品)来自于知名信托公司等提供给环成金服的资料，信托、资管公司等对其提供信息的真实可靠性和完整准确性负责。信托理财、资管理财产品预约的投资者请仔细阅读理财产品的法律文件，了解信托资管理财产品的风险和收益特征等。投资者应根据自身资产状况和风险承受能力选择知合自己的理财产品进行投资。环成金服提供的宣传材料仅供投资者参考，不构成环成金服的任何推荐或者投资建议，信托资管理财投资者应审慎决策、独立承担风险。</p></div>
</div>
            <div class="clearb">
            </div>
        </div>
        <div class=" h40 clearb">
        </div>
    </div>
</div>


<!--End 正文主体-->
<div id="topic-footer" style="bottom: 0px; z-index:99;"> 
    <span class="u-tpbtn">点击展开</span>
    <div class="tp-bg">
    	<input type="hidden" name="info[title]" id="yuyue_zhuang_ti" value="">
    	<div class="u-tpbox yuyue_not_longin" style="display: none;">
            <div class="fl">
      		    <div class="u-tpleft"> <strong>额度有限，欲约从速</strong><br>
        	    <i class="i-star"></i><i class="u-tp-tel">400-0096-880</i><i class="i-star"></i> 
                </div>
            </div>
            <div class="fl w710">
                <div class=" w710">
		            <div class="fl" style=" float:left;"><input type="text" name="请输入您的姓名" id="UserName" class="tp-ipt user-ipt" value="请输入您的姓名" onblur="if (value ==&#39;&#39;){value=&#39;请输入您的姓名&#39;}" onfocus="if (value ==&#39;请输入您的姓名&#39;){value =&#39;&#39;}"></div>
		            <div class="fl" style=" float:left;"><input type="text" class="tp-ipt phone-ipt" name="请输入您的手机号" id="ContactMobile" value="请输入您的手机号" onblur="if (value ==&#39;&#39;){value=&#39;请输入您的手机号&#39;}" onfocus="if (value ==&#39;请输入您的手机号&#39;){value =&#39;&#39;}"></div>
		            
                    <div class="tp-btn fl" id="yuyue_submit" onclick="zixun_click()">预约领取红包</div>
                </div>
                <div class=" clearb">（火爆预约中，请留下您的联系方式，专业理财经理将尽快联系您） </div>
            </div>
      	</div>
		<div class="u-tpbox2">环成金服 您终身信赖的财富管家 | 400-0096-880</div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        function hideBookbox() {
            $('.u-tpbox').hide();
            $('#topic-footer').css('bottom', 0);
            $('.u-tpbtn').text('点击展开');
        }
        function openBookbox() {
            $('.u-tpbox').slideDown(200);
            $('#topic-footer').css('bottom', '-36px');
            $('.u-tpbtn').text('点击关闭');
        }
        $('.a-book').click(function () {
            var yuyueTitle = $(this).attr('_title');
            $('#yuyue_zhuang_ti').val(yuyueTitle);
            if ($('.u-tpbtn').text() == '点击关闭') {
                hideBookbox();
            }
            openBookbox();
            //$('#UserName').focus();
            setTimeout(function () {
                $('#UserName').focus();
            }, 500)
        })
       /*  hideBookbox(); */
    });
</script>
<script type="text/javascript">
    $(function () {
        var _foot = $('#topic-footer'), _con = $('.u-tpbox');
        $('.u-tpbtn').click(function () {
            text = $(this).text();
            if (text == '点击关闭') {
                $(this).text('点击展开');
                _con.slideUp();
                _foot.css('bottom', 0);
            } else {
                $(this).text('点击关闭');
                _con.slideDown();
                _foot.css('bottom', '-36px');
            }
        });
        $("#UserName").val("请输入您的姓名");
        $("#ContactMobile").val("请输入您的手机号");
    })

    function zixun_click() {
        var UserName = $("#UserName").val();
        var ContactMobile = $("#ContactMobile").val();
     /*    if (checkUsername()) { */
            if (ClickBtnLogin() == true) {
                //ajax开始
                $.ajax({
                    type: "Post",
                    url: "<%=basePath%>web/cpyy",
                    data: {
                        NAME: UserName,
                        PHONE: ContactMobile
                    },
                    cache: false,
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        if (data.result == '00') {
                            alert("预约提交失败!");
                        }
                        else if (data.result == '01') {
                            alert("预约提交成功!");
                            $("#UserName").val("请输入您的姓名");
                            $("#ContactMobile").val("请输入您的手机号");
                            $('.u-tpbtn').text('点击展开');
                            $('.u-tpbox').hide();
                            $('#topic-footer').css('bottom', 0);
                        }
                    },
                    error: function () {

                    }
                })//end ajax
            }
            else {
            }
       /*  }
        else {
            alert("请输入中文、数字和英文!");
        } */
    }

    function checkUsername() {
        var strBool = true;
        //正则表达式
        var reg = new RegExp("^[a-zA-Z\d\u4E00-\u9FA5]+$");
        //获取输入框中的值
        var username = document.getElementById("UserName").value;
        //判断输入框中有内容
        if (!reg.test(username)) {
            strBool = false;
            return strBool;
        }
        else
        { return true; }
    }

    function ClickBtnLogin() {
        var UserName = $("#UserName").val();
        var ContactMobile = $("#ContactMobile").val();
        if (UserName == '' || UserName == '请输入您的姓名') {
            alert("请输入您的姓名!");
            $("#UserName").focus();
            return false;
        }
        if (ContactMobile == '') {
            alert("请输入您的手机号码!");
            $("#ContactMobile").focus();
            return false;
        }
        else {
	        if (!ContactMobile.match(/^(((1[0-9]{2})|159|153)+\d{8})$/)) {
				alert("手机号码格式不正确！"); 
				$("#EjectContact_ContactMobile").focus(); 
				return false; 
			}
			return true;
        }
    }

    function isMobileNO(obj) {
        //var tel = $(obj).val();
        var myreg = /^1[3|4|5|8][0-9]\d{4,8}$/;
        if (myreg.test(obj)) {
            return true;
        }
        else {
            return false;
        }
    }
</script>
<!-- <script type="text/javascript">
	$(function(){
		$("#WEBTYPES").children().children().removeClass();
		var ID = "WEBTYPE"+$("#WEBTYPE").val();
		$("#"+ID).addClass("cur");
	});
</script>
 -->