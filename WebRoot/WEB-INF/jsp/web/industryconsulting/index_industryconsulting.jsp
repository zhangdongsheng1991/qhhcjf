<%@page pageEncoding="UTF-8" %>

<div id="ctl00_ContentPlaceHolder1_index_news_zixun_server" class="fr" style="width: 590px; height: 330px;">
        <div class=" h36 lh36" style=" width:590px;">
            <div class="fl w80 tac fs18 c333333 fwb"><a href="web/newsList" class="c333333" target="_blank">行业资讯</a></div>
        </div>
        <div style="border:#d2d2d2 solid 1px; height:292px;">
            <c:forEach items="${newlist2}" var="var" varStatus="vs">
                <c:if test="${vs.index eq 0 }">
                    <div class=" h20"></div>
                    <div>
                        <div class="fl ml20"><a href="web/goNewsInfo?ID=${var.ID}" class="c333333"
                                                target="_blank"><img src="${var.IMG }" width="155" height="90"></a>
                        </div>
                        <div class="fl" style=" width:350px; margin-left:20px;">
                            <div class=" fs16 mt6 c333333 h36 lh36 fwb">
                                <a href="web/goNewsInfo?ID=${var.ID}" class="c333333" target="_blank">
                                    <c:if test="${fn:length(var.NAME) > 16 }">
                                        ${fn:substring(var.NAME,0,16)}..
                                    </c:if>
                                    <c:if test="${fn:length(var.NAME)  <= 16 }">
                                        ${var.NAME}
                                    </c:if>	
                                </a></div>
                            <div class=" fs12 c999999 lh24">
                                <a href="web/goNewsInfo?ID=${var.ID}" class="c999999" target="_blank"
                                   rel="nofollow">
                                    <c:if test="${fn:length(var.COMMENT) > 35 }">
							${fn:substring(var.COMMENT,0,35)}...
						</c:if>
						<c:if test="${fn:length(var.COMMENT)  <= 35 }">
							${var.COMMENT}
						</c:if>
                                    <span class="c4e99fe">[详情]</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="clearb h15"></div>
                    <div>
                        <ul style=" padding:0px 10px;">
                            <c:forEach items="${newlist2}" var="var" varStatus="vs">
                                <c:if test="${vs.index > 0 }">
                                    <li class="c666666 lh40 h40"
                                        style=" border-top:1px dashed #d9d9d9; padding-left:20px;">
                                        <a href="web/goNewsInfo?ID=${var.ID}" target="_blank">
                                            <c:if test="${fn:length(var.NAME) > 24 }">
                                                ${fn:substring(var.NAME,0,24)}...
                                            </c:if>
                                            <c:if test="${fn:length(var.NAME)  <= 24 }">
                                                ${var.NAME}
                                            </c:if>
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>