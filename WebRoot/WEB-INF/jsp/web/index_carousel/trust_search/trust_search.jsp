<%@page pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">

<meta charset="utf-8">
<title>2017高收益信托产品查询__环成金服</title>
<link rel="Shortcut Icon" href="static/img/web/logo2.ico">
<script src="static/js/jquery-1.7.2.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
		<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
		<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
		<link rel="stylesheet" href="static/css/web/index_carousel/trust_search/trust_search.css" type="text/css">
<script src="static/js/web/index_carousel/trust_search/trust_search.js"></script>
<%@include file="../../baidusq.jsp"%>
</head>

<body>
	<div class="top">
        	<div class="top_box">
            	<a href=" " target="_blank">
            		<div class="top_logo">环成金服</div>
            	</a>
                <div class="top_phone"></div>
            </div>
        
        </div>
	<div class="banner_1"></div>
	<div class="Choice">
    	<div class="tit tit_2"></div>
    
    	<div class="Choice_con">
        	<h4>认购起点</h4>
        	<ul id="INVESTMENTTHRESHOLD" class="Choice_1">
            	<li class="default">不限</li>
            	<li>50万-100万（含）</li>
                <li>100万-300万（含）</li>
                <li>300万以上</li>
            </ul>
        
        	<h4>产品期限</h4>
        	<ul id="PRODUCTDEADLINE" class="Choice_1">
            	<li class="default">不限</li>
            	<li>12个月以内</li>
                <li>12个月</li>
                <li>12至23个月</li>
                <li>24个月</li>
                <li>24个月以上</li>
            </ul>
            
            <h4>预购收益</h4>
        	<ul id="RETURNSBENCHMARK" class="Choice_1">
            	<li class="default">不限</li>
            	<li>7%以下</li>
                <li>7%-7.9%</li>
                <li>8%-8.9%</li>
                <li>9%-9.9%</li>
                <li>10%以上</li>
                <li>浮动收益</li>
            </ul>
            
            <h4>付息方式</h4>
        	<ul id="PAYINTERESTWAY" class="Choice_1">
           		<li class="default" >不限</li>
            	<li>按季付息</li>
            	<li>半年付息</li>
                <li>按年付息</li>
                <li>到期付息</li>
            </ul>
            
            <h4>投资领域</h4>
        	<ul id="INVESTMENTFIELD" class="Choice_1">
            	<li class="default" >不限</li>
            	<li>工商企业类</li>
                <li>金融市场类</li>
                <li>政信类</li>
                <li>房地产类</li>
                <li>其他</li>
            </ul>

        </div>
    	
       <center> <button class="but_2">开始查找</button> </center>
    </div>

	<div class="ranking">
    	<div class="tit tit_1"></div>
        
        <div class="ranking_1">
        	<h4>中信信托 <span>实力排名第一</span></h4>
            <div class="ranking_con">
            	<p class="p_r">股东背景：</p><p class="p_l">金融机构控股</p><br/>
                <p class="p_r">注册资本：</p><p class="p_l">1000000万元 </p><br/>
                <p class="p_r">资产管理规模：</p><p class="p_l">7297.00亿元 </p> <br/>
            </div>
        	<button class="but_1">了解咨询</button>
        </div>
        
        <div class="ranking_1">
        	<h4>平安信托 <span>实力排名第二</span></h4>
            <div class="ranking_con">
            	<p class="p_r">股东背景：</p><p class="p_l">金融机构控股</p><br/>
                <p class="p_r">注册资本：</p><p class="p_l">1200000万元 </p><br/>
                <p class="p_r">资产管理规模：</p><p class="p_l">6772.21亿元 </p> <br/>
            </div>
        	<button class="but_1">了解咨询</button>
        </div>
        
        <div class="ranking_1">
        	<h4>重庆信托 <span>实力排名第三</span></h4>
            <div class="ranking_con">
            	<p class="p_r">股东背景：</p><p class="p_l">名省级政府控股</p><br/>
                <p class="p_r">注册资本：</p><p class="p_l">243873万元 </p><br/>
                <p class="p_r">资产管理规模：</p><p class="p_l">1263.00亿元 </p> <br/>
            </div>
        	<button class="but_1">了解咨询</button>
        </div>
        
        <div class="ranking_1">
        	<h4>安信信托 <span>实力排名第四</span></h4>
            <div class="ranking_con">
            	<p class="p_r">股东背景：</p><p class="p_l">地方企业控股</p><br/>
                <p class="p_r">注册资本：</p><p class="p_l">45410.00万元 </p><br/>
                <p class="p_r">资产管理规模：</p><p class="p_l">4320.00亿元 </p> <br/>
            </div>
        	<button class="but_1">了解咨询</button>
        </div>
        
        <div class="ranking_1">
        	<h4>中融信托 <span>实力排名第五</span></h4>
            <div class="ranking_con">
            	<p class="p_r">股东背景：</p><p class="p_l">中央企业控股</p><br/>
                <p class="p_r">注册资本：</p><p class="p_l">600000万元 </p><br/>
                <p class="p_r">资产管理规模：</p><p class="p_l">4785.00亿元 </p> <br/>
            </div>
        	<button class="but_1">了解咨询</button>
        </div>
        
    </div>


	


    <div class="Recommend">
        <div class="tit tit_3"></div>
		
        <div class="Recommend_con">
        	<dl>
            	<dt>
                	<strong >中江信托-金鹤351号</strong>
                    <strong>7.3%-7.7%</strong>
                	<p class="p_r">投资起点：</p><p class="p_l">100万</p>
                    <p class="p_r">投资期限：</p><p class="p_l">24个月</p><br/>
                    <p class="p_r">返现金额：</p><p class="p_l">3000元 </p> <br/>
                	<p class="p_con">&nbsp;&nbsp;公司现金流;融资人的综合经营收入;担保人的资产和综合经营收入。</p>
                </dt>
                <dd>
                	<center> 
                	<button class="but_4">了解咨询</button> 
                    </center> 
                </dd>
            </dl>
            
            <dl>
            	<dt>
                	<strong >四川信托-锦天39号</strong>
                    <strong>7.3%-7.7%</strong>
                	<p class="p_r">投资起点：</p><p class="p_l">100万</p>
                    <p class="p_r">投资期限：</p><p class="p_l">9个月</p><br/>
                    <p class="p_r">返现金额：</p><p class="p_l">3000元 </p> <br/>
                	<p class="p_con">&nbsp;&nbsp;实物抵押+股权质押+大型企业担保</p>
                </dt>
                <dd>
                	<center> 
                	<button class="but_4">了解咨询</button> 
                    </center> 
                </dd>
            </dl>
            
            <dl>
            	<dt>
                	<strong >光大信托--龙腾川渝3号</strong>
                    <strong>9.5%-10%</strong>
                	<p class="p_r">投资起点：</p><p class="p_l">100万</p>
                    <p class="p_r">投资期限：</p><p class="p_l">24个月</p><br/>
                    <p class="p_r">返现金额：</p><p class="p_l">5000元 </p> <br/>
                	<p class="p_con">&nbsp;&nbsp;成都市经济技术开发区建设发展有限公司为龙泉驿国投此次融资提供不可撤销的连带责任担保</p>
                </dt>
                <dd>
                	<center> 
                	<button class="but_4">了解咨询</button> 
                    </center> 
                </dd>
            </dl>
            
            <dl>
            	<dt>
                	<strong >中融信托--融雅35号</strong>
                    <strong>8.8%-10.2%</strong>
                	<p class="p_r">投资起点：</p><p class="p_l">100万</p>
                    <p class="p_r">投资期限：</p><p class="p_l">12个月</p><br/>
                    <p class="p_r">返现金额：</p><p class="p_l">5000元 </p> <br/>
                	<p class="p_con">&nbsp;&nbsp;收购的债权中部分附带有华普集团持有的上市公司湖北武昌鱼股份有限公司（“武昌鱼”）8000万股股份质押担保</p>
                </dt>
                <dd>
                	<center> 
                		<button class="but_4">了解咨询</button> 
                    </center> 
                </dd>
            </dl>
            
            <dl>
            	<dt>
                	<strong >中信信托--民生16号</strong>
                    <strong>9.0%</strong>
                	<p class="p_r">投资起点：</p><p class="p_l">100万</p>
                    <p class="p_r">投资期限：</p><p class="p_l">24个月</p><br/>
                    <p class="p_r">返现金额：</p><p class="p_l">4000元 </p> <br/>
                	<p class="p_con">&nbsp;&nbsp;重庆市潼南县应收账款转让借款， 潼南县国企（净资产75亿元）担保，五折土地抵押。 </p>
                </dt>
                <dd>
                	<center> 
                	<button class="but_4">了解咨询</button> 
                    </center> 
                </dd>
            </dl>
            
            <dl>
            	<dt>
                	<strong >DS飞凤湖定向融资计划</strong>
                    <strong>9.0%-10.3%</strong>
                	<p class="p_r">投资起点：</p><p class="p_l">20万</p>
                    <p class="p_r">投资期限：</p><p class="p_l">24个月</p><br/>
                    <p class="p_r">返现金额：</p><p class="p_l">5000元 </p> <br/>
                	<p class="p_con">&nbsp;&nbsp;AA级国企连带担保+五折土地抵押，融资方资产雄厚负债低。</p>
                </dt>
                <dd>
                	<center> 
                	<button class="but_4">了解咨询</button> 
                    </center> 
                </dd>
            </dl>
            
            
        </div>	
	</div>


    <!-- <div class="register">
    	<div class="tit tit_4"></div>
    	
        <div class="register_con">
        	<form method="post" action="">
            	<input type="text" placeholder="请输入您的手机号码"  />
            	<input type="password" placeholder="请输入您的密码" />
            	<center> <button class="but_3">立即注册</button> </center>
            </form>
        
        </div>
    
    </div> -->
	<div class="bottom_con">
    	<div></div>
    </div>

	<!--弹框-->
    <div class="opt"></div>
        <div class="openWindow">
            <div class="close">
                <img src="static/img/web/index_carousel/trust_search/close.png"/>
            </div>
            <div class="windowTT">2017高收益信托产品查询</div>
            <div class="winodw-input">
                <input type="text" placeholder="姓名" id="name">
                <input type="text" placeholder="电话" id="mobile">
            </div>
            <p>请您填写正确的联系方式，以便我们发送查询结果</p>
            <button >提交</button>
    </div>
<!-----提交成功------>
        <div class="tijiao-ok" style="cursor: pointer;">
            <div class="close" style="width: 30px; height: 30px;"></div>
            <img src="static/img/web/index_carousel/trust_search/succ.png"/>
        </div>


	 <script>
            $(function() {
                $('.close,.tijiao-ok').click(function() {
                    $('.openWindow,.opt,.tijiao-ok').hide();
                });
                var flag = true;
                var fromPage = '信托收益着陆页';
                var consultType = '';
                $('.button,.chaxun').click(function() {
                    $('.windowTT').text('信托公司产品收益率查询平台');
                    $('.openWindow p').text('请正确填写手机号，以便我方发送查询结果到手机上');
                    $('.opt,.openWindow').show();

                    consultType = $(this).attr("consultType");
                });

                $('.zixun').click(function() {
                    $('.windowTT').text('信托公司及产品咨询平台');
                    $('.openWindow p').text('金牌理财师将在24小时内给您回电，请耐心等待');
                    $('.opt,.openWindow').show();

                    consultType = $(this).attr("consultType");
                });

               
                // 免费领取报告按钮
                $('.lingqu').click(function() {
                    // 防止重复提交
                    if (!flag) {
                        return;
                    }
                    flag = false;

                    consultType = $(this).attr("consultType");
                    var name = $("#reportName").val();
                    var mobile = $("#reportMobile").val();
                    var nameReg = /^[\u4e00-\u9fa5]+$/;
                    var mobileReg = /^[1-9][0-9]{10}$/;
                    if (!name || name.trim() == "" || name.trim().length < 2) {
                        alert("请输入2-5字中文姓名");
                        flag = true;
                        return;
                    }
                    if (!nameReg.test(name.trim())) {
                        alert("请输入中文姓名");
                        flag = true;
                        return;
                    }
                    if (!mobile || mobile.trim() == "") {
                        alert("手机号不能为空");
                        flag = true;
                        return;
                    }
                    if (!mobileReg.test(mobile.trim())) {
                        alert("请输入正确的手机号码");
                        flag = true;
                        return;
                    }
                    $.ajax({
                        url: "/zt/submitInfo",
                        type: "post",
                        data: {
                            "name": name,
                            "mobile": mobile,
                            "fromPage": fromPage,
                            "consultType": consultType
                        },
                        dataType: "json",
                        success: function(data) {
                            flag = true;
                            if (data.error == 0) {
                                $("#reportName").val("");
                                $("#reportMobile").val("");
                                $('.opt,.tijiao-ok').show();
                            } else {
                                alert(data.message);
                            }
                        }
                    });
                })

            })
        </script>
		<%@include file="../../bottom.jsp"%>
	
</body>
</html>
