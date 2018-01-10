<%@page pageEncoding="UTF-8" %>
<html>
<head>
</head>
<body >
	<div class="index_new_wenda">
		<div class="index_new_wenda_head">
	    	<span class="new_head">理财问答</span>
	        <a href="web/wenda" target="_blank">更多>></a>
	    </div>
	    
	    <ul>
	    <c:forEach items="${newlist1}" var="var" varStatus="vs" begin='0' end='7'>
	        <c:if test="${vs.index eq 0 }">
	           	<c:forEach items="${newlist1}" var="var" varStatus="vs" begin='0' end='7'>
	           		<c:if test="${vs.index >= 0}">
	           			 <li class="c666666 lh40 h40"
	                          style=" border-bottom:1px dashed #d9d9d9; padding-left:20px;">
	                          <span>·</span>
	                              <c:if test="${fn:length(var.QUESTION) > 24 }">
	                                  ${fn:substring(var.QUESTION,0,24)}...
	                              </c:if>
	                              <c:if test="${fn:length(var.QUESTION)  <= 24 }">
	                                  ${var.QUESTION}
	                              </c:if>
	                      </li>
	                 </c:if>
	           </c:forEach>
	           
	       </c:if>
	       
	     </c:forEach>
	</div>

</body>
</html>