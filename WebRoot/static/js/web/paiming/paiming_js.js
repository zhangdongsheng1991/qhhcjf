$(function(){
	var pageSize = _pageSize;	
	var columns = _columns;
	var tablename = _tablename;
	var loaddata = _loaddata;
	
	$.myajax = function(url,data,callback){
		$.ajax({
			type:'POST',
			url:url,
			data:data,
			dataType:'json',
			success:callback
		});
	}
	//初始化首页页码
	$("#pageNow").val(1);
	
	
	$("#nextpage").click(function(){
		if($("#pageNow").val()==$("#pageCount").val()){
			return;
		}
		if(Number($("#pageCount").val())==0){
			return;
		}
		$("#pageNow").val(Number($("#pageNow").val())+1);
		var pageNow = $("#pageNow").val();
		$.myajax('web/list_fy',{"pageNow":pageNow,"columns":columns,"tablename":tablename,"condition":$("#condition").val(),"order":$("#order").val(),"pageSize":pageSize},
				loaddata
		);
	});	
	
	$("#prevpage").click(function(){
		if($("#pageNow").val()==1){
			return;
		}
		$("#pageNow").val(Number($("#pageNow").val())-1);
		var pageNow = $("#pageNow").val();
		$.myajax('web/list_fy',{"pageNow":pageNow,"columns":columns,"tablename":tablename,"condition":$("#condition").val(),"order":$("#order").val(),"pageSize":pageSize},
				loaddata
		);
	});	
	$("#tz").click(function(){ 
		var pageNow = $("#tzys").val();
		var pageCount = $("#pageCount").val();
		if(isNaN(pageNow)){
			alert("请输入有效数字");
			$("#tzys").val('');
			return;
		}
		if(Number(pageNow)<=0||Number(pageNow)>Number(pageCount)){
			alert("输入页数不在范围");
			$("#tzys").val('');
			return;
		} 
		$("#tzys").val('');
		$("#pageNow").val(pageNow);
		$.myajax('web/list_fy',{"pageNow":pageNow,"columns":columns,"tablename":tablename,"condition":$("#condition").val(),"order":$("#order").val(),"pageSize":pageSize},
				loaddata
		);
	});
	
})