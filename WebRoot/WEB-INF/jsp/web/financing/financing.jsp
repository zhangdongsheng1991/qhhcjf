<%@page pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>

<html>
<head>
	<base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width" />
    <link href="static/css/web/style.css" rel="stylesheet" />
    <link href="/Content/CSS/top.css" rel="stylesheet" />
    <link href="static/css/layui/css/modules/laydate/laydate.css" rel="stylesheet" />
    <script src="static/js/jquery-1.7.2.js"></script>
    <script src="/JavaScript/jQuery.pagePeel.js"></script>
    <script src="static/css/layui/layui.js"></script>

     
</head>
<body>
    <div class="head">
        <div class="bg474641">
            <div class="top">
                <ul class="cf6eba7 leftyh fl" style="display:none">
                    <!--a 链接悬浮 特效未设置-->
                    <li class=""><a href="/user/register" class="cf6eba7">免费注册</a></li>
                    <li class=""><a href="/user/login" class="cf6eba7">用户登录</a></li>
                    <li class=""><a href="/user/forgetpassword" class="cf6eba7">忘记密码</a></li>
                </ul>
                <ul class="cf6eba7 fl" style="">
                    <li class=""><a href="/user/myproject" class="cf6eba7">欢迎您:搜索</a>&nbsp;&nbsp;<a href="javascript:void(0);" class="cf6eba7" onclick="LoginOut();">注销</a></li>
                </ul>
                <ul  class="fr">
                    <li class="cffffff">24小时免费咨询：</li>
                    <li class="fwb fs22 cf6eba7">400-8800-209</li>
                </ul>
            </div>
        </div>
        <div class="bg1f1f1d">
            <div class="nav">
                <div class="logo fl"><a href="/index/index"><img src="/Content/Image/Member/zcjf_logo.png" /></a></div>
                <ul class="disflex fl fs20">
                    <li><a href="/index/index" class="cffffff home">首页</a></li>
                    <li><a href="/seekfund/seekfund" class="cffffff seekfund">找资金</a></li>
                    
                    <li><a href="/member_specially/expertOneIsOne" class="cffffff expert">会员专享</a></li>
                    <li><a href="/newsindex/newsindex" class="cffffff NewsIndex">金融学院</a></li>
                    <li><a href="/member_specially/member_specially" class="cffffff menber">融资规划服务</a></li>
                    
                </ul>
                <a target="_blank" class="issueItem fr apply-cooperation" href="javascript:void(0);">我要融资</a>
            </div>
        </div>
    </div>


      
    
    <script>
        //var peel = new Xteam.Ui.PagePeel('#pagepeel');
        //$(document).ready(function () {
        //    //$(".pagepeel-colose").on("click", function () { 
        //    //    $("#pagepeel").hide();
        //    //})
        //    //$(document).on("click", ".pagepeel-colose", function () {
        //    //    $("#pagepeel").hide();
        //    //})
        //})
        function peelColse() {
            $(".tr_box").hide();
        }
    </script>
    
    
    <div class="tr_box">
        <a class="t_r_0" id="top_right" href="http://www.zcscs.com" target="_blank"></a>
        <span class="pagepeel-colose" onclick="peelColse()"></span>
    </div>
    <script>

    topRight_lr("top_right","t_r_");   //topRight("id名","索引前缀");
    function topRight_lr(domid,indexPrefix){

        function $id(byid){ return document.getElementById(byid); }
        var top_right = $id(domid),trLoop;
        var i = 0;
        clearInterval(trLoop);
        top_right.onmouseover = function(){
		    clearInterval(trLoop);
            if(i!=0){ return }
            var trLoop = setInterval(function(){
                change(i);
                i++;
                if(i>5){
                    clearInterval(trLoop);
                    return
                }
            },100);

        }
        top_right.onmouseout = function(){
            if(i<5){ return }
            var trLoop = setInterval(function(){
                change(i);
                i--;
                if(i<0){
                    clearInterval(trLoop);
                    i=0;
                    return
                }
            },100);
        }
        function change(i){
            top_right.className = indexPrefix+i;
        }
    }
    </script>
    <div>
        
<title>股权融资平台_股权融资众筹平台_融资服务平台-招财融资网</title>
<meta name="keywords" content="股权融资,股权融资平台,融资众筹平台,融资服务平台,招财融资网" />
<meta name="description" content="深圳前海光控瑞银投资有限公司旗下：招财融资网。目前已经连接了市面上68家信托公司、3000多家银行和70多家资管公司，可以为中国无数企业提供全方位的系统服务，从资讯信息到帮助对接优质融资渠道到直接获得资金等相关的配套服务，为企业降低融资成本，提高融资效率，让融资更简单。" />
<link href="/Content/CSS/Style.css" rel="stylesheet" />
<link href="/Content/CSS/common.css" rel="stylesheet" />
<link href="/Content/CSS/index.css" rel="stylesheet" />
<script src="/JavaScript/Jquery/jquery-1.7.2.min.js"></script>

<script src="/JavaScript/common.js"></script>

