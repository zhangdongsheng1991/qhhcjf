<%@page pageEncoding="utf-8" %>
<!--弹窗框-->
	<div class="pop-by"></div>
	<div class="pop-mnc">
		<img id="succ" style="display:none ;margin-top: 58px;margin-left: 40px" src="static/img/web/financing_img/ok.png"/>
		<div id="zx">
			<h3 class="pop-tt">投递项目</h3>
			<div class="pop-hide"></div>
			<ul class="pop-form">
				<li class="clearfix relative"><span class="name-i1">您的姓名：</span>
					<input name="yuyue_name" id="yuyue_name" class="pop-inp"
					placeholder="请输入您的姓名"> <span class="name-tip" style="display:none"
					id="yuyue_name_tip">请输入2-5位中文姓名</span></li>
				<li class="clearfix relative"><span class="phone-i1">您的手机：</span>
					<input name="yuyue_phone" id="yuyue_phone" class="pop-inp"
					placeholder="请输入您的电话"> <span class="phone-tip" style="display:none"
					id="yuyue_phone_tip">请输入正确的电话号码</span></li>
				<li class="clearfix relative"><span class="phone-i1">项目标题：</span>
					<input name="yuyue_subject" id="yuyue_subject" class="pop-inp"
					placeholder="请输入项目标题"> <span class="phone-tip" style="display:none"
					id="yuyue_subject_tip"></span></li>
				<li class="clearfix relative"><span class="phone-i1">项目描述：</span>
					<input name="yuyue_des" id="yuyue_des" class="pop-inp"
					placeholder="请输入项目描述"> <span class="phone-tip" style="display:none"
					id="yuyue_des_tip"></span></li>
				<li class="clearfix">
					<a id="comy_but" onclick="hz()" class="comy_but">申请合作</a>
				</li>
			</ul>
		</div>
	</div>
