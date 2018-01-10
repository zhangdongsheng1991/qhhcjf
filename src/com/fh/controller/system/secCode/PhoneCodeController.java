package com.fh.controller.system.secCode;

import java.util.Random;










import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.controller.web.WebLoginController;
import com.fh.service.system.usermanagement.UserManageMentService;

@Controller
@RequestMapping(value="/phonecode")
public class PhoneCodeController extends BaseController{
	
	@Resource(name="usermanagementService")
	private UserManageMentService usermanagementService;
	
	@RequestMapping(value="/generate")
	@ResponseBody
	public Object generate(String k){
		
		String temp_id2 = this.get32UUID();
		
		//生成随机数
		Random r = new Random();
		int i = r.nextInt();
		
		//把生成的数发送给 k，并将生成的数存入session
		Subject s = SecurityUtils.getSubject();
		Session session = s.getSession();
		session.setAttribute("code", k);
		
		//发送  send(k,i);
		
		
		return true;
	}
}
