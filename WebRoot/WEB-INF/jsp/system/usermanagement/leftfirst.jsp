<%@page pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>环城金服网站用户管理平台</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="static/css/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="static/css/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="static/css/easyui/themes/demo.css">
	<script type="text/javascript" src="static/css/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/css/easyui/jquery.easyui.min.js"></script>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <style type="text/css">
a,a:visited {
    color: #5e5e5e;
    text-decoration: none;
}

a:hover {
    color: #b52725;
    text-decoration: underline;
}


.top {
    color:#F00;
}

.top a {
    color:#F00;
}
.select{
	box-shadow:0px 0px 5px 3px #F2F2F2; 
}
.head_li{
	cursor:pointer; 
	text-align:center; 
	float:left;
	width:45px;
	height:45px;
	margin-left: 15px;
}
    </style>
    <script>
    if(top.location!=self.location){
		top.location=self.location;
	}
    /*自适应浏览器的大小*/
        var settime = null;
        function redraw(){
            $('#wrap').layout('resize');  
            $('#subWrap').layout('panel', 'north').panel('resize',{width:$('#subWrap').width()});
            $('#subWrap').layout('panel', 'center').panel('resize',{width:$('#subWrap').width()});
            $('#subWrap').layout('resize');
        }
        $(function(){        
            $(window).resize(function(){
                if(settime != null)
                    clearTimeout(settime);
                settime=setTimeout("redraw()",100);
            });              
            var p1 = $('body').layout('panel','west').panel({
                onCollapse:function(){
                    if(settime != null)
                        clearTimeout(settime);
                    settime=setTimeout("redraw()",100);
                },
                onExpand:function(){
                    if(settime != null)
                        clearTimeout(settime);
                    settime=setTimeout("redraw()",100);
                },
                onResize:function(width,height){
                    if(settime != null)
                        clearTimeout(settime);
                    settime=setTimeout("redraw()",100);
                }
            });                
            var p2 = $('body').layout('panel','east').panel({
                onCollapse:function(){
                    if(settime != null)
                        clearTimeout(settime);
                    settime=setTimeout("redraw()",100);
                },
                onExpand:function(){
                    if(settime != null)
                        clearTimeout(settime);
                    settime=setTimeout("redraw()",100);
                },
                onResize:function(width,height){
                    if(settime != null)
                        clearTimeout(settime);
                    settime=setTimeout("redraw()",100);
                }
            });
            
            $(".mm li").mouseenter(function(){
            	$(this).addClass("select");
            	$(this).siblings().removeClass("select");
            }).mouseleave(function(){
            	$(this).removeClass("select");
            });
            $(".mm li").click(function(){
            	$(this).css("background-color","#E0EEEE");
            	$(this).siblings().css("background-color","white");
            })
            
          
            $(".head_li").mousedown(function(){
            	$(this).css("box-shadow","0px 0px 5px 3px  #6495ED");
            	$(this).children("img").css("width","26px");
            }).mouseup(function(){
            	$(this).css("box-shadow","none");
            	$(this).children("img").css("width","23px");
            });
            $(".head_li").mouseleave(function(){
            	$(this).css("box-shadow","none");
            	$(this).children("img").css("width","23px");
            });
        });
        
        //动态添加Tabs
    function addTab(title, url){
            if ($('#tabsInfo').tabs('exists', title)){
                $('#tabsInfo').tabs('select', title);
            } else {
                var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
                $('#tabsInfo').tabs('add',{
                    title:title,
                    content:content,
                    closable:true
                });
            }
        }
        
    function showTime(){
        var show_day=new Array('星期一','星期二','星期三','星期四','星期五','星期六','星期日');
        var time=new Date();
        var year=time.getFullYear();  
        var month=time.getMonth();
        var date=time.getDate();
        var day=time.getDay();
        var hour=time.getHours();
        var minutes=time.getMinutes();
        var second=time.getSeconds();
        month=month+1;
        month<10?month='0'+month:month;
        hour<10?hour='0'+hour:hour;
        minutes<10?minutes='0'+minutes:minutes;
        second<10?second='0'+second:second;
        var now_time='当前时间：'+year+'年'+month+'月'+date+'日'+' '+show_day[day-1]+' '+hour+':'+minutes+':'+second;
        document.getElementById('showtime').innerHTML=now_time;
        setTimeout("showTime();",1000);
}
    
    </script>
