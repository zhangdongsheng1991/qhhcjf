package com.test;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
// import org.springframework.stereotype.Component;
public class MyTestServiceImpl {

	@Scheduled(cron = "0 54 15  * * ? ")
	// 每5秒执行一次
	public void myTest() {

		System.out.println("进入测试");

	}

}