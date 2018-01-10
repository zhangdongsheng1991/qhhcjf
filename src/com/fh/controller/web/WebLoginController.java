package com.fh.controller.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.UserLog;
import com.fh.entity.system.UserLoginLog;
import com.fh.entity.system.UserManageMent;
import com.fh.service.system.menu.MenuService;
import com.fh.service.system.role.RoleService;
import com.fh.service.system.usermanagement.UserManageMentService;
import com.fh.service.system.usermanagement.usermanagement.userlog.UserLoginLogService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import com.fh.util.Tools;


@Controller
@RequestMapping(value="/web")
public class WebLoginController extends BaseController{
	public static Map map = new HashMap(); //存储临时ID
	@Resource(name="usermanagementService")
	private UserManageMentService usermanagementService;
	@Resource(name="menuService")
	private MenuService menuService;
	@Resource(name="roleService")
	private RoleService roleService;
	@Resource(name="userloginlogService")
	private UserLoginLogService userloginlogService;
	
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/login")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		String referer = getRequest().getHeader("REFERER");
		mv.addObject("referer", referer);
		mv.setViewName("web/login/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 请求登录，验证用户
	 */
	@RequestMapping(value="/web_login" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login()throws Exception{
		Map map = new HashMap();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").replaceAll("qq313596790fh", "").replaceAll("QQ978336446fh", "").split(",fh,");
		
		if(null != KEYDATA && KEYDATA.length == 2){
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			String PHONE = KEYDATA[0];
			String PASSWORD  = KEYDATA[1];
			pd.put("PHONE", PHONE);
			String passwd = new SimpleHash("SHA-1", PHONE, PASSWORD).toString();	//密码加密
			pd.put("PASSWORD", passwd);
			pd = usermanagementService.getUserByNameAndPwd(pd);
			if(pd != null){
				pd.put("LAST_LOGIN",DateUtil.getTime().toString());
				usermanagementService.updateLastLoginAndLoginCount(pd);
				UserManageMent user = new UserManageMent();
				user.setId(pd.getString("ID"));
				user.setU_phone(pd.getString("U_PHONE"));
				user.setU_pwd(pd.getString("U_PWD"));
				user.setU_email(pd.getString("U_EMAIL"));
				user.setU_name(pd.getString("U_NAME"));
				user.setLast_login(pd.getString("LAST_LOGIN"));
				user.setIp(pd.getString("IP"));
				session.setAttribute(Const.SESSION_WEBUSER, user);
				session.setAttribute(Const.SESSION_CURRENTPHONE, user.getU_phone());
				session.removeAttribute(Const.SESSIONWEB_SECURITY_CODE);
				
				//添加用户登录日志
				Integer loginCount = usermanagementService.getLoginCount(pd.getString("U_PHONE"));
				UserLoginLog userloginlog = new UserLoginLog();
				userloginlog.setLogintime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(pd.getString("LAST_LOGIN")));
				userloginlog.setLogincount(loginCount);
				userloginlog.setId(get32UUID());
				userloginlog.setU_phone(pd.getString("U_PHONE"));
				userloginlog.setLoginout(null);
				userloginlogService.addUserLoginLog(userloginlog);
				session.setAttribute(Const.SESSIONWEB_USERLOGINLOG, userloginlog);
				//shiro加入身份验证
				Subject subject = SecurityUtils.getSubject(); 
			    UsernamePasswordToken token = new UsernamePasswordToken(PHONE, PASSWORD); 
			    try { 
			        subject.login(token); 
			    } catch (AuthenticationException e) { 
			    	errInfo = "身份验证失败！";
			    }
			    
			}else{
				errInfo = "usererror"; 				//用户名或密码有误
			}
		
			if(Tools.isEmpty(errInfo)){
				errInfo = "success";					//验证成功
			}
			
		}else{
			errInfo = "error";	//缺少参数
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/*
	 * 1,忘记密码
	 */
	@RequestMapping("/findpwd/index")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("web/login/findpwd");
		return mv;
	}
	/*
	 * 2,findpwd
	 */
	@RequestMapping("/findpwd/findpwd")
	public ModelAndView findpwd(String k){
		ModelAndView mv = new ModelAndView();
		try {
			
			if(map.get(k)!=null&&!"".equals(map.get(k))){ //若map临时ID有对应手机号，进入方法
				usermanagementService.updateTempId(k,(String)map.get(k));//修改数据库中手机为(String)map.get(k)的临时id
				//增加倒计时，若超过指定时间，修改临时ID为1
				ForgetPwdThread fpt = new ForgetPwdThread("findpwd","1",k,(String)map.get(k),usermanagementService);
				Thread t=new Thread(fpt);
				System.out.println("++++++++++++++++++++++++++++++++=========="+t.isAlive());
				t.start();
				map.put(k, ""); //解除绑定，将value设为“”，用户刷新或第二次访问该地址不会重新操作数据库，直接进入findpwd2
				mv.addObject("k",k); 
				mv.setViewName("web/login/findpwd2");
				return mv;
			}else if(map.get(k)==null){ //若超时未操作，进入首页
				 return new ModelAndView("redirect:/web/findpwd/index");
			}else{   
				mv.addObject("k",k);
				mv.setViewName("web/login/findpwd2");
				return mv;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:/web/findpwd/index");
		}
	}
	/*
	 * 3,resetPassword
	 */
	@RequestMapping("/findpwd/resetPassword")
	public ModelAndView resetPassword(String key){
		ModelAndView mv = new ModelAndView();
		try {
			if(map.get(key)!=null&&!"".equals(map.get(key))){
				usermanagementService.updateTempId2(key,(String)map.get(key));
				ForgetPwdThread fpt = new ForgetPwdThread("resetPassword","1",key,(String)map.get(key),usermanagementService);
				Thread t=new Thread(fpt);  
				
				t.start();
				map.put(key, "");
				mv.addObject("key",key);
				mv.setViewName("web/login/findpwd3");
				return mv;
			}else if(map.get(key)==null){
				 return new ModelAndView("redirect:/web/findpwd/index");
			}else{
				mv.addObject("key",key);
				mv.setViewName("web/login/findpwd3");
				return mv;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:/web/findpwd/index");
		}
	}
	
	/*
	 * 4,success
	 */
	@RequestMapping("/findpwd/success")
	public ModelAndView success(){
		PageData pd = this.getPageData();
		ModelAndView mv = new ModelAndView();
		try {
			UserManageMent user = (UserManageMent) usermanagementService.getTempId2((String)pd.get("key"));
			if(user!=null){
				String pwd = new SimpleHash("SHA-1",user.getU_phone(),pd.get("u_pwd")).toString();
				pd.put("u_pwd", pwd);
				pd.put("u_phone", user.getU_phone());
				usermanagementService.updatePwd(pd);
				mv.setViewName("web/login/findpwd4");
				return mv;
			}else{
				return new ModelAndView("redirect:/web/findpwd/index");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ModelAndView("redirect:/web/findpwd/index");
		}
		
	}
	
	/**
	 * 检查findpwd验证码是否正确
	 * @param webcode
	 * @param phone
	 * @return
	 */
	@RequestMapping("/checkwebcode")
	@ResponseBody
	public Object checkwebcode(String webcode,String phone){
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
	
		String sessioncode =  (String)session.getAttribute(Const.SESSIONWEB_SECURITY_CODE);
		
		if(Tools.notEmpty(sessioncode)&&webcode.equalsIgnoreCase(sessioncode)){
			
			//验证码正确，生成临时ID，并传入findpwd页
			String temp_id = this.get32UUID(); 
			//将临时ID和手机号绑定
			map.put(temp_id, phone);
			return temp_id;
		}else{
			return "";
		}
	}
	
	@RequestMapping("/checkphonecode")
	@ResponseBody
	public Object checkphonecode(String phonecode,String temp_id2,String k){
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
	
		String sessionphonecode =  (String)session.getAttribute(temp_id2);
		if(map.get(k)!=null){
			if(Tools.notEmpty(sessionphonecode)&&sessionphonecode.equalsIgnoreCase(phonecode)){
				return temp_id2;
			}else{
				return "err";
			}
		}else{
			return "";
		}
	}
	
	
	/**
	 * 访问系统首页
	 */
//	@RequestMapping(value="/main/{changeMenu}")
//	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu){
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		try{
//			
//			//shiro管理的session
//			Subject currentUser = SecurityUtils.getSubject();  
//			Session session = currentUser.getSession();
//			
//			User user = (User)session.getAttribute(Const.SESSION_USER);
//			if (user != null) {
//				
//				User userr = (User)session.getAttribute(Const.SESSION_USERROL);
//				if(null == userr){
//					user = userService.getUserAndRoleById(user.getUSER_ID());
//					session.setAttribute(Const.SESSION_USERROL, user);
//				}else{
//					user = userr;
//				}
//				Role role = user.getRole();
//				String roleRights = role!=null ? role.getRIGHTS() : "";
//				//避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
//				session.setAttribute(Const.SESSION_ROLE_RIGHTS, roleRights); 		//将角色权限存入session
//				session.setAttribute(Const.SESSION_USERNAME, user.getUSERNAME());	//放入用户名
//				
//				List<Menu> allmenuList = new ArrayList<Menu>();
//				
//				if(null == session.getAttribute(Const.SESSION_allmenuList)){
//					allmenuList = menuService.listAllMenu();
//					if(Tools.notEmpty(roleRights)){
//						for(Menu menu : allmenuList){
//							menu.setHasMenu(RightsHelper.testRights(roleRights, menu.getMENU_ID()));
//							if(menu.isHasMenu()){
//								List<Menu> subMenuList = menu.getSubMenu();
//								for(Menu sub : subMenuList){
//									sub.setHasMenu(RightsHelper.testRights(roleRights, sub.getMENU_ID()));
//								}
//							}
//						}
//					}
//					session.setAttribute(Const.SESSION_allmenuList, allmenuList);			//菜单权限放入session中
//				}else{
//					allmenuList = (List<Menu>)session.getAttribute(Const.SESSION_allmenuList);
//				}
//				
//				//切换菜单=====
//				List<Menu> menuList = new ArrayList<Menu>();
//				//if(null == session.getAttribute(Const.SESSION_menuList) || ("yes".equals(pd.getString("changeMenu")))){
//				if(null == session.getAttribute(Const.SESSION_menuList) || ("yes".equals(changeMenu))){
//					List<Menu> menuList1 = new ArrayList<Menu>();
//					List<Menu> menuList2 = new ArrayList<Menu>();
//					
//					//拆分菜单
//					for(int i=0;i<allmenuList.size();i++){
//						Menu menu = allmenuList.get(i);
//						if("1".equals(menu.getMENU_TYPE())){
//							menuList1.add(menu);
//						}else{
//							menuList2.add(menu);
//						}
//					}
//					
//					session.removeAttribute(Const.SESSION_menuList);
//					if("2".equals(session.getAttribute("changeMenu"))){
//						session.setAttribute(Const.SESSION_menuList, menuList1);
//						session.removeAttribute("changeMenu");
//						session.setAttribute("changeMenu", "1");
//						menuList = menuList1;
//					}else{
//						session.setAttribute(Const.SESSION_menuList, menuList2);
//						session.removeAttribute("changeMenu");
//						session.setAttribute("changeMenu", "2");
//						menuList = menuList2;
//					}
//				}else{
//					menuList = (List<Menu>)session.getAttribute(Const.SESSION_menuList);
//				}
//				//切换菜单=====
//				
//				if(null == session.getAttribute(Const.SESSION_QX)){
//					session.setAttribute(Const.SESSION_QX, this.getUQX(session));	//按钮权限放到session中
//				}
//				
//				//FusionCharts 报表
//			 	String strXML = "<graph caption='前12个月订单销量柱状图' xAxisName='月份' yAxisName='值' decimalPrecision='0' formatNumberScale='0'><set name='2013-05' value='4' color='AFD8F8'/><set name='2013-04' value='0' color='AFD8F8'/><set name='2013-03' value='0' color='AFD8F8'/><set name='2013-02' value='0' color='AFD8F8'/><set name='2013-01' value='0' color='AFD8F8'/><set name='2012-01' value='0' color='AFD8F8'/><set name='2012-11' value='0' color='AFD8F8'/><set name='2012-10' value='0' color='AFD8F8'/><set name='2012-09' value='0' color='AFD8F8'/><set name='2012-08' value='0' color='AFD8F8'/><set name='2012-07' value='0' color='AFD8F8'/><set name='2012-06' value='0' color='AFD8F8'/></graph>" ;
//			 	mv.addObject("strXML", strXML);
//			 	//FusionCharts 报表
//			 	
//			 	//读取websocket配置
//			 	String strWEBSOCKET = Tools.readTxtFile(Const.WEBSOCKET);//读取WEBSOCKET配置
//			 	if(null != strWEBSOCKET && !"".equals(strWEBSOCKET)){
//					String strIW[] = strWEBSOCKET.split(",fh,");
//					if(strIW.length == 4){
//						pd.put("WIMIP", strIW[0]);
//						pd.put("WIMPORT", strIW[1]);
//						pd.put("OLIP", strIW[2]);
//						pd.put("OLPORT", strIW[3]);
//					}
//				}
//			 	//读取websocket配置
//			 	
//				mv.setViewName("system/admin/index");
//				mv.addObject("user", user);
//				mv.addObject("menuList", menuList);
//			}else {
//				mv.setViewName("system/admin/login");//session失效后跳转登录页面
//			}
//			
//			
//		} catch(Exception e){
//			mv.setViewName("system/admin/login");
//			logger.error(e.getMessage(), e);
//		}
//		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
//		mv.addObject("pd",pd);
//		return mv;
//	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/admin/tab";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 */
	@RequestMapping(value="/login_default")
	public String defaultPage(){
		return "system/admin/default";
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		String referer = getRequest().getHeader("REFERER");
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		
		session.removeAttribute(Const.SESSION_WEBUSER);
		session.removeAttribute(Const.SESSION_CURRENTPHONE);
		session.removeAttribute(Const.SESSIONWEB_SECURITY_CODE);
//		session.removeAttribute(Const.SESSION_allmenuList);
//		session.removeAttribute(Const.SESSION_menuList);
//		session.removeAttribute(Const.SESSION_QX);
//		session.removeAttribute(Const.SESSION_userpds);
//		session.removeAttribute(Const.SESSION_USERNAME);
//		session.removeAttribute(Const.SESSION_USERROL);
		//session.removeAttribute("changeMenu");
		
		//shiro销毁登录
		Subject subject = SecurityUtils.getSubject(); 
		subject.logout();
		
		pd = this.getPageData();
		String  msg = pd.getString("msg");
		pd.put("msg", msg);
		
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("redirect:"+referer);
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 获取用户权限
	 */
//	public Map<String, String> getUQX(Session session){
//		PageData pd = new PageData();
//		Map<String, String> map = new HashMap<String, String>();
//		try {
//			String USERNAME = session.getAttribute(Const.SESSION_USERNAME).toString();
//			pd.put(Const.SESSION_USERNAME, USERNAME);
//			String ROLE_ID = userService.findByUId(pd).get("ROLE_ID").toString();
//			
//			pd.put("ROLE_ID", ROLE_ID);
//			
//			PageData pd2 = new PageData();
//			pd2.put(Const.SESSION_USERNAME, USERNAME);
//			pd2.put("ROLE_ID", ROLE_ID);
//			
//			pd = roleService.findObjectById(pd);																
//				
//			pd2 = roleService.findGLbyrid(pd2);
//			if(null != pd2){
//				map.put("FX_QX", pd2.get("FX_QX").toString());
//				map.put("FW_QX", pd2.get("FW_QX").toString());
//				map.put("QX1", pd2.get("QX1").toString());
//				map.put("QX2", pd2.get("QX2").toString());
//				map.put("QX3", pd2.get("QX3").toString());
//				map.put("QX4", pd2.get("QX4").toString());
//			
//				pd2.put("ROLE_ID", ROLE_ID);
//				pd2 = roleService.findYHbyrid(pd2);
//				map.put("C1", pd2.get("C1").toString());
//				map.put("C2", pd2.get("C2").toString());
//				map.put("C3", pd2.get("C3").toString());
//				map.put("C4", pd2.get("C4").toString());
//				map.put("Q1", pd2.get("Q1").toString());
//				map.put("Q2", pd2.get("Q2").toString());
//				map.put("Q3", pd2.get("Q3").toString());
//				map.put("Q4", pd2.get("Q4").toString());
//			}
//			
//			map.put("adds", pd.getString("ADD_QX"));
//			map.put("dels", pd.getString("DEL_QX"));
//			map.put("edits", pd.getString("EDIT_QX"));
//			map.put("chas", pd.getString("CHA_QX"));
//			
//			//System.out.println(map);
//			
//			this.getRemortIP(USERNAME);
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		}	
//		return map;
//	}
	//手机验证码
	@RequestMapping(value="/generate")
	@ResponseBody
	public Object generate(String k){
		try {
			String phone = (String)usermanagementService.getPhoneByTempId(k);
			if(map.get(k)==null||phone==null||"".equals(phone)){
				return "";
			}else{
				UserManageMent user = usermanagementService.findUserByPhone(phone);
				long now = System.currentTimeMillis();
				
				if(user.getFindpwdcounts()!=0){
					String findpwdtime1str = user.getFindpwdtime1();
					Date findpwdtime1 = new SimpleDateFormat("yyyy-MM-dd").parse(findpwdtime1str);
					long findpwdtime1long = findpwdtime1.getTime();
					long differ = now-findpwdtime1long;
					long oneday = 24*60*60*1000;
					if(differ>oneday){
						usermanagementService.initFindpwd(phone);
					}else{
						if(user.getFindpwdcounts()<3){
							usermanagementService.updateFindPwdCounts(phone);
						}else{
							return "false";
						}
					}
				}
				
				String temp_id2 = this.get32UUID();
				map.put(temp_id2, phone);
				//生成随机数
				Random r = new Random();
				int i = r.nextInt();
				System.out.println("++++++++++++++++++++++++++++++++++++++++++++++"+i);
				//把生成的数发送给 k，并将生成的数存入session
				Subject s = SecurityUtils.getSubject();
				Session session = s.getSession();
				session.setAttribute(temp_id2, String.valueOf(i));
				
				//发送  send(phone,i);
				//TODO
				return temp_id2+"_"+i;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return true;
	}
}
