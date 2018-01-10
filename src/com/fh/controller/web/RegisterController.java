package com.fh.controller.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.UserManageMent;
import com.fh.service.system.usermanagement.UserManageMentService;
import com.fh.util.Const;

@Controller
@RequestMapping(value="/web")
public class RegisterController extends BaseController{
	
	@Resource(name="usermanagementService")
	private UserManageMentService usermanagementService;
	
	@RequestMapping(value="/register")
	public ModelAndView goRegister(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("web/register/register");
		return mv;
	}
	
	@RequestMapping(value="/saveUser")
	@ResponseBody
	public Object saveUser(String u_phone,String u_name,String u_pwd,String u_email,String webcode){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		if(!webcode.equalsIgnoreCase((String) session.getAttribute(Const.SESSIONREGISTER_SECURITY_CODE))){
			return "errcode";
		}
//		if(!webcode.equalsIgnoreCase((String) session.getAttribute(Const.SESSIONPHONE_SECURITY_CODE))){
//			return "errphonecode";
//		}
		String id = this.get32UUID();
		
		String pwd = new SimpleHash("SHA-1",u_phone,u_pwd).toString();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String now = sdf.format(new Date());
		String[] datearr = now.split("-");
		
		String year = datearr[0];
		String month = datearr[1];
		
		UserManageMent user = new UserManageMent();
		user.setId(id);
		user.setU_phone(u_phone);
		user.setU_pwd(pwd);
		user.setU_name(u_name);
		user.setU_email(u_email);
		user.setRegisterdate(now);
		user.setR_year(year);
		user.setR_month(month);
		user.setU_sex("0");
		try {
			usermanagementService.saveUser(user);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	@RequestMapping("/success")
	public ModelAndView success(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("web/register/success_register");
		return mv;
	}
	@RequestMapping("/checkphone")
	@ResponseBody
	public Object checkphone(String phone){
		try {
			return usermanagementService.checkphone(phone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	//申请发送手机验证码
	@RequestMapping("/sendphonecode")
	@ResponseBody
	public Object sendphonecode(){
		System.out.println(1);
		return "";
	}
}