<script src="/JavaScript/index.js"></script>
<script src="/JavaScript/jquery.countup.js"></script>
<script src="/JavaScript/jquery.event.drag-1.5.min.js"></script>
<script src="/JavaScript/jquery.superslide.2.1.1.js"></script>
<script src="/JavaScript/jquery.touchslider.js"></script>
<script src="/JavaScript/jquery.waypoints.min.js"></script>
<script src="/JavaScript/layer.js"></script>
<script src="/JavaScript/lxb.js"></script>
<script src="/JavaScript/marquee.js"></script>
<script src="/JavaScript/o_code.js"></script>
<script src="/JavaScript/pc_nb.js"></script>
<script src="/JavaScript/title.js"></script>
<script src="/TouRongJs/Pubilc.js"></script>
<script>
    $(document).ready(function () {
        //$.ajax({
        //    url: '/base/VerificationLogin',
        //    type: 'post',
        //    data: {},
        //    async: false,
        //    success: function (data) {
        //        if (data == "1") {
        //            $(".join_login").hide();
        //        } else {
        //            return false;
        //        }
        //    }
        //});
        //if (IsLogin()) {
        //    $(".join_login").hide();
        //} else {
        //    //$(".join_login").hide();
        //}
        $(".home").addClass("active");

        $(".join_seleced").click(function () { //注册 登录 切换　
            $(".jl_select div").removeClass("active");
            $(this).addClass("active");
            $(".join_box").removeClass("disnone");  //显示注册
            $(".login_box").addClass("disnone"); //隐藏登录
        });

        $(".logo_seleced").click(function () { //注册 登录 切换
            $(".jl_select div").removeClass("active");
            $(this).addClass("active");
            $(".login_box").removeClass("disnone");  //显示登录
            $(".join_box").addClass("disnone"); //隐藏注册
        });
        $("#login").on('click', function () {
            var mobile = $("#login_mobile").val();
            if (mobile == '') {
                publicUpbox("请输入手机号!");
                $("#login_mobile").focus();
                return false;
            }
            var password = $("#login_password").val();
            if (password == '') {
                publicUpbox("请输入您的密码!");
                $("#login_password").focus();
                return false;
            }
            var yzm_input = $("#loginyzm").val();
            if (yzm_input == '') {
                publicUpbox("请输入您的验证码!");
                $("#loginyzm").focus();
                return false;
            }
            $.ajax({
                url: '/index/login',
                type: 'post',
                data: { Mobile: mobile, password: password, code: yzm_input },
                success: function (data) { 
                    if (data == "0") { 
                        publicUpbox("请输入正确的验证码");
                        //alert("请输入正确的验证码");
                    } else if (data == "-1") {
                        publicUpbox("用户名或密码错误");
                        //alert("用户名或密码错误");
                    } else if (data == "2") {
                        publicUpbox("验证码已过期,请重新获取");
                        //alert("验证码已过期,请重新获取");
                    } else if (data == "1") {
                        //publicUpbox("登录成功");
                        //alert("登录成功");
                        location.href = window.location.href;
                        $(".join_login").hide();
                    } else {
                        publicUpbox("用户名,密码和验证码都不能为空!");
                    }
                }
            });
        });
        //注册
        $("#register").on('click', function () {
            var ruserName = $("#ruserName").val();
            if (ruserName == '') {
                publicUpbox("请输入您的姓名!");
                $("#ruserName").focus();
                return false;
            }
            var rPhone = $("#rPhone").val();
            if (rPhone == '') {
                publicUpbox("请输入您的手机号!");
                $("#rPhone").focus();
                return false;
            }
            var rPassword = $("#rPassword").val();
            if (rPassword == '') {
                publicUpbox("请输入您的密码!");
                $("#rPassword").focus();
                return false;
            }
            if ($("input[type='checkbox']").is(':checked')) {
                //$.ajax({
                //    url: '/index/registers',
                //    type: 'post',
                //    data: { userName: ruserName, phone: rPhone, password: rPassword },
                //    success: function (data) { 
                //        if (data == "0") { 
                //            publicUpbox("请填写好姓名手机号和密码");
                //        } else if (data == "2") {
                //            publicUpbox("注册失败");
                //        } else if (data == "1") {
                //            //reghint();
                //            window.location.href = "/user/userAttestation?theOne=1";
                //            //publicUpbox("注册成功");
                //            reghint();
                //        } else if (data == "3") {
                //            publicUpbox("该号码已注册");
                //        } else if (data == "4") {
                //            publicUpbox("请输入正确的手机号码");
                //        }
                //    }
                //});


                $.ajax({
                    url: '/user/PageRegister',
                    type: 'post',
                    data: {userName: ruserName, phone: rPhone, password: rPassword, code: $("#yzm").val(), isagree: 1 ,type:1},
                    success: function (data) {
                        if (data == "2") {
                            publicUpbox("注册失败,请联系网站相关人员!");
                        } else if (data == "3") {
                            publicUpbox("手机号码已存在,请重新填写!");
                        } else if (data == "4") {
                            publicUpbox("手机号码不正确,请重新填写!");
                        } else if (data == "5") {
                            publicUpbox("还未获取验证码,请获取验证码!");
                        } else if (data == "6") {
                            publicUpbox("短信验证码错误,请输入正确的短信验证码!");
                        } else if (data == "7") {
                            publicUpbox("请确认选择招财融资网服务协议!");
                        } else if (data == "7") {
                            publicUpbox("短信已失效,请重新获取!");
                        } else if (data == "0") {
                            publicUpbox("手机号码,验证码和密码都不能为空!");
                        }
                        else if (data == "1") {
                            //alert("注册成功!");
                            publicUpbox("恭喜您，注册成功!即将为您跳转到认证页面..");
                            theTimer = setTimeout("  window.location.href = '/user/userAttestation?theOne=1'", 3000);
                            // location.href = '/user/login';
                        }
                    }
                });


            } else { 
                publicUpbox("请同意招财金服网协议");
            }
        });

    });


    var openTime = 60;
    function runCode() {
        openTime = openTime - 1;

        $("#btn").html("" + openTime + "");
        if (openTime <= 0) {
            ////$("#Ssendmess").html("短信已经发出60秒后,仍没收到可重新获取。");
            //$("#divCountDown").hide();
            //$("#divGetCode").show();
            $("#btn").attr("disabled", false)
           // $("input[type = 'button']").css("background-color", "#5dc1f9");
            $("#btn").html("获取");
            openTime = 60;
            return false;
        }
        theTimer = setTimeout("runCode()", 1000);
    }

    function settime1(obj) {
        if ($("#rPhone").val() == "" || $("#rPhone").val() == null) {
            publicUpbox("请输入手机号码!");
        } else {
         //   $("input[type = 'button']").css("background-color", "#c7c4c4");
            $("#btn").attr("disabled", "disabled")
     
            $.ajax({
                url: '/user/SendNote',
                type: 'post',
                data: { phone: $("#rPhone").val(), type: "2" },
                success: function (data) {
                    if (data == "0") {
                        runCode()
                        //if (countdown == 0) {
                        //    obj.removeAttribute("disabled");
                        //    obj.value = "免费获取验证码";
                        //    countdown = 60;
                        //    return;
                        //} else {
                        //    obj.setAttribute("disabled", true);
                        //    obj.value = "重新发送(" + countdown + ")";
                        //    countdown--;
                        //}
                        //setTimeout(function () {
                        //    settime(obj)
                        //}, 1000)
                    }
                    else if (data == "2") {
                        publicUpbox("手机号码错误,请重新输入!");
                    } else if (data == "1") {
                        publicUpbox("手机号码已被注册,请重新输入!");
                    }
                    else {
                        publicUpbox("服务器错误,请联系网站相关人员!");
                    }
                }
            });
        }
    }


</script>

<div class="banner">
    <div class="w1200 mauto disflex justcfe alignic h450 prelavive">
        <div class="join_login" style="display:none">
            <div class="jl_select">
                <div class="logo_seleced active">用户登陆</div>
                <div class="join_seleced">免费注册</div> 
            </div>
            <div class="h15"></div>
            <div class="join_box disnone">
                <ul class="jl_input_info">
                    <li><span>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</span><input placeholder="请输入姓名" id="ruserName" type="text" /></li>
                    <li><span>手机号：</span><input type="text" placeholder="请输入手机号" id="rPhone" /></li>
                    <li><span>验证码：</span><input type="text" class="yzm_input" placeholder="请输入手机验证码" id="yzm"/><div class="yzm_"><a class="ryzm_" id="btn" onclick="settime1(this)">获取</a></div></li>
                    <li><span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input placeholder="请输入密码" id="rPassword" type="password" /></li>
                    <li class="pt10"><label><input type="checkbox" checked="checked" /><span class="pl10">已阅读并同意</span></label><a class="cff0000 protocol">《招财金服网协议》</a></li>
                </ul>
                <a class="jl_submit" id="register" href="javascript:void(0);">立即免费注册</a>
            </div>
            <div class="login_box ">
                <ul class="jl_input_info">
                    <li><span>手机号：</span><input type="text" placeholder="请输入手机号" id="login_mobile" /></li>
                    <li><span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input placeholder="请输入密码" type="password" id="login_password" /></li>
                    <li><span>验证码：</span><input type="text" id="loginyzm" class="yzm_input" /><div class="yzm_"><img src="/index/securitycode" onclick="this.src=this.src+'?'" /></div></li>
                    <li class="pt10"><a class="cff0000 tdunline" href="/user/forgetpassword">忘记密码？</a></li>
                </ul>
                <a href="javascript:void(0);" class="jl_submit" id="login">登录</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $('.counter').countUp();
    });
</script>
<div class="section" id="m_login1">
    <ul>
        <li class="datafirst" style="text-align:right;">
            认证官方资金 <span class="text-gradient counter">67</span>
            <sub>家</sub>
        </li>
        <li class="spacfirst">
            
        </li>
        <li class="datalast">
            累计放款 <span class="text-gradient counter">530000</span>
            <sub>万元</sub>
        </li>
    </ul>
</div>
<div class="article">
    <div class="art">
        <h2 class="art_title"><span class="text-gradient">专业融资对接平台</span></h2>
        <ul class="prelavive">
            <li style="position: relative; margin-top: 20px;"><img src="/Content/Image/index/index_img1.png"></li>
            <li id="Rotation_box"><img class="Rotation" src="/Content/Image/index/leida.png" /></li>
        </ul>
    </div>
