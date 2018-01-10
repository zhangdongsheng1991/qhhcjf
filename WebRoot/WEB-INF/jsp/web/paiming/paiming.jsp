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
	<title>信托公司排名_环成金服</title>
	<meta name="keywords" content="信托公司排名_信托公司列表_环成金服" />
    <meta name="description" content="环成金服为客户提供全国68家信托公司实力排名,股东背景,成立时间,注册地,产品收益率查询,查排名,上环成金服。" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit">
	<meta charset="utf-8">
	<link rel="Shortcut Icon" href="static/img/web/logo2.ico"> 
	<link rel="stylesheet" type="text/css" href="static/css/web/style.css">
	<link rel="stylesheet" type="text/css" href="static/css/web/index.css">
	<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
	<link rel="stylesheet" type="text/css" href="static/css/web/paiming/paiming_css.css">
	<!-- <link rel="stylesheet" type="text/css" href="static/css/web/paiming/common.css"> -->
	<script src="static/js/web/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="static/js/web/paiming/paiming_js.js" type="text/javascript"></script>
	<script language="javascript" >
		var _pageSize = 20;
		var _columns = "";
		var _tablename="td_institution";
		var _loaddata = function(data){
			if(data!=null){
				$("#t1 tr:gt(0)").remove();
				for(var i=0;i<data.length;i++){
					var foundingtime;
					if(typeof(data[i].FOUNDINGTIME) == "undefined"){
						foundingtime = '';
					}else{
						foundingtime = data[i].FOUNDINGTIME;
					}
					$("#t1").append(	
							"<tr>"+
						    "<td height='50' bgcolor='#FFFFFF'>"+
						    "<div align='center' height='30'>"+
						          "<a href='web/goCompany?ID="+data[i].ID+"' target='_blank';>"+
						              "<span class='gongsiT'><img  src='"+data[i].IMGURL+"' width='30' height='30'></span>"+
						              "<span class='gongsiM'>"+data[i].NAME+"</span>"+
						          "</a>"+
						    "</div>"+
						    "</td>"+
						    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].AR+"</div></td>"+
						    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].PPR+"</div></td>"+
						    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].CAPITAL+"</div></td>"+
						    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].SHAREHOLDER+"</div></td>"+
						    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].CORPORATION+"</div></td>"+
						    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].LOCATION+"</div></td>"+
						    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+foundingtime+"</div></td>"+
						    "<td style='display: none;' height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].VIEWS+"</div></td>"+
					    "</tr>"
					);
				}
			}				
		}
		
		$(function(){
			/**初始*/
			$("#pageCount").val(${pageCount});
			$("#condition").val(" where A.ISTRUST='是' ");
			$("#order").val(" order by  a.RANKING DESC, a.CTDATE  DESC");
			$("#searchTxt").val("");
			$("#type").val("");
			$("#RANKING").addClass("selected");
			$("#RANKING").siblings().removeClass("selected");
			
			$("#search").click(function(){ 
				$("#pageNow").val(1);
				var text = $("#searchTxt").val().trim();
				$("#type").val(text);
				$("#condition").val("where a.ISTRUST='是' and a.NAME like '%"+text+"%'");
				var v = $(".selected").attr("id");
				if(v=='CAPITAL'){
					$("#order").val("order by  cast(a.CAPITAL as decimal(10,2)) DESC,a.CTDATE DESC ");
				}else{
					$("#order").val("order by  a.RANKING DESC,a.CTDATE DESC ");
				}
				$.myajax(
					'web/searchCompany',
					{"pageNow":1,"columns":_columns,"tablename":_tablename,"condition":$("#condition").val(),"order":$("#order").val(),"pageSize":20},
					function(data){
						if(data!=null){
							$("#pageCount").val(data[data.length-1]);
							$("#t1 tr:gt(0)").remove();
							for(var i=0;i<data.length-1;i++){
								var foundingtime;
								if(typeof(data[i].FOUNDINGTIME) == "undefined"){
									foundingtime = '';
								}else{
									foundingtime = data[i].FOUNDINGTIME;
								}
								$("#t1").append(	
										"<tr>"+
									    "<td height='50' bgcolor='#FFFFFF'>"+
									    "<div align='center' height='30'>"+
									          "<a href='web/goCompany?ID="+data[i].ID+"' target='_blank';>"+
									              "<span class='gongsiT'><img  src='"+data[i].IMGURL+"' width='30' height='30'></span>"+
									              "<span class='gongsiM'>"+data[i].NAME+"</span>"+
									          "</a>"+
									    "</div>"+
									    "</td>"+
									    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].AR+"</div></td>"+
									    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].PPR+"</div></td>"+
									    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].CAPITAL+"</div></td>"+
									    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].SHAREHOLDER+"</div></td>"+
									    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].CORPORATION+"</div></td>"+
									    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].LOCATION+"</div></td>"+
									    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+foundingtime+"</div></td>"+
									    "<td style='display: none;' height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].VIEWS+"</div></td>"+
								    "</tr>"
								);
							}
						}				
					}
				);
			});
			$("#searchTxt").keydown(function(e){
				if(e.keyCode==13){
					$("#pageNow").val(1);
					var text = $("#searchTxt").val().trim();
					$("#type").val(text);
					$("#condition").val("where a.ISTRUST='是' and a.NAME like '%"+text+"%'");
					var v = $(".selected").attr("id");
					if(v=='CAPITAL'){
						$("#order").val("order by  cast(a.CAPITAL as decimal(10,2)) DESC,a.CTDATE DESC ");
					}else{
						$("#order").val("order by  a.RANKING DESC,a.CTDATE DESC ");
					}
					$.myajax(
						'web/searchCompany',
						{"pageNow":1,"columns":_columns,"tablename":_tablename,"condition":$("#condition").val(),"order":$("#order").val(),"pageSize":20},
						function(data){
							if(data!=null){
								$("#pageCount").val(data[data.length-1]);
								$("#t1 tr:gt(0)").remove();
								for(var i=0;i<data.length-1;i++){
									var foundingtime;
									if(typeof(data[i].FOUNDINGTIME) == "undefined"){
										foundingtime = '';
									}else{
										foundingtime = data[i].FOUNDINGTIME;
									}
									$("#t1").append(	
											"<tr>"+
										    "<td height='50' bgcolor='#FFFFFF'>"+
										    "<div align='center' height='30'>"+
										          "<a href='web/goCompany?ID="+data[i].ID+"' target='_blank';>"+
										              "<span class='gongsiT'><img  src='"+data[i].IMGURL+"' width='30' height='30'></span>"+
										              "<span class='gongsiM'>"+data[i].NAME+"</span>"+
										          "</a>"+
										    "</div>"+
										    "</td>"+
										    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].AR+"</div></td>"+
										    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].PPR+"</div></td>"+
										    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].CAPITAL+"</div></td>"+
										    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].SHAREHOLDER+"</div></td>"+
										    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].CORPORATION+"</div></td>"+
										    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].LOCATION+"</div></td>"+
										    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+foundingtime+"</div></td>"+
										    "<td style='display: none;' height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].VIEWS+"</div></td>"+
									    "</tr>"
									);
								}
							}				
						}
					);
				}
			}); 
			$(".paiming_fangshi input").click(
				function(){
					$("#pageNow").val(1);
					var v = $(this).attr("id");
					var type = $("#type").val();
					$(this).addClass("selected");	
					$(this).siblings().removeClass("selected");
					if(v=='CAPITAL'){
						$("#order").val("order by  cast(a.CAPITAL as decimal(10,2)) DESC,a.CTDATE DESC ");
					}else{
						$("#order").val("order by  a.RANKING DESC,a.CTDATE DESC ");
					}
					var type = $("#type").val();
					if(type!=''){
						$("#condition").val("where a.ISTRUST='是' and a.NAME like '%"+type+"%'");
					}
					$.myajax('web/searchCompany',
							{"pageNow":1,"columns":_columns,"tablename":_tablename,"condition":$("#condition").val(),"order":$("#order").val(),"pageSize":20},
							function(data){
								if(data!=null){
									$("#pageCount").val(data[data.length-1]);
									$("#t1 tr:gt(0)").remove();
									for(var i=0;i<data.length-1;i++){
										var foundingtime;
										if(typeof(data[i].FOUNDINGTIME) == "undefined"){
											foundingtime = '';
										}else{
											foundingtime = data[i].FOUNDINGTIME;
										}
										$("#t1").append(	
												"<tr>"+
											    "<td height='50' bgcolor='#FFFFFF'>"+
											    "<div align='center' height='30'>"+
											          "<a href='web/goCompany?ID="+data[i].ID+"' target='_blank';>"+
											              "<span class='gongsiT'><img  src='"+data[i].IMGURL+"' width='30' height='30'></span>"+
											              "<span class='gongsiM'>"+data[i].NAME+"</span>"+
											          "</a>"+
											    "</div>"+
											    "</td>"+
											    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].AR+"</div></td>"+
											    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].PPR+"</div></td>"+
											    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].CAPITAL+"</div></td>"+
											    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].SHAREHOLDER+"</div></td>"+
											    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].CORPORATION+"</div></td>"+
											    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].LOCATION+"</div></td>"+
											    "<td height='50' bgcolor='#FFFFFF'><div align='center'>"+foundingtime+"</div></td>"+
											    "<td style='display: none;' height='50' bgcolor='#FFFFFF'><div align='center'>"+data[i].VIEWS+"</div></td>"+
										    "</tr>"
										);
									}
								}				
							}
							
					);
				}
			);
		})
		
	</script>
	
