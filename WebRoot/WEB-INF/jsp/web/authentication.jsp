<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="static/js/web/jquery.cookie.js" type="text/javascript"></script>
    <script>
    	$(function(){
    		if($.cookie('qhhcjf_stable')!=null){
    			$("#xinhuancontent_scroll").css("display","none");
    		}else{
    			$("#xinhuancontent_scroll").css("display","block");
    		}
    	})
    	function jianguanyuyue(){
    		 var name = $("#AUTHENTICATION_NAME").val();
             var mobile = $("#AUTHENTICATION_PHONE").val();
    		 var nameReg = /^[\u4e00-\u9fa5]+$/;
             var mobileReg = /^[1-9][0-9]{10}$/;
             if (!name || name.trim() == "" || name.trim().length < 2) {
                 alert("请输入2-5字中文姓名");
                 return;
             }
             if (!nameReg.test(name.trim())) {
                 alert("请输入中文姓名");
                 return;
             }
             if (!mobile || mobile.trim() == "") {
                 alert("手机号不能为空");
                 return;
             }
             if (!mobileReg.test(mobile.trim())) {
                 alert("请输入正确的手机号码");
                 return;
             }
             $.ajax({
            	 type:"post",
            	 url:"web/authentication",
            	 data:{"NAME":name ,"PHONE":mobile,"INFO":"合格投资者认定"},
             	 datatype:"json",
             	 success:function(data){
             		if(data=="ok"){
             			$.cookie('qhhcjf_stable', 'true', {path:'/',expires : 7}); 
             			$("#xinhuancontent_scroll").hide();
             		}else{
             		
             		}
             	 }
             });
    	}
    </script>
<!-- 证监会弹框 -->
	<div class="tankuang_xinzeng" id="xinhuancontent_scroll" style="display:none ">
            <div class="diceng">
                <div class="tankuang_xinzeng_1">
                    
                    <div class="tk_right" style="background: #fff;">
                        <div class=" h30 bgffffff">
                        </div>
                        <div class=" h54 bgffffff">
                            <div class=" fl ml20">
                                <img src="static/img/web/img_index_logo_sign.png" width="180" alt="logo"></div>
                            <div class=" fl ml20" style="width: 3px; background: #f49703; height: 36px; margin-top: 8px;">
                            </div>
                            <div class=" fl ml20 fs20 lh48 fwb" style="color:#c54c0d;">
                                合格投资者认定</div>
                        </div>
                        <div class=" c666666 fs14 lh24 pl25 pt5 pr25 pb10">
                           
                            
                                
                            <p class="c000000">
                                根据《私募投资基金监督管理暂行办法》第十二条等之规定，合格投资者是指具备相应风险识别能力和风险承担能力，单笔投资金额不少于100万元，且符合下列条件的单位和个人：（一）净资产不低于1000 万元的单位；（二）金融资产不低于300 万元或者最近三年个人年均收入不低于50 万元的个人。
 环成金服谨遵法律法规的规定，只向合格投资者展示相关理财产品信息，不构成任何投资推介建议。请您阅读本提示并确认是否符合合格投资者条件。</p >

							<p style="color: #FB930A;">您完成验证并点击“认证”即表明您保证符合合格投资者的条件。</p >
                           
                        </div>
                        <div>
                            
                                 <!--<div onclick="colous()" id="closebtn" style="background:#4D4D4D;" class=" tac ml50 w100 h48 lh48 cffffff fs18 fr bradius5 cpointer">
                                    我知道了</div> 
                                <div class=" w20 h20 ml25 fl">
                                    <input type="checkbox" checked="checked" style="" disabled="disabled"></div>
                                    <div class=" h20 fl" style=" margin-top:-3px;color: #FB930A;">我已阅读并符合合格投资者认定</div>-->
	 </div>
 <style>
 .trust_productdetail_input_bg{ background:#eeeeee; width:210px; height:40px; color:#878686; padding-left:10px; border-radius:4px; line-height:40px;}
 </style>                       
                    </div>
                    <div class="tk_left">
                
                    <div class=" c666666 fs14 lh24" style=" padding-top:90px; width:300px; margin-left:20px; overflow:hidden;">
                    	 <p style="color: #000;">
                                根据《私募投资监督管理暂行办法》规定，您需要进行身份认证后才能继续访问。</p>
                         <div class=" fl w220 h40 lh40" style="margin-top:12px; ">
                              <input id="AUTHENTICATION_NAME" value=""  type="text" placeholder="请输入您的姓名"  class="trust_productdetail_input_bg"></div>
                         <div class=" fl w220 h40" style="margin-top:10px;line-height:40px;">
                              <input id="AUTHENTICATION_PHONE" value="" type="text" placeholder="请输入您的手机号码" class=" trust_productdetail_input_bg"></div>
                         <a onclick="jianguanyuyue()" class=" fl w220 h40 lh40 cffffff" style="cursor:pointer; margin-top:10px; background-color:#f49703;border-radius:4px; text-align:center;">认证并继续访问
                         </a>                                           
                    </div>
                    <a href="web/index" style="float: right; margin-right:110px; margin-top:15px; cursor: pointer; ">暂不认证</a> 
                    </div> <img  src="static/img/web/banner22.jpg" width="100%">
                </div>
               
            </div>
         <div class="beijing">
            </div>
        </div> 