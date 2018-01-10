<%@page pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
        <meta name="format-detection" content="telephone=no, email=no"/>
 		<title>最新_高收益信托产品查询 _环成金服</title>
        <link rel="stylesheet" type="text/css" href="../../static/css/web/app/index_carousel/trust_search/trust_search.css">
       	<link href="../static/css/web/app/style.css" rel="stylesheet" type="text/css" />
       	<link rel="stylesheet" href="../static/css/web/app/test.css">
         <link rel="stylesheet" href="../static/css/web/app/index.css" type="text/css">  
        <script src="../../static/js/jquery-1.7.2.js"></script>
        <script src="../../static/js/web/app/index_carousel/trust_search/trust_search.js"></script>
        <script>
            var _hmt = _hmt || [];
            (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?d9ff309f16334bf8a78bc7731c67977c";
                //pc和h5的统计代码是不一致的
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
		
    </head>
    
    
    <body>
    	<div id="select_pop-by" class="pop-by" style="display: none;"></div>
    	<header class="m_index_header2">
		    <a href="javascript:history.go(-1)">
		        <div class="m_index_header_back" class="js-slideout-toggle"></div>
		    </a>
		     <a style=" float:right; margin-right:10px; margin-top:11px"><img  class="js-slideout-toggle" src="../static/img/web/app/ann.png" width="25"></a>
		<div class="m_index_header_logo">高收益信托产品查询</div>
		</header>
        <div class="wrap" style="margin-top: 44px">
            <div class="banner">
                <img src="../static/img/web/app/index_carousel/trust_search/banner.png"/>
            </div>
            <div class="pt1">
                <article>
                    <img src="../static/img/web/app/index_carousel/trust_search/pic1.png"/>
                </article>
            </div>
            <ul class="select">
                <nav class="select_Li">
                    <span>认购起点</span>
                    <li class="rengou">
                        <article class="article_active" v="不限">不限</article>
                        <article v="50万-100万(含)">50万-100万（含）</article>
                    </li>
                    <li class="rengou">
                        <article v="101万-300万(含)">100万-300万（含）</article>
                        <article v="301万+">300万以上</article>
                    </li>
                </nav>
                <nav class="select_Li2">
                    <span>产品期限</span>
                    <li class="qixian">
                        <article class="article_active" v="不限">不限</article>
                        <article v="0-11">12个月以内</article>
                        <article v="12">12个月</article>
                    </li>
                    <li class="qixian">
                        <article v="13-23个月">12-23个月</article>
                        <article v="24个月">24个月</article>
                        <article v="24+个月">24个月以上</article>
                    </li>
                </nav>
                <nav class="select_Li3">
                    <span>预购收益</span>
                    <li class="yugou">
                        <article class="article_active" v="不限">不限</article>
                        <article v="0%-7%">7%以下</article>
                        <article v="7%-7.9%">7-7.9%</article>
                        <article v="8%-8.9%">8-8.9%</article>
                    </li>
                    <li class="yugou">
                        <article v="9%-9.9%">9-9.9%</article>
                        <article v="10%+">10%以上</article>
                        <article v="浮动">浮动收益</article>
                    </li>
                </nav>
                <nav class="select_Li4">
                    <span>付息方式</span>
                    <li class="fuxi">
                        <article class="article_active" v="不限">不限</article>
                        <article v="按季付息">按季付息</article>
                        <article v="半年付息">半年付息</article>
                    </li>
                    <li class="fuxi">
                        <article v="按年付息">按年付息</article>
                        <article v="到期付息">到期付息</article>
                    </li>
                </nav>
                <nav class="select_Li5">
                    <span>投资领域</span>
                    <li class="lingyu">
                        <article class="article_active" v="不限">不限</article>
                        <article v="工商企业类">工商企业类</article>
                        <article v="金融市场类">金融市场类</article>
                    </li>
                    <li class="lingyu">
                        <article v="基础设施类">基础设备类</article>
                        <article v="房地产类">房地产类</article>
                        <article v="其他">其他</article>
                    </li>
                </nav>
                <div id="kscz"  class="btn chaxun" style="margin-top: 40px;" consultType="收益查询">开始查找</div>
            </ul>
          
            <div class="pt3">
                <div class="tt">
                    <img src="../static/img/web/app/index_carousel/trust_search/pic8.png"/>
                </div>
                <article id="pzfa" class="" consultType="配置方案">
                    <img src="../static/img/web/app/index_carousel/trust_search/pic9.png"/>
                    
                    <select id="pzfa_type">
                        <option value='0'>保守型投资者</option>
                        <option value='1'>激进型投资者</option>
                        <option value='2'>稳定型投资者</option>
                    </select>
                    
                    <input id="pzfa_name" style="text-indent:2em;" type="text" placeholder="请输入您的姓名">
                    <input id="pzfa_phone" style="text-indent:2em;" type="text" placeholder="请输入您的手机号码">
                    <input class="btn" style="text-indent:0px" type="button" value="免费领取">
                    
                    
                </article>
                
            </div>
            
          <!--公司部分-->  
             <div class="pt4">
                <div class="tt">
                    <img src="../static/img/web/app/index_carousel/trust_search/pic4.png"/>
                </div>
                <!--1-->
                <article class="gongsi_box" style="background:#f49293;" >
<!--                	<img class="gongsilogo" src="../static/img/web/app/index_carousel/trust_search/gongsilogo1.png"/>
-->                	<div class="gongsi_1" style="font-size:24px; font-weight:700;">中信信托</div>
                    <div class="gongsi_1">股东背景：金融机构控股</div>
                	<div class="gongsi_1">注册资本：1000000.00万</div>
                    <div class="gongsi_1">管理规模：7297.0亿 </div>
                    <img class="jiantou" src="../static/img/web/app/index_carousel/trust_search/jiantouUp.png"/>
                </article>
                <!--产品部分-->
                <article class="chanping_box current" style="background:#f49293;" >
                	<div class="chanping_1">
                    	<div class="chanping_tit">民生16号</div>
                    	<ul class="chanping_con">
                        	<li>9.0% <span>预计年化收益</span></li>
                        	<li>100.00万  <span>投资起点</span></li>
                        	<li>24个月  <span>投资期限</span></li>
                        </ul>
                        <div id="cpzx" class="btn cpzx"  consulttype="产品咨询">立即咨询</div>
                    </div>
                    
                    <div class="chanping_1">
                    	<div class="chanping_tit">民生34号</div>
                    	<ul class="chanping_con">
                        	<li>7.0% <span>预计年化收益</span></li>
                        	<li>100.00万  <span>投资起点</span></li>
                        	<li>24个月  <span>投资期限</span></li>
                        </ul>
                       <div id="cpzx" class="btn cpzx"  consulttype="产品咨询">立即咨询</div>
                    </div>
                    
                    <div class="chanping_1">
                    	<div class="chanping_tit">中信佳源</div>
                    	<ul class="chanping_con">
                        	<li>9.8%<span>预计年化收益</span></li>
                        	<li>100.00万  <span>投资起点</span></li>
                        	<li>24个月  <span>投资期限</span></li>
                        </ul>
                        <div id="cpzx" class="btn cpzx"  consulttype="产品咨询">立即咨询</div>
                    </div>
                </article>
                
                <!--2-->
                <article class="gongsi_box" style="background:#4fb3d7;" >
<!--                	<img class="gongsilogo" src="../static/img/web/app/index_carousel/trust_search/gongsilogo1.png"/>
-->                	<div class="gongsi_1" style="font-size:24px; font-weight:700;">中融信托</div>
                    <div class="gongsi_1">股东背景：中央企业控股</div>
                	<div class="gongsi_1">注册资本：600000.00万</div>
                    <div class="gongsi_1">管理规模：4785.0亿 </div>
                    <img class="jiantou" src="../static/img/web/app/index_carousel/trust_search/jiantouDown.png"/>
                </article>
				
                 <article class="chanping_box" style="background:#4fb3d7;" >
                	<div class="chanping_1">
                    	<div class="chanping_tit">融雅35号</div>
                    	<ul class="chanping_con">
                        	<li>10.2% <span>预计年化收益</span></li>
                        	<li>100.00万  <span>投资起点</span></li>
                        	<li>12个月  <span>投资期限</span></li>
                        </ul>
                        <div id="cpzx" class="btn cpzx"  consulttype="产品咨询">立即咨询</div>
                    </div>
                    
                    <div class="chanping_1">
                    	<div class="chanping_tit">立泽1号</div>
                    	<ul class="chanping_con">
                        	<li>7.2% <span>预计年化收益</span></li>
                        	<li>100.00万  <span>投资起点</span></li>
                        	<li>12个月  <span>投资期限</span></li>
                        </ul>
                       <div id="cpzx" class="btn cpzx"  consulttype="产品咨询">立即咨询</div>
                    </div>
                    
                    <div class="chanping_1">
                    	<div class="chanping_tit">鑫瑞1号</div>
                    	<ul class="chanping_con">
                        	<li>8.0% <span>预计年化收益</span></li>
                        	<li>300.00万  <span>投资起点</span></li>
                        	<li>12个月  <span>投资期限</span></li>
                        </ul>
                       <div id="cpzx" class="btn cpzx"  consulttype="产品咨询">立即咨询</div>
                    </div>
                </article>
                
                <!--3-->
                <article class="gongsi_box" style="background:#e9c555;" >
<!--                	<img class="gongsilogo" src="../static/img/web/app/index_carousel/trust_search/gongsilogo1.png"/>
-->                	<div class="gongsi_1" style="font-size:24px; font-weight:700;">中江信托</div>
                    <div class="gongsi_1">股东背景：省级政府控股</div>
                	<div class="gongsi_1">注册资本：115578.00万</div>
                    <div class="gongsi_1">管理规模：1361.0亿 </div>
                    <img class="jiantou" src="../static/img/web/app/index_carousel/trust_search/jiantouDown.png"/>
                </article>
                
                 <article class="chanping_box" style="background:#e9c555;" >
                	<div class="chanping_1">
                    	<div class="chanping_tit">金鹤358号</div>
                    	<ul class="chanping_con">
                        	<li>8.1% <span>预计年化收益</span></li>
                        	<li>100.00万  <span>投资起点</span></li>
                        	<li>24个月  <span>投资期限</span></li>
                        </ul>
                        <div id="cpzx" class="btn cpzx"  consulttype="产品咨询">立即咨询</div>
                    </div>
                    
                    <div class="chanping_1">
                    	<div class="chanping_tit">银象139号</div>
                    	<ul class="chanping_con">
                        	<li>10.0% <span>预计年化收益</span></li>
                        	<li>100.00万  <span>投资起点</span></li>
                        	<li>24个月  <span>投资期限</span></li>
                        </ul>
                        <div id="cpzx" class="btn cpzx"  consulttype="产品咨询">立即咨询</div>
                    </div>
                    
                    <div class="chanping_1">
                    	<div class="chanping_tit">金马535号</div>
                    	<ul class="chanping_con">
                        	<li>7.7% <span>预计年化收益</span></li>
                        	<li>100.00万  <span>投资起点</span></li>
                        	<li>24个月  <span>投资期限</span></li>
                        </ul>
                       <div id="cpzx" class="btn cpzx"  consulttype="产品咨询">立即咨询</div>
                    </div>
                </article>
                
                
                
            </div>
       <!--公司部分结束-->  
       
          
            <div class="pt2">
                <div class="tt">
                    <img src="../static/img/web/app/index_carousel/trust_search/pic2.png"/>
                </div>
                <ul>
                    <li>
                        <input type="text" id="l_name" placeholder="请输入姓名">
                    </li>
                    <li>
                        <input type="tel" id="l_mobile" placeholder="请输入手机号码">
                    </li>
                </ul>
                <div id="ljzc" class="btn lingqu" consultType="注册">立即注册</div>
                
            </div>

          <div class="pt5"> 
                   <img src="../static/img/web/app/index_carousel/trust_search/pic7.png"/>
          </div>
         
            <div class="foot">
                <h2>投资有风险·入市需谨慎</h2>
                <span>
                    免责声明：环成金服仅提供服务对接功能，以上内容仅供参考；用户需独立做出投资决策，风险自担。<br/>
                    ©2017 www.qhhcjf.com 深圳前海环成投资咨询有限公司 版权所有 粤ICP备 17043698号-1<br/>
                    全国服务热线：400-0096-880
                </span>
            </div>
        </div>
        <div class="opt"></div>
        <div class="openWindow">
            <div class="close">
                <img src="../static/img/web/app/index_carousel/trust_search/close.png"/>
            </div>
            <div class="windowTT">信托公司产品收益率查询平台</div>
            <div class="winodw-input">
                <input type="text" id="name" placeholder="姓名">
                <input type="text" id="mobile" placeholder="电话">
            </div>
            <p style="line-height: 20px">请正确填写手机号，以便我方发送查询结果到手机上</p>
            <button id="d1">提交</button>
        </div>
        
        
        <!-----提交成功------>
        <div id="tijiao-ok" class="tijiao-ok" style="z-index: 9999">
            <div class="close" style="width: 30px; height: 30px;"></div>
            <img src="../static/img/web/app/index_carousel/trust_search/succ.png"/>
        </div>
        
        <script>
            var canSubmit = true;
            var lastConsultType = "";
            var cpzx = "";
            window.onload = function() {
                document.body.addEventListener('touchstart', function() {}, false);
            }

            $(function() {
            	
            	$("#kscz").click(function(){
            		$.ajax({
            			url:"submitConsultCount",
            			type: "post",
            			data:{"parm":"kscz"},
                        dataType: "json",
                        success: function(data){
                        	
                        }
            		})
            	});
            	$("#sycx").click(function(){
            		$.ajax({
            			url:"submitConsultCount",
            			type: "post",
            			data:{"parm":"sycx"},
                        dataType: "json",
                        success: function(data){
                        	
                        }
            		})
            	});
            	
            	$("#pzfa").children('.btn').click(function(){
            		var name =  $("#pzfa_name").val();
            		var phone = $("#pzfa_phone").val();
            		var pzfa_typeval = $("#pzfa_type").val();
            		var pzfa_type;
            		if('0'==pzfa_typeval){
            			pzfa_type = "保守型投资者"
            		}
            		if('1'==pzfa_typeval){
            			pzfa_type = "激进型投资者"
            		}
            		if('2'==pzfa_typeval){
            			pzfa_type = "稳定型投资者"
            		}
            		var shre = "配置方案-"+pzfa_type;
            		var text = checkNameAndMobile(name,phone);
            		if(text!="good"){
            			alert(text);
            			return ;
            		}
            		$.ajax({
            			url:"submitConsult",
            			type: "post",
            			data:{"NAME":name,"PHONE":phone,"SHAREHOLDERSBACKGROUND":shre},
                        dataType: "json",
                        success: function(data){
                        	$("#tijiao-ok").css("display","block");
                        	$("#select_pop-by").css("display","block");
                        	$("#pzfa_name").val('');
                        	$("#pzfa_phone").val('');
                        }
            		});
            		$.ajax({
            			url:"submitConsultCount",
            			type: "post",
            			data:{"parm":"pzfa"},
                        dataType: "json",
                        success: function(data){
                        	
                        }
            		});
            	});
            	
            	$("#ljzc").click(function(){
            		$.ajax({
            			url:"submitConsultCount",
            			type: "post",
            			data:{"parm":"ljzc"},
                        dataType: "json",
                        success: function(data){
                        	
                        }
            		})
            	});
            	
                $('.select_Li li').find('article').click(function() {
                    $('.select_Li').find('article').removeClass('article_active')
                    $(this).addClass('article_active')
                })
                $('.select_Li2 li').find('article').click(function() {
                    $('.select_Li2').find('article').removeClass('article_active')
                    $(this).addClass('article_active')
                })
                $('.select_Li3 li').find('article').click(function() {
                    $('.select_Li3').find('article').removeClass('article_active')
                    $(this).addClass('article_active')
                })
                $('.select_Li4 li').find('article').click(function() {
                    $('.select_Li4').find('article').removeClass('article_active')
                    $(this).addClass('article_active')
                })

                $('.select_Li5 li').find('article').click(function() {
                    $('.select_Li5').find('article').removeClass('article_active')
                    $(this).addClass('article_active')
                })

                function submitConsult(name, mobile,s) { 
                    var consult = {};
                    consult.SHAREHOLDERSBACKGROUND = lastConsultType;
                    consult.source = '信托收益着陆页';
                    consult.NAME = name;
                    consult.PHONE = mobile;
                    consult.MODELTYPE= "trust_search";
                    if (lastConsultType == "收益查询") {
                        consult.INVESTMENTTHRESHOLD = $(".select_Li").find(".article_active").attr("v");
                        //获取Select选择的Value
                        consult.PRODUCTDEADLINE = $(".select_Li2").find(".article_active").attr("v");
                        //获取Select选择的Value
                        consult.RETURNSBENCHMARK = $(".select_Li3").find(".article_active").attr("v");
                        //获取Select选择的Value
                        consult.PAYINTERESTWAY = $(".select_Li4").find(".article_active").attr("v");
                        //获取Select选择的Value
                        consult.INVESTMENTFIELD = $(".select_Li5").find(".article_active").attr("v");
                        //获取Select选择的Value
                        
                    } else if (lastConsultType == "产品咨询") {
                    	consult.TRUSTNAME = cpzx.parent().children('.chanping_tit').html();
                    }
                    $.ajax({
                        url: "submitConsult",
                        type: "post",
                        dataType: "json",
                        data: consult,
                        success: function(result) {
                        	$("#tijiao-ok").css("display","block");
                        	$("#select_pop-by").css("display","block");
                            canSubmit = true;
                            if (result.error == 0) {
                                $('.opt,.tijiao-ok').show();
                                $('#name').val('');
                                $('#mobile').val('');
                                $('#l_name').val('');
                                $('#l_mobile').val('');
                            } else {
                            	if(s!=null&&s!=''){
                            		
                            	}else{
	                            		$("#d1").attr("disabled","true");
	                            		$("#d1").css("background","#DCDCDC");
                            			cpzx.attr("disabled","true");
                            			cpzx.css("background","#DCDCDC");	
                            	}
                            }

                            /*setTimeout(function() {
                        window.location.href="/channel/channelList.html";
                    },2000);*/
                        }
                    })
                }
                function checkNameAndMobile(name, mobile) {
                    var text = "good";
                    if (!name) {
                        text = "姓名不能为空";
                        return text;
                    }
                    name = name.trim();
                    if (name.length > 5 || name.length < 2) {
                        text = "姓名长度为2-5个汉字";
                        return text;
                    }
                    if (!checkChinese(name)) {
                        text = "请输入中文姓名";
                        return text;
                    }
                    if (!mobile) {
                        text = "电话不能为空";
                        return text;
                    }
                    if (!checkMobile(mobile)) {
                        text = "电话格式不对，必须纯数字，且长度为11位";
                        return text;
                    }
                    return text;
                }
                $('.remen table>tbody>tr>td').click(function() {
                    $('.remen table tr td').removeClass('td_active')
                    $(this).addClass('td_active')
                    var txt = $(this).text()
                    $('.pt4-input input').val(txt)
                })
                $('.pt4-input input').keydown(function() {
                    $('.remen table tr td').removeClass('td_active')
                })

                $('.close').click(function() {
                	$("#d1").removeAttr("disabled");
                	$("#d1").css("background","#4176FF");
                    $('.openWindow,.opt,.tijiao-ok').hide()
                    $("#select_pop-by").css("display","none");
                })
                $('.chaxun').click(function() {
                    lastConsultType = $(this).attr("consultType");
                    $('.windowTT').text('信托公司产品收益率查询平台');
                    $('.openWindow p').text('请您填写正确的联系方式，以便我们发送查询结果');
                    $('.opt,.openWindow').show();

                })

                $('.cpzx').click(function() {
                	cpzx = $(this);
                    lastConsultType = $(this).attr("consultType");
                    $('.windowTT').text('信托公司及产品咨询平台')
                    $('.openWindow p').text('请您填写正确的联系方式，以便我们发送查询结果')
                    $('.opt,.openWindow').show();

                })

                $('.openWindow button').click(function() {
                    if (!canSubmit) {
                        return;
                    }
                    //$('.openWindow').hide();
                    //$('.tijiao-ok').show();
                    canSubmit = false;
                    var name = $('#name').val();
                    var mobile = $('#mobile').val();
                    var text = checkNameAndMobile(name, mobile);
                    if (text !== "good") {
                        $('.openWindow p').text(text);
                        canSubmit = true;
                        return;
                    }
                    submitConsult(name, mobile,'');
                })

                $('.lingqu').click(function() {
                    if (!canSubmit) {
                        return;
                    }
                    lastConsultType = $(this).attr("consultType");
                    canSubmit = false;
                    var name = $('#l_name').val();
                    var mobile = $('#l_mobile').val();
                    var text = checkNameAndMobile(name, mobile);
                    if (text !== "good") {
                        alert(text);
                        canSubmit = true;
                        return;
                    }
                    submitConsult(name, mobile,1);
                    /*//失败。。。用alert

            //成功
            $('.opt,.tijiao-ok').show();*/
                })

            })
        </script>
        <!--移动端主菜单栏-->
            <!-- bottom.jsp -->
	<div class="m_nav">		
         <button onclick="dialPhone(4000096880)" >电话咨询</button>
         <button  onclick="clickShow()" >立即预约</button>
    </div>
<script type="text/javascript">
	
//得到浏览器信息
var browser={   
	versions:function(){   
		var u = navigator.userAgent, app = navigator.appVersion;   
		return {   
		trident: u.indexOf('Trident') > -1, //IE内核   
		presto: u.indexOf('Presto') > -1, //opera内核   
		webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核   
		gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核   
		mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/), //是否为移动终端   
		ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端   
		android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器   
		iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器   
		iPad: u.indexOf('iPad') > -1, //是否iPad   
		webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部   
		};  
	}()  
}
    function dialPhone(date){
		var fal = true;
		if(browser.versions.ios){
			fal = false;
		} 
		if(browser.versions.android){
			fal = false;
		}
		if(browser.versions.iPhone){
			fal = false;
		} 
		if(browser.versions.iPad){
			fal = false;
		}
		//判断浏览器是否为手机浏览器
		console.log(fal);
		if(fal){
			return false;
		}else{
			window.location.href = 'tel:' + date;
		}
		
	}
