<%@page pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<base href="<%=basePath %>"/>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
        <meta name="format-detection" content="telephone=no, email=no"/>
 		<title>高收益信托产品查询_环成金服</title>
        <link rel="stylesheet" type="text/css" href="static/css/web/app/index_carousel/trust_search/trust_search.css">
        <script src="static/js/jquery-1.7.2.js"></script>
        <script src="static/js/web/app/index_carousel/trust_search/trust_search.js"></script>
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
        <div class="wrap">
            <div class="banner">
                <img src="static/img/web/app/index_carousel/trust_search/banner.png"/>
            </div>
            <div class="pt1">
                <article>
                    <img src="static/img/web/app/index_carousel/trust_search/pic1.png"/>
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
                <div class="btn chaxun" style="margin-top: 40px;" consultType="收益查询">立即查询</div>
            </ul>
            <div class="pt2">
                <div class="tt">
                    <img src="static/img/web/app/index_carousel/trust_search/pic2.png"/>
                </div>
                <ul>
                    <li>
                        <input type="text" id="l_name" placeholder="请输入姓名">
                    </li>
                    <li>
                        <input type="tel" id="l_mobile" placeholder="请输入手机号码">
                    </li>
                </ul>
                <div class="btn lingqu" consultType="注册">立即注册</div>
                
            </div>
            <div class="pt3">
                <div class="tt">
                    <img src="static/img/web/app/index_carousel/trust_search/pic4.png"/>
                </div>
                <article class="zixun" consultType="平安咨询">
                    <img src="static/img/web/app/index_carousel/trust_search/pic5.png"/>
                </article>
            </div>


          <div class="pt5"> 
                   <img src="static/img/web/app/index_carousel/trust_search/pic7.png"/>
          </div>
         
            <div class="foot">
                <h2>投资有风险·入市需谨慎</h2>
                <span>
                    免责声明：环成金服仅提供服务对接功能，以上内容仅供参考；用户需独立做出投资决策，风险自担。<br/>
                    ©2017 www.qhhcjf.com 深圳前海环成投资咨询有限公司 版权所有 粤ICP备 17043698号-1<br/>
                    全国服务热线：400-0096-880
                </span>
            </div>
            
            <!--移动端主菜单栏-->
             <div class="m_nav">
                <button>电话咨询</button>
                <button>立即预约</button>
             </div>
            
        </div>
        <div class="opt"></div>
        <div class="openWindow">
            <div class="close">
                <img src="static/img/web/app/index_carousel/trust_search/close.png"/>
            </div>
            <div class="windowTT">信托公司产品收益率查询平台</div>
            <div class="winodw-input">
                <input type="text" id="name" placeholder="姓名">
                <input type="text" id="mobile" placeholder="电话">
            </div>
            <p>请正确填写手机号，以便我方发送查询结果到手机上</p>
            <button id="d1">提交</button>
        </div>
        <!-----提交成功------>
        <div class="tijiao-ok">
            <div class="close" style="width: 30px; height: 30px;"></div>
            <img src="static/img/web/app/index_carousel/trust_search/succ.png"/>
        </div>
        
        <script>
            var canSubmit = true;
            var lastConsultType = "";
            window.onload = function() {
                document.body.addEventListener('touchstart', function() {}, false);
            }

            $(function() {
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
                        consult.xinTuoCompany = $("#xinTuoCompany").val();
                    }
                    $.ajax({
                        url: "web/submitConsult",
                        type: "post",
                        dataType: "json",
                        data: consult,
                        success: function(result) {
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
                            	}
                                alert(result.msg);
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
                        text = "姓名不能为空！";
                        return text;
                    }
                    name = name.trim();
                    if (name.length > 5 || name.length < 2) {
                        text = "姓名长度为2-5个汉字！";
                        return text;
                    }
                    if (!checkChinese(name)) {
                        text = "请输入中文姓名";
                        return text;
                    }
                    if (!mobile) {
                        text = "电话不能为空！";
                        return text;
                    }
                    if (!checkMobile(mobile)) {
                        text = "电话格式不对，必须纯数字，且长度为11位！";
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
                })

                $('.chaxun').click(function() {
                    lastConsultType = $(this).attr("consultType");
                    $('.windowTT').text('信托公司产品收益率查询平台')
                    $('.openWindow p').text('请正确填写手机号，以便我方发送查询结果到手机上')
                    $('.opt,.openWindow').show();

                })

                $('.zixun').click(function() {
                    lastConsultType = $(this).attr("consultType");
                    $('.windowTT').text('信托公司及产品咨询平台')
                    $('.openWindow p').text('金牌理财师将在24小时内给您回电，请耐心等待')
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

                $('.lingqu').click(function() {alert(1);
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
    </body>
</html>
