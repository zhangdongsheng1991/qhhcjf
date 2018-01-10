package com.fh.controller.system.activityapply;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.activityapply.AppActivityApplyService;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.Jurisdiction;

/** 
 * 类名称：ConditionController
 * 创建人：FH 
 * 创建时间：2017-03-17
 */
@Controller
@RequestMapping(value="/activityapply")
public class ActivityApplyController extends BaseController {
	
	String menuUrl = "activityapply/list.do"; //菜单地址(权限用)
	
	@Resource(name="activityapplyService")
	private AppActivityApplyService activityapplyService;
	
	
	/**
	 * 删除
	 *//*
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除activityapply");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			financialplannerappointmentService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}*/
	
	/**
	 * 审核
	 */
	@RequestMapping(value="/shenhe")
	public void shenhe(PrintWriter out){
		logBefore(logger, "审核");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("STATUS", 2);
			pd.put("UPDATE", Tools.date2Str(new Date()));
			activityapplyService.edit(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表activityapply");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = activityapplyService.datalistPage(page);	//列出financialplannerappointment列表
			mv.setViewName("system/activityapply/activityapply_list");
			mv.addObject("varList", varList);
//			mv.addObject("conditionList", conditionList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增activityapply页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/activityapply/activityapply_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改activityapply页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = activityapplyService.findById(pd);	//根据ID读取
			mv.setViewName("system/activityapply/activityapply_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除activityapply");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				activityapplyService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出activityapply到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("访问类型");	//1
			titles.add("来源");	//1
			titles.add("来源url");	//1
			titles.add("城市");	//1
			titles.add("姓名");	//1
			titles.add("投资门槛");	//1
			titles.add("收益基准");	//1
			titles.add("投资期限");	//1
			titles.add("付息方式");	//1
			titles.add("投资领域");	//1
			titles.add("信托名称");	//1
			titles.add("申请类型");	//1
			titles.add("创建时间");	//1
			titles.add("更新时间");	//1
			dataMap.put("titles", titles);
			List<PageData> varOList = activityapplyService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("PCORPHONE"));	//1
				vpd.put("var2", varOList.get(i).getString("CHANNEL"));	//1
				vpd.put("var3", varOList.get(i).getString("CHANNELURL"));	//1
				vpd.put("var4", varOList.get(i).getString("CITY"));	//1
				vpd.put("var5", varOList.get(i).getString("NAME"));	//1
				vpd.put("var6", varOList.get(i).getString("INVESTMENTTHRESHOLD"));	//1
				vpd.put("var7", varOList.get(i).getString("RETURNSBENCHMARK"));	//1
				vpd.put("var8", varOList.get(i).getString("PRODUCTDEADLINE"));	//1
				vpd.put("var9", varOList.get(i).getString("PAYINTERESTWAY"));	//1
				vpd.put("var10", varOList.get(i).getString("INVESTMENTFIELD"));	//1
				vpd.put("var11", varOList.get(i).getString("TRUSTNAME"));	//1
				vpd.put("var12", varOList.get(i).getString("SHAREHOLDERSBACKGROUND"));	//1
				vpd.put("var13", varOList.get(i).getString("CTDATE"));	//1
				vpd.put("var14", varOList.get(i).getString("UPDATE"));	//1
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