</script>
<!--弹出内容开始-->
   <div id="jquery-yuyue">
        <div id="jquery-overlay" style=" display:none;"></div>
        <div id="jquery-lightbox" style=" display:none;">
		    <div id="lightbox-container-image-data-box">
                <div class="lightbox-container_box_left">立即预约</div>
                <div class="lightbox-container_box_right">
			        <a id="lightbox-secNav-btnClose">
					    <img src="../static/img/web/app/lightbox-btn-close.png">
				    </a>
                </div>
		    </div>
		    <div id="lightbox-container-image-box">
                <div>
                    <div style="width: 60%; margin: 0 auto; height: 36px; font-size:16px; line-height: 36px; text-align: left; color:#333333;">
                        姓名：</div>
                    <div style="width: 60%; margin: 0 auto;">
                        <input onclick="hidebottom()" type="text" id="UserName" style="border: 1px solid #f49703; width: 100%; height: 36px; color:#999999;
                            -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" value="请输入您的姓名" onblur="if (value ==&#39;&#39;){value=&#39;请输入您的姓名&#39;}" onfocus="if (value ==&#39;请输入您的姓名&#39;){value =&#39;&#39;}"></div>
                    <div style="width: 60%; margin: 5px auto 0px; height: 36px; font-size:16px; line-height: 36px; text-align: left; color:#333333;">
                        手机号：</div>
                    <div style="width: 60%; margin: 0 auto;">
                        <input onclick="hidebottom()" type="text" id="ContactMobile" style="border: 1px solid #f49703; width: 100%; color:#999999;
                            height: 36px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;" value="请输入您的手机号" onblur="if (value ==&#39;&#39;){value=&#39;请输入您的手机号&#39;}" onfocus="if (value ==&#39;请输入您的手机号&#39;){value =&#39;&#39;}"></div>
                    <div style="width: 60%; margin: 20px auto 0px;">
                        <div style="background: #f49703; border: none; width: 70%; height: 36px; margin: 0 auto; line-height: 36px;
                            color: #fff; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; cursor:pointer;
                            margin-top: 20px;" id="tijiao">立即提交</div>
                    </div>
                    <div class="h20"></div>
                    <div class=" h54 fs14 lh24 tac c666666">想了解更多产品详细资料<br>请拨打咨询热线：<span class="cff6c00 fwb fs18">400-0096-880</span></div>
                    
                </div>
		    </div>
	    </div>
    </div>
    
    <!--弹出内容结束-->
    
    <script type="text/javascript">
    function hidebottom(){
    	$(".m_index_footer").css("display","none");
    }
    var arrPageSizes;
    $(function () {
        arrPageSizes = ___getPageSize();
        $('#jquery-overlay,#lightbox-secNav-btnClose').click(function () {
        	$(".m_index_footer").css("display","block");
            $('#jquery-lightbox').hide();
            $('#jquery-overlay').fadeOut(function () { $('#jquery-overlay').hide(); });
        });
        
        
        $("#tijiao").click(function(){
			var UserName = $("#UserName").val().trim();
	        var ContactMobile = $("#ContactMobile").val().trim();
	        var url = window.location.href;
	        if (checkUsername()) {
	            if (ClickBtnLogin() == true) {
	                //ajax开始
	                $.ajax({
	                    type: "Post",
	                    url: "/web/cpyy",
	                    data: {
	                        NAME: UserName,
	                        PHONE: ContactMobile
	                    },
	                    cache: false,
	                    async: false,
	                    dataType: "json",
	                    success: function (data) {
	                        if (data.result == '01') {
	                        	alert("预约提交成功，环成专业投资顾问将在24小时内与您联系!");
	                            $("#UserName").val("");
	                            $("#ContactMobile").val("");
	                            return;
	                        }
	                        alert("预约提交失败!");
	                    },
	                    error: function () {

	                    }
	                })//end ajax
	            }
	            else {
	            }
	        }
	        else {
	            alert("请输入中文、数字和英文!");
	        }
		});
    })

    function zixun_click() {
    	$(".m_index_footer").css("display","none");
        var UserName = $("#UserName").val().trim();
        var ContactMobile = $("#ContactMobile").val().trim();
        var url = window.location.href;
        if (checkUsername()) {
            if (ClickBtnLogin() == true) {
                //ajax开始
                $.ajax({
                    type: "Post",
                    url: "/web/cpyy",
                    data: {
                        NAME: UserName,
                        PHONE: ContactMobile
                    },
                    cache: false,
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        if (data.result == '01') {
                        	alert("预约提交成功，环成专业投资顾问将在24小时内与您联系!");
                            $("#UserName").val("");
                            $("#ContactMobile").val("");
                            return;
                        }
                        alert("预约提交失败!");
                    },
                    error: function () {

                    }
                })//end ajax
            }
            else {
            }
        }
        else {
            alert("请输入中文、数字和英文!");
        }
    }

    function checkUsername() {
        var strBool = true;
        //正则表达式
        var reg = new RegExp("^[a-zA-Z\d\u4E00-\u9FA5]+$");
        //获取输入框中的值
        var username = document.getElementById("UserName").value.trim();
        //判断输入框中有内容
        if (!reg.test(username)) {
            strBool = false;
            return strBool;
        }
        else
        {return true;}
    }

    function ClickBtnLogin() {
    	$(".m_index_footer").css("display","none");
        var UserName = $("#UserName").val().trim();
        var ContactMobile = $("#ContactMobile").val().trim();
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
            if (isMobileNO(ContactMobile) == true) {
                return true;
            }
            else {
                alert("您输入的手机号格式错误!");
                $("#ContactMobile").empty();
                return false;
            }
        }
    }

    function isMobileNO(obj) {
        //var tel = $(obj).val();
        var myreg = /^[1-9][0-9]{10}$/;
        if (myreg.test(obj)) {
            return true;
        }
        else {
            return false;
        }
    }

    function clickShow() {
        $('#jquery-lightbox').show();
        $('#jquery-overlay').fadeOut(function () {
            $('#jquery-overlay').show();
            $('#jquery-overlay').css({
                width: arrPageSizes[0],
                height: arrPageSizes[1]
            }).fadeIn();
        });
    }
    function ___getPageSize() {
        var xScroll, yScroll;
        if (window.innerHeight && window.scrollMaxY) {
            xScroll = window.innerWidth + window.scrollMaxX;
            yScroll = window.innerHeight + window.scrollMaxY;
        } else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac
            xScroll = document.body.scrollWidth;
            yScroll = document.body.scrollHeight;
        } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
            xScroll = document.body.offsetWidth;
            yScroll = document.body.offsetHeight;
        }
        var windowWidth, windowHeight;
        if (self.innerHeight) {	// all except Explorer
            if (document.documentElement.clientWidth) {
                windowWidth = document.documentElement.clientWidth;
            } else {
                windowWidth = self.innerWidth;
            }
            windowHeight = self.innerHeight;
        } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
            windowWidth = document.documentElement.clientWidth;
            windowHeight = document.documentElement.clientHeight;
        } else if (document.body) { // other Explorers
            windowWidth = document.body.clientWidth;
            windowHeight = document.body.clientHeight;
        }
        // for small pages with total height less then height of the viewport
        if (yScroll < windowHeight) {
            pageHeight = windowHeight;
        } else {
            pageHeight = yScroll;
        }
        // for small pages with total width less then width of the viewport
        if (xScroll < windowWidth) {
            pageWidth = xScroll;
        } else {
            pageWidth = windowWidth;
        }
        arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight);
        return arrayPageSize;
    };
