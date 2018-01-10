<%@page pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath %>">
<meta charset="utf-8">
<title>公司简介_关于我们——环成金服</title>
<meta name="keywords" content="信托产品_资管产品_政府债券_股权投资_环成金服">
<meta name="description" content=" 环成金服是国内一家专为高净值人群提供财富管理服务的综合性平台，位于国际金融中心深圳。专注于财富管理领域，致力于为单笔投资100万以上的个人客户及机构客户提供固定收益金融资产配置。成立至今，已为超过3.5万名高净值客户完成资产配置，总计配置资产规模达400亿。">

	<link href="static/css/web/aboutUs/aboutUs.css"  rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/index.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/common.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/gjf_index.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/owl.theme.css">
    <link rel="stylesheet" type="text/css" href="static/css/web/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="static/css/web/slide.css">
    <script src="static/js/web/slide.js"></script> 
    <script src="static/js/web/jquery.flexslider-min.js" type="text/javascript"></script>
    <script src="static/js/web/owl.carousel.min.js" type="text/javascript"></script>
    <script src="static/js/web/gjf_index.js" type="text/javascript"></script>
    <link rel="Shortcut Icon" href="static/img/web/logo2.ico">
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		var timer = null;
		var num = 0;//初始值 从0开始运动
		var gun = -3;//这个全局变量控制方向 -3代表左 正3代表右 全局变量可以被任何人获取和修改
		//全局变量设置一个存储定时器的变量
		var myFn = function(){
			//num--;//num = num - 1;
			num+=gun;//num = num + gun;
			//这里一定要判断极值问题 我们有4张图 所以走完一轮应该是-1200px
			if(num < -2700){
				//如果到达极值 我们就要让图片再次恢复到0点 重新运动
				num = 0;
			}else if(num > 0){//大于0是向右运动时候的极值点 到达极值之后 我们要让num恢复到-1200
				num = -2700;
			}
			$('.team ul').css('left',num + 'px');
		}
		timer = setInterval(myFn,30);
		$('.team ul li').hover(function(e) {
            //鼠标移入就要停止定时器
			clearInterval(timer);
			//控制除了自己之外的小伙伴 变透明度0.5
			$(this).siblings().stop().fadeTo(500,0.5);
			
        },function(){
			timer = setInterval(myFn,30);
			//控制除了自己之外的小伙伴透明度恢复1
			$(this).siblings().stop().fadeTo(500,1);
		});
		
		
		
	})
</script>
<%@include file="../baidusq.jsp"%>
</head>

<body>
<%@include file="../head.jsp"%>
	<!-- 当前位置 -->
    <div id="common_currentlocation" class=" clearb">
        <div id="ctl00_ContentPlaceHolder1_Location_common_currentlocation_list" class=" w1200 mauto h48 lh48 fs14 c666666">
        	<div class=" fl">当前位置：</div>
            <div class=" fl ml10"><a href="web/index">首页</a></div>
            <div class=" fl ml10">&gt;</div>
			<!-- <div class=" fl ml10"><a href="javascript:{location.reload();}">固定收益</a></div> -->
			<div class=" fl ml10">&gt;</div><div class=" fl ml10"><a href="javascript:{location.reload();}">关于我们</a></div>
		</div>
    </div>   
<!--公司介绍-->
	<div class="introduce">
    	<div class="introduce_con">
        	<h2><b><<</b>深圳前海环成投资咨询有限公司<b>>></b></h2>
            
            <h4>您终身信赖的财富管家</h4>
            
            <p class="p1">环成金服隶属于深圳前海环成投资咨询有限公司</p>
            <p class="p1">环成金服是国内一家专为高净值人群提供财富管理服务的综合性平台，位于国际金融中心深圳。</p>
            <p class="p1">环成金服专注于财富管理领域，致力于为单笔投资100万以上的个人客户及机构客户提供固定收益金融资产配置。</p>
            <p class="p1">作为独立的第三方理财平台，我们始终坚持以客户为中心，根据客户财务状况和风险偏好，为客户量身提供个性化的理财方案，帮助客户实现稳定、安全的财富增值。</p>
            <p class="p1">成立至今，已有超过3.5万名高净值客户在环成金服成功完成资产配置，总计配置资产规模达400亿。</p>
        </div>
    </div>
<!--公司介绍结束-->



<!--企业文化-->
	<div class="Culture" >
    	<div class="Culture_con">
        	
        	<h2><b><<</b>企&nbsp;业&nbsp;文&nbsp;化<b>>></b></h2>
            
        	 <p class="p1">
               <b class="sum"> 环成领域</b>
                &nbsp;&nbsp; 面向高净值用户的互联网财富管理平台，是全国领先的综合性独立第三方在线理财服务平台。
            </P>
        	 <p class="p1">
                <b class="sum"> 企业愿景</b>
                &nbsp;&nbsp; 做“您终生信赖的财富管家”，旨在通过互联网，随时随地为投资者提供专业、实时、权威的理财产品和金融服务的搜索、对比、查找、咨询，以帮助投资者找到最合适的理财产品和最优质的理财服务。
            </p>
             <p class="p1">
                <b class="sum">环成团队</b>
                &nbsp;&nbsp; 创始人从事理财咨询行业8年，拥有丰富的行业经验和人脉关系，现有投行与研究团队现有40余人，专注于信托、资管、私募基金、股权投资、海外保险研究，可以为投资者的全球资产配置提供理财服务。
            </p>
             <p class="p1">
                <b class="sum">组织架构</b>
                &nbsp;&nbsp; 环成金服采用扁平化组织架构，用户可在网站最短时间内找到合适的投资理财产品，包含但不限于信托产品、券商资管、有限合伙、私募基金、海外保险、契约型基金等委托类投资产品的购买，以及安装用户需求定向配置全方位的资产配套计划。
            </p>
             <p class="p1">
                <b class="sum">服务模式</b>
                &nbsp;&nbsp; 环成金服模式明确，具有互联网和金融业的“融合基因”。把投资金融的门槛设为100万及以上。把正在快速崛起的中产阶级定义为“新富人群”，将优质的产品和高净值用户更好的对接起来,充分发挥第三方财富管理机构的作用。
            </p>
    	</div>
    </div>
<!--企业文化结束-->



<!--产品服务-->
	<div class="biaotilan"><b><<</b>产品服务<b>>></b></div>
	<div class="service">
    	 <p class="p1">随时随地为投资者提供专业、实时、权威的理财产品，帮助投资者找到最合适的理财产品和最优质的理财服务;
        <br>
        立足于高净值投资者主流的投资领域，包括信托、资管、政府债、股权投资以及契约型股权等，</p>
    
    	<dl class="product_1">
			<dd>信托资管</dd>
            <dt>1、超额土地抵押</dt>
            <dt>2、还款来源充分</dt>
            <dt>3、双AA集团担保</dt>
        </dl>
        
        <dl class="product_1">
			<dd>政府债</dd>
            <dt>1、收益可期</dt>
            <dt>2、风控措施完善，</dt>
            <dt>3、保证担保</dt>
            <dt>4、政府支持性文件</dt>
        </dl>
        
        <dl class="product_1">
			<dd>股权投资</dd>
            <dt>1、平台担保</dt>
            <dt>2、土地抵押</dt>
            <dt>3、AA级融资方到期无条件溢价回购</dt>
            <dt>4、抵押物充足</dt>
            
        </dl>
        
        <dl class="product_1">
			<dd>契约型</dd>
            <dt>1、精选私募组成核心基金池</dt>
            <dt>2、全天候跟踪基金动向</dt>
            <dt>3、分散配置，精选基金</dt>
        </dl>
        
        <dl class="product_1">
			<dd>定增对冲</dd>
            <dt>1、超强上市融资主体</dt>
            <dt>2、强实力管理人</dt>
            <dt>3、还款来源多样可靠</dt>
        </dl>
    
    </div>
<!--产品服务结束-->


<!--安全保障-->
	<div class="biaotilan"><b><<</b>安全保障<b>>></b></div>
<div class="guarantee">
	  <p class="p1">实行多级安全保障机制，从产品保障、资金保障、信息保障、隐私保障四大方面入手。
     <br>
     专门设立产品采集部、风险控制部和风险管理部，独立审核，标准控制，流程化管理。
     <br>
     由投资、风控、法务等部门进行对发行机构和项目进行风险把控，让客户放心。
     </p>
     
     <img src="static/img/web/aboutUs_img/baozhang.png" />
     
     
</div>

<!--安全保障结束-->

<!--团队风采-->
		<div class="biaotilan"><b><<</b>团队风采<b>>></b></div>
	<div class="team">
    	<ul>
        	<li><img src="static/img/web/aboutUs_img/01.jpg" width="450" height="300" /></li>
        	<li><img src="static/img/web/aboutUs_img/02.jpg" width="450" height="300" /></li>
        	<li><img src="static/img/web/aboutUs_img/03.jpg" width="450" height="300" /></li>
        	<li><img src="static/img/web/aboutUs_img/04.jpg" width="450" height="300" /></li>
            <li><img src="static/img/web/aboutUs_img/05.jpg" width="450" height="300" /></li>
            <li><img src="static/img/web/aboutUs_img/06.jpg" width="450" height="300" /></li>
            
        	<li><img src="static/img/web/aboutUs_img/01.jpg" width="450" height="300" /></li>
        	<li><img src="static/img/web/aboutUs_img/02.jpg" width="450" height="300" /></li>
            
        </ul>
    </div>
    


<!--团队风采结束-->




<!--联系我们-->
<div class="contactUs">
        <div class="biaotilan"><b><<</b>联系我们<b>>></b></div>
    <div class="contactUs_1">
        <p class="p1">公司地址：深圳市福田区上梅林卓悦汇大厦B座18楼</p>
         <p class="p1">全国服务热线：400-0096-880</p>
         <p class="p1">渠道合作：0755-61937372</p>
         <p class="p1">项目融资咨询与合作：成先生--13928480329</p>
         <p class="p1"></p>
    </div>
</div>

<!--联系我们结束-->
<%@include file="../bottom.jsp"%>

</body>
</html>