</head>
<%@include file="../baidusq.jsp"%>
<body>
<%@include file="../head.jsp"%>
<div class="paiming_box">
		
        <div class="paiming_biaoti">
        	热门信托公司
        </div>
     <!--热门推荐-->   
        <div class="paiming_hot">
        	<c:forEach var="hot" items="${hotList }">
	        	<div class="paiming_hot_1">
	            	<div class="paiming_hot_1_1">
	                	<a href="web/goCompany?ID=${hot.ID} " target="_blank";>
	                		<img class="tupian_hot" src="${hot.IMGURL}" />
	                    </a>
	                </div>
	                <ul class="paiming_hot_1_2">
	                	<li class="paiming_hot_con"> 公司名称： ${hot.NAME} </li>
	                	<li class="paiming_hot_con"> 股东背景： ${hot.SHAREHOLDER} </li>
	                	<li class="paiming_hot_con"> 注册资本： ${hot.CAPITAL}万</li> 
	                </ul>
	            </div>
        	</c:forEach>
        </div>
        
       <!--热门推荐结束-->   
        <input type="hidden" id="type" value=""/>
  		<div class="paiming_biaoti">
        	信托公司排名
            <div style="float:right; margin:18px 0px 0px 0px;">
                <input type="text" id="searchTxt"   placeholder="请输入搜索内容"/>
                <button id="search">搜索</button>
            </div>
        </div>
        
        <div class="paiming_fangshi">
        	<input class="selected" id="RANKING" type="button" value="按综合实力排名">
        	<input id="CAPITAL" type="button" value="按注册资本排名">
        </div>
	
        
  <table id="t1" class="paiming_biaoge" bgcolor="#CCCCCC" width="1196" border="0" cellspacing="1">
  <tr>
    <th width="184" height="50" bgcolor="#f49703" scope="col"><div align="center">公司简称</div></th>
    <th width="125" bgcolor="#f49703" scope="col">平均收益率 </th>
    <th width="138" bgcolor="#f49703" scope="col">产品兑付比例</th>
    <th width="166" bgcolor="#f49703" scope="col">注册资本（万元）</th>
    <th width="169" bgcolor="#f49703" scope="col">股东背景</th>
    <th width="129" bgcolor="#f49703" scope="col">法人代表</th>
    <th width="129" bgcolor="#f49703" scope="col">所在地区</th>
    <th width="131" bgcolor="#f49703" scope="col">成立时间</th>
  </tr>
  <c:forEach var="company" items="${list}">
	  <tr>
	    <td height="50" bgcolor="#FFFFFF">
	    <div align="center" height="30">
	          <a href="web/goCompany?ID=${company.ID}" target="_blank";>
	              <span class="gongsiT"><img  src="${company.IMGURL}" width="30" height="30"></span>
	              <span class="gongsiM">${company.NAME}</span>
	          </a>
	    </div>
	    </td>
	    <td height="50" bgcolor="#FFFFFF"><div align="center">${company.AR}</div></td>
	    <td height="50" bgcolor="#FFFFFF"><div align="center">${company.PPR}</div></td>
	    <td height="50" bgcolor="#FFFFFF"><div align="center">${company.CAPITAL}</div></td>
	    <td height="50" bgcolor="#FFFFFF"><div align="center">${company.SHAREHOLDER}</div></td>
	    <td height="50" bgcolor="#FFFFFF"><div align="center">${company.CORPORATION}</div></td>
	    <td height="50" bgcolor="#FFFFFF"><div align="center">${company.LOCATION}</div></td>
	    <td height="50" bgcolor="#FFFFFF"><div align="center">${company.FOUNDINGTIME}</div></td>
	    <td style="display: none;" height="50" bgcolor="#FFFFFF"><div align="center">${company.VIEWS}</div></td>
	  </tr>
  </c:forEach>
</table>
	<div class=" h70 clearb bgfafafa" id="IsShowPage">
       <div style="float:right;cursor:pointer;height:30px;width:120px;line-height: 30px;margin:0px 10px;">
			到第<input value="" type="text" id="tzys" style="width:20px;height:20px;border:1px solid #ccc"/>页
			<button id="tz">跳转</button>
		</div>
		<div id="nextpage" style="float:right;cursor:pointer;height:30px;width:50px;line-height: 30px;margin:0px 10px;">
			下一页
		</div>
		<div id="ym" style="float:right;line-height:32px;">
			<input type="text" value="${pageNow}" id="pageNow" style="border:none;width:18px;text-align: right;font-size: 15px"/>/<input type="text" value="${pageCount}" id="pageCount" style="border:none;width:18px;text-align: left;font-size: 15px"/>
		</div>
		<div id="prevpage" style="float:right; cursor:pointer;height:30px;width:50px;line-height: 30px;margin:0px 10px;">
			上一页
		</div>
		<input type="hidden" id="condition" value="where A.ISTRUST='是'" />
		<input type="hidden" id="order" value="order by a.CTDATE DESC " />
    </div>
</div>

<%@include file="../bottom.jsp"%>
</body>
</html>