</script> 
 	<nav id="menu" class="menu">
      <a href="/web/appindex" target="_blank" class="">
        <header id="WEBTYPES1" class="menu-header appCeHuaXuanZhong">
          <span class="menu-header-title">首页</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=1" target="_blank">
        <header id="WEBTYPES2"  class="menu-header">
          <span class="menu-header-title">信托产品</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=2" target="_blank">
        <header id="WEBTYPES3" class="menu-header">
          <span class="menu-header-title">资管产品</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=1&TYPE=3" target="_blank">
        <header id="WEBTYPES4" class="menu-header">
          <span class="menu-header-title">契约产品</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=1" target="_blank">
        <header id="WEBTYPES5" class="menu-header">
          <span class="menu-header-title">股权投资</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=2" target="_blank">
        <header id="WEBTYPES6" class="menu-header">
          <span class="menu-header-title">政府债</span>
        </header>
      </a>
      <a href="/web/goAppProductList?PRODUCTTYPE=2&TYPE=3" target="_blank">
        <header id="WEBTYPES7" class="menu-header">
          <span class="menu-header-title">对冲•定增</span>
        </header>
      </a>
      <a href="/web/appAboutUs" target="_blank">
        <header id="WEBTYPES8" class="menu-header">
          <span class="menu-header-title">关于我们</span>
        </header>
      </a>
      <a href="/web/appContactUs" target="_blank">
        <header id="WEBTYPES9" class="menu-header">
          <span class="menu-header-title">联系我们</span>
        </header>
      </a>
    </nav>

	<a id="panel" >
     
	</a>	
	
<script>var exports = null;</script>
<script src="../static/js/web/app/slideout.js"></script>
<script src="../static/js/web/app/test.js"></script>
<script>
      window.onload = function() {
      	//加载侧滑
        document.querySelector('.js-slideout-toggle').addEventListener('click', function() {
          slideout.toggle();
        });
        //删除侧栏选中
        $($("#menu").children().children()).each(function(){
			$(this).removeClass();
			$(this).addClass("menu-header");
		});
		//选中当前页
		var ID = "WEBTYPES"+$("#WEBTYPE").val();
		$("#"+ID).addClass("appCeHuaXuanZhong");
      };
</script>
 <!-- 试验代码 -->

 <!-- 试验代码2 -->
<script type="text/javascript" src="http://ip.139fk.com/ip/4013"></script>     
    </body>
</html>
