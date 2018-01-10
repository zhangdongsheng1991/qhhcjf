/*package com.fh.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.fh.controller.base.BaseController;

@Component("testLogger")
@Aspect
public class TestLogger extends BaseController{
	@Pointcut("execution(* com.fh.service.system.productappointment.AppProductAppointmentService.save(..))")
	public void testPointcut(){
		
	}
	
	@Around("testPointcut()")
	public Object testlogger(ProceedingJoinPoint pjp) throws Throwable{
		Object obj = pjp.proceed();
		HttpServletRequest request = getRequest();
		request.getRemoteAddr();
		System.out.println("==================================="+request.getAttribute("sessionId"));
		System.out.println("test 产品预约...");
		return obj;
	}
}
*/