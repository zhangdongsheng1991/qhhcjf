var formData = {}, m = [
		'A',
		'B',
		'C',
		'D',
		'E',
		'F'
	], lasttime = 3;
$(function () {
    $('.dl-ol1 li label').on('click', function () {
        $(this).parent().siblings('li').find('.check-i').removeClass('check-i2');
        $(this).find('.check-i').addClass('check-i2');
        if ($(this).parents("ol").attr('id') == "dl-ol8") {
            if ($(this).hasClass("no-buy")) {
                $('#h-ans9').show()
            } else {
                $('#h-ans9').hide().find(".check-i2").removeClass('check-i2');
            }
        }
        if ($(this).hasClass("zdy-box")) {
            $(this).next('.h-advice3').show();
            //$(this).parent('li').height(178);
            //$(this).next('.h-advice3').children('textarea').focus();
        } else {
            //	$(this).parent('li').siblings(".l-other").height(34);
            $(this).closest('.dl-ol1').find('.h-advice3').hide().find('textarea').val('').trigger('blur');
        }

        var name = $(this).closest('.dl-ol1').attr('data-name');
        if (name == 'answer8') { //问题8，选B有出现另一个问题
            formData[name] = m[$('.dl-ol1[data-name=answer8]').find('.check-i2').attr('data-val')] || '';

            formData[name] += '|';
            if (formData['answer8'] != 'A|') {
                answer2 = '';
                $(this).closest('.dl-ol2').find('.check-i2').each(function (i) {
                    answer2 += m[$(this).attr('data-val')];
                });
                formData[name] += answer2;
            }
        } else {
            formData[name] = m[$(this).find('.check-i').attr('data-val')];
        }

        var textarea = $(this).closest('.dl-ol1').find('textarea');
        if (textarea.length > 0) {
            if (textarea.val().indexOf('请输入内容，不超过') == -1) formData[name + 'Supply'] = textarea.val();
        }

        if (formData['answer8'] == 'A|') {
            $(".dl-ol2[data-name=answer8] textarea").val('请输入内容，不超过500字');
            delete formData['answer8' + 'Supply'];
        }
    })
    $('.dl-ol2 li label').on('click', function () {
        $(this).find('.check-i').toggleClass('check-i2');

        var name = $(this).closest('.dl-ol2').attr('data-name');

        if (name == 'answer8') { //问题8，选B有出现另一个问题
            formData[name] = m[$('.dl-ol1[data-name=answer8]').find('.check-i2').attr('data-val')] || '';

            formData[name] += '|';
            if (formData['answer8'] != 'A|') {
                answer2 = '';
                $(this).closest('.dl-ol2').find('.check-i2').each(function (i) {
                    answer2 += m[$(this).attr('data-val')];
                });
                formData[name] += answer2;
            }

        } else {
            formData[name] = '';
            $(this).closest('.dl-ol2').find('.check-i2').each(function (i) {
                formData[name] += m[$(this).attr('data-val')];
            });
        }

        if (formData[name] == '' || formData[name] == '|') {
            delete formData[name];
        }

        var textarea = $(this).closest('.dl-ol2').find('textarea');
        if (textarea.length > 0) {
            if (textarea.val().indexOf('请输入内容，不超过') == -1) formData[name + 'Supply'] = textarea.val();
        }

        if (formData['answer8'] == 'A|') {
            $(".dl-ol2[data-name=answer8] textarea").val('请输入内容，不超过500字');
            delete formData['answer8' + 'Supply'];
        }
    });
    /*获取焦点 隐藏提示语*/
    $('.h-advice1 textarea').focus(function () {
        if ($(this).val() == '请输入内容，不超过500字') {
            $(this).val('');
        }
    });
    $('.h-advice1 textarea').blur(function () {
        if ($(this).val() == '') {
            $(this).val('请输入内容，不超过500字');
        }

        var name = $(this).closest('.dl-ol').attr('data-name');
        if ($(this).val().indexOf('请输入内容，不超过') == -1) {
            formData[name + 'Supply'] = $(this).val();
        } else {
            delete formData[name + 'Supply'];
        }
    });
    $('.h-advice3 textarea').focus(function () {
        if ($(this).val() == '请输入内容，不超过50字') {
            $(this).val('');
        }
    });
    $('.h-advice3 textarea').blur(function () {
        if ($(this).val() == '') {
            $(this).val('请输入内容，不超过50字');
        }

        var name = $(this).closest('.dl-ol').attr('data-name');
        if ($(this).val().indexOf('请输入内容，不超过') == -1) {
            formData[name + 'Supply'] = $(this).val();
        } else {
            delete formData[name + 'Supply'];
        }
    });

    $(".wenjuan_fancybox_close").click(function () {
        $("#wenjuancontent_scroll").hide();
        $(".x-mask,.succ").hide();
    });

    $(".wenjuan_success_close").click(function () {
        $("#wenjuancontent_scroll").hide();
        $(".x-mask,.succ").hide();
    }); 

    $(".btn-post").click(function () {
        var errorArr = [], rightAnser = [];
        $(".dlbox:visible").each(function (index) {
            if ($(this).find(".check-i2").size() < 1) {
                errorArr.push(index);
            } else {
                var index = $(this).index(), val = $(this).find(".check-i2").attr("data-val");
                //console.log("ques:"+index+",answer:"+val);
            }
        })
        if (errorArr.length > 0) {
            var scrY = $(".dlbox").eq(errorArr[0]).offset().top;
            $(window).scrollTop(scrY);
            $(".dlbox:visible").eq(errorArr[0]).find("dt").append("<em class=error-tip>此题必答</em>");
            setTimeout(function () { $(".error-tip").fadeOut(640, function () { $(this).remove() }) }, 1000);
            //return false;
        } else {
            $("#wenjuancontent_scroll").hide();
            $(".x-mask,.succ").show();
            last();
            //                $.post(
            //						"questionnaire_check.html",
            //						{},
            //						function (data) {
            //						    alert("1");
            //						    if (data == 1) {
            //						        $.post(
            //										"questionnaire_add.html",
            //										formData,
            //										function (data) {
            //										    if (data == 1) {
            //										        $(".x-mask,.succ").show();
            //										        last();


            //										    }
            //										}
            //								);
            //						    } else {
            //						        $('.succ dt').text('抱歉，提交已超过最大限制');
            //						        $(".x-mask,.succ").show();
            //						        last();
            //						    }
            //						}
            //				);
        }
    })


})

function last() {

    if (lasttime != 0) {
        $('.lasttime').text(lasttime);
        lasttime--;
        setTimeout("last()", 1000);
    } else {
        $('.lasttime').text(lasttime);
        //location.href = 'index.html';
        $("#wenjuancontent_scroll").hide();
        $(".x-mask,.succ").hide();
    }
}