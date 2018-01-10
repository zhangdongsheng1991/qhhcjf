package com.fh.controller.system.usermanagement.usermanagement.userlog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.entity.system.UserManageMent;
import com.fh.service.system.usermanagement.UserManageMentService;
import com.fh.service.system.usermanagement.usermanagement.userlog.UserLoginLogService;

@Controller
@RequestMapping("usermanagement/userlog")
public class UserLogController {
	@Resource(name="userloginlogService")
	private UserLoginLogService userloginlogService;
	@Resource(name="usermanagementService")
	private UserManageMentService usermanagementService;
	private static final String JSPPREFIX = "system/usermanagement/usermanagement/userlog";
	@RequestMapping("/listuser")
	public ModelAndView listuser(UserManageMent user){
		ModelAndView mv = new ModelAndView();
		List<UserManageMent>list = null;
		String str2017month = "";
		String str2018month = "";
		for(int i=0;i<12;i++){
			if(i<9){
				str2017month+="{ id:'20170"+(i+1)+"', pId:'2017', name:'"+(i+1)+"月份',open:false},";
				str2018month+="{ id:'20180"+(i+1)+"', pId:'2018', name:'"+(i+1)+"月份',open:false},";
			}else{
				str2017month+="{ id:'2017"+(i+1)+"', pId:'2017', name:'"+(i+1)+"月份',open:false},";
				str2018month+="{ id:'2018"+(i+1)+"', pId:'2018', name:'"+(i+1)+"月份',open:false},";
			}
		}
		String result = "[{ id:'2017', pId:'0', name:'2017年',open:false},"+str2017month+"{ id:2018, pId:0, name:'2018年'},"+str2018month+"{ id:2019, pId:0, name:'2019年'}";
		try {
			list = usermanagementService.listAll(user);
			for(int i=0;i<list.size();i++){
				UserManageMent u = list.get(i);
				String pid = u.getR_year()+u.getR_month();
				if(i==list.size()-1){
					result+=",{id:'"+u.getId()+"',pId:'"+pid+"',name:'"+u.getU_phone()+"'}]";
				}else{
					result+=",{id:'"+u.getId()+"',pId:'"+pid+"',name:'"+u.getU_phone()+"'}";
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("result", result);
		mv.setViewName(JSPPREFIX+"/listuser");
		return mv;
	}
	
	@RequestMapping("/logtype")
	public ModelAndView logtype(String id){
		ModelAndView mv = new ModelAndView();
		mv.setViewName(JSPPREFIX+"/logtype");
		mv.addObject("id",id);
		return mv;
	}
	
	@RequestMapping("/listloginlog")
	public ModelAndView listloginlog(String id){
		ModelAndView mv = new ModelAndView();
		try {
			UserManageMent user = (UserManageMent) usermanagementService.findUserById(id);
			String phone = user.getU_phone();
			List list = userloginlogService.findLoginLogByPhone(phone);
			mv.addObject("list",list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName(JSPPREFIX+"/listloginlog");
		mv.addObject("id",id);
		return mv;
	}
	@RequestMapping("/operationrecords")
	public ModelAndView operationrecords(String u_phone,Integer logincount){
		ModelAndView mv = new ModelAndView();
		try {
			Map map = new HashMap<>();
			map.put("u_phone", u_phone);
			map.put("logincount", logincount);
			List list = userloginlogService.findOperationRecordsByLoginCount(map);
			mv.addObject("list",list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName(JSPPREFIX+"/listoperationrecords");
		return mv;
	}
}