</head>
<body class="easyui-layout" onload="showTime();">
    <div id="north" region="north" border="false" style="height:80px;background:#E8F1FF;">
	    <div style="width:100%;height:80px;">
			<img style="width:215px;padding-left: 30px;" src="static/img/web/img_index_logo_sign.png" alt="logo">
			<div style="bottom: 15px; position: absolute;right:30px;">
				<ul style="list-style: none;top:10px">
					<li onclick="location.href='/main/index'" class="head_li" >	
						<img draggable="false" style="width:23px" src="static/img/web/common/home.png" /><br/>主系统
					</li>
					<li onclick="location.href='/logout'" class="head_li">
						<img draggable="false" style="width:23px" src="static/img/web/common/quit.png" /><br/>退出
					</li>
				</ul>
			</div>
	    </div>
    </div>
    <div region="west" split="true" title="菜单管理" style="width:200px;overflow:hidden;">
    <div class="easyui-accordion" style="width:100%;height:100%;">
        <div title="用户管理" iconCls="icon-menu1">
        	<ul class="mm" style="text-align: center;width:100px;">
        		<li onclick="addTab('用户管理','usermanagement/leftsecond');" style="margin:20px 0 0 10px; list-style: none;height:75px;width:75px;line-height: 25px;cursor: pointer;">
        			<img style="margin-top: 5px" src="static/img/web/common/usermanage.png"><br/>
        			<span style="font-weight: bold;">用户管理</span>
        		</li>
        		<li onclick="addTab('用户记录','usermanagement/userlog/listuser');" style="margin:20px 0 0 10px; list-style: none;height:75px;width:75px;line-height: 25px;cursor: pointer;">
        			<img style="margin-top: 5px" src="static/img/web/common/userlog.png"><br/>
        			<span style="font-weight: bold;">用户记录</span>
        		</li>
        	</ul>
        </div>
        
        <div title="消息管理" iconCls="icon-menu1">
        	<ul class="mm" style="text-align: center;width:100px;">
        		<li onclick="addTab('消息管理','messagemanagement/messagetype');" style="margin:20px 0 0 10px; list-style: none;height:75px;width:75px;line-height: 25px;cursor: pointer;">
        			<img src="static/img/web/common/message.png"><br/>
        			<span style="font-weight: bold;">消息管理</span>
        		</li>
        		
        		<li style=" margin:20px 0 0 10px; list-style: none;height:75px;width:75px;line-height: 25px;cursor: pointer;">
        			<img src="static/img/web/common/message.png"><br/>
        			<span style="font-weight: bold;">消息管理</span>
        		</li>
        	</ul>
        </div>
        
       <!--  <div title="协作办公" iconCls="icon-menu4">
            <ul id="cooperationManage" class="easyui-tree">
                    <li>
                            <span>流程定义</span>
                            <ul>
                                <li><a  onclick="addTab('流程基本信息','jsp/workOrderManage/processDefinitionInfo.jsp')">流程基本信息</a></li>
                                <li><a  onclick="addTab('流程环节信息','jsp/workOrderManage/processNodeInfo.jsp')">流程环节信息</a></li>
                            </ul>
                    </li>    
                    <li>
                            <span>发起工单</span>
                            <ul>
                                <li><a  onclick="addTab('发起工单','jsp/workOrderManage/initiateWorkOrderInfo.jsp')">发起工单</a></li>
                            </ul>
                    </li>    
                    <li>
                            <span>我的待办</span>
                            <ul>
                                <li><a  onclick="addTab('我的待办','jsp/workOrderManage/myBacklogInfo.jsp')">我的待办</a></li>
                                <li><a  onclick="addTab('所有待办','jsp/workOrderManage/allMyBacklogInfo.jsp')">所有待办</a></li>
                            </ul>
                    </li>    
                    <li>
                            <span>业务统计</span>
                            <ul>
                                <li><a  onclick="addTab('业务统计','jsp/workOrderManage/businessStatisticsInfo.jsp')">业务统计</a></li>
                            </ul>
                    </li>    
            </ul>
        </div> -->
        
        </div>
    </div>

    <div region="east" split="true" display="none"  title="系统公告" style="width:200px;padding:0px;">
    <div class="ranklist">
        <ul>
        	<li class="top">
                <p><a href="#" title="中国2014年军费预算约8082亿元 比去年提升12.2%">中国2014年军费预算约8082亿元 比去年提升12.2%</a><img src="images/new.gif"></p>
            </li>
            <!--<li class="top">
                <p><a href="#" title="习近平的一天如何度过？">习近平的一天如何度过？</a><img src="images/new.gif"></p>
            </li>
             
            <li class="top">
                <p><a href="#" title="国产操作系统迎来利好:部委机构正大量采购">国产操作系统迎来利好:部委机构正大量采购</a><img src="images/new.gif"></p>
            </li>
            <li >
                <p><a href="#" title="罗塞夫连任巴西总统 作风强硬素有“铁娘子”之称">罗塞夫连任巴西总统 作风强硬素有“铁娘子”之称</a></p>
            </li>
            <li>
                <p><a href="#" title="历史最悠久的电台,却在这轮传媒动荡中生命力最强">历史最悠久的电台,却在这轮传媒动荡中生命力最强</a></p>
            </li>
            <li>
                <p><a href="#" title="男子14年献5身血 凭献血积分入户广州(图)">男子14年献5身血 凭献血积分入户广州(图)</a></p>
            </li> -->
        </ul>
    </div>
    
    </div>
    
    <div region="south" border="false" style="height:33px;background:#E8F1FF;">
       <ul style="list-style: none;margin-top:10px">
       <li style="text-align:left;float:left;width:560px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前用户&nbsp;:&nbsp;&nbsp;<%=session.getAttribute("USERNAME") %></li>
       	<li style="text-align:center;float:left">©2017 www.qhhcjf.com 深圳前海环成投资咨询有限公司</li>
      	<li style="text-align:center;float:right;margin:0 20px" id="showtime"></li>
       </ul> 
    </div>
    
	<script>
		/* $(function(){
			$("#zt").parent().css("display","none");
		}) */
	</script>
    <div id="zt" region="center" border="true" title="主题" style="display:none;border-left:0px;border-right:0px;overflow:hidden;">        
    	<div id="tabsInfo" class="easyui-tabs" style="height:auto;overflow:hidden;" fit="true">
	        <div class="easyui-layout" title="首页" id="sy" >
	    	</div>
        </div>    
    </div>    
</body>
</html>