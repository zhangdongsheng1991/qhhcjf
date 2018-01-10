$(function(){
	$(".wendadd").hover(  
        function(){  
            $(this).css("background-color","#f49703");
        } ,  
        function(){  
            $(this).css("background-color","white");
        }   
     ); 
	 $(".wendadd").click(function(){
		 $(".wendadd").removeAttr("style");
		 $(this).css("background-color","#f49703");
		 $(this).unbind("hover");
		 $(this).siblings("dd").bind({mouseenter:function(){
			 $(this).css("background-color","#f49703");
	      	},mouseleave :function(){
	      	 $(this).css("background-color","white");
	      	}
	     });
	 });
	 
	 $(".wenda_type").hover(  
		 function(){  
            
         } ,  
         function(){  
           
         }  
	 );
	 $(".wenda_type").click(  
        function(){
        	$(".wenda_type").removeAttr("style");
        	$(this).css("background-color","#f49703");
        	$(this).css("color","white");
        	$(this).unbind("hover");
        	$(this).siblings(".wenda_type").bind({mouseenter:function(){
   			 $(this).css("color","#f49703");
   	      	},mouseleave :function(){
   	      	 $(this).css("color","black");
   	    }});
        }
     );
	 //为动态生成的节点添加事件
	 $(document).on('click', '.check', function(e) {
		 var pagename = $(this).html();
		 var pageNow = $('#check').html();
		 var pageCount = $('#pageCount').val();
		 if(pagename.trim()=="上一页".trim()){
			 //var prev = $("#check").prev();
			 if(pageNow == 1){
				 alert("已经是第一页了");
				 return;
			 }else{
				 pageNow = Number(pageNow)-1;
				 $('#check').html(pageNow)
			 }
			 //$("#check").removeAttr('id');
			 //prev.attr('id','check');
		 }else if(pagename.trim()=="下一页".trim()){
			 //var next = $("#check").next();
			 if(pageNow == pageCount){
				 alert("已经是最后一页了");
				 return;
			 }else{
				 pageNow = Number(pageNow)+1;
				 $('#check').html(pageNow)
			 }
			// pageNow = Number($("#pageNow").val())+1;
			 //$("#check").removeAttr('id');
			 //next.attr('id','check');
			 
		 } 
		 if(typeof(wenda_type_val)=="undefined"){
			 wenda_type_val = "最新";
		 }
		 if(typeof(ddval)=="undefined"){
			 ddval = "全部分类";
		 }
		 $.ajax({
			    type: 'POST',
			    url: "web/question_fy",
			    data: {"category":ddval,"type":wenda_type_val,"pageNow":pageNow} ,
			    dataType: 'json',
			    success: function(data){
			    	if(data!=null){
			    		$("#pageNow").val(pageNow);
			    		$("#wendabody").empty();
				    	for(var i=0;i<data.length;i++){
				    		var question = data[i].QUESTION;
				    		var answer = data[i].T_ANSWER;
				    		var v_question;
				    		var v_answer;
				    		if(question.length>13){
				    			v_question = question.substring(0,13)+"...";
	 						}else{
	 							v_question = question;
	 						}
					    		if(answer.length>40){
					    			v_answer = answer.substring(0,40)+"...";
	 						}else{
	 							v_answer = answer;
	 						}
				    		$("#wendabody").append("" +
					    			"<dl class='wendakuai'>"+	
					    			"<a style='color:#f49703; font-size:18px;cursor: pointer;' target=_blank href='web/goQuestion?ID="+data[i].ID+"' value="+data[i].ID+">" +
					    				v_question+
					    			"</a>"+
					    			"<span style='float:right; color:#999; margin-top:10px; margin-right:10px;'>浏览量：<b>"+data[i].READING+"</b></span>"+
					    			"<dd style='color:#666; font-size:14px;' >"+
					    				v_answer+
	                                "</dd>" +
	                                "</dl>"); 
				    	}
			    	}
			    } ,
		 });
		  
	});
	 var ddval;
	 $("dt,.wendadd").click(
		 function(){
			 $("#load").css("display", "block");
			 $("#wendabody").css("display", "none");
			 if(wenda_type_val==undefined){
				 wenda_type_val='最新';
			 }
			 ddval = $(this).html();
			 $.ajax({
			    type: 'POST',
			    url: "web/question",
			    data: {"category":$(this).html(),"type":wenda_type_val} ,
			    dataType: 'json',
			    success: function(data){
			    	if(data!=null){
			    		setTimeout(function(){$("#load").css("display", "none");
				    	$("#wendabody").css("display", "block");}, 500);
			    		
			    		$("#wendabody").empty();
			    		var pageCount;
			    		if(data.length%10==0){
							pageCount = parseInt(data.length/10);
						}else{
							pageCount = parseInt((data.length/10))+1;
						}
			    		$("#ys").html(pageCount);
			    		$("#pageCount").val(pageCount);
			    		$("#ym").empty();
		    			$("#ym").append(
		    				"<span style='cursor:pointer' id='check' class='check'>1</span>/<span id='ys'>"+pageCount+"</span>"
		    				//"<div id='check' style='cursor:pointer' class='check'>1</div>/<span id='ys'>"+pageCount+"</span>"
		    			);
			    			
			    		$("#pageNow").val("1");
				    	for(var i=0;i<10;i++){
				    		var question = data[i].QUESTION;
				    		var answer = data[i].T_ANSWER;
				    		var v_question;
				    		var v_answer;
				    		if(question.length>13){
				    			v_question = question.substring(0,13)+"...";
    						}else{
    							v_question = question;
    						}
				    		if(answer.length>40){
				    			v_answer = answer.substring(0,40)+"...";
    						}else{
    							v_answer = answer;
    						}
				    		$("#wendabody").append("" +
					    			"<dl class='wendakuai'>"+	
					    			"<a style='color:#f49703; font-size:18px;cursor: pointer; ' target='_blank'  href='web/goQuestion?ID="+data[i].ID+"' value="+data[i].ID+">" +
					    				v_question+
					    			"</a>"+
					    			"<span style='float:right; color:#999; margin-top:10px; margin-right:10px;'>浏览量：<b>"+data[i].READING+"</b></span>"+
					    			"<dd style='color:#666; font-size:14px;' >"+
					    				v_answer+
	                                "</dd>" +
	                                "</dl>"); 
				    	}
					    
			    	}
			    } ,
			});
		 }
	 );
	 var wenda_type_val ;
	 $(".wenda_type").click(
	    function(){
	    	$("#load").css("display", "block");
	 	    $("#wendabody").css("display", "none");
	    	wenda_type_val = $(this).html();
	    	$.ajax({
			    type: 'POST',
			    url: "web/question_type",      
			    data: {"category":ddval,"type":$(this).html()} ,
			    dataType: 'json',
			    success: function(data){
			    	$("#pageNow").val("1");
			    	
			    	if(data!=null){
			    		setTimeout(function(){$("#load").css("display", "none");
				    	$("#wendabody").css("display", "block");}, 500);
			    		var pageCount;
			    		if(data.length%10==0){
							pageCount = parseInt(data.length/10);
						}else{
							pageCount = parseInt((data.length/10))+1;
						}
			    		$("#pageCount").val(pageCount);
			    		$("#ys").html(pageCount);
			    		$("#ym").empty();
		    			$("#ym").append(
		    				"<span style='cursor:pointer' id='check' class='check'>1</span>/<span id='ys'>"+pageCount+"</span>"
		    				//"<div style='cursor:pointer' id='check' class='check'>1</div>/<span id='ys'>"+pageCount+"</span>"
		    			);
			    		$("#wendabody").empty();
				    	for(var i=0;i<10;i++){
				    		var question = data[i].QUESTION;
				    		var answer = data[i].T_ANSWER;
				    		var v_question;
				    		var v_answer;
				    		if(question.length>13){
				    			v_question = question.substring(0,13)+"...";
    						}else{
    							v_question = question;
    						}
				    		if(answer.length>40){
				    			v_answer = answer.substring(0,40)+"...";
    						}else{
    							v_answer = answer;
    						}
				    		$("#wendabody").append("" +
				    			"<dl class='wendakuai'>"+	
				    			"<a style='color:#f49703; font-size:18px;cursor: pointer;' target='_blank'  href='web/goQuestion?ID="+data[i].ID+"' value="+data[i].ID+">" +
				    				v_question+
				    			"</a>"+
				    			"<span style='float:right; color:#999; margin-top:10px; margin-right:10px;'>浏览量：<b>"+data[i].READING+"</b></span>"+
				    			"<dd style='color:#666; font-size:14px;' >"+
				    				v_answer+
                                "</dd>" +
                                "</dl>"); 
				    	}
			    	}
			    } ,
			});
	    }
	 );
	 //翻页
	 $(".nextpage").click(function(){
		 var pagename = $(this).html();
		 var pageNow = $('#check').html();
		 var pageCount = $('#pageCount').val();
		 if(pagename.trim()=="上一页".trim()){
			 //var prev = $("#check").prev();
			 if(pageNow == 1){
				 alert("已经是第一页了");
				 return;
			 }else{
				 pageNow = Number(pageNow)-1;
				 $('#check').html(pageNow)
			 }
			 //$("#check").removeAttr('id');
			 //prev.attr('id','check');
		 }else if(pagename.trim()=="下一页".trim()){
			 //var next = $("#check").next();
			 if(pageNow == pageCount){
				 alert("已经是最后一页了");
				 return;
			 }else{
				 pageNow = Number(pageNow)+1;
				 $('#check').html(pageNow)
			 }
			// pageNow = Number($("#pageNow").val())+1;
			 //$("#check").removeAttr('id');
			 //next.attr('id','check');
			 
		 } 
		 if(typeof(wenda_type_val)=="undefined"){
			 wenda_type_val = "最新";
		 }
		 if(typeof(ddval)=="undefined"){
			 ddval = "全部分类";
		 }
		 $.ajax({
			    type: 'POST',
			    url: "web/question_fy",
			    data: {"category":ddval,"type":wenda_type_val,"pageNow":pageNow} ,
			    dataType: 'json',
			    success: function(data){
			    	if(data!=null){
			    		$("#pageNow").val(pageNow);
			    		$("#wendabody").empty();
				    	for(var i=0;i<data.length;i++){
				    		var question = data[i].QUESTION;
				    		var answer = data[i].T_ANSWER;
				    		var v_question;
				    		var v_answer;
				    		if(question.length>13){
				    			v_question = question.substring(0,13)+"...";
 						}else{
 							v_question = question;
 						}
				    		if(answer.length>40){
				    			v_answer = answer.substring(0,40)+"...";
 						}else{
 							v_answer = answer;
 						}
			    		$("#wendabody").append("" +
				    			"<dl class='wendakuai'>"+	
				    			"<a style='color:#f49703; font-size:18px;cursor: pointer;' target='_blank'  href='web/goQuestion?ID="+data[i].ID+"' value="+data[i].ID+">" +
				    				v_question+
				    			"</a>"+
				    			"<span style='float:right; color:#999; margin-top:10px; margin-right:10px;'>浏览量：<b>"+data[i].READING+"</b></span>"+
				    			"<dd style='color:#666; font-size:14px;' >"+
				    				v_answer+
                                "</dd>" +
                                "</dl>"); 
				    	}
			    	}
			    } ,
			});
		 
	 });
	 $("#tz").click(function(){
		 var tzys = $('#tzys').val();
		 if(tzys==''){
			 alert("请输入跳转的页数");
			 $('#tzys').val('');
			 return;
		 }
		 var pageNow = $('#check').html();
		 var pageCount = $('#pageCount').val();
		 if(tzys<=0||tzys>Number(pageCount)){
			 alert("输入的页数不在范围");
			 $('#tzys').val('');
			 return;
		 }
		 if(isNaN(tzys)){
			 alert("请输入有效数字");
			 $('#tzys').val('');
			 return;
		 }
		  $('#check').html(tzys)
		$('#tzys').val('');
		 if(typeof(wenda_type_val)=="undefined"){
			 wenda_type_val = "最新";
		 }
		 if(typeof(ddval)=="undefined"){
			 ddval = "全部分类";
		 }
		 $.ajax({
			    type: 'POST',
			    url: "web/question_fy",
			    data: {"category":ddval,"type":wenda_type_val,"pageNow":tzys} ,
			    dataType: 'json',
			    success: function(data){
			    	if(data!=null){
			    		$("#pageNow").val(pageNow);
			    		$("#wendabody").empty();
				    	for(var i=0;i<data.length;i++){
				    		var question = data[i].QUESTION;
				    		var answer = data[i].T_ANSWER;
				    		var v_question;
				    		var v_answer;
				    		if(question.length>13){
				    			v_question = question.substring(0,13)+"...";
 						}else{
 							v_question = question;
 						}
				    		if(answer.length>40){
				    			v_answer = answer.substring(0,40)+"...";
 						}else{
 							v_answer = answer;
 						}
			    		$("#wendabody").append("" +
				    			"<dl class='wendakuai'>"+	
				    			"<a style='color:#f49703; font-size:18px;cursor: pointer;' target='_blank'  href='web/goQuestion?ID="+data[i].ID+"' value="+data[i].ID+">" +
				    				v_question+
				    			"</a>"+
				    			"<span style='float:right; color:#999; margin-top:10px; margin-right:10px;'>浏览量：<b>"+data[i].READING+"</b></span>"+
				    			"<dd style='color:#666; font-size:14px;' >"+
				    				v_answer+
                                "</dd>" +
                                "</dl>"); 
				    	}
			    	}
			    } ,
			});
		 
	 });
});
function goQuestion(v){
	window.open("web/goQuestion?ID="+v);
	//location.href="web/goQuestion?ID="+v;
}


