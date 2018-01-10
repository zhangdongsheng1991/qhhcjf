<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
	</head>
<body>
	<form action="questionnaire/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<input type="hidden" name="questionnaires" id="questionnaires"/>
		<div align="center" id="zhongxin" style="margin-top: 30px;">
				标题：<td style="width:200px;"><input style="text-align:center;" type="text" name="NAME" id="NAME" value="${pd.NAME}"  placeholder="这里输入标题" title="标题"/></td>
				<a class="btn btn-mini btn-primary" onclick="add();">添加问题</a>
			</br>
				<font id="INFO">
					<c:forEach items="${titleList}" var="var" varStatus="vs">
						<div id='title'>
							<font hidden='true'>
								${vs.index+1}
							</font>
							<input id='${var.ID}' type='text' value="${var.NAME }" placeholder='这里输入问题' sid='titleInput${vs.index+1}' id='titleInput'><a class='btn btn-mini btn-primary' onclick="addOption(this);">添加选项</a><a class='btn btn-mini btn-primary' onclick="delOption(this);">X</a>
							<div id='options${vs.index+1}'>
								<c:forEach items="${var.optionList}" var="vars" varStatus="vss">
									<div>
										<font hidden='true'>
											options${vs.index+1}${vss.index+1}
										</font>
										<input id='${vars.ID }' type='text' value="${vars.NAME }" placeholder='这里输入选项' ><a class='btn btn-mini btn-primary' onclick="delOptions(this);">X</a>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</font>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="saves();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
			
			<!-- <div align="center" id="shujuliebiao" style="margin-top: 30px;">
				<td ><font id="NAMES" style="font-size: 36px;"></font></td>
			</div> -->
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
	        
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			//上传
			$('#file').ace_file_input({
				no_file:'请选择图片 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'gif|png|jpg|jpeg',
				blacklist:'gif|png|jpg|jpeg'
				//onchange:''
				//
			});
			
		});
		
		</script>
		<script type="text/javascript">
		/* 	$('#NAME').bind('input propertychange', function() {
				var name = $("#NAME").val();
				$("#NAMES").html(name);
			}); */
			function saves(){
				if($("#NAME").val()==""){
					$("#NAME").tips({
						side:3,
			            msg:'请输入标题',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#NAME").focus();
					return false;
				}
				var number = $("#INFO").children("div").length;
				var str = "";
				var fal = true;
				for (var i = 0; i < number; i++) {
					/* console.log($($("#INFO").children("div")[i]).html()); */
					
					var info = $("#INFO").children("div")[i];
					if(!$(info).find("input").val()){
						$($(info).find("input")).tips({
							side:3,
					        msg:'请输入问题内容',
					        bg:'#AE81FF',
					        time:2
					    });
						$($(info).find("input")).focus();
						fal = false;
						break;
					}
					var name = $(info).find("input").val();
					var id = $(info).find("input").attr("id");
					var strs = name+"---"+id;
					var numbers = $(info).find("div").children("div").length;
					/* console.log(numbers); */
					for (var j = 0; j < numbers; j++) {
						var infos = $(info).find("div").children("div")[j];
						var names = $(infos).find("input").val();
						var ids = $(infos).find("input").attr("id");
						if(!$(infos).find("input").val()){
							$($(infos).find("input")).tips({
								side:3,
					            msg:'请输入选项内容',
					            bg:'#AE81FF',
					            time:2
					        });
							$($(infos).find("input")).focus();
							fal = false;
							break;
						}
							strs = strs+",,,"+names+"---"+ids;
					}
					if(i==0){
						str = strs;
					}else{
						str = str+"==="+strs;
					}
				}
				if(!fal){
					return;
				}
				console.log(str);
				
				$("#questionnaires").val(str);
				console.log("str="+$("#questionnaires").val());
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
					/* <div id='title'>
						<font hidden='true'>
						</font><input type='text' placeholder='这里输入问题' sid='titleInput"+number+"' id='titleInput'><a class='btn btn-mini btn-primary' onclick='addOption(this);'>添加选项</a><a class='btn btn-mini btn-primary' onclick='delOption(this);'>X</a>"+
						<div id=options"+number+">
							<div><font hidden='true'>
								</font><input type='text' placeholder='这里输入选项' ><a class='btn btn-mini btn-primary' onclick='delOptions(this);'>X</a>
							</div>
						</div>
					</div> */
				
			}
			function add(){
				var number = $("#INFO").children().length+1;
				var str =  	"<div id='title'><font hidden='true'>"+
								number+"</font><input id='0' type='text' placeholder='这里输入问题' sid='titleInput"+number+"' id='titleInput'><a class='btn btn-mini btn-primary' onclick='addOption(this);'>添加选项</a><a class='btn btn-mini btn-primary' onclick='delOption(this);'>X</a>"+
								"<div id=options"+number+"></div>"+
							"</div>";
				$("#INFO").append(str);
				/* $("#NUMBER").val(number);
				
				str =   "<div id='TITLES"+number+"' style='margin-top: 8px;margin-right: 20px;'>"+
							"<font id='titleInput"+number+"s' style='font-size: 18px;'></font>"+
						"</div>";
				$("#shujuliebiao").append(str); */
				/* $('#titleInput"+number+"').bind('input propertychange', function(e) {
					var name = $(e).val();
					$("#titleInputs"+number).html(name);
				}); */
			} 
			
			
			/* $("body").on("propertychange input", "#titleInput", function () {
			 	var name = $(this).val();
			 	$("#"+$(this).attr("sid")+"s").html(name);
			}); */
			
			/* function changes(e){
				console.log(e.id);
				onpropertychange='changes(this)''
			} */
			
			function delOption(e){
				$(e).parent("div").remove();
				/* var number = $(e).parent("div").find("font").eq(0).html();
				$("#TITLES"+number).empty(); */
			}
			
			function addOption(e){
				var number = $(e).parent("div").find("font").html(); 
				var numbers = $("#options"+number).children().length+1;
				var str =   "<div><font hidden='true'>"+
								"options"+number+numbers+"</font><input id='0' type='text' placeholder='这里输入选项' ><a class='btn btn-mini btn-primary' onclick='delOptions(this);'>X</a>"+
							"</div>";
				$($(e).parent("div").find("div").eq(0)).append(str);
				/* hidden='true' */
			}
			function delOptions(e){
				$(e).parent("div").remove();
			}
		</script>
</body>
</html>