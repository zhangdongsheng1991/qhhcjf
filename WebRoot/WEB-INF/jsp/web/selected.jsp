<!-- <!DOCTYPE html> -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
    <head>
     	<base href="<%=basePath%>">
     	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta charset="UTF-8">
        <meta name='keywords' content=''/>
        <meta name='description' content=''/>
        <title>环成在线产品精选-环成金服</title>
        <link href='static/css/web/selected/self.css' rel='stylesheet' type='text/css'/>
        <script src="static/js/web/selected/jquery.js"></script>
        <link rel="stylesheet" type="text/css" href="static/css/web/style.css">
		<link rel="stylesheet" type="text/css" href="static/css/web/common.css">
		<link rel="Shortcut Icon" href="static/img/web/logo2.ico">
        <script>
	        $(function(){
	        	$('#selected_succ').click(function(){
	        		$('#select_pop-by,#selected_pop-mnc,#selected_succ,#zx').css('display','none');
	        	});
				$('#yuyue_submit1').click(function(){
					var name = $('#yuyue_name');
					var val_name=name.val();
					
					var reg = /^[\u4E00-\u9FA5]{2,5}$/;
					if(!reg.test(val_name.trim())){
						alert("请输入2-5字中文姓名");
						return;
					};
					var phone =$('#yuyue_phone');
					var val_phone=phone.val();
					var reg = /^1\d{10}$/;
					if(!reg.test(val_phone.trim())){
						alert("请输入11位手机号码");
						return;
						
					};
					 
					 var consultType= h3_text;
					$.ajax({
                        url: "web/activityApply",
                        type: "post",
                        data: {
                           "NAME": val_name,
                            "PHONE": val_phone,
                            "SHAREHOLDERSBACKGROUND": consultType,
                            "INVESTMENTTHRESHOLD": '',
                            "RETURNSBENCHMARK": '',
                            "PRODUCTDEADLINE": '',
                            "TRUSTNAME":''
                        },
                        dataType: "json",
                        success: function(data) {
                          // flag = true;
                            
                            if (data.result == 01) {
                                $("#reportName").val("");
                                $("#reportMobile").val("");
                                $('#selected_succ').css('display','block');
                                $('#zx').css('display','none');
                            }else{
                             alert(data.msg);
                            }
                           
                        }
                    });
					
				});
			})
        </script> <%@include file="baidusq.jsp"%>
    </head>
    <body>
    	<div class="top">
        	<div class="top_box">
            	<a href="http://www.qhhcjf.com/web/index" target="_blank">
            		<div class="top_logo">环成金服</div>
            	</a>
                <div class="top_phone"></div>
            </div>
        
        </div>
        <!--Start 正文主体-->
        <div class="container">
       <!--第一区域-->
            <div class="banner"></div>
            <!--2-->
            <div class="row2">
                <div class="w1200 clearfix tac">
                    <p>信托</p>
                    <p>资管</p>
                    <p>契约型</p>
                    <p>股权投资</p>
                    <p>政府债</p>
                </div>
            </div>
            
            <!--4-->
            <div class="pro-1 mt60 w1200">
                <h3 class="pro-mntt clearfix normal">
                    <span class="col333">优选信托产品</span>
                    <i>安全性高、免税待遇</i>
                </h3>
                <ul class="pro-ul clearfix mt25">
                    <li>
                        <p class="pro-top">红包6000元起</p>
                        <h3 class="normal pro-tt tac">
                               	光大信托-润泽金汇5号<i></i>
                        </h3>
                        <h4 class="normal pro-num tac">
                            8.10<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24个月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn"> 向前海光信发放信托贷款，用于并购深圳市世纪文化创意有限公司51%股权；并购梓盛发房地产公司90%股权；并购梓盛发实业集团公司5%股权。</p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">红包8000元起</p>
                        <h3 class="normal pro-tt tac">播州水投(第1期)</h3>
                        <h4 class="normal pro-num tac">
                            7.50<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>36个月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">小额畅打+优质地级市政信+主体评级AA城投+主体评级AA国投双政府平台担保
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">红包5000元起</p>
                        <h3 class="normal pro-tt tac">金马535号（3期）</h3>
                        <h4 class="normal pro-num tac">
                            7.70<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24个月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">ZF文件+国企担保+应收账款转让
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">现金红包</p>
                        <h3 class="normal pro-tt tac">中泰信托--金泰36号</h3>
                        <h4 class="normal pro-num tac">
                            7.20<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24个月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">AA主体剑江控股提供不可撤销的连带责任保证担保.
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                </ul>
            </div>
            
           <!--3-->
                        <div class="pro-1 mt60 w1200">
                <h3 class="pro-mntt clearfix normal">
                    <span class="col333">优选资管产品</span>
                    <i>预期收益高、知名企业担保</i>
                </h3>
                <ul class="pro-ul clearfix mt25">
                    <li>
                        <p class="pro-top">红包8000元起</p>
                        <h3 class="normal pro-tt tac">
                            和合资管•嘉业1号<i></i>
                        </h3>
                        <h4 class="normal pro-num tac">
                            9.50<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>18/24月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">上海内环内项目，投资于上海核心区繁华商圈知名品牌物业，超低折扣价格，项目方跟投20%，超高性价比。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">红包6000元起</p>
                        <h3 class="normal pro-tt tac">网信证券-中租2号</h3>
                        <h4 class="normal pro-num tac">
                            8.50<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>12月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">信托计划受让中国融资租赁有限公司持有的应收账款收益权，资管计划所募资金最终用于补充中国融资租赁有限公司流动性资金。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">红包6000元起</p>
                        <h3 class="normal pro-tt tac">ZHQH•荣信</h3>
                        <h4 class="normal pro-num tac">
                            8.38<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">融资方为政府融资平台，偿债能力极强；土地抵押+应收账款质押+政府支持性文件+AA级市级平台担保。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">红包5000元起</p>
                        <h3 class="normal pro-tt tac">XX资管•瑞林</h3>
                        <h4 class="normal pro-num tac">
                            8.50<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">土地抵押+应收账款转让+政府支持性文件+AA级市级平台担保；地方财政实力较强，还款来源充足可靠。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                </ul>
            </div>
 

            <!--5-->
            <div class="pro-1 mt60 w1200">
                <h3 class="pro-mntt clearfix normal">
                    <span class="col333">优选契约型产品</span>
                    <i>投资灵活、期限明确</i>
                </h3>
                <ul class="pro-ul clearfix mt25">
                
                	<li>
                        <p class="pro-top">红包3000元起</p>
                        <h3 class="normal pro-tt tac">晋汇--深圳鸿海环球</h3>
                        <h4 class="normal pro-num tac">
                            11.6<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>12+6个月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">抵押物唯一且第一顺位抵押至本基金债权人，抵押物足值且升值变现能力强。实际控股股东对融资提供无限连带责任保证担保，担保效力强。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                
                  <li>
                        <p class="pro-top">红包5000元起</p>
                        <h3 class="normal pro-tt tac">黑岩-成都华霖商贸</h3>
                        <h4 class="normal pro-num tac">
                            10.8<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>12+12月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">成都市地铁上盖物业，2.5环新地标+4.7亿超足值抵押担保
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                
                    <li>
                        <p class="pro-top">红包3000元起</p>
                        <h3 class="normal pro-tt tac">太平洋-金凤12号</h3>
                        <h4 class="normal pro-num tac">
                            9.60<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24个月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">西岳华山城投主体融资、西岳国资连带担保、1.5倍足额应收账款、1.5足值土地抵押、政府支持性文件、太平洋证券外包、上海银行托管双重金融机构监管。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                  
                    <li>
                        <p class="pro-top">红包2000元起</p>
                        <h3 class="normal pro-tt tac">工大集团安见三期</h3>
                        <h4 class="normal pro-num tac">
                            9.50<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>12个月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">本基金通过委托贷款方式给予哈尔滨工大集团股份有限公司发放流动资金贷款等。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    
                </ul>
            </div>
            <!--6-->
            <div class="pro-1 mt60 w1200">
                <h3 class="pro-mntt clearfix normal">
                    <span class="col333">优选股权投资</span>
                    <i>监管机制严、安全度高</i>
                </h3>
                <ul class="pro-ul clearfix mt25">
                    <li>
                        <p class="pro-top">红包8000元起</p>
                        <h3 class="normal pro-tt tac">
                            华谊风云实景一号<i></i>
                        </h3>
                        <h4 class="normal pro-num tac">
                            10.00<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24个月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">国民经济支柱性产业项目，上市公司华谊兄弟（300027.SZ）旗下三大主营板块之一，AA+发债主体+资金规模超900亿提供差额补足义务。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">红包6000元起</p>
                        <h3 class="normal pro-tt tac">乾立三盛宏业</h3>
                        <h4 class="normal pro-num tac">
                            9.80<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24个月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">上海临港鲜花港开发项目，融资主体为全国地产50强，控股A股上市公司，舟山市核心段现房抵押，实际控制人连带担保。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">红包6000元起</p>
                        <h3 class="normal pro-tt tac">海棠光正一号</h3>
                        <h4 class="normal pro-num tac">
                            9.00<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>12+6个月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">标的项目属于市政府重点扶持项目，项目区域优势明显，通过低至近四折的高折扣率获得优质抵押资产，安全边际高。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">红包5000元起</p>
                        <h3 class="normal pro-tt tac">当代东方院线并购二期</h3>
                        <h4 class="normal pro-num tac">
                            11.00<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>2+1年</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">上市公司当代东方携手国泰元鑫，收购优质电影院线、影院资产，当代集团承诺回购
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                </ul>
            </div>
            <!--7-->
            <div class="pro-1 mt60 w1200">
                <h3 class="pro-mntt clearfix normal">
                    <span class="col333">优选政府债产品</span>
                    <i>优质标的、期限灵活</i>
                </h3>
                <ul class="pro-ul clearfix mt25">
                    <li>
                        <p class="pro-top">红包6000元起</p>
                        <h3 class="normal pro-tt tac">
                            尧舜禹旅游产业<i></i>
                        </h3>
                        <h4 class="normal pro-num tac">
                            10.50<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>100万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>12+12月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">资金投向政府支持的AAAA级景区项目，政策优势+区位优势明显，政府对项目进行溢价回购+大型国企担保。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">红包8000元起</p>
                        <h3 class="normal pro-tt tac">召陵区城投</h3>
                        <h4 class="normal pro-num tac">
                            9.60<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>20万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">1.融资方现金流；2.担保方履行担保义务；3.质押物变现。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">红包5000元起</p>
                        <h3 class="normal pro-tt tac">独山定向融资</h3>
                        <h4 class="normal pro-num tac">
                            9.50<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>20万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">1.发行人经营收入； 2.担保人的保证担保； 3.抵押物处置以及财政支持。</p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                    <li>
                        <p class="pro-top">现金红包</p>
                        <h3 class="normal pro-tt tac">独山下司私募债</h3>
                        <h4 class="normal pro-num tac">
                            10.30<em>%</em>
                        </h4>
                        <p class="pro-sy tac">预期年化收益率</p>
                        <div class="pro-intr clearfix">
                            <p class="pro-intr1">
                                <span>10万</span>
                                <i>起投金额</i>
                            </p>
                            <p class="pro-intr1 pro-intr2">
                                <span>24月</span>
                                <i>投资期限</i>
                            </p>
                        </div>
                        <p class="pro-mn">10万起投国企融资，高额应收账款转让+国企担保，政府文件支持，财政纳入预算。
                </p>
                        <a href="javascript:;" class="pro-a yuyue">立即预约</a>
                    </li>
                </ul>
            </div>
            <!--底部-->
        
        
        
        <!--End 正文主体-->
       <div id='select_pop-by' class="pop-by"></div>
        <div id='selected_pop-mnc' class="pop-mnc">
        	<div>
      			<img id='selected_succ' style="display: none" src="static/img/web/query/succ.png"/>
      		</div>
      		<div class="pop-hide"></div>
	        <div id="zx">   
	        	<h3 class="pop-tt"></h3>
	            <ul class="pop-form">
	                <li class="clearfix relative">
	                    <i class="name-i1">您的姓名：</i>
	                    <input type="hidden" name="yuyue_zhuang_ti" id="yuyue_zhuang_ti" value="软件下载"/>
	                    <input name="yuyue_name" id="yuyue_name" class="pop-inp fl name ipt" placeholder="请输入您的姓名">
	                    <span class="name-tip" id="yuyue_name_tip"></span>
	                </li>
	                <li class="clearfix relative">
	                    <i class="phone-i1">您的手机：</i>
	                    <input name="yuyue_phone" id="yuyue_phone" class="pop-inp fl phone" placeholder="请输入您的电话">
	                    <span class="name-tip" id="yuyue_phone_tip"></span>
	                </li>
	                <li class="clearfix">
	                    <input id="yuyue_submit1" type="button" class="pop-but">
	                </li>
	            </ul>
	        </div>
        </div>
        
        <div class="pop-succ">
            <div class="succ colfff">
                <h3></h3>
                <p class="tac">
                    我们将立即为您分配理财师 <br>
                    跟进您的预约 <br>
                    <span>请保持电话畅通</span>
                    <br>感谢您选择环成金服
        
                </p>
            </div>
            <div class="pop-hide"></div>
        </div>
        <%@include file="bottom.jsp"%>  
        <script>

            //滑动
            //关于我们

            function fnClick(el, arrObj) {
                var obj, current, arr;
                arr = arrObj;
                obj = $(el);
                obj.on('click', 'p', function() {
                    current = $(this).index();
                    $(this).addClass('on').siblings().removeClass('on');
                    $('html, body').animate({
                        scrollTop: arr[current]
                    }, 500);
                });
                $(window).scroll(function() {
                    var thisSc = $(window).scrollTop();
                    if (thisSc > arrObj[0]) {
                        obj.addClass('nav-fixed');
                    } else {
                        obj.removeClass('nav-fixed');
                    }
                    if (thisSc >= arrObj[0] && thisSc < arrObj[1]) {
                        obj.find('p').eq(0).addClass('on').siblings().removeClass('on');
                    }
                    if (thisSc >= arrObj[1] && thisSc < arrObj[2]) {
                        obj.find('p').eq(1).addClass('on').siblings().removeClass('on');
                    }
                    if (thisSc >= arrObj[2] && thisSc < arrObj[3]) {
                        obj.find('p').eq(2).addClass('on').siblings().removeClass('on');
                    }
                    if (thisSc >= arrObj[3] && thisSc < arrObj[4]) {
                        obj.find('p').eq(3).addClass('on').siblings().removeClass('on');
                    }
                    if (thisSc >= arrObj[4] && thisSc < arrObj[5]) {
                        obj.find('p').eq(4).addClass('on').siblings().removeClass('on');
                    }
                });
            }
            fnClick('.row2', [687, 1197, 1715, 2227, 2660]);

            //弹框
            var popClose = $('.pop-hide');
            function popHide() {
                $('.pop-by,#selected_pop-mnc,.pop-succ,#selected_succ').fadeOut();
            }
            function yuyue() {
                $('.pop-by,#selected_pop-mnc,#zx').fadeIn();
            }
            function succ() {
                $('#selected_pop-mnc').fadeOut();
                $('.pop-by,.pop-succ').fadeIn();
            }

            popClose.click(function() {
                popHide()
            });
			var h3_text;
            $('.yuyue').click(function() {
            	h3_text = $(this).parent().find("h3").text();
                var product_title = $(this).attr("_title");
                $("#yuyue_zhuang_ti").val(product_title);
                yuyue();
            })
            
        </script>
    </body>
</html>