</div>
<!--平台优势-->
<div class="art1">
    <h2 class="art_title"><span class="text-gradient">招财金服平台优势</span></h2>
    <div class="art_duijie">
        <a href="javascript:void(0);">
            <ul>
                <li>
                    <img src="/Content/Image/index/index_icon01.png" />
                    <p><span>实力资金背景</span>招财金服与68家信托公司，3000多家银<br>行，市面上70多家资管公司达成战略合<br>作，资金面广，解决融资后顾之忧。</p>
                </li>
                <li>
                    <img src="/Content/Image/index/index_icon02.png">
                    <p><span>海量资金库</span>7000+资金方持有资产均过百<br>亿以上，强大的资金库做您融<br />资的坚实后盾。</p>
                </li>
                <li>
                    <img src="/Content/Image/index/index_icon03.png">
                    <p><span>精准匹配对接</span>从事银行、信托、<br>租赁领域的业内精英，精准匹配对接<br>资金方。</p>
                </li>
                <li>
                    <img src="/Content/Image/index/index_icon04.png">
                    <p><span>安全快捷融资</span>提供法律保障，安全对接融<br>资，精准快速匹配资金，解<br>您燃眉之急</p>
                </li>
            </ul>
        </a>
    </div>
</div>
<!--最新签约成功-->
<div class="me_content1">
    <link href="/Content/CSS/cdqy/cd_qianyue.css" rel="stylesheet" />
     
    
    <script src="/JavaScript/cdqy/modernizr.js"></script>
    <script src="/JavaScript/cdqy/velocity.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".trig1").on("click", function () {
                $(".backgPlate").show();
                $(".cd-quick-view").hide();
                $(".quicVie1").show(200);
            })
            $(".trig2").on("click", function () {
                $(".backgPlate").show();
                $(".cd-quick-view").hide();
                $(".quicVie2").show(200);
            })
            $(".trig3").on("click", function () {
                $(".backgPlate").show();
                $(".cd-quick-view").hide();
                $(".quicVie3").show(200);
            })
            $(".cd-close").on("click", function () {
                $(".backgPlate").hide();
                $(".cd-quick-view").hide(200);
            })
        })
    </script>
    <h2 class="art_title"><span class="text-gradient">最新签约成功</span></h2>
    <ul class="cd-items cd-container">
        <li class="cd-item trig1">   
            <div class="cdit_cont">
                <img src="/Content/Image/index/%e4%ba%bf%e9%98%b3.jpg" />
                <div class="cd-trigger ">
                    <p>亿阳集团股份有限公司融资方案</p>
                    <p>资金用途：用于补充亿阳集团股份有限公司流动资金。</p>
                    <p>累计融资：4亿</p>
                </div>
            </div>
        </li><!-- cd-item -->
        <li class="cd-item trig2">  
            <div  class="cdit_cont">
                <img src="/Content/Image/index/%e9%87%91%e8%b4%b5%e9%93%b6%e4%b8%9a.jpg" />
                <div class="cd-trigger ">
                    <p>金贵银业信托融资方案</p>
                    <p>资金用途：用于补充公司流动资金</p>
                    <p>累计融资：1亿</p>
                </div>
            </div>
        </li><!-- cd-item -->
        <li class="cd-item trig3">  
            <div class="cdit_cont">
                <img src="/Content/Image/index/%e5%ae%89%e9%a1%ba%e5%b8%82%e4%bf%a1%e6%89%98.jpg" />
                <div class="cd-trigger ">
                    <p>安顺市信托融资方案</p>
                    <p>资金用途：用于安顺市XX工程建设及补充融资人企业流动资金。</p>
                    <p>累计融资：10亿</p>
                </div>
            </div>
        </li><!-- cd-item -->
    </ul>
    <div class="cd-quick-view quicVie1"> 
        <div class="">
            <h4 class="c3d7b3a fs16">亿阳集团股份有限公司融资方案<span class="contFinan fs14 c333333 fwo">累计融资：<a class="cff6c00 fs24">4亿</a></span></h4>
            <div class="h10"></div>
            <p>国盛证券资产管理有限公司设立资管计划，国盛证券以受托人的身份接受委托人的委托，将集合的资管计划资金通过信托公司设立的信托计划贷款给亿阳集团股份有限公司，到期由亿阳集团股份有限公司还本付息，国盛证券从中实现收益。</p>
            <div class="pl15">
                <h4 class="c4da149 h40 lh45">风控措施</h4>
                <p class="lh25">1、融资人持有的上市公司（600289）1500万股股票质押，市值约2亿元</p>
                <p class="lh25">2、实际控制人邓伟先生持有的1亿股亿阳集团股份有限公司股权质押。</p>
                <p class="lh25">3、关联公司亿阳石油股份有限公司为本次融资提供保证担保。</p>
                <p class="lh25">4、亿阳集团实际控制人邓伟先生及其配偶提供不可撤销连带责任担保，同时承诺将严格按照相关法律文件的约定及时足额支付到期回购的本金和利息。</p>
            </div>
            <div class="h30"></div>
            <p class="fs16 bge7e7e7 disinlbock pd10">资金用途：用于补充亿阳集团股份有限公司流动资金。</p>
            
        </div> <!-- cd-item-info -->
        <a class="cd-close">X</a>
    </div> <!-- cd-quick-view -->
    <div class="cd-quick-view quicVie2">
        <div class="">
                
            <h4 class="c3d7b3a fs16">金贵银业信托融资方案<span class="contFinan fs14 c333333 fwo"">累计融资：<a class="cff6c00 fs24">1亿</a></span></h4>
            <div class="h10"></div>
            <p>中江国际设立集合资金信托计划，中江国际以受托人的身份接受委托人的委托，将集合的信托计划资金用于受让浙江金盾股份合法持有的【XX公司】（要求净资产不低于1亿）的股权收益权，到期由金盾股份按约无条件回购该股权收益权并承担还款责任，中江国际从中实现信托收益。</p>
            <div class="pl15">
                <h4 class="c4da149 h40 lh45">风控措施</h4>
                <p class="lh25">1、金盾股份实际控制人周建灿夫妇、周纯夫妇提供连带责任担保；</p>
                <p class="lh25">2、签署基本文件：签署《股权收益权买入暨返售协议》、《个人担保合同》等。</p>
            </div>
            <div class="h30"></div>
            <p class="fs16 bge7e7e7 disinlbock pd10">资金用途：用于补充公司流动资金</p>
            
        </div> <!-- cd-item-info -->
        <a   class="cd-close">X</a>
    </div> <!-- cd-quick-view -->
    <div class="cd-quick-view quicVie3">
        <div class="">
            
            <h4 class="c3d7b3a fs16">安顺市信托融资方案<span class="contFinan fs14 c333333 fwo"">累计融资：<a class="cff6c00 fs24">10亿</a></span></h4>
            <div class="h10"></div>
            <p>交易方式：中江国际信托股份有限公司设立集合资金信托计划，中江国际以受托人的身份接受委托人的委托，将集合的信托计划资金用于受让安顺市交通建设投资有限责任公司（融资人）对安顺市政府不低于13亿元的应收账款，到期由融资人或安顺市政府还本付息，中江国际从中实现信托收益。</p>
            <div class="pl15">
                <h4 class="c4da149 h40 lh45">风控措施</h4>
                <p class="lh25">1、安顺市政府与融资人就之前应收账款进行确认，并提供应收账款形成依据，用应收账款进行转让。</p>
                <p class="lh25">2、政府回购：市政府对信托融资作出还款承诺。</p>
                <p class="lh25">3、安顺市国有资产管理有限公司提供连带责任担保；</p>
                <p class="lh25">4、签署基本文件：签署《合作协议书》、《应收账款转让协议》、《保证合同》等。</p>
            </div>
            <div class="h30"></div>
            <p class="fs16 bge7e7e7 disinlbock pd10">资金用途：用于安顺市XX工程建设及补充融资人企业流动资金。</p> 
        </div> <!-- cd-item-info -->
        <a class="cd-close">X</a>
    </div> <!-- cd-quick-view -->
    
</div>
<!--认证官方资金-->
<div class="me_content2">
    <h2 class="art_title art_title2"><span>专业融资对接平台</span></h2>
    <div class="mec_atr">
                <div class="meca_box">
                    <a class="apply-cooperation mecab_box" target="_blank" href="javascript:void(0);"> 
                        <div class="comy_logo"><img src="http://www.zcscs.com/Uploadfile/images/20170823/2017823189446224.jpg" onerror="this.src = '/Content/Image/index/index_compyLogo.png'" /></div>
                        <ul>
                            <li><span>投资机构：</span><span class="text-nowap">苏州信托有限公司</span></li>
                            <li><span>投资偏好：</span><span class="text-nowap">江苏省或其他省会城市，上市</span></li>
                            <li><span>资金规模：</span><span class="text-nowap">2亿</span></li>
                        </ul>
                    </a>
                    <div class="mecab_chat"><a class="apply-cooperation" target="_blank" href="javascript:void(0);">申请合作</a></div>
                </div>
                <div class="meca_box">
                    <a class="apply-cooperation mecab_box" target="_blank" href="javascript:void(0);"> 
                        <div class="comy_logo"><img src="/Content/Image/index/index_compyLogo.png" onerror="this.src = '/Content/Image/index/index_compyLogo.png'" /></div>
                        <ul>
                            <li><span>投资机构：</span><span class="text-nowap">华宸未来基金管理有限公司</span></li>
                            <li><span>投资偏好：</span><span class="text-nowap">房地产有抵押，资质较优项目</span></li>
                            <li><span>资金规模：</span><span class="text-nowap">3亿</span></li>
                        </ul>
                    </a>
                    <div class="mecab_chat"><a class="apply-cooperation" target="_blank" href="javascript:void(0);">申请合作</a></div>
                </div>
                <div class="meca_box">
                    <a class="apply-cooperation mecab_box" target="_blank" href="javascript:void(0);"> 
                        <div class="comy_logo"><img src="http://www.zcscs.com/Uploadfile/images/20170912/2017912161432854.jpg" onerror="this.src = '/Content/Image/index/index_compyLogo.png'" /></div>
                        <ul>
                            <li><span>投资机构：</span><span class="text-nowap">昆仑信托有限责任公司</span></li>
                            <li><span>投资偏好：</span><span class="text-nowap">房地产</span></li>
                            <li><span>资金规模：</span><span class="text-nowap">5亿</span></li>
                        </ul>
                    </a>
                    <div class="mecab_chat"><a class="apply-cooperation" target="_blank" href="javascript:void(0);">申请合作</a></div>
                </div>
                <div class="meca_box">
                    <a class="apply-cooperation mecab_box" target="_blank" href="javascript:void(0);"> 
                        <div class="comy_logo"><img src="http://www.zcscs.com/Uploadfile/images/20170823/20178231717492135.jpg" onerror="this.src = '/Content/Image/index/index_compyLogo.png'" /></div>
                        <ul>
                            <li><span>投资机构：</span><span class="text-nowap">北京信托</span></li>
                            <li><span>投资偏好：</span><span class="text-nowap">暂无</span></li>
                            <li><span>资金规模：</span><span class="text-nowap">无上限</span></li>
                        </ul>
                    </a>
                    <div class="mecab_chat"><a class="apply-cooperation" target="_blank" href="javascript:void(0);">申请合作</a></div>
                </div>
                <div class="meca_box">
                    <a class="apply-cooperation mecab_box" target="_blank" href="javascript:void(0);"> 
                        <div class="comy_logo"><img src="http://www.zcscs.com/Uploadfile/images/20170912/2017912162214449.jpg" onerror="this.src = '/Content/Image/index/index_compyLogo.png'" /></div>
                        <ul>
                            <li><span>投资机构：</span><span class="text-nowap">天津信托有限责任公司</span></li>
                            <li><span>投资偏好：</span><span class="text-nowap">地产类：一二线城市，政府项</span></li>
                            <li><span>资金规模：</span><span class="text-nowap">3亿</span></li>
                        </ul>
                    </a>
                    <div class="mecab_chat"><a class="apply-cooperation" target="_blank" href="javascript:void(0);">申请合作</a></div>
                </div>
                <div class="meca_box">
                    <a class="apply-cooperation mecab_box" target="_blank" href="javascript:void(0);"> 
                        <div class="comy_logo"><img src="http://www.zcscs.com/Uploadfile/images/20170823/20178231717110685.jpg" onerror="this.src = '/Content/Image/index/index_compyLogo.png'" /></div>
                        <ul>
                            <li><span>投资机构：</span><span class="text-nowap">山西信托</span></li>
                            <li><span>投资偏好：</span><span class="text-nowap">暂无</span></li>
                            <li><span>资金规模：</span><span class="text-nowap">无上限</span></li>
                        </ul>
                    </a>
                    <div class="mecab_chat"><a class="apply-cooperation" target="_blank" href="javascript:void(0);">申请合作</a></div>
                </div>
    </div>
    <div class="h70 clearb"></div>
</div>

<!--企业介绍-->
<div class="me_content3">
    <h2 class="art_title3"><span class="text-gradient">企业介绍</span></h2>
    <div class="mec_atr">
        <div class="pt15 fl"><img src="/Content/Image/index/index_img3.png" /></div>
        <div class="text_box">
            <p class="cfff0c3 fs18 bsb7b744b lh50 mb10">深圳前海招财树金融服务有限公司</p>
            <div class="tindent2">深圳前海招财树金融服务有限公司（简称“招财金服”），是严谨、专业、诚信、高效的一站式综合金融服务平台，由金融行业、互联网领域专业人士共同创办；招财金服秉承“合规经营、包容创新、专业专注”的理念，依托专业的金融知识和先进的互联网技术为客户创造价值。</div>
            <div class="tindent2">招财金服为客户提供一站式融资对接服务!拥有多年线下项目与资金对接经验,，专注于打造资金与项目精准对接的平台，提高资金找项目、项目找资金的效率和成功率。凭借自身平台强大的整合能力，招财金服建立了强大的资金、项目信息数据库，打造最符合融资需求的融资服务平台，切实提高企业投融资成功率，改善企业融资难的问题。</div>
        </div>
        <div class="clearb"></div>
    </div>
    <div class="h60"></div>
    <div class="w1200 mauto pl30 pr30 boxsbb">
        <p class="cfff0c3 fs18 bsb7b744b lh50 mb10">团队介绍</p>
        <div class="tindent2 c999999 lh30">公司管理团队主要来自于投行、信托、私募基金、大型互联网金融平台、国内知名咨询管理公司、PE、VC、风投及民间资金机构的投资团队，在金融政策把握、市场建设、产品设计、风控与规范等方面有着丰富的经验，并且与政府部门、金融管理部门、业界等有长期良好的沟通和合作，能为企业提供真实、高效、精准、可靠的融资对接服务，为企业安全快速融资保驾护航。</div>
    </div>
    

        <div class="h90"></div>
    </div>
<!--快速融资 只需要五步-->
<div class="me_content4">
    <h2 class="art_title"><span class="text-gradient">快速融资 只需5步</span></h2>
    <div class="w1200 mauto tac"><img src="/Content/Image/index/index_img4.png" /></div>
    
    <div class="h20"></div>
