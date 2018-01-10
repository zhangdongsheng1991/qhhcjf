package com.fh.controller.system.usermanagement.messagemanagement;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.MessageManagement;
import com.fh.entity.system.Reading;
import com.fh.entity.system.UserManageMent;
import com.fh.service.system.conditiontwo.AppConditionTwoService;
import com.fh.service.system.institution.AppInstitutionService;
import com.fh.service.system.product.AppProductService;
import com.fh.service.system.usermanagement.MessageManagementService;
import com.fh.service.system.usermanagement.UserManageMentService;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FyUtil;
import com.fh.util.PageData;
import com.fh.util.PageUtils;
import com.fh.util.Tools;

@Controller 
@RequestMapping("/messagemanagement")
public class MessageManagementController extends BaseController{
	
	@Resource(name="productService")
	private AppProductService productService;
	
	@Resource(name="institutionService")
	private AppInstitutionService institutionService;
	
	@Resource(name="conditionTwoService")
	private AppConditionTwoService conditionTwoService;
	
	@Resource(name="usermanagementService")
	private UserManageMentService usermanagementService;
	
	private int pageSize = 10;
	
	@Resource(name="messagemanagementservice")	
	private MessageManagementService messagemanagementservice;
	@RequestMapping("/messagetype")
	public ModelAndView messagetype(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/usermanagement/messagemanagement/messagetype");
		return mv;
	}
	
	@RequestMapping("/getMessage")
	@ResponseBody
	public PageUtils getMessage(int pageSize,int pageNumber){
			  PageUtils dg = new PageUtils();
			  MessageManagement mm = new MessageManagement(); 
			  mm.setPageSize(pageSize);
			  mm.setPageNumber(pageNumber);
	          List list = null;
	          int total = 0;
			try {
				list = messagemanagementservice.listMessages(mm);
				total = messagemanagementservice.listMessagesCount(mm);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	          
	          dg.setTotal(total);
	          dg.setRows(list);
	          return dg;
	     }
	
	@RequestMapping("/listmessages")
	public ModelAndView listmessages(String status,String year,String month,String messagetype,Integer pageNumber){
		ModelAndView mv = new ModelAndView();
		MessageManagement temp_mm = new MessageManagement(); //临时类，用于传值，无意义
		temp_mm.setStatus(status);
		temp_mm.setMessagetype(messagetype);
		List list = null;
		String firstday = "";
		String lastday ="";
		try {
			if(null!=year){
				if(month!=null&&!month.equals("")){
					firstday = DateUtil.getFirstDayOfMonth(Integer.parseInt(year),Integer.parseInt(month));
					lastday = DateUtil.getLastDayOfMonth(Integer.parseInt(year),Integer.parseInt(month));
				}else{
					firstday = DateUtil.getFirstDayOfYear(Integer.parseInt(year));
					lastday = DateUtil.getLastDayOfYear(Integer.parseInt(year));
				}
				//临时存放
				temp_mm.setCtdate(firstday);
				temp_mm.setSendtime(lastday);
			}
			int total = messagemanagementservice.listMessagesCount(temp_mm);
			int pageCount = FyUtil.getPageCount(total, pageSize);
			temp_mm.setPageSize(pageSize);
			//若当前页码是null,第一页
			if(pageNumber==null){
				temp_mm.setPageNumber(1);
				mv.addObject("pageNumber", 1);
			}else{
				mv.addObject("pageNumber", pageNumber);
				temp_mm.setPageNumber(pageNumber);
			}
			list = messagemanagementservice.listMessages(temp_mm);
			mv.addObject("list", list);
			mv.addObject("pageCount", pageCount);
			mv.addObject("total", total);
			mv.addObject("status",status);
			mv.addObject("year",year);
			mv.addObject("month",month);
			mv.addObject("messagetype",messagetype);
			mv.setViewName("system/usermanagement/messagemanagement/listmessages");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/addEditMessage")
	public ModelAndView addEditMessage(String id,String status,String messagetype,String year,String month){
		ModelAndView mv = new ModelAndView();
		mv.addObject("status",status);
		mv.addObject("messagetype",messagetype);
		mv.addObject("year",year);
		mv.addObject("month",month);
		mv.setViewName("system/usermanagement/messagemanagement/addeditmessage");
		if(null!=id&&!"".equals(id)){
			try {
				MessageManagement mm = (MessageManagement) messagemanagementservice.findMessageById(id);
				String productidsarr[]=new String[]{};
				if(null!=mm.getProductids()&&!"".equals(mm.getProductids())){
					productidsarr = mm.getProductids().split(",");
				}	
				List productlist = new ArrayList();
				PageData pd = new PageData();
				for(int i=0;i<productidsarr.length;i++){
					pd.put("ID", productidsarr[i]);
					productlist.add(productService.findById(pd));
				}
				mv.addObject("productlist",productlist);
				mv.addObject("mm",mm);
				mv.addObject("edit","true"); //是否编辑
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			mv.addObject("edit","false");
		}
		return mv;
	}
	
	@RequestMapping("/saveMessage")
	public ModelAndView saveMessage(MessageManagement mm){
		ModelAndView mv = new ModelAndView();
		UserManageMent user = new UserManageMent();
		List productlist = new ArrayList();
		String info = "";
		String productids="";
		PageData pd = getPageData();
		mv.addObject("edit",pd.get("edit"));
		mv.addObject("status",pd.get("status"));
		mv.addObject("messagetype",pd.get("messagetype1"));
		mv.addObject("year",pd.get("year"));
		mv.addObject("month",pd.get("month"));
		try {
			//编辑
			if(mm.getId()!=null&&!"".equals(mm.getId())){
				if(mm.getMessagetype().equals("1")){
				}else if(null!=mm.getIds()&&mm.getIds().length>0){
					for(int i=0;i<mm.getIds().length;i++){
						productids += mm.getIds()[i]+",";
					}
					productids = productids.substring(0, productids.length()-1);
					pd.put("ID", productids);
					productlist.add(productService.findById(pd));
				}
				mm.setProductids(productids);
				if("0".equals(mm.getStatus())){
					mm.setSendtime(Tools.date2Str(new Date()));
					List<UserManageMent> listuser = usermanagementService.listAll(user);
					messagemanagementservice.deleteReading(mm.getId());
					for(int i=0;i<listuser.size();i++){
						Reading r = new Reading();
						r.setId(get32UUID());
						r.setMessageid(mm.getId());
						r.setUserid(listuser.get(i).getU_phone());
						r.setState("0");
						r.setMessagetype(mm.getMessagetype());
						r.setSendtime(mm.getSendtime());
						messagemanagementservice.addReading(r);
					}
					info = "发布成功";
				}else{
					messagemanagementservice.deleteReading(mm.getId());
					mm.setStatus("1");
					mm.setSendtime(null);
					info = "操作成功";
				}
				messagemanagementservice.updateMessage(mm);
			}else{
				if(null!=mm.getIds()&&mm.getIds().length>0){
					for(int i=0;i<mm.getIds().length;i++){
						productids += mm.getIds()[i]+",";
					}
					productids = productids.substring(0, productids.length()-1);
				}
				mm.setProductids(productids);
				mm.setId(get32UUID());
				mm.setCtdate(Tools.date2Str(new Date()));
				if("0".equals(mm.getStatus())){
					mm.setSendtime(Tools.date2Str(new Date()));
					messagemanagementservice.deleteReading(mm.getId());
					List<UserManageMent> listuser = usermanagementService.listAll(user);
					for(int i=0;i<listuser.size();i++){
						Reading r = new Reading();
						r.setId(get32UUID());
						r.setMessageid(mm.getId());
						r.setUserid(listuser.get(i).getU_phone());
						r.setState("0");
						r.setMessagetype(mm.getMessagetype());
						r.setSendtime(mm.getSendtime());
						messagemanagementservice.addReading(r);
						info="发布成功";
					}
					//保存时判断是系统消息还是产品消息
					if(mm.getMessagetype().equals("0")){
						pd.put("ID", productids);
						productlist.add(productService.findById(pd));
					}else{
						
					}
					messagemanagementservice.saveMessage(mm);
					mv.addObject("edit","true");
				}else{
					//保存时判断是系统消息还是产品消息
					if(mm.getMessagetype().equals("0")){
						pd.put("ID", productids);
						productlist.add(productService.findById(pd));
					}else{
						
					}
					messagemanagementservice.saveMessage(mm);
					info="保存成功";
					mv.addObject("edit","true");
				}
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			info="操作失败";
		}
		mv.setViewName("system/usermanagement/messagemanagement/addeditmessage");
		mv.addObject("mm",mm);
		mv.addObject("info",info);
		mv.addObject("productlist",productlist);
		return mv;
	}
	@RequestMapping("/showuser")
	public ModelAndView showuser(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/usermanagement/messagemanagement/user");
		return mv;
	}
	@RequestMapping({"/getSelfMessagesCount"})
	@ResponseBody
	public Object getSelfMessagesCount(){
		List list = null;
		try {
			list = usermanagementService.findMessageByPhone("123");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list.size();
	}
	
	/*
	 * 获取产品列表
	 */
	@RequestMapping({"/productlist"})
	public ModelAndView productlist(Page page){
		logBefore(logger, "列表product");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(pd.getString("INVESTMENTSTARTINGSTATE") != null && !"".equals(pd.getString("INVESTMENTSTARTINGSTATE"))){
				String INVESTMENTSTARTINGSTATES [] = pd.getString("INVESTMENTSTARTINGSTATE").split(",");
				pd.put("INVESTMENTSTARTINGSTATES", INVESTMENTSTARTINGSTATES);
			}
			if(pd.getString("PRODUCTDEADLINESTATE") != null && !"".equals(pd.getString("PRODUCTDEADLINESTATE"))){
				String PRODUCTDEADLINESTATES [] = pd.getString("PRODUCTDEADLINESTATE").split(",");
				pd.put("PRODUCTDEADLINESTATES", PRODUCTDEADLINESTATES);
			}
			if(pd.getString("RETURNSBENCHMARKSTATE") != null && !"".equals(pd.getString("RETURNSBENCHMARKSTATE"))){
				String RETURNSBENCHMARKSTATES [] = pd.getString("RETURNSBENCHMARKSTATE").split(",");
				pd.put("RETURNSBENCHMARKSTATES", RETURNSBENCHMARKSTATES);
			}
			page.setPd(pd);
			List<PageData>	varList = productService.datalistPage(page);	//列出product列表
//			List<PageData>	conditionList = conditionService.listAll(null);
			pd.put("CONDTIONID", "5");//付息方式
			List<PageData> INTERESTDISTRIBUTIONList = conditionTwoService.ParamListAll(pd);
			pd.put("CONDTIONID", "4");//信托类型
			List<PageData> TRUSTList = conditionTwoService.ParamListAll(pd);
			pd.put("CONDTIONID", "6");//产品状态
			List<PageData> PRODUCTList = conditionTwoService.ParamListAll(pd);
			pd.put("CONDTIONID", "1");//认购起点
			List<PageData> INVESTMENTSTARTINGList = conditionTwoService.ParamListAll(pd);
			pd.put("CONDTIONID", "2");//产品期限
			List<PageData> PRODUCTDEADLINEList = conditionTwoService.ParamListAll(pd);
			pd.put("CONDTIONID", "3");//收益基准
			List<PageData> RETURNSBENCHMARKList = conditionTwoService.ParamListAll(pd);
			//获取发行机构列表
			List<PageData> INSTITUTIONList = institutionService.listAll(null);
			mv.setViewName("system/usermanagement/messagemanagement/productlist");
			mv.addObject("varList", varList);
//			mv.addObject("conditionList", conditionList);
			mv.addObject("INTERESTDISTRIBUTIONList", INTERESTDISTRIBUTIONList);
			mv.addObject("TRUSTList", TRUSTList);
			mv.addObject("PRODUCTList", PRODUCTList);
			mv.addObject("INVESTMENTSTARTINGList", INVESTMENTSTARTINGList);
			mv.addObject("PRODUCTDEADLINEList", PRODUCTDEADLINEList);
			mv.addObject("RETURNSBENCHMARKList", RETURNSBENCHMARKList);
			mv.addObject("INSTITUTIONList", INSTITUTIONList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	@RequestMapping("/deleteMessage")
	public ModelAndView deleteMessage(){
	//redirect:/web/findpwd/index
		PageData pd = getPageData();
		String ids = (String) pd.get("ids");
		String year = (String) pd.get("year");
		String month = (String) pd.get("month");
		String messagetype = (String) pd.get("messagetype");
		if("".equals(ids)){
			
		}else{
			String[] sf_ids = ids.split(",");
			try {
				messagemanagementservice.deleteMessage(sf_ids);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return  new ModelAndView("redirect:/messagemanagement/listmessages?status="+pd.get("status")+"&messagetype="+messagetype+"&year="+year+"&month="+month);
	}
	
	@ResponseBody
	@RequestMapping("/checkStatus")
	public Object checkStatus(String id){
		try {
			MessageManagement mm = (MessageManagement) messagemanagementservice.findMessageById(id);
			if("0".equals(mm.getStatus())){
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	@RequestMapping("/readingLog")
	public ModelAndView readingLog(String messageid,Integer pageNumber){
		ModelAndView mv = getModelAndView();
		List<Reading> readList = new ArrayList<Reading>(); //
		List<Reading> unreadList = new ArrayList<Reading>();
		Map map = new HashMap();
		int pageCount = 0;
		Integer total = 0;
		try {
			
			//若当前页码是null,第一页
			if(pageNumber==null){
				mv.addObject("pageNumber", 1);
			}else{
				mv.addObject("pageNumber", pageNumber);
			}
			map.put("messageid",messageid);
			map.put("pageSize", pageSize);
			if(pageNumber==null){
				map.put("pageNumber", 1);
			}else{
				map.put("pageNumber", pageNumber);
			}
			List<Reading> readingList = messagemanagementservice.findReadingByMessageId(map);
			total = messagemanagementservice.findReadingCountByMessageId(messageid);
			pageCount = FyUtil.getPageCount(total, pageSize);
			for(int i=0;i<readingList.size();i++){
				if(readingList.get(i).getState().equals("1")){
					readList.add(readingList.get(i));
				}else{
					unreadList.add(readingList.get(i));
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("pageCount",pageCount);
		mv.addObject("total",total);
		mv.addObject("pageSize",pageSize);
		mv.addObject("messageid",messageid);
		mv.addObject("readList",readList);
		mv.addObject("unreadList",unreadList);
		mv.addObject("readCount",readList.size());
		mv.addObject("unreadCount",unreadList.size());
		mv.setViewName("system/usermanagement/messagemanagement/readinglog");
		return mv;
	}
	
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	
}
