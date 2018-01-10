$(function() {
	$("#succ").click(function(){
		$("#succ").css("display","none");
		$("#zx").css("display","block");
		$('.pop-by,.pop-mnc').fadeOut();
		
	});
	/* 翻页导航 */
	var num = 0;// 全局变量初始值肯定是0 代表当前是第0个li被选中
	function myFn() {// 自定义函数简化代码
		// 1：ol的li切换 2：换ul的li图片
		num++;// 让num自己加1
		if (num > 5) {
			num = 0;
		}
		$('.Scroll ol li').eq(num).addClass('current').siblings().removeClass(
				'current');

	}

	$('.rightBtn').click(function(e) {
		myFn();
	});

	$('.leftBtn').click(
			function(e) {
				num--;
				if (num < 0) {
					num = 5;
				}

				$('.Scroll ol li').eq(num).addClass('current').siblings()
						.removeClass('current');

			});
	$('.Scroll ol li').click(function(e) {
		// 控制ol的li有特殊类样式
		$(this).addClass('current').siblings().removeClass('current');

	});

	// 弹框
	var popClose = $('.pop-hide,.pop-by');
	function popHide() {
		$('.pop-by,.pop-mnc').fadeOut();
	}
	function yuyue() {
		$('.pop-by,.pop-mnc').fadeIn();
	}

	popClose.click(function() {
		popHide()
	});

})

var institutionname = "";
function showhz(v) {
	var product_title = $(this).attr("_title");
	$("#yuyue_zhuang_ti").val(product_title);
	$('.pop-by,.pop-mnc').fadeIn();
	institutionname = v;
}
function hz() {
	var name = $('#yuyue_name');
	var val_name = name.val();

	var reg = /^[\u4E00-\u9FA5]{2,5}$/;
	if (!reg.test(val_name.trim())) {
		$(".name-tip").css("display", "block");
		return;
	} else {
		$(".name-tip").css("display", "none");
	}
	;
	var phone = $('#yuyue_phone');
	var val_phone = phone.val();
	var reg = /^1\d{10}$/;
	if (!reg.test(val_phone.trim())) {
		$(".phone-tip").css("display", "block");
		return;
	} else {
		$(".phone-tip").css("display", "none");
	}
	;
	
	var yuyue_subject = $('#yuyue_subject');
	var val_yuyue_subject = yuyue_subject.val();
	
	var yuyue_des = $('#yuyue_des');
	var val_yuyue_des = yuyue_des.val();
	
	
	var SHAREHOLDERSBACKGROUND = '融资网-' + institutionname;
	$.ajax({
		url : "web/activityApply",
		type : "post",
		data : {
			"NAME" : val_name,
			"PHONE" : val_phone,
			"INVESTMENTFIELD":val_yuyue_subject,
			"TRUSTNAME":val_yuyue_des,
			"SHAREHOLDERSBACKGROUND" : SHAREHOLDERSBACKGROUND
		},
		dataType : "json",
		success : function(data) {
			if (data.result == 01) {
				$("#succ").css("display","block");
				$("#zx").css("display","none");
			} else {
				alert(data.msg);
			}

		}
	});
}
