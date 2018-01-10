package com.fh.controller.web;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.MessageManagement;
import com.fh.entity.system.Reading;
import com.fh.entity.system.UserManageMent;
import com.fh.service.system.activityapply.AppActivityApplyService;
import com.fh.service.system.collection.CollectionService;
import com.fh.service.system.financialplanner.AppFinancialplannerService;
import com.fh.service.system.financialplannerappointment.AppFinancialplannerappointmentService;
import com.fh.service.system.institution.AppInstitutionService;
import com.fh.service.system.leavemsg.AppLeavemsgService;
import com.fh.service.system.news.AppNewsService;
import com.fh.service.system.privateequity.AppPrivateEquityService;
import com.fh.service.system.product.AppProductService;
import com.fh.service.system.product.AppProductStableService;
import com.fh.service.system.productappointment.AppProductAppointmentService;
import com.fh.service.system.questions_answers.Questions_AnswersService;
import com.fh.service.system.setincrease.AppSetincreaseService;
import com.fh.service.system.usermanagement.MessageManagementService;
import com.fh.service.system.usermanagement.UserManageMentService;
import com.fh.service.system.userreferer.UserRefererService;
import com.fh.util.Const;
import com.fh.util.FyUtil;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;

/** 
 * 类名称：ConditionController
 * 创建人：FH 
 * 创建时间：2017-03-17
 */