</div>


    </div>

    
    <script>
        $(document).ready(function () {
            var cwidht = $(document.body).width()  
            $("#returnTop").css("left", "" + ((cwidht - 1200) / 2 + 1220) + "px")
            
            $(window).scroll(function () {
                var sc = $(window).scrollTop();
                if (sc > 250) {
                    $("#returnTop").css("display", "block");
                } else {
                    $("#returnTop").css("display", "none");
                }
            })
            $("#returnTop").click(function () { 
                var sc = $(window).scrollTop();
                $('body,html').animate({ scrollTop: 0 }, 500);
            })
        });
    </script>
    <div class="" id="returnTop"></div>
    
    <script>
        //各种提示的弹出框
        function publicUpbox(strText) {
            document.getElementById("pupText").innerHTML = strText;
            //$(".backgPlate").show();
            $(".publicUpbox").show();
            setTimeout(function () {
                $('.publicUpbox').hide(500); //将DIV标签隐藏。
            }, 2000);
        }
        function reghint() {
            $(".backgPlate").show();
            $(".reghint").show();
        }
        $(document).ready(function () {

            

            
            $(".loginButton").on('click', function () {
                if ($("#loginphone").val() != "" && $("#loginphone").val() != null) {
                    $.ajax({
                        url: '/index/login',
                        type: 'post',
                        data: { userName: $("#loginphone").val(), password: $("#loginpassword").val(), code: $("#loginyzm").val() },
                        success: function (data) {
                            if (data == "0") {
                                alert("请输入正确的验证码");
                            } else if (data == "-1") {
                                alert("用户名或密码错误,请重新填写!");
                            } else if (data == "2") {
                                alert("验证码已过期,请重新获取");
                            } else if (data == "1") {
                                //alert("登录成功");
                                location.href = "/index/index";
                                // $(".join_login").hide();
                            } else if (data == "3") {
                                alert("请填入正确的手机号码,密码和验证码");
                            }
                        }
                    });
                } else if ($("#yzmphone").val() != "" && $("#yzmphone").val() != null) {
                    //alert($("#yzmphone").val());
                    //$(".yzm_").on('click', function () {
                        $.ajax({
                            url: '/user/PhoneLogin',
                            type: 'post',
                            data: { mobile: $("#yzmphone").val(), message: $("#yzmmessage").val(), code: $("#yzm").val() },
                            success: function (data) {
                                if (data == "0") {
                                    alert("手机号码还未注册或被禁用!");
                                } else if (data == "2") {
                                    alert("手机号码错误,请重新输入!");
                                }  else if (data == "3") {
                                    alert("短信验证码失效,请重新获取!");
                                } else if (data == "4") {
                                    alert("图形码错误!");
                                } else if (data == "6") {
                                    alert("短信验证码错误!");
                                } else if (data == "7") {
                                    alert("图形验证码已过期,请重新获取!");
                                } else if (data == "8") {
                                    alert("图形验证码错误,请重新填写!");
                                } else if (data == "9") {
                                    alert("请填入正确的手机号码,图形验证码和短信验证码!");
                                }
                                else if (data == "5") {
                                    alert("还未获取验证码,请获取验证码!");
                                } else if (data == "1") {
                                    location.href = '/index/index';
                                } else {
                                    alert("服务器错误,请联系网站相关人员!");
                                }
                            }
                        });
                    //});
                } else {
                    alert("当前对应项都不能为空!");
                }
            });



            $(".protocol").click(function () { //协议书弹出框
                $(".backgPlate").show();
                $("._hangProtocol").css("left", "50%");
            });
            $(".Colse").click(function () { //申请合作未登录 关闭弹出框
                $(".login_authe").hide();
                $("._hangProtocol").css("left", "-100%");
                $(".backgPlate").hide();
            });

            $(".psw_tab").click(function () {// 密码登录 账户
                $(".yzm_tab").removeClass("active");
                $(this).addClass("active");
                $(".yzm_login").css("margin-top", "0px");
                $("#loginphone,#loginpassword,#loginyzm").val('');
            });
            $(".yzm_tab").click(function () {// 手机验证码登录 账户
                $(".psw_tab").removeClass("active");
                $(this).addClass("active");
                $(".yzm_login").css("margin-top", "-160px");
                $("#yzmmessage,#yzmphone,#yzm").val('');
            });

            //协议书 切换
            $(".protocol_tab .pro_").click(function () {
                $(".protocol_tab a").removeClass("active");
                $(this).addClass("active");
                $(".hp_content").addClass("disnone");
                $(".protocol_text").removeClass("disnone");
            });
            $(".protocol_tab .pun_").click(function () {
                $(".protocol_tab a").removeClass("active");
                $(this).addClass("active");
                $(".hp_content").addClass("disnone");
                $(".punish_text").removeClass("disnone");
            });
            $(".protocol_tab .pri_").click(function () {
                $(".protocol_tab a").removeClass("active");
                $(this).addClass("active");
                $(".hp_content").addClass("disnone");
                $(".privacy_text").removeClass("disnone");
            });

            /* 未认证弹出框 */ 
            

            $(".notAuthentication_box .colse_").click(function () {
                $(".login_authe").hide(250);
                $(".backgPlate").hide();
            });
            // 注册后提醒 认证
            $(".regh_bnt").click(function () {
                $(".reghint").hide(250);
                $(".backgPlate").hide();
            });
            // 全局弹框 关闭
            //$(".pupbox_colse").click(function () {
            //    //$(".publicUpbox").hide(250);
            //    $(".backgPlate").hide();
            //})
        });

        var countdown = 60;
        function settime(obj) {
            if ($("#yzmphone").val() == "" || $("#yzmphone").val() == null) {
                alert("请输入手机号码!");
            } else {
                $.ajax({
                    url: '/user/SendNotes',
                    type: 'post',
                    data: { phone: $("#yzmphone").val() },
                    function (data) {
                        //console.log(data);
                        if (data == "0") {
                            if (countdown == 0) {
                                obj.removeAttribute("disabled");
                                obj.value = "获取短信验证码";
                                countdown = 60;
                                return;
                            } else {
                                obj.setAttribute("disabled", true);
                                obj.value = "重新发送(" + countdown + ")";
                                countdown--;
                            }
                            setTimeout(function () {
                                settime(obj)
                            }, 1000)
                        } else if (data == "2") {
                            alert("手机号码错误,请重新输入!");
                        } else if (data == "1") {
                            alert("手机号码已被注册,请重新输入!");
                        } else {
                            alert("服务器错误,请联系网站相关人员!");
                        }
                    }
                });
            }
        }

        function LoginOut() {
            $.ajax({
                url: '/user/signout',
                type: 'post',
                data: {},
                success: function (data) {
                    if (data == "0") {
                        location.href = window.location.href;
                    }
                }
            })
        }
    </script>
    

    <div class="backgPlate"></div> 
    
    <div class="login_authe disnone">
            <script>
                $(document).ready(function () {
                    $(".apply-cooperation").click(function () {//认证弹框
                        $(".backgPlate").show();
                        $(".login_authe").show(250);
                    });
                })
            </script>
            <div class="notAuthentication_box">
                
                <div class="content_">您还未进行机构认证，机构认证完成后可查看详情，是否前往？</div>
                <div class="link_">
                    <a class="authent_" href="/User/userAttestation">前往认证</a>
                    <a class="colse_">我再看看</a>
                </div>
            </div>
    </div>
    
    <div class="reghint">
        <div class="regh_tt"><img src="/Content/Image/reghint_tt.png" /></div>
        <div class="h20"></div>
        <div class="regh_cont">
            <p class="pb20">● 您将享有以下会员权利：</p>
            <div class="pb30">①发布融资项目；②查看资金方的投融需求；③一对一融资规划服务；④团队融资规划服务。</div>
            <p class="pb30">● 您需要先进行机构认证，待认证审核之后，您可直 接查看资金方投资需求；</p>
            <p class="pb30">● 通过机构认证后，您可直接发布项目，将会有融资规划师为您进行一对一的服务。</p>
        </div>
        <div class="h30"></div>
        <div class="regh_bnt"><a href="/user/userAttestation">前往认证</a></div>
    </div> 
     
    <div class="publicUpbox">
        
        <div class="pupbox_text" id="pupText"></div>
        
    </div>

    
    <div class="_hangProtocol">
        <div class="_hr_title">服务条款<div class="Colse">X</div></div>
        <div class="protocol_tab">
            <a class="active pro_">服务协议</a>
            <a class="pun_">违规处罚</a>
            <a class="pri_">隐私条款</a>
        </div>
        <div class="protocol_text hp_content">
            <p>
                <span  >尊敬的用户：<span></span></span>
            </p>
            <p>
                <span  >欢迎注册招财融资网会员，请您使用服务之前认真阅读服务协议全部内容。<span></span></span>
            </p>
            <p>
                <span  >本服务协议的组成部分包括《服务协议》、《管理规则》、《隐私协议》、《法律声明》等，如果您对本协议任何条款表示异议，您可以选择不使用招财融资网的服务。点击<span>“</span>立即注册<span>”</span>按钮，则默认您自愿遵守本协议全部内容，招财融资网有权对您进行电话回访，注册会员将受以下条款约束。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >本协议阐述之条款和条件适用于用户使用招财融资网（网址）所提供的各种在线投融资的工具、服务和衍生的线下服务。招财融资网是中国领先的全产业链融资并购信息服务平台。招财融资网网站的运营权归深圳前海招财树金融服务有限公司所有，招财融资网和深圳前海招财树金融服务有限公司，视为同一个主体。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >一、用户的权利和义务<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 1.</span><span  >用户同意遵守本协议后，在招财融资网完成注册，进行投资、融资、并购、招商引资和信息交流活动的主体，包括项目方、资金方、招商方、交易信息的发布者等所有参与本平台活动的自然人、法人或者其他组织。用户应当具备相应民事行为能力，不具备民事行为能力或者缺乏特定许可资质的用户与招财融资网签署的协议无效。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 2.</span><span  >用户在遵守本协议的前提下，依法享有招财融资网提供的服务，有权对招财融资网的服务进行监督、批评和指导，招财融资网欢迎用户提出服务改进建议，并会以诚恳态度为用户提供服务。<span></span></span>
            </p>
            <p>
                <span  > <span>3. </span>用户应按照本协议和本平台的有关管理规则提交注册信息，并保证注册信息的真实性和完整性。用户可选择不公开或部分公开自己的注册信息，对用户选择公开的信息以及用户上传的资料信息，招财融资网、其他用户及其他浏览者将有权依据各自权限级别浏览、查阅和利用。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 4. </span><span  >用户需妥善保管好自己的用户名和密码，不得以任何形式擅自转让或授权他人使用自己在招财融资网的用户帐号。用户对其在招财融资网注册的用户名和密码的安全性以及用户名进行的所有活动和事件负全部责任，若发现任何非法使用用户账号或存在安全漏洞的情况，应立即通知招财融资网。<span></span></span>
            </p>
            <p>
                <span  > <span>5. </span>用户保证通过招财融资网发布的信息是真实且合法的，用户发布的信息不能含有任何违反国家有关法律、法规及中华人民共和国承认或加入的国际条约的内容，包括但不限于危害国家安全、淫秽色情、虚假、侮辱、诽谤、恐吓或骚扰、蓄意毁坏、恶意干扰、秘密地截取或侵占任何系统、数据等侵犯他人知识产权、人身权或其他合法权益以及有违社会公序良俗的内容或指向这些内容的链接。<span></span></span>
            </p>
            <p>
                <span  > <span>6. </span>用户有权享有招财融资网平台提供的各种服务，在本平台进行包括但不限于信息发布、信息浏览、信息订阅等相关活动时，应当严格遵守招财融资网的相关管理规则，该规则包括但不限于《隐私条款》、《法律声明》等管理规则。<span></span></span>
            </p>
            <p>
                <span  > <span>7. </span>用户通过招财融资网进行信息发布、信息浏览、信息订阅等活动所引起的一切法律纠纷均与招财融资网无关。因用户违反有关法律、法规或本协议的有关规定而给招财融资网或者第三方造成损失的，用户同意赔偿因此而导致的全部损失，包括但不限于实际损失、可预期利益、因此发生的诉讼费、律师费、赔偿金等。<span></span></span>
            </p>
            <p>
                <span  > <span>8. </span>用户在招财融资网实施了违法行为，导致第三方投诉（包括但不限于第三方以发函等形式指控招财融资网侵权，对招财融资网提起诉讼、仲裁，或使招财融资网面临相关主管机关的审查或质询），招财融资网有权先暂停用户对招财融资网的使用。用户应在收到招财融资网通知后，应以自己名义出面与第三方协商、参与诉讼或接受相关主管机关审查或质询，并承担所有费用，并赔偿因此给招财融资网造成的全部损失。<span></span></span>
            </p>
            <p>
                <span  > <span>9. </span>用户不得通过任何方式攻击、干扰或试图攻击、干扰招财融资网的正常运作及其有关活动，也不得帮助或教唆任何第三方从事上述活动。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >二、招财融资网的权利义务<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  > <span>1. </span>招财融资网在提供本平台服务时，可能会对部分服务收取一定的费用，并会在相关页面上做明确的提示。如用户拒绝支付该等费用，则不能使用相关服务。招财融资网将保留收取或不收取服务费用的权利。<span></span></span>
            </p>
            <p>
                <span  > <span>2. </span>招财融资网会对用户上传的内容进行人工审核，该审查为规范性审核，无法保证用户上传内容的真实性、准确性、有效性和安全性。但在本平台实施管理活动以及第三方对用户发布信息进行投诉时，本平台会对用户提供的信息进行复核，并可能会要求用户提供相应证据来证明信息的真实性及合法性，在用户无法提供有效证明时，本平台有权删除相关信息或终止服务。<span></span></span>
            </p>
            <p>
                <span  > <span>3. </span>为了更好的服务用户，招财融资网及其关联机构除对用户提供的资料拥有合理使用权外，还拥有独家的免费的许可使用权。许可使用范围包括复制、发行、展览、信息网络传播、改编、翻译、汇编等。用户将前述资料提供给招财融资网期间，使用权持续有效。若用户发现招财融资网对用户资料的使用不当时请及时提出，招财融资网将尽快改正。<span></span></span>
            </p>
            <p>
                <span  > <span>4. </span>招财融资网有权随时删除含有任何危害国家安全、淫秽色情、虚假、侮辱、诽谤、恐吓或骚扰、侵犯他人知识产权或人身权或其他合法权益等违法或有违社会公序良俗的内容或指向这些内容链接的信息，并有权终止对发布前述信息的用户的服务。<span></span></span>
            </p>
            <p>
                <span  > <span>5. </span>通过招财融资网服务存储或传送之任何信息、通讯资料和其他内容，如被删除或未予储存，招财融资网毋须承担任何责任。<span></span></span>
            </p>
            <p>
                <span  > <span>6. </span>招财融资网可能会提供与其他互联网网站或资源进行链接；用户还可能通过招财融资网与推广商进行互动（包括但不限于参与促销活动，进行相关商品或服务之付款及交付），对于前述网站或资源是否可以利用或用户与前述推广商的自主互动而遭受的任何性质的损失或损害，招财融资网不承担任何责任。<span></span></span>
            </p>
            <p>
                <span  > <span>7. </span>用户所从事的经营业务不得对招财融资网利益构成任何现实或潜在的损害或冲突，否则招财融资网有权通知用户立即终止服务，而无需承担其他法律责任和费用补偿。<span></span></span>
            </p>
            <p>
                <span  > <span>8. </span>如若系统发生故障影响到本平台的正常运行，招财融资网承诺及时处理进行修复。但用户因此而产生的经济和精神损失，招财融资网不承担任何直接或间接的责任。对于招财融资网有计划的系统维修、保养、升级，招财融资网将会以网站公告的方式事先通知用户，升级期间，招财融资网服务将不同程度受到影响，用户因此而产生的损失，招财融资网不承担任何直接或间接的责任。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 9. </span><span  >用户完全理解并同意，通过招财融资网可能会收到推广信息及服务信息，凡因接收相应推广信息而与信息发布者或推广商发生交易行为而遭受的任何性质的损失或损害，招财融资网均不予负责。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 10. </span><span  >用户在无法核实合作方信息的情况下，请务必联系招财融资网对他人公司的资质、实力进行详细调查了解，对于任何未经过招财融资网核实信息而私自合作所产生的纠纷，招财融资网不承担用户产生的经济和精神损失，不承担任何直接或间接的责任。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 11. </span><span  >招财融资网拥有对本协议条款的修改权、更新权、解释权。用户对服务之任何部分或本协议条款的任何部分之意见及建议可与招财融资网取得联系。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >三、隐私权保护<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; </span><span  >招财融资网将严格依照《隐私条款》及国家法律法规给予用户隐私权保护。详见《隐私条款》条文。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >四、知识产权声明<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; </span><span  >招财融资网独立拥有或与相关内容提供者共同拥有本平台内相关内容（包括但不限于网络域名、文字、图片、音频、视频资料、设计、商标、标识、网站构架、网站版面的安排、网页设计、软件和全部专有数据库等）的知识产权，包括但不限于著作权、商标权、专利权或其它专属权利等。未经招财融资网书面许可，任何人不得擅自使用。否则，招财融资网将依法追究侵权人法律责任。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >五、协议的变更、解除和终止<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 1. </span><span  >变更<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; </span><span  >招财融资网可以根据相关政策和客观情况的变化，对进行业务性或产品性调整，并变更本协议，变更后的本协议将会在招财融资网上重新公布，用户可以选择继续使用调整后的业务或产品。用户如果对变更后的协议持有异议，可以选择退出招财融资网，但招财融资网对此不承担任何法律责任和费用补偿。如果用户继续选择享用招财融资网，则默认用户完全接受本协议及其修改。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >2. </span><span  >解除和终止<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; </span><span  >如果发生以上任何一种情形，招财融资网有权随时解除或终止向用户提供服务，且无需通知用户。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 1) </span><span  >用户违反相关法律法规或者本协议及其修改文本的规定；<span></span></span>
            </p>
            <p>
                <span  > <span>2) </span>用户提供的个人资料不真实；<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 3) </span><span  >招财融资网发现同一公司主体注册多个帐号；<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 4</span><span  >）用户恶意注册帐号；<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 5) </span><span  >招财融资网收到第三方投诉；<span></span></span>
            </p>
            <p>
                <span  > <span>6) </span>同行业者通过注册账号等行为，获取联系方式，窃取商业机密；<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 7</span><span  >）其他招财融资网认为是符合整体服务需求的特殊情形。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >六、不可抗力<span></span></span>
            </p>
            <p>
                <span  > <span>1. </span>不可抗力是指协议双方不能合理控制、不可预见或即使预见亦无法避免的事件，该事件使任何一方根据本协议履行其全部或部分义务已不可能。该事件包括但不限于政府行为、自然灾害或其它天灾、战争或任何其它类似事件。<span></span></span>
            </p>
            <p>
                <span  > <span>2. </span>鉴于互联网之特殊性质，不可抗力亦包括下列影响互联网正常运行之情形：<span>1</span>）黑客攻击；<span>2</span>）电信部门技术调整导致之重大影响；<span>3</span>）病毒侵袭等。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 3. </span><span  >招财融资网如遭受不可抗力事件，有权暂停或终止服务，不视为违约。在不可抗力事件影响结束后，应当继续按本协议履行其义务。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >七、法律适用及争议解决<span></span></span>
            </p>
            <p>
                <span  > <span>1. </span>本协议的订立、生效、解释、执行、管辖、争议的解决均适用中华人民共和国法律。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 2. </span><span  >因本协议引起的或与本协议有关的任何争议，应尽最大诚意进行友好协商，如果双方不能协商一致，协议双方向本协议的履行地即服务器所在地有管辖权的人民法院起诉。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >八、其他<span></span></span>
            </p>
            <p>
                <span  > <span>1. </span>本协议适用的通知方式。<span></span></span>
            </p>
            <p>
                <span  > <span>1) </span>拨打客服电话<span>400-8800-209</span>、发送邮件至客服邮</span><span  >cloud6286@126.com</span><span  >邮寄快递均视为用户的有效通知。<span></span></span>
            </p>
            <p>
                <span  > <span>2) </span>若通知以电子邮件形式发送，则通知收件日期以邮件进入收件方指定的电子邮件系统的时间为准；若通知及函件以邮寄快递或挂号邮件发送时，则通知收件日期以收件方签收之日为准；以多种方式通知收件方的，收件日期以最早的收件日期为准。<span></span></span>
            </p>
            <p>
                <span  > <span>2. </span>本公司未行使或执行本服务协议任何权利或规定，不构成对前述权利或权益之放弃。<span></span></span>
            </p>
            <p>
                <span  > <span>3. </span>如本服务协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本服务协议的其余条款仍应有效并且有约束力。<span></span></span>
            </p>
            <p>
                <span  > <span>4. </span>免责声明：网站所展示的信息由会员自行提供，内容的真实性、准确性和合法性由发布会员负责。招财融资网对此不承担任何责任。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;&nbsp;&nbsp; 5. </span><span  >友情提醒：注意融资风险，建议您在招财融资网时务必对他人公司的资质、实力进行详细调查了解，特别警惕各类前期费用！<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >九、本协议一经用户点击<span>“</span>立即注册<span>”</span>按钮后，立即生效。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
        </div>
        <div class="punish_text hp_content disnone">
            <p>
                <span  >为了还<span>“</span>招财融资网<span>”</span>网站一片清净，维护网站的公平公正，特对用户网上行为做如下约束。<span></span></span>
            </p>
            <p>
                <span  > <span></span></span>
            </p>
            <p>
                <span  >一、处理分类 <span></span></span>
            </p>
            <p>
                <span  >对用户行为处理形式包括几下几种：<span></span></span>
            </p>
            <p>
                <span  >1</span><span  >、禁<span>IP——</span>该账号被冻结，且该<span>IP</span>下不可浏览网站和注册账号<span></span></span>
            </p>
            <p>
                <span  >2</span><span  >、冻结账号<span>——</span>不能登录账号使用<span></span></span>
            </p>
            <p>
                <span  >3</span><span  >、禁言<span>——</span>可以登录账号查看信息，但不能发布信息、评论或其他操作<span></span></span>
            </p>
            <p>
                <span  >4</span><span  >、禁回复<span>——</span>可以发布信息和交换名片，但不能对他人信息发表评论<span></span></span>
            </p>
            <p>
                <span  >5</span><span  >、警告<span>——</span>收到警告信息<span></span></span>
            </p>
            <p>
                <span  > <span></span></span>
            </p>
            <p>
                <span  >二、要求<span></span></span>
            </p>
            <p>
                <span  >1</span><span  >、每种处理形式，都有效期设定，以天为单位<span></span></span>
            </p>
            <p>
                <span  >2</span><span  >、处理形式可共存，如可以警告（加理由）然后禁言<span></span></span>
            </p>
            <p>
                <span  >3</span><span  >、处罚等级：警告<span>-</span>禁回复<span>-</span>禁言<span>-</span>冻结账号<span>-</span>禁<span>IP</span></span>
            </p>
            <p>
                <span  >4</span><span  >、凡冻结账户，其所发所有信息，前台均不可见 <span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >注：最终解释权归</span><span  >深圳前海招财树金融服务有限公司</span><span  >所有<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
        </div>
        <div class="privacy_text hp_content disnone">
            <p>
                <span  >一、隐私保护<span></span></span>
            </p>
            <p>
                <span  >招财融资网会尽一切合理努力，保护您的隐私信息不被泄露给无关的第三方，保守您的秘密。您可随时访问或修改在注册时填写的信息，包括信息的公开或保密状态。如果您有任何疑问，请与招财融资网客服取得联系。<span></span></span>
            </p>
            <p>
                <span  > <span></span></span>
            </p>
            <p>
                <span  >二、隐私信息<span></span></span>
            </p>
            <p>
                <span  >隐私信息包括：用户住址；用户联系方式；用户账号密码；用户设置的不公开的其他信息。<span></span></span>
            </p>
            <p>
                <span  > <span></span></span>
            </p>
            <p>
                <span  >三、非隐私信息说明<span></span></span>
            </p>
            <p>
                <span  >下列信息不属于隐私信息：<span></span></span>
            </p>
            <p>
                <span  >1</span><span  >、您发布的项目信息；<span></span></span>
            </p>
            <p>
                <span  >2</span><span  >、您希望公开的其他信息；<span></span></span>
            </p>
            <p>
                <span  >3</span><span  >、您在本网站上进行登录、操作等活动过程中本网站记录的相关信息；<span></span></span>
            </p>
            <p>
                <span  >4</span><span  >、为了其他用户的利益必须公开的其他信息。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >四、授权公开信息<span></span></span>
            </p>
            <p>
                <span  >下列情况视为用户<span>“</span>以明确的方式授权<span>”</span>本网站向第三人披露用户的有关信息：<span></span></span>
            </p>
            <p>
                <span  >1</span><span  >、在本网站交换名片；<span></span></span>
            </p>
            <p>
                <span  >2</span><span  >、在本网站对其他项目信息进行了回应；<span></span></span>
            </p>
            <p>
                <span  >3</span><span  >、在本网站发布信息；<span></span></span>
            </p>
            <p>
                <span  >4</span><span  >、在本网站填写信息时，勾选了<span>“</span>公开<span>”</span>或者其他类似的选项；<span></span></span>
            </p>
            <p>
                <span  >5</span><span  >、用户以信函、电子邮件或传真等有形的方式授权；<span></span></span>
            </p>
            <p>
                <span  >6</span><span  >、在必要情况下用户以口头授权，后以信函、电子邮件或传真等有形的方式确认此项授权；或者本网站得到用户的口头授权后，以信函、电子邮件或传真等有形的方式向用户确认是否授权，授权披露信息的范围、内容等，用户在半小时以内未予答复，默认了此项授权。<span></span></span>
            </p>
            <p>
                <span  >7</span><span  >、其他明确的方式。<span></span></span>
            </p>
            <p>
                <span  >&nbsp;</span>
            </p>
            <p>
                <span  >五、合理公开信息说明<span></span></span>
            </p>
            <p>
                <span  >下列情况下，本网站有权公布或向第三人披露您的有关信息：<span></span></span>
            </p>
            <p>
                <span  >1</span><span  >、用户以明确的方式授权；<span></span></span>
            </p>
            <p>
                <span  >2</span><span  >、国家法律法规、行政机关要求；<span></span></span>
            </p>
            <p>
                <span  >3</span><span  >、仲裁机构的裁决的要求；<span></span></span>
            </p>
            <p>
                <span  >4</span><span  >、司法机关的判决、裁定、协助执行通知书或者其他法律文件要求；<span></span></span>
            </p>
            <p>
                <span  >5</span><span  >、用户违反了使用条款的规定或者有其他损害招财融资网权益的行为；<span></span></span>
            </p>
            <p>
                <span  >6</span><span  >、为向用户提供其需要的信息，必须公布或向第三人披露用户的有关信息；<span></span></span>
            </p>
            <p>
                <span  >7</span><span  >、为了用户的利益而必须公布或向第三人披露用户的有关信息的其他情形。<span></span></span>
            </p>
            <p>
                <span  > <span></span></span>
            </p>
            <p>
                <span  >六、保护说明<span></span></span>
            </p>
            <p>
                <span  >以下情形导致您的隐私信息被泄露，本网站不承担任何责任：<span></span></span>
            </p>
            <p>
                <span  >1</span><span  >、不可抗力；<span></span></span>
            </p>
            <p>
                <span  >2</span><span  >、意外事件；<span></span></span>
            </p>
            <p>
                <span  >3</span><span  >、本网站采取了合理的防护措施而遭到黑客攻击、电脑病毒侵入；<span></span></span>
            </p>
            <p>
                <span  >4</span><span  >、用户未能妥善保管您的隐私信息；<span></span></span>
            </p>
            <p>
                <span  >5</span><span  >、用户主动向第三人透露隐私信息；<span></span></span>
            </p>
            <p>
                <span  >6</span><span  >、其他不可归责于本网站的原因。<span></span></span>
            </p>
            <p>
                <span >&nbsp;</span>
            </p>
        </div>
        <div class="bm_text">安全快捷的企业融资服务平台</div>
    </div>


    <link href="/Content/CSS/footer.css" rel="stylesheet" />
    <div class="footer">
        <div class="bg333333">
            <div class="mauto w1200 disflex pt15 pl10 pr10 pb20 justcsb">
                <div class="f_left fl">
                    <div><img src="/Content/Image/Member/zcjf_logo.png" /></div>
                    <div class="h20"></div>
                    <ul>
                        <li class="c999999">7X24小时融资热线：</li>
                        <li class="fs22 cf6eba7 fwb">400-8800-209</li>
                        <li class="c999999"><span>E-Mail：</span><span>296720367@qq.com</span></li>
                    </ul>
                </div>
                <div class="f_mind fl" >
                    <div><img src="/Content/Image/Member/zcjf_erweima.png" /></div>
                    <div class="ce2e2e2 lh30 tac">关注官方微信</div>
                </div>
                <div class="f_right fr">
                    <div class="h10"></div>
                    <ul class="fr_navlist">
                        <li><a href="/about/company_introduce">关于我们</a></li>
                        <li><a href="/member_specially/member_specially">会员服务</a></li>
                        <li><a href="/newsindex/newsindex">金融学院</a></li>
                        <li><a href="/seekfund/seekfund">找资金</a></li>
                        <li><a href="/about/callwe">联系我们</a></li>
                    </ul>
                    <div class="h30"></div>
                    <ul class="fr_linklist">
                        <li>友情链接：</li>
                        <li><a target="_blank" href="http://www.csrc.gov.cn/pub/newsite/">中国证监会</a></li>
                        <li><a target="_blank" href="http://www.cbrc.gov.cn/index.html">中国银监会</a></li>
                        <li><a target="_blank" href="http://www.stockstar.com/">证券之星</a></li>
                        <li><a target="_blank" href="http://www.jrj.com.cn/">金融界</a></li>
                        <li><a target="_blank" href="http://www.eastmoney.com/">东方财富网</a></li>
                        <li><a target="_blank" href="http://www.cnfol.com/">中金在线</a></li>
                        <li><a target="_blank" href="http://www.hexun.com/">和讯财经</a></li>
                        <li><a target="_blank" href="http://www.forbeschina.com/">福布斯中国</a></li>
                        <li><a target="_blank" href="http://www.sac.net.cn/">中国证券业协会</a></li>
                        <li><a target="_blank" href="http://www.szse.cn/">深圳证券交易所</a></li>
                        <li><a target="_blank" href="http://cs.ecitic.com/">中信证券</a></li>
                        <li><a target="_blank" href="http://stock.pingan.com/beta/index.shtml">平安证券官方网站</a></li> 
                    </ul>
                    <div class="clearb"></div>
                </div>
                <div class="clearb"></div>
            </div>
        </div>
        <div class="bg000000 c999999 tac lh50">©2015-2019 www.zcscs.com 深圳前海招财树金融服务有限公司 版权所有 粤ICP备 15073245号-1</div>
    </div>
</body>
</html>
