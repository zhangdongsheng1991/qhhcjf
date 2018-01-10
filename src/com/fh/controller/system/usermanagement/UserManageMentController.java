package com.fh.controller.system.usermanagement;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.UserManageMent;
import com.fh.service.system.usermanagement.UserManageMentService;
import com.fh.util.PageData;

@Controller
@RequestMapping("/usermanagement")
public class UserManageMentController extends BaseController{
	@Resource(name="usermanagementService")
	private UserManageMentService usermanagementService;
	
	@RequestMapping("/user")
	public ModelAndView gouser(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/usermanagement/leftfirst");
		return mv;
	}
	@RequestMapping("/leftsecond")
	public ModelAndView left(UserManageMent user){
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
		mv.setViewName("system/usermanagement/leftsecond");
		mv.addObject("result", result);
		return mv;
	}
	@RequestMapping("/showUser")
	public ModelAndView showUser(String id){
		ModelAndView mv = new ModelAndView();
		UserManageMent user = null;
		try {
			if(id.length()==6){
				PageData pd = this.getPageData();
				String year = id.substring(0,4);
				String month = id.substring(4,6);
				pd.put("year",year);
				pd.put("month",month);
				List list = usermanagementService.findUsersByYearMonth(pd);
				mv.addObject("list", list);
				mv.setViewName("system/usermanagement/userlist");
			}else if(id.length()==4){
				List list = usermanagementService.findUsersByYear(id);
				mv.addObject("list", list);
				mv.setViewName("system/usermanagement/userlist");
			}else{
				user = (UserManageMent) usermanagementService.findUserById(id);
				mv.setViewName("system/usermanagement/userinfo");
				mv.addObject("user", user);
			}
			mv.addObject("treeId",id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/*
	 * 编辑
	 */
	@RequestMapping("/edituser")
	public ModelAndView edituser(String id,String treeId){
		ModelAndView mv = new ModelAndView();
		try {
			UserManageMent user = (UserManageMent) usermanagementService.findUserById(id);			
			mv.addObject("user", user);
			mv.setViewName("system/usermanagement/edituser");
			mv.addObject("treeId",treeId);
			return mv;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return mv;
		}
	}
	/*
	 * 保存
	 */
	@RequestMapping("/saveuser")
	public ModelAndView saveuser(UserManageMent user){
		ModelAndView mv = new ModelAndView();
		PageData pd = this.getPageData();
		mv.addObject("treeId",pd.get("treeId"));
		try {
			if(user!=null){
				usermanagementService.updateUser(user);
				mv.addObject("user",user);
				mv.setViewName("system/usermanagement/edituser");
				mv.addObject("status","ok");
				return mv;
			}else{
				mv.addObject("user",user);
				mv.setViewName("system/usermanagement/userlist");
				mv.addObject("status","err");
				return mv;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return mv;
		}
	}
}