@Controller
@RequestMapping(value="/web")
public class WebController extends BaseController {
	@Resource(name="messagemanagementservice")
	private MessageManagementService messagemanagementservice;
	@Resource(name="leavemsgService")
	private AppLeavemsgService leavemsgService;
	@Resource(name="usermanagementService")
	private UserManageMentService usermanagementService;
    @Resource(name="questions_answersService")
    private Questions_AnswersService questions_answersService;
	@Resource(name="productService")
	private AppProductService appproductService;
	@Resource(name="financialplannerService")
	private AppFinancialplannerService financialplannerService;
	@Resource(name="PrivateEquityService")
	private AppPrivateEquityService finAppPrivateEquityService;
	@Resource(name="setincreaseService")
	private AppSetincreaseService appSetincreaseService;
	@Resource(name="productAppointmentService")
	private AppProductAppointmentService productAppointmentService;
	@Resource(name="financialplannerappointmentService")
	private AppFinancialplannerappointmentService financialplannerappointmentService;
	@Resource(name="newsService")
	private AppNewsService newsService;
	@Resource(name="activityapplyService")
	private AppActivityApplyService activityapplyService;
	@Resource(name="userrefererService")
	private UserRefererService userrefererService;
	@Resource(name="fyutil")
	private FyUtil fyutil;
	@Resource(name="collectionService")
	private CollectionService collectionService;
	//浮动产品
	@Resource(name="productStableService")
	private AppProductStableService appProductStableService;
	@Resource(name="institutionService")
	private AppInstitutionService institutionService;
	/** 跳转到微信授权地址 *//*
	@RequestMapping
	public String login(){
		return "redirect:"+"/web/index";
	}*/
	
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/admin/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 选择进入网站类型
	 */
	@RequestMapping("/guidancePage")
	public ModelAndView guidancePage()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("web/guidancePage");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 去校验浏览器类型页面
	 */
	//@RequestMapping(value="/auth")
	/*public ModelAndView auth(){
		logBefore(logger, "去新auth页面");
		ModelAndView mv = this.getModelAndView();
		try {
			mv.setViewName("web/auth");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}*/
	
	
	/**
	 * 去app页面
	 */
	@RequestMapping(value="/appindex")
	public ModelAndView appindex(Page page){
		logBefore(logger, "去app页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> newProduct=appproductService.appIndexlistNewProduct(page,pd);
			List newslist = newsService.applistPage(page);
			//热推产品
			pd.put("WEBTYPE", "1");
			mv.addObject("newProduct",newProduct);
			mv.addObject("newslist",newslist);
			mv.addObject("pd",pd);
			mv.setViewName("web/app/index");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	@RequestMapping("/gosearch")
	public ModelAndView gosearch(){
		logBefore(logger, "去查询页面");
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("web/app/search");
		return mv;
	}
	@RequestMapping("/search")
	@ResponseBody
	public Object search(Page page){
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> list=null;
		try {
			page.setPd(pd);
			list = appproductService.appfindProductsListBySearchName(page,pd);
			System.out.println(list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 去新index页面
	 */
	@RequestMapping(value="/index")
	public ModelAndView getNewProductList(Page page){
		logBefore(logger, "去新index页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> newProduct=appproductService.getNewProductList(page,pd);
			//热推产品
			mv.addObject("newProduct",newProduct);
			PageData product = new PageData();
			product.put("TYPE",1);
			List<PageData>list1=appproductService.applistTrustLeft(product);
			product.put("TYPE",2);
			List<PageData>list2=appproductService.applistTrustLeft(product);
			product.put("TYPE",3);
			List<PageData>list3=appproductService.applistTrustLeft(product);
			mv.addObject("list1",list1);
			mv.addObject("list2",list2);
			mv.addObject("list3",list3);
			/**统计总条数**/
			int number = appproductService.countNumber(null);
			pd.put("productNumber", number);
			List<PageData>pushListTop=appproductService.applistPushTop(page);
			//热门推荐上
			mv.addObject("pushListTop",pushListTop);
			product.put("TYPE",1);
			List<PageData> list4 =appProductStableService.appFloatlistLeft(product);
			product.put("TYPE",2);
			List<PageData> list5 =appProductStableService.appFloatlistLeft(product);
			product.put("TYPE",3);
			List<PageData> list6 =appProductStableService.appFloatlistLeft(product);
			mv.addObject("list4",list4);
			mv.addObject("list5",list5);
			mv.addObject("list6",list6);
			/**统计总条数**/
			number = appProductStableService.countNumber(null);
			pd.put("productStableNumber", number);
			List<PageData>chooseList = financialplannerService.applistChoose(pd);
			//推荐理财师s
			mv.addObject("chooseList",chooseList);
//			List<PageData>pushLisBelowt=appproductService.applistPushBelow(page);
//			List<PageData>floatRight=appProductStableService.appFloatlistRight(page);
			
//			List<PageData>floatLeft=appProductStableService.appFloatlistLeft(pd);
			PageData newPageData = new PageData();
			newPageData.put("TYPES", 5);
			List newlist1 = this.questions_answersService.list(page);
		    mv.addObject("newlist1", newlist1);
			newPageData = new PageData();
			
			HttpServletRequest request = getRequest();
			
			HttpSession session = request.getSession();
			String ip = (String) session.getAttribute("ip");
			String channelurl = (String) session.getAttribute("channelurl");
			Integer _port = (Integer) session.getAttribute("_port");
			String sign = request.getParameter("sign");
			if(sign!=null){
				sign = sign.substring(0, 2);	
				if("bd".equals(sign)){
					session.setAttribute("CHANNEL", "百度");
				}else if("sg".equals(sign)){
					session.setAttribute("CHANNEL", "搜狗");
				}else if("36".equals(sign)){
					session.setAttribute("CHANNEL", "360");
				}else if("sm".equals(sign)){
					session.setAttribute("CHANNEL", "神马");
				}
			}
			if(ip==null){
				ip = request.getRemoteAddr();
				session.setAttribute("ip",ip);
			}
			if(_port==null){
				_port = request.getRemotePort();
				session.setAttribute("_port",_port);
			}
			if(channelurl==null){
				//channelurl = request.getHeader("REFERER");
				Enumeration enu=request.getParameterNames();  
				String parm = "?";
				while(enu.hasMoreElements()){  
					String parmName=(String)enu.nextElement();  
					String parmVal = request.getParameter(parmName);  
					parm += parmName+"="+parmVal+"&";
				}
				parm = parm.substring(0, parm.length()-1);
				channelurl = request.getRequestURI()+parm;
				session.setAttribute("channelurl",channelurl);
			}
			pd.put("USER_ADDR", ip);
			pd.put("USER_REFERER", channelurl);
			//userrefererService.save(pd);
//			UserManageMent user = (UserManageMent) session.getAttribute(Const.SESSION_WEBUSER);
//			if(null!=user){
//				List list = usermanagementService.findMessageByPhone(user.getU_phone());
//				if(list!=null&&!list.isEmpty()){
//					pd.put("messagecount", list.size());
//					mv.addObject("listmessages",list);
//				}
//			}
			newPageData.put("TYPE", 5);
			List<PageData> newlist2 = newsService.getNewsIndexList(newPageData);
			mv.addObject("newlist2",newlist2);
			//热门推荐下
//			mv.addObject("pushLisBelowt",pushLisBelowt);
			//浮动收益右
//			mv.addObject("floatRight",floatRight);
			//浮动收益左
//			mv.addObject("floatLeft",floatLeft);
			mv.setViewName("web/indexs");
			mv.addObject("msg","getWorkList");
			mv.addObject("pd", pd);
			/*for(PageData ps : newProduct){
				System.out.println(ps.getString("PRODUCTREFERRED"));
			}*/
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 修改上下页
	 */
	@RequestMapping(value="/editSX1")
	@ResponseBody
	public Object editSX1(){
		try {
			PageData pd = new PageData();
			pd.put("TYPE", "1");
			List<PageData> list = newsService.getTypeListAll(pd);
			for (int i = 0; i < list.size(); i++) {
				PageData pd1 = list.get(i);
				if(i==0){
					if(list.size()!=1){
							PageData pd2 = list.get(i+1);
							pd1.put("XID", pd2.getString("ID"));
							pd2.put("SID", pd1.get("ID"));
							newsService.edit(pd1);
							newsService.edit(pd2);
					}
				}else{
					if(list.size()-1 != i){
						PageData pd2 = list.get(i+1);
						pd1.put("XID", pd2.getString("ID"));
						pd2.put("SID", pd1.get("ID"));
						newsService.edit(pd1);
						newsService.edit(pd2);
					}
				}
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return"";
	}
	
	
	/**
	 * 去新信托页面
	 */
	@RequestMapping(value="/trust")
	public ModelAndView trustList(Page page){
		logBefore(logger, "去新trust页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("TYPE",1);
			pd.put("WEBTYPE", "2");
			page.setPd(pd);
			page.setState(2);
			List<PageData> list=appproductService.applistPage(page);
			//收藏的产品
			String phone = (String) getSession().getAttribute(Const.SESSION_CURRENTPHONE);
			if(null!=phone&&!"".equals(phone)){
				pd.put("phone", phone);
				
				List<PageData> collectionlist = collectionService.listByPhone(pd);
				String collectionProductIds = "";
				for(int i=0;i<collectionlist.size();i++){
					collectionProductIds += collectionlist.get(i).get("COLLECTION_PRODUCTID")+",";
				}
				mv.addObject("collectionProductIds",collectionProductIds);
			}
			mv.addObject("list",list);
			mv.setViewName("web/trust_list");
			mv.addObject("msg","getTrustList");
			System.out.println(page.getPageStr());
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 获取信托列表
	 */
	@RequestMapping(value="/getTrustList")
	@ResponseBody
	public Object getTrustList(Page page){
		logBefore(logger, "获取信托列表");
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		page.setState(2);
		try {
			
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			List<PageData> list=appproductService.applistPage(page);
			map.put("list",list);
			map.put("pd", pd);
			map.put("page", page);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	
	/**
	 * 去固定收益详情页面
	 */
	@RequestMapping(value="/trustDetails")
	public ModelAndView getTrustDetails(){
		logBefore(logger, "去新trust页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData>chooseList = financialplannerService.appDetailsChoose(pd);
			List<PageData>solidPush = appproductService.appSolidPush(pd);
			pd= appproductService.applistById(pd);
			//推荐理财师
			mv.addObject("chooseList",chooseList);
			//固定收益产品推荐
			mv.addObject("solidPush",solidPush);
			mv.addObject("trustDetails",pd);
			mv.setViewName("web/trust_details");
			mv.addObject("msg","getTrustList");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	
	
	/**
	 * 去资管页面
	 */
//	@RequestMapping(value="/mislist")
//	public ModelAndView getMISlist(Page page){
//		logBefore(logger, "去新MIS页面");
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		try {
//			List<PageData> MISList=appproductService.appMISList(page);
//			mv.addObject("MISList",MISList);
//			mv.setViewName("web/MIS_list");
//			mv.addObject("msg","getMISlist");
//			mv.addObject("pd", pd);
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		}						
//		return mv;
//	}
	
	/**
	 * 去资管页面
	 */
	@RequestMapping(value="/mislist")
	public ModelAndView mislist(Page page){
		logBefore(logger, "去资管页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("TYPE",2);
			pd.put("WEBTYPE", "3");
			page.setPd(pd);
			page.setState(2);
			List<PageData> list=appproductService.applistPage(page);
			//收藏的产品
			String phone = (String) getSession().getAttribute(Const.SESSION_CURRENTPHONE);
			if(null!=phone&&!"".equals(phone)){
				pd.put("phone", phone);
				
				List<PageData> collectionlist = collectionService.listByPhone(pd);
				String collectionProductIds = "";
				for(int i=0;i<collectionlist.size();i++){
					collectionProductIds += collectionlist.get(i).get("COLLECTION_PRODUCTID")+",";
				}
				mv.addObject("collectionProductIds",collectionProductIds);
			}
			mv.addObject("list",list);
			mv.setViewName("web/MIS_list");
			mv.addObject("msg","getTrustList");
			System.out.println(page.getPageStr());
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 获取资管列表
	 */
	@RequestMapping(value="/getMisList")
	@ResponseBody
	public Object getMisList(Page page){
		logBefore(logger, "获取资管列表");
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			page.setState(2);
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			List<PageData> list=appproductService.applistPage(page);
			map.put("list",list);
			map.put("pd", pd);
			map.put("page", page);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	
	
	/**
	 * 去新契约页面
	 */
	/*@RequestMapping(value="/covenant")
	public ModelAndView getCovenantList(Page page){
		logBefore(logger, "去新covenant页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> covenantList=appproductService.appCovenantList(page);
			mv.addObject("covenantList",covenantList);
			mv.setViewName("web/covenant_list");
			mv.addObject("msg","getCovenantList");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}*/
	
	/**
	 * 去契约页面
	 */
	@RequestMapping(value="/covenant")
	public ModelAndView covenant(Page page){
		logBefore(logger, "去契约页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("TYPE",3);
			pd.put("WEBTYPE", "4");
			page.setPd(pd);
			page.setState(2);
			List<PageData> list=appproductService.applistPage(page);
			
			//收藏的产品
			String phone = (String) getSession().getAttribute(Const.SESSION_CURRENTPHONE);
			if(null!=phone&&!"".equals(phone)){
				pd.put("phone", phone);
				
				List<PageData> collectionlist = collectionService.listByPhone(pd);
				String collectionProductIds = "";
				for(int i=0;i<collectionlist.size();i++){
					collectionProductIds += collectionlist.get(i).get("COLLECTION_PRODUCTID")+",";
				}
				mv.addObject("collectionProductIds",collectionProductIds);
			}
			
			mv.addObject("list",list);
			mv.setViewName("web/covenant_list");
			mv.addObject("msg","getTrustList");
			System.out.println(page.getPageStr());
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 获取契约列表
	 */
	@RequestMapping(value="/getCovenantList")
	@ResponseBody
	public Object getCovenantList(Page page){
		logBefore(logger, "获取契约列表");
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			page.setState(2);
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			List<PageData> list=appproductService.applistPage(page);
			map.put("list",list);
			map.put("pd", pd);
			map.put("page", page);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	
	/**
	 * 去浮动详情页面
	 */
	@RequestMapping(value="/folatDetails")
	public ModelAndView getfolatDetails(){
		logBefore(logger, "去新folat页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData>chooseList = financialplannerService.appDetailsChoose(pd);
			List<PageData>floatPush = appProductStableService.appFloatPush(pd);
			pd= appProductStableService.applistById(pd);
			//推荐理财师
			mv.addObject("chooseList",chooseList);
			//推荐产品
			mv.addObject("floatPush",floatPush);
			mv.addObject("folatDetails",pd);
			mv.setViewName("web/setincrease");
			mv.addObject("msg","getSetincrease");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 去新私募页面
	 */
	/*@RequestMapping(value="/privateEquitylist")
	public ModelAndView getPrivateEquityList(Page page){
		logBefore(logger, "去新privateEquity页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> privateEquitylist=appProductStableService.appPrivateList(page);
			mv.addObject("privateEquitylist",privateEquitylist);
			mv.setViewName("web/private_equity_list");
			mv.addObject("msg","getPrivateEquityList");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}*/
	
	/**
	 * 去私募页面
	 */
	@RequestMapping(value="/privateEquitylist")
	public ModelAndView privateEquitylist(Page page){
		logBefore(logger, "去私募页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("TYPE",1);
			pd.put("WEBTYPE", "5");
			page.setPd(pd);
			page.setState(2);
			List<PageData> list=appProductStableService.applistPage(page);
			PageData news = new PageData();
			news.put("TYPE", 1);
			List<PageData> newsList = newsService.getList(news);
			mv.addObject("list",list);
			mv.addObject("newsList",newsList);
			mv.setViewName("web/private_equity_list");
			mv.addObject("msg","getTrustList");
			System.out.println(page.getPageStr());
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 获取私募列表
	 */
	@RequestMapping(value="/getPrivateEquityList")
	@ResponseBody
	public Object getPrivateEquityList(Page page){
		logBefore(logger, "获取私募列表");
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			page.setState(2);
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			List<PageData> list=appProductStableService.applistPage(page);
			map.put("list",list);
			map.put("pd", pd);
			map.put("page", page);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	
	/**
	 * 去新定增页面
	 */
	/*@RequestMapping(value="/setincreaseList")
	public ModelAndView getSetincreaseList(Page page){
		logBefore(logger, "去新setincrease_list页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> setincreaseList=appProductStableService.appSetincreaseList(page);
			mv.addObject("setincreaseList",setincreaseList);
			mv.setViewName("web/setincrease_list");
			mv.addObject("msg","getSetincreaseList");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}*/
	
	
	/**
	 * 去定增页面
	 */
	@RequestMapping(value="/setincreaseList")
	public ModelAndView setincreaseList(Page page){
		logBefore(logger, "去定增页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("TYPE",2);
			pd.put("WEBTYPE", "6");
			page.setPd(pd);
			page.setState(2);
			List<PageData> list=appProductStableService.applistPage(page);
			PageData news = new PageData();
			news.put("TYPE", 1);
			List<PageData> newsList = newsService.getList(news);
			mv.addObject("list",list);
			mv.addObject("newsList",newsList);
			mv.setViewName("web/setincrease_list");
			mv.addObject("msg","getTrustList");
			System.out.println(page.getPageStr());
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 获取定增列表
	 */
	@RequestMapping(value="/getSetincreaseList")
	@ResponseBody
	public Object getSetincreaseList(Page page){
		logBefore(logger, "获取定增列表");
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			page.setState(2);
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			List<PageData> list=appProductStableService.applistPage(page);
			map.put("list",list);
			map.put("pd", pd);
			map.put("page", page);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	@RequestMapping(value="/minusreading")
	@ResponseBody
	public Object minusreading(){
		Map m = new HashMap();
		PageData pd = this.getPageData();
		pd.put("READINGDATE", Tools.date2Str(new Date()));
		try {
			messagemanagementservice.minusReading(pd);
			m.put("msg", "ok");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			m.put("msg", "err");
		}
		return m;
	}
	/**
	 * 去对冲页面
	 */
	/*@RequestMapping(value="/offsetList")
	public ModelAndView getOffsetList(Page page){
		logBefore(logger, "去新offset_list页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> offsetList=appProductStableService.appOffsetList(page);
			mv.addObject("offsetList",offsetList);
			mv.setViewName("web/offset_list");
			mv.addObject("msg","getOffsetList");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}*/
	
	/**
	 * 去对冲页面
	 */
	@RequestMapping(value="/offsetList")
	public ModelAndView offsetList(Page page){
		logBefore(logger, "去对冲页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("TYPE",3);
			pd.put("WEBTYPE", "7");
			page.setPd(pd);
			page.setState(2);
			List<PageData> list=appProductStableService.applistPage(page);
			PageData news = new PageData();
			news.put("TYPE", 1);
			List<PageData> newsList = newsService.getList(news);
			mv.addObject("list",list);
			mv.addObject("newsList",newsList);
			mv.setViewName("web/offset_list");
			mv.addObject("msg","getTrustList");
			System.out.println(page.getPageStr());
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 获取对冲列表
	 */
	@RequestMapping(value="/getOffsetList")
	@ResponseBody
	public Object getOffsetList(Page page){
		logBefore(logger, "获取对冲列表");
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			page.setState(2);
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			List<PageData> list=appProductStableService.applistPage(page);
			map.put("list",list);
			map.put("pd", pd);
			map.put("page", page);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	
	/**
	 * 去热推产品页面
	 */
	@RequestMapping(value="/hotList")
	public ModelAndView hotList(Page page){
		logBefore(logger, "去新offset_list页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
		/*	List<PageData> hotList=appProductStableService.appHotList(page);
			mv.addObject("hotList",hotList);*/
			pd.put("TYPE",1);
			page.setPd(pd);
			page.setState(2);
			List<PageData> list=appproductService.applistPage(page);
			mv.addObject("list",list);
			mv.setViewName("web/hot_list");
			mv.addObject("msg","getHotList");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 去搜索页面
	 */
	@RequestMapping(value="/searchList")
	public ModelAndView searchList(Page page){
		logBefore(logger, "搜索");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("TYPE", pd.getString("HTYPE"));
			List<PageData> list = new ArrayList<>();
			switch (pd.getString("PRODUCTTYPES")) {
			case "1":
				page.setPd(pd);
				page.setState(2);
				list=appproductService.countSearchlistPage(page);
				switch (pd.getString("HTYPE")) {
					case "1":
						mv.addObject("TYPES",1);
						break;
					case "2":
						mv.addObject("TYPES",2);
						break;
					case "3":
						mv.addObject("TYPES",3);
						break;
				}
				break;
			case "2":
				page.setPd(pd);
				page.setState(2);
				list = appProductStableService.countSearchlistPage(page);
				switch (pd.getString("HTYPE")) {
					case "1":
						mv.addObject("TYPES",4);
						break;
					case "2":
						mv.addObject("TYPES",5);
						break;
					case "3":
						mv.addObject("TYPES",6);
						break;
				}
				break;
			default:
				pd.put("TYPE", 1);
				int TYPES = 1;
				page.setPd(pd);
				page.setState(2);
				list=appproductService.countSearchlistPage(page);
				if(list.size()<=0){
					pd.put("TYPE", 2);
					page.setPd(pd);
					TYPES = 2;
					list=appproductService.countSearchlistPage(page);
					if(list.size()<=0){
						pd.put("TYPE", 3);
						page.setPd(pd);
						TYPES = 3;
						list=appproductService.countSearchlistPage(page);
						if(list.size()<=0){
							pd.put("TYPE", 1);
							page.setPd(pd);
							TYPES = 4;
							list = appProductStableService.countSearchlistPage(page);
							if(list.size()<=0){
								pd.put("TYPE", 2);
								page.setPd(pd);
								TYPES = 5;
								list = appProductStableService.countSearchlistPage(page);
								if(list.size()<=0){
									pd.put("TYPE", 3);
									page.setPd(pd);
									TYPES = 6;
									list = appProductStableService.countSearchlistPage(page);
									if(list.size()<=0){
										pd.put("TYPE", 1);
										page.setPd(pd);
										TYPES = 1;
										list = appProductStableService.countSearchlistPage(page);
									}
								}
							}
						}
						
						
					}
				}
				mv.addObject("TYPES",TYPES);
				break;
			}
			mv.addObject("list",list);
			mv.setViewName("web/search_list");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 获取搜索产品列表
	 */
	@RequestMapping(value="/getSearchList")
	@ResponseBody
	public Object getSearchList(Page page){
		logBefore(logger, "获取搜索产品列表");
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			page.setState(2);
			List<PageData> list = new ArrayList<>();
			List<PageData> list1 = new ArrayList<>();
			List<PageData> list2= new ArrayList<>();
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			switch (pd.getString("PRODUCTTYPE")) {
			case "1":
				list = appproductService.countSearchlistPage(page);
				break;
			case "2":
				list = appProductStableService.countSearchlistPage(page);
				break;
			default:
				list = appproductService.countAllSearchlistPage(page);
				break;
			}
			map.put("list",list);
			map.put("pd", pd);
			map.put("page", page);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	
	
	
	/**
	 * 去产品详情页面
	 */
	@RequestMapping(value="/goProductInfo")
	public ModelAndView goProductInfo(){
		logBefore(logger, "去产品详情页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData info = new PageData();
			List<PageData> list = new ArrayList<>();
			switch (pd.getString("PRODUCTTYPE")) {
			case "1":
				info = appproductService.findById(pd);
				list = appproductService.findProductInfoList(info);
				pd.put("LOCATION", "固定收益");
				switch (info.getString("TYPE")) {
					case "1":
						pd.put("LOCATIONTWO", "信托产品");
						pd.put("LOCATIONTWOURL", "web/trust");
						break;
					case "2":
						pd.put("LOCATIONTWO", "资管产品");
						pd.put("LOCATIONTWOURL", "web/mislist");
						break;
					case "3":
						pd.put("LOCATIONTWO", "契约产品");
						pd.put("LOCATIONTWOURL", "web/covenant");
						break;
				}
				break;
			case "2":
				info = appProductStableService.findById(pd);
				list = appProductStableService.findProductInfoList(info);
				pd.put("LOCATION", "浮动收益");
				switch (info.getString("TYPE")) {
					case "1":
						pd.put("LOCATIONTWO", "股权投资");
						pd.put("LOCATIONTWOURL", "web/privateEquitylist");
						break;
					case "2":
						pd.put("LOCATIONTWO", "政府债产品");
						pd.put("LOCATIONTWOURL", "web/setincreaseList");
						break;
					case "3":
						pd.put("LOCATIONTWO", "对冲•定增");
						pd.put("LOCATIONTWOURL", "web/offsetList");
						break;
				}
				break;
			default:
				info = appproductService.findById(pd);
				if(info!=null){
					list = appproductService.findProductInfoList(info);
					pd.put("LOCATION", "固定收益");
					switch (info.getString("TYPE")) {
						case "1":
							pd.put("LOCATIONTWO", "信托产品");
							pd.put("LOCATIONTWOURL", "web/trust");
							break;
						case "2":
							pd.put("LOCATIONTWO", "资管产品");
							pd.put("LOCATIONTWOURL", "web/mislist");
							break;
						case "3":
							pd.put("LOCATIONTWO", "契约产品");
							pd.put("LOCATIONTWOURL", "web/covenant");
							break;
					}
					break;
				}else{
					info = appProductStableService.findById(pd);
					list = appProductStableService.findProductInfoList(info);
					pd.put("LOCATION", "浮动收益");
					switch (info.getString("TYPE")) {
						case "1":
							pd.put("LOCATIONTWO", "股权投资");
							pd.put("LOCATIONTWOURL", "web/privateEquitylist");
							break;
						case "2":
							pd.put("LOCATIONTWO", "政府债产品");
							pd.put("LOCATIONTWOURL", "web/setincreaseList");
							break;
						case "3":
							pd.put("LOCATIONTWO", "对冲•定增");
							pd.put("LOCATIONTWOURL", "web/offsetList");
							break;
					}
					break;
				}
			}
			List<PageData> financialplannerList = financialplannerService.appDetailsChoose(null);
			String DETAILS = info.getString("DETAILS");
			System.out.println(DETAILS);
			String tem_DETAILS = financialplannerService.filterHtmlTag(DETAILS);
			mv.addObject("tem_DETAILS",tem_DETAILS);
			mv.addObject("var",info);
			mv.addObject("list",list);
			mv.addObject("financialplannerList",financialplannerList);
			mv.setViewName("web/productInfo");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 去新闻详情页面
	 */
	@RequestMapping(value="/goNewsInfo")
	public ModelAndView goNewsInfo(){
		logBefore(logger, "去新闻详情页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData info = new PageData();
			info = newsService.findById(pd);
			List<PageData> list = appproductService.findProductInfoList(info);
			List<PageData> newsList = newsService.getNewsList(pd);
			List<PageData> tagList = newsService.getTagList(pd);
			mv.addObject("var",info);
			mv.addObject("list",list);
			mv.addObject("newsList",newsList);
			mv.addObject("tagList",tagList);
			mv.setViewName("web/newsInfo");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 获取热推产品列表
	 */
	@RequestMapping(value="/getHotList")
	@ResponseBody
	public Object getHotList(Page page){
		logBefore(logger, "获取热推产品列表");
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			page.setState(2);
			List<PageData> list = new ArrayList<>();
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			switch (pd.getString("PRODUCTTYPE")) {
			case "1":
				list = appproductService.applistPage(page);
				break;
			case "2":
				list = appProductStableService.applistPage(page);
				break;
			default:
				break;
			}
			map.put("list",list);
			map.put("pd", pd);
			map.put("page", page);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	
	
	
	/**
	 * 去核心团队页面
	 */
	@RequestMapping(value="/teamList")
	public ModelAndView getTeamList(Page page){
		logBefore(logger, "去新news_list页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> mainChoose=financialplannerService.appMainChoose(pd);
			mv.addObject("mainChoose",mainChoose);
			mv.setViewName("web/team_list");
			mv.addObject("msg","getTeamList");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新关于我们页面
	 */
	@RequestMapping(value="/aboutUsList")
	public ModelAndView getAboutUsList(Page page){
		logBefore(logger, "去新about_us_list页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("zds", "zdsss");
		try {
//			List<PageData> newProduct=appproductService.getNewProductList(page,pd);
//			mv.addObject("newProduct",newProduct);
			mv.setViewName("web/aboutUs/aboutUs");
			mv.addObject("msg","getAboutUsList");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 产品预约
	 */
	@RequestMapping(value="/cpyy")
	@ResponseBody
	public Object cpyy(){
		logBefore(logger, "产品预约");
		Map<String,Object> map = new HashMap<>();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		try {
			pd.put("ID", UuidUtil.get32UUID());
			pd.put("CTDATE", Tools.date2Str(new Date()));
			productAppointmentService.save(pd);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	
	/**
	 * 理财师预约
	 */
	@RequestMapping(value="/lcsyy")
	@ResponseBody
	public Object lcsyy(){
		logBefore(logger, "理财师预约");
		Map<String,Object> map = new HashMap<>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			if(pd.getString("PHONE")==null || "".equals(pd.getString("PHONE"))){
				map.put("result", "00");
				map.put("msg", "手机号不能未空");
				return map;
			}
			if(pd.getString("NAME")==null || "".equals(pd.getString("NAME"))){
				map.put("result", "00");
				map.put("msg", "姓名不能未空");
				return map;
			}
			pd.put("ID", UuidUtil.get32UUID());
			pd.put("CTDATE", Tools.date2Str(new Date()));
			financialplannerappointmentService.save(pd);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	
	@RequestMapping(value="/wealth")
	public ModelAndView wealth(){
		logBefore(logger, "去活动页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("web/wealth");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	@RequestMapping(value="/soe")
	public ModelAndView soe(){
		logBefore(logger, "去活动页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("web/soe");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	@RequestMapping(value="/selected")
	public ModelAndView selected(){
		logBefore(logger, "去活动页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("web/selected");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	@RequestMapping(value="/trust_company")
	public ModelAndView trust_company()
	  {
	    logBefore(this.logger, "去活动页面");
	    ModelAndView mv = getModelAndView();
	    PageData pd = new PageData();
	    pd = getPageData();
	    try
	    {
	      mv.setViewName("web/trust_company");
	      mv.addObject("pd", pd);
	    }
	    catch (Exception e)
	    {
	      this.logger.error(e.toString(), e);
	    }
	    return mv;
	  }
	
	
	/**
	 * 活动申请
	 */
	@RequestMapping(value="/activityApply")
	@ResponseBody
	public Object activityApply(){
		logBefore(logger, "活动申请");
		Map<String,Object> map = new HashMap<>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("ID", UuidUtil.get32UUID());
			pd.put("CTDATE", Tools.date2Str(new Date()));
			activityapplyService.save(pd);
			map.put("result", "01");
			map.put("msg", "succeed");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result", "00");
			map.put("msg", "系统繁忙，请稍后再试");
		}finally{
			return map;
		}				
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 去产品详情页面
	 */
	@RequestMapping(value="/goAppProductInfo")
	public ModelAndView goAppProductInfo(){
		logBefore(logger, "去App产品详情页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData info = new PageData();
			List<PageData> list = new ArrayList<>();
			switch (pd.getString("PRODUCTTYPE")) {
			case "1":
				info = appproductService.findById(pd);
				list = appproductService.findProductInfoList(info);
				pd.put("LOCATION", "固定收益");
				switch (info.getString("TYPE")) {
					case "1":
						pd.put("LOCATIONTWO", "信托产品");
						pd.put("WEBTYPE", "2");
						pd.put("LOCATIONTWOURL", "web/trust");
						break;
					case "2":
						pd.put("LOCATIONTWO", "资管产品");
						pd.put("WEBTYPE", "3");
						pd.put("LOCATIONTWOURL", "web/mislist");
						break;
					case "3":
						pd.put("LOCATIONTWO", "契约产品");
						pd.put("WEBTYPE", "4");
						pd.put("LOCATIONTWOURL", "web/covenant");
						break;
				}
				break;
			case "2":
				info = appProductStableService.findById(pd);
				list = appProductStableService.findProductInfoList(info);
				pd.put("LOCATION", "浮动收益");
				switch (info.getString("TYPE")) {
					case "1":
						pd.put("LOCATIONTWO", "股权投资");
						pd.put("WEBTYPE", "5");
						pd.put("LOCATIONTWOURL", "web/privateEquitylist");
						break;
					case "2":
						pd.put("LOCATIONTWO", "政府债产品");
						pd.put("WEBTYPE", "6");
						pd.put("LOCATIONTWOURL", "web/setincreaseList");
						break;
					case "3":
						pd.put("LOCATIONTWO", "对冲•定增");
						pd.put("WEBTYPE", "7");
						pd.put("LOCATIONTWOURL", "web/offsetList");
						break;
				}
				break;
			default:
				break;
			}
			String DETAILS = (String) info.get("DETAILS");
			DETAILS = DETAILS.replaceAll("<img src=\"", "<img src=\"/");
			info.put("DETAILS",DETAILS);
			//List<PageData> financialplannerList = financialplannerService.appDetailsChoose(null);
			mv.addObject("var",info);
			mv.addObject("list",list);
//			mv.addObject("financialplannerList",financialplannerList);
			mv.setViewName("web/app/productInfo");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	
	
	
	/**
	 * 去产品列表页面
	 */
	@RequestMapping(value="/goAppProductList")
	public ModelAndView goAppProductList(Page page){
		logBefore(logger, "去App产品列表页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			List<PageData> list = new ArrayList<>();
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			switch (pd.getString("PRODUCTTYPE")) {
			case "1":
				list = appproductService.applistPage(page);
				pd.put("LOCATION", "固定收益");
				switch (pd.getString("TYPE")) {
					case "1":
						pd.put("WEBTYPE", "2");
						pd.put("LOCATIONTWO", "信托产品");
						break;
					case "2":
						pd.put("WEBTYPE", "3");
						pd.put("LOCATIONTWO", "资管产品");
						break;
					case "3":
						pd.put("WEBTYPE", "4");
						pd.put("LOCATIONTWO", "契约产品");
						break;
				}
				break;
			case "2":
				list = appProductStableService.applistPage(page);
				pd.put("LOCATION", "浮动收益");
				switch (pd.getString("TYPE")) {
				case "1":
					pd.put("WEBTYPE", "5");
					pd.put("LOCATIONTWO", "股权投资");
					break;
				case "2":
					pd.put("WEBTYPE", "6");
					pd.put("LOCATIONTWO", "政府债产品");
					break;
				case "3":
					pd.put("WEBTYPE", "7");
					pd.put("LOCATIONTWO", "对冲•定增");
					break;
				}
				break;
			default:
				break;
			}
			mv.addObject("list",list);
			mv.addObject("page",page);
			page.getTotalPage();
			mv.addObject("pd",pd);
			mv.setViewName("web/app/productList");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	  @RequestMapping(value="/goAppProductQuery")
	  public ModelAndView goAppProductQuery(Page page)
	  {
	    logBefore(this.logger, "去App产品列表页面");
	    ModelAndView mv = getModelAndView();
	    PageData pd = new PageData();
	    pd = getPageData();
	    try {
	      if (((String)pd.get("product")).equals("3")) {
	        mv.addObject("pd", pd);
	        mv.setViewName("web/app/product3");
	      }
	    }
	    catch (Exception e) {
	      this.logger.error(e.toString(), e);
	    }
	    return mv;
	  }

	/**
	 * 获取产品列表
	 */
	@RequestMapping(value="/getAppProductList")
	@ResponseBody
	public Object getAppProductList(Page page){
		logBefore(logger, "获取产品列表");
		Map<String,Object> map = new HashMap<>();
		map.put("result",00);
		map.put("msg","系统繁忙请稍后再试");
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			List<PageData> list = new ArrayList<>();
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			switch (pd.getString("PRODUCTTYPE")) {
			case "1":
				list = appproductService.applistPage(page);
				pd.put("LOCATION", "固定收益");
				switch (pd.getString("TYPE")) {
					case "1":
						pd.put("WEBTYPE", "2");
						pd.put("LOCATIONTWO", "信托产品");
						break;
					case "2":
						pd.put("WEBTYPE", "3");
						pd.put("LOCATIONTWO", "资管产品");
						break;
					case "3":
						pd.put("WEBTYPE", "4");
						pd.put("LOCATIONTWO", "契约产品");
						break;
				}
				break;
			case "2":
				list = appProductStableService.applistPage(page);
				pd.put("LOCATION", "浮动收益");
				switch (pd.getString("TYPE")) {
				case "1":
					pd.put("WEBTYPE", "5");
					pd.put("LOCATIONTWO", "股权投资");
					break;
				case "2":
					pd.put("WEBTYPE", "6");
					pd.put("LOCATIONTWO", "政府债产品");
					break;
				case "3":
					pd.put("WEBTYPE", "7");
					pd.put("LOCATIONTWO", "对冲•定增");
					break;
				}
				break;
			default:
				break;
			}
			map.put("result",01);
			map.put("msg","succeed");
			map.put("list",list);
			map.put("pd",pd);
			map.put("page",page);
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("result",00);
			map.put("msg","系统繁忙请稍后再试");
		}finally{
			return map;
		}
	}
	

@RequestMapping({"/goQuestion"})
public ModelAndView goQuestion(Page page)
{
  ModelAndView mv = getModelAndView();
  List right_list = new ArrayList();
  PageData pd = new PageData();
  pd = getPageData();
  try
  {
    pd = this.questions_answersService.findById(pd);
    this.questions_answersService.edit(pd);
    page.setShowCount(1000);
    page.setPd(pd);
    List<PageData> list = questions_answersService.list(page);
   
   
    if(list!=null&&list.size()>6){
    	Random r = new Random();
    	for(int i=0;i<6;i++){
    		int r_num = r.nextInt(list.size());
    		if(right_list!=null&&
    				!right_list.contains(list.get(r_num))){
    			right_list.add(list.get(r_num));
    		}else{
    			i--;
    		}
    	}
    }
    
    
    for(int i=0;i<list.size();i++){
    	if(list.get(i).get("ID").equals(pd.get("ID"))){
    		if(i!=0){
    			pd.put("PREV", list.get(i-1));
    		}else{
    			
    		}
    		if(i==list.size()-1){
    		}else{
    			pd.put("NEXT", list.get(i+1));
    		}
    	    break;
    	}
    }
    
   
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  mv.addObject("question", pd);
  mv.addObject("right_list", right_list);
  mv.setViewName("web/questions_answers/questions_answers");
  return mv;
}
@RequestMapping({"/wenda"})
public ModelAndView wenda(Page page) { 
	
  int pageSize = 10;

  ModelAndView mv = getModelAndView();

  PageData pd = getPageData();

  page.setPd(pd);
  page.setShowCount(1000);
  try {
    List list = this.questions_answersService.list(page);
    
    List right_list = new ArrayList();
    /**
     * 获取右侧随机问题list
     */
    if(list!=null&&list.size()>6){
    	Random r = new Random();
    	for(int i=0;i<6;i++){
    		int r_num = r.nextInt(list.size());
    		if(right_list!=null&&
    				!right_list.contains(list.get(r_num))){
    			right_list.add(list.get(r_num));
    		}else{
    			i--;
    		}
    	}
    }
    
    int pageCount;
    if (list.size() % pageSize == 0)
      pageCount = list.size() / pageSize;
    else {
      pageCount = list.size() / pageSize + 1;
    }
    
    /**
     * 获取左侧列表列
     */
   
    List categorytemp = questions_answersService.getRightList(page);
    List categoryList = new ArrayList();
    for(int i=0;i<categorytemp.size();i++){
    	categoryList.add("");
    }
    for(int i=0;i<categorytemp.size();i++){
    	String str = (String) categorytemp.get(i);
        if("信托".equals(str)){
        	categoryList.remove(0);
        	categoryList.add(0,str);
        	continue;
        }
        if("证券".equals(str)){
        	categoryList.remove(1);
        	categoryList.add(1,str);
        	continue;
        }
        if("基金".equals(str)){
        	categoryList.remove(2);
        	categoryList.add(2,str);
        	continue;
        }
        if("股权".equals(str)){
        	categoryList.remove(3);
        	categoryList.add(3,str);
        	continue;
        }
        if("理财".equals(str)){
        	categoryList.remove(4);
        	categoryList.add(4,str);
        	continue;
        }
        categoryList.add(str);
    }
    mv.addObject("categoryList", categoryList);
    if (list.size() >= 10)
      mv.addObject("list", list.subList(0, 10));
    else {
      mv.addObject("list", list.subList(0, list.size()));
    }
    mv.addObject("pageCount", Integer.valueOf(pageCount));
    mv.addObject("pageNow", Integer.valueOf(1));
    mv.addObject("right_list",right_list);
    mv.setViewName("web/questions_answers/wenda");
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  return mv;
}

	/**
	 * 去app关于我们页面
	 */
	@RequestMapping(value="/appAboutUs")
	public ModelAndView appAboutUs(){
		logBefore(logger, "去app关于我们页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("WEBTYPE", "8");
			mv.addObject("pd",pd);
			mv.setViewName("web/app/aboutUs");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去app联系我们页面
	 */
	@RequestMapping(value="/appContactUs")
	public ModelAndView appContactUs(){
		logBefore(logger, "去app联系我们页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("WEBTYPE", "9");
			mv.addObject("pd",pd);
			mv.setViewName("web/app/contactUs");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	  @RequestMapping({"/question"})
	  @ResponseBody
	  public Object question(Page page) throws Exception { Map map = new HashMap();
	    PageData pd = getPageData();
	    int pageCount = 0;
	    int pageSize = 10;
	    List varList = null;
	    page.setShowCount(1000);
	    page.setPd(pd);
	    if ("全部分类".equals(pd.get("category"))) {
	      if ("最新".equals(pd.get("type"))) {
	        varList = this.questions_answersService.list(page);
	        if (varList.size() % pageSize == 0)
	          pageCount = varList.size() / pageSize;
	        else
	          pageCount = varList.size() / pageSize + 1;
	      }
	      else if ("最热".equals(pd.get("type"))) {
	        varList = this.questions_answersService.listOrderByReading(page);
	        if (varList.size() % pageSize == 0)
	          pageCount = varList.size() / pageSize;
	        else {
	          pageCount = varList.size() / pageSize + 1;
	        }
	      }
	    }
	    else if ("最新".equals(pd.get("type"))) {
	      varList = this.questions_answersService.findByCategoryOrderbyDate(page);
	      if (varList.size() % pageSize == 0)
	        pageCount = varList.size() / pageSize;
	      else
	        pageCount = varList.size() / pageSize + 1;
	    }
	    else if ("最热".equals(pd.get("type"))) {
	      varList = this.questions_answersService.findByCategoryOrderByReading(page);
	      if (varList.size() % pageSize == 0)
	        pageCount = varList.size() / pageSize;
	      else {
	        pageCount = varList.size() / pageSize + 1;
	      }
	    }

	    if (varList.size() >= 10) {
	      map.put("list", varList.subList(0, 10));
	      map.put("pageCount", Integer.valueOf(pageCount));
	      return varList;
	    }
	    map.put("list", varList.subList(0, varList.size()));
	    return varList; }

	  @RequestMapping({"/question_type"})
	  @ResponseBody
	  public Object question_type(Page page) throws Exception
	  {
	    Map map = new HashMap();

	    int pageSize = 10;
	    PageData pd = getPageData();
	    page.setPd(pd);
	    page.setShowCount(1000);
	    List varList = null;
	    if ((pd.get("category") != null) && (!"".equals(pd.get("category"))) && (!"全部分类".equals(pd.get("category"))))
	    {
	      int pageCount;
	      if ("最热".equals(pd.get("type"))) {
	        varList = this.questions_answersService.findByCategoryOrderByReading(page);
	        if (varList.size() % pageSize == 0)
	          pageCount = varList.size() / pageSize;
	        else
	          pageCount = varList.size() / pageSize + 1;
	      }
	      else if ("最新".equals(pd.get("type"))) {
	        varList = this.questions_answersService.findByCategoryOrderbyDate(page);
	        if (varList.size() % pageSize == 0)
	          pageCount = varList.size() / pageSize;
	        else
	          pageCount = varList.size() / pageSize + 1;
	      }
	    }
	    else
	    {
	      int pageCount;
	      if ("最热".equals(pd.get("type"))) {
	        varList = this.questions_answersService.listOrderByReading(page);
	        if (varList.size() % pageSize == 0)
	          pageCount = varList.size() / pageSize;
	        else {
	          pageCount = varList.size() / pageSize + 1;
	        }
	      }
	      else if ("最新".equals(pd.get("type"))) {
	        varList = this.questions_answersService.list(page);
	        if (varList.size() % pageSize == 0)
	          pageCount = varList.size() / pageSize;
	        else {
	          pageCount = varList.size() / pageSize + 1;
	        }
	      }
	    }
	    if (varList.size() >= 10) {
	      map.put("list", varList.subList(0, 10));
	      return varList;
	    }
	    map.put("list", varList.subList(0, varList.size()));
	    return varList;
	  }
	  @RequestMapping({"/question_fy"})
	  @ResponseBody
	  public Object question_fy(Page page) throws Exception {
	    int pageSize = 10;
	    Map map = new HashMap();
	    PageData pd = getPageData();
	    page.setPd(pd);
	    String pageNowstr = (String)pd.get("pageNow");
	    int pageNow = Integer.parseInt(pageNowstr);
	    List varList = null;
	    page.setShowCount(1000);
	    if (("全部分类".equals(pd.get("category"))) && ("最新".equals(pd.get("type")))) {
	      varList = this.questions_answersService.list(page);
	      varList = getListDate(varList, pageSize, pageNow);
	    }
	    else if (("全部分类".equals(pd.get("category"))) && ("最热".equals(pd.get("type")))) {
	      varList = this.questions_answersService.listOrderByReading(page);
	      varList = getListDate(varList, pageSize, pageNow);
	    } else if ((!"全部分类".equals(pd.get("category"))) && ("最新".equals(pd.get("type")))) {
	      varList = this.questions_answersService.findByCategoryOrderbyDate(page);
	      varList = getListDate(varList, pageSize, pageNow);
	    } else if ((!"全部分类".equals(pd.get("category"))) && ("最热".equals(pd.get("type")))) {
	      varList = this.questions_answersService.findByCategoryOrderByReading(page);
	      varList = getListDate(varList, pageSize, pageNow);
	    }
	    map.put("list", varList);
	    return varList;
	  }

	  public List getListDate(List varList, int pageSize, int pageNow) {
	    if (varList.size() % pageSize == 0) {
	      if (varList.size() / pageSize == pageNow)
	        varList = varList.subList((pageNow - 1) * pageSize, varList.size());
	      else {
	        varList = varList.subList((pageNow - 1) * pageSize, pageNow * pageSize);
	      }
	    }
	    else if (varList.size() / pageSize + 1 == pageNow)
	      varList = varList.subList((pageNow - 1) * pageSize, varList.size());
	    else {
	      varList = varList.subList((pageNow - 1) * pageSize, pageNow * pageSize);
	    }

	    return varList;
	  }
	  /*
	   * 去公司排名
	   */
	  @RequestMapping(value="/paiming")
	  public ModelAndView paiming(Page page){
			int pageSize = 20;

		  ModelAndView mv = new ModelAndView();
		  PageData pd = getPageData();
		  page.setShowCount(pageSize);
		  try {
			String condition = " where A.ISTRUST='是' " ;
			String order = " order by  a.RANKING DESC, a.CTDATE  DESC";
			
		    List<PageData> listall = institutionService.listAllXT(pd);
		    List<PageData> hotList = new ArrayList<PageData>(); 
		    int count = listall.size();
		    int r;
		    Random random = new Random();
		    for(int i=0;i<4;i++){
		    	r = random.nextInt(count);
		    	if(hotList.isEmpty()){
		    		hotList.add(listall.get(r));
		    	}else{
		    		if(hotList.contains(listall.get(r))){
		    			i--;
		    		}else{
		    			hotList.add(listall.get(r));
		    		}
		    	}
		    }
		    mv.addObject("hotList", hotList);
		    int pageCount = FyUtil.getPageCount(count,pageSize);
		    List list = fyutil.list_fy("1","" ,"td_institution",condition,order,pageSize, pd);
			//List list = institutionService.datalistPage(page);
			page.setPd(pd);
			page.setState(2);
			mv.addObject("list", list);
			mv.addObject("pageCount",pageCount);
			mv.addObject("pageNow",1);
			mv.addObject("condition",condition);
			mv.addObject("order",order);
			mv.setViewName("web/paiming/paiming");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  return mv;
	  }
	  @RequestMapping({"/list_fy"})
	  @ResponseBody
	  public Object list_fy() throws Exception {
		PageData pd = getPageData();
		String pageSize = (String)pd.get("pageSize");
		String pageNowStr = (String)pd.get("pageNow");
		String columns = (String)pd.getString("columns");
		String tablename = (String)pd.getString("tablename");
		String condition = (String)pd.getString("condition");
		String order = (String)pd.getString("order");
	    List varList = fyutil.list_fy(pageNowStr,columns,tablename,condition,order,Integer.parseInt(pageSize),pd);
	    return varList;
	  }
	  
	  @RequestMapping(value="/goCompany")
	  public ModelAndView goCompany(Page page){
		  int pageSize = 10;
		  PageData pd = getPageData();
		  String _columns = "a.ID,a.PRODUCTNAME,a.PRODUCTREFERRED,a.RETURNSBENCHMARK,a.RETURNSBENCHMARKMAX,"+
					"a.INVESTMENTSTARTING,a.PRODUCTDEADLINE,a.PRODUCTREVIEWS,a.THEISSUER,b.NAME THEISSUERNAME,b.IMGURL THEISSUERIMGURL,"+
					"a.EXPECTISSUANCE,a.INTERESTDISTRIBUTIONSTATE,c.NAME TINTERESTDISTRIBUTIONSTATENAME,a.TRUSTTYPE,"+
					"d.NAME TRUSTTYPENAME,a.PRODUCTSTATUS,"+
					"e.NAME PRODUCTSTATUSNAME,a.INVESTMENTSTARTINGSTATE,a.PRODUCTDEADLINESTATE,a.RETURNSBENCHMARKSTATE,a.DETAILS,a.SORT,a.CTDATE,a.UPDATE,a.TYPE";
		  String _condition =  " left join td_institution b on a.THEISSUER = b.ID "+ 
					"left join td_conditiontwo c on a.INTERESTDISTRIBUTIONSTATE = c.ID "+ 
					"left join td_conditiontwo d on a.TRUSTTYPE = d.ID  "+ 
					"left join td_conditiontwo e on a.PRODUCTSTATUS = e.ID where 1 = 1 "+
					"and a.THEISSUER  = '"+pd.getString("ID")+"'";
		  String _order=" order by a.SORT,a.CTDATE";
		  ModelAndView mv = new ModelAndView();
		  
		try {
			pd.put("TYPE",1);
			pd.put("WEBTYPE", "2");
			pd = institutionService.findById(pd);
			page.setPd(pd);
			page.setState(2);
			page.setShowCount(6);
			List<PageData> listProducts=institutionService.getProductsByCompany(page);
			List<PageData> recommendList =  appproductService.findAllBookingProduct();
			List recommend = new ArrayList();
			Random r = new Random();
			for(int i=0;i<4;i++){
				int j = r.nextInt(recommendList.size()); 
				recommend.add(recommendList.get(j));
			}
			mv.addObject("recommend",recommend);
			int pageCount = FyUtil.getPageCount(listProducts.size(),pageSize);
			mv.addObject("pageCount",pageCount);
			List<PageData> list_fy = fyutil.list_fy("1", _columns, "td_product",_condition ,_order, pd);
			mv.addObject("pageNow",1);
			mv.addObject("listProducts",list_fy);
			mv.addObject("pd", pd);
			mv.setViewName("web/paiming/company");
			mv.addObject("msg","getTrustList");
			System.out.println(page.getPageStr());
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	  
	  @RequestMapping({"/searchCompany"})
	  @ResponseBody
	  public Object searchCompany() throws Exception {
		PageData pd = getPageData();
		String pageSize = (String)pd.get("pageSize");
		String pageNowStr = (String)pd.get("pageNow");
		String columns = (String)pd.getString("columns");
		String tablename = (String)pd.getString("tablename");
		String condition = (String)pd.getString("condition");
		String order = (String)pd.getString("order");
		pd.put("condition", condition);
		List<PageData> listallsearch = institutionService.listAllSearch(pd);
		int pageCount = FyUtil.getPageCount(listallsearch.size(),Integer.parseInt(pageSize));
		List varList = fyutil.list_fy(pageNowStr,columns,tablename,condition,order,Integer.parseInt(pageSize),pd);
		varList.add(pageCount);
	    return varList;  
	  }   
	  
	  	@RequestMapping({"/getSelfMessagesCount"})
		@ResponseBody
		public Object getSelfMessagesCount(String phone){
			List<Reading> list = null;
			Map<String,Object> messagemap = new HashMap<String,Object>();
			int all = 0;
			int syscount = 0;
			int productcount = 0;
			List<MessageManagement> productList = new ArrayList<MessageManagement> ();
			List<MessageManagement>  sysList = new ArrayList<MessageManagement> ();
			try {
				list = usermanagementService.findMessageByPhone(phone);
				if(list!=null&&!list.isEmpty()){
					all = list.size();
					messagemap.put("all", all);
					for(int i=0;i<list.size();i++){
   						Reading r = (Reading)list.get(i);
   						if(r.getMessagetype().equals("0")){
   							String messageid =  r.getMessageid();
   							MessageManagement mm = (MessageManagement)messagemanagementservice.findMessageById(messageid);
   							if(appproductService.findByIdStr(mm.getProductids())!=null){
   								messagemap.put("PRODUCTTYPE", "1");
   							}else{
   								messagemap.put("PRODUCTTYPE", "2");
   							}
   							productList.add(mm);
   							productcount++;
   						}else{
   							String messageid =  r.getMessageid();
   							MessageManagement mm = (MessageManagement)messagemanagementservice.findMessageById(messageid);
   							sysList.add(mm);
   							syscount++;
   						}
   					}
					messagemap.put("productList",productList);
					messagemap.put("sysList",sysList);
					messagemap.put("productcount", productcount);
					messagemap.put("syscount", syscount);
   				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return messagemap;
		}
	  
	  	@RequestMapping({"/authentication"})
		@ResponseBody 
		public Object authentication(){
	  		PageData pd = this.getPageData();
	  		pd.put("ID",this.get32UUID());
	  		pd.put("CTDATE", Tools.date2Str(new Date()));
			try {
				leavemsgService.save(pd);
				return "ok";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "err";
			}
		}
	  	
	  	@RequestMapping("/uploadfile")
	  	public ModelAndView uploadfile(){
	  		ModelAndView mv = new ModelAndView();
	  		mv.setViewName("web/uploadfile");
	  		return mv;
	  	}
	  	
	  	@RequestMapping(value = "/upload")  
	    public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) {  
	        System.out.println("开始");  
	        String path = request.getSession().getServletContext().getRealPath("upload");  
	        String fileName = file.getOriginalFilename();  
//	        String fileName = new Date().getTime()+".jpg";  
	        System.out.println(path);  
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	        //保存  
	        try {  
	            file.transferTo(targetFile);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  
	  
	        return "result";  
	    }  
	  	
	  	/*
	  	 * 产品收藏
	  	 */
		@RequestMapping(value = "/collectionProduct")  
		@ResponseBody
		public Object collectionProduct(){
			PageData pd = this.getPageData();
			String id = get32UUID();
			String ctdate = Tools.date2Str(new Date());
			pd.put("id", id);
			pd.put("ctdate", ctdate);
			try {
				collectionService.collectionProduct(pd);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "";
		}
}
