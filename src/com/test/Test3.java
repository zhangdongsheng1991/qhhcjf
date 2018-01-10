package com.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test3 {
	
	public static void main(String[] args) {
		String str = "<p><br/></p><p><span style=\"color: rgb(247, 150, 70); font-size: 20px;\">资金运用情况     </span><br/></p><p><br/></p><p>主要投资于基础设施建设及资质良好的企业或国家政策重点鼓励支持行业，银行存款、国债、金融债、央行票据、AA+级企业债、A-1及以上短期信用评级基金以及其他低风险的固定收益类产品。</p><p><br/></p><p><br/></p><p><br/></p><hr/><p><br/></p><p><br/></p><p><span style=\"font-family: 宋体; font-size: 20px; color: rgb(247, 150, 70);\">资金用途</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); font-size: 16px;\"><br/><br/>主要投资于基础设施建设及资质良好的企业或国家政策重点鼓励支持行业，银行存款、国债、金融债、央行票据、AA+级企业债、A-1及以上短期信用评级基金以及其他低风险的固定收益类产品。</span></p><p><br/><span style=\"font-family: 宋体; color: rgb(0, 0, 0); font-size: 16px;\"></span></p><p><span style=\"font-family: 宋体; color: rgb(0, 0, 0); font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; color: rgb(0, 0, 0); font-size: 16px;\"></span></p><hr/><p><br/></p><p><br/></p><p><span style=\"font-family: 宋体; color: rgb(247, 150, 70); font-size: 20px;\">还款来源</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; color: rgb(0, 0, 0); font-size: 16px;\"><br/>项目投资收益。</span></p><p><br/><span style=\"font-family: 宋体; color: rgb(0, 0, 0); font-size: 16px;\"></span></p><p><br/><span style=\"font-family: 宋体; color: rgb(0, 0, 0); font-size: 16px;\"></span></p><p><span style=\"font-family: 宋体; color: rgb(0, 0, 0); font-size: 16px;\"></span></p><hr/><p><span style=\"font-family: 宋体; color: rgb(0, 0, 0); font-size: 16px;\"></span><br/></p>";
		
		int count = 0;
		long t = System.currentTimeMillis();
		for(int i=0;i<str.length();i+=1000){
			i = str.indexOf("<p",i);
			if(i==-1){
				break;
			}else{
				count++;
			}
		}
		System.out.println(count);
		long t2 = System.currentTimeMillis();
		System.out.println(t2-t);
		
	}
}
