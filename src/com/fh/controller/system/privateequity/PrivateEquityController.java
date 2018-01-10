package com.fh.controller.system.privateequity;

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
import com.fh.service.system.condition.AppConditionService;
import com.fh.service.system.conditiontwo.AppConditionTwoService;
import com.fh.service.system.privateequity.AppPrivateEquityService;
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
@RequestMapping(value="/privateequity")
public class PrivateEquityController extends BaseController {
	
	String menuUrl = "privateequity/list.do"; //菜单地址(权限用)
	
	@Resource(name="PrivateEquityService")
	private AppPrivateEquityService PrivateEquityService;
	
	@Resource(name="conditionService")
	private AppConditionService conditionService;
	
	@Resource(name="conditionTwoService")
	private AppConditionTwoService conditionTwoService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增privateequity");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.getString("SORT")==null || "".equals(pd.getString(""))){
			pd.put("SORT", null);
		}
		pd.put("ID", this.get32UUID());	//主键
		pd.put("CTDATE", Tools.date2Str(new Date()));
		PrivateEquityService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除privateequity");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			PrivateEquityService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改privateequity");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PrivateEquityService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表privateequity");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(pd.getString("INVESTMENTSTARTINGSTATE") != null && !"".equals(pd.getString("INVESTMENTSTARTINGSTATE"))){
				String INVESTMENTSTARTINGSTATES [] = pd.getString("INVESTMENTSTARTINGSTATE").split(",");
				pd.put("INVESTMENTSTARTINGSTATES", INVESTMENTSTARTINGSTATES);
			}
			if(pd.getString("privateequityDEADLINESTATE") != null && !"".equals(pd.getString("privateequityDEADLINESTATE"))){
				String privateequityDEADLINESTATES [] = pd.getString("privateequityDEADLINESTATE").split(",");
				pd.put("privateequityDEADLINESTATES", privateequityDEADLINESTATES);
			}
			if(pd.getString("RETURNSBENCHMARKSTATE") != null && !"".equals(pd.getString("RETURNSBENCHMARKSTATE"))){
				String RETURNSBENCHMARKSTATES [] = pd.getString("RETURNSBENCHMARKSTATE").split(",");
				pd.put("RETURNSBENCHMARKSTATES", RETURNSBENCHMARKSTATES);
			}
			page.setPd(pd);
			List<PageData>	varList = PrivateEquityService.datalistPage(page);	//列出privateequity列表
//			List<PageData>	conditionList = conditionService.listAll(null);
			pd.put("CONDTIONID", "5");//付息方式
			List<PageData> INTERESTDISTRIBUTIONList = conditionTwoService.ParamListAll(pd);
			pd.put("CONDTIONID", "4");//信托类型
			List<PageData> TRUSTList = conditionTwoService.ParamListAll(pd);
			pd.put("CONDTIONID", "6");//产品状态
			List<PageData> privateequityList = conditionTwoService.ParamListAll(pd);
			pd.put("CONDTIONID", "1");//认购起点
			List<PageData> INVESTMENTSTARTINGList = conditionTwoService.ParamListAll(pd);
			pd.put("CONDTIONID", "2");//产品期限
			List<PageData> privateequityDEADLINEList = conditionTwoService.ParamListAll(pd);
			pd.put("CONDTIONID", "3");//收益基准
			List<PageData> RETURNSBENCHMARKList = conditionTwoService.ParamListAll(pd);
			mv.setViewName("system/privateequity/privateequity_list");
			mv.addObject("varList", varList);
//			mv.addObject("conditionList", conditionList);
			mv.addObject("INTERESTDISTRIBUTIONList", INTERESTDISTRIBUTIONList);
			mv.addObject("TRUSTList", TRUSTList);
			mv.addObject("privateequityList", privateequityList);
			mv.addObject("INVESTMENTSTARTINGList", INVESTMENTSTARTINGList);
			mv.addObject("privateequityDEADLINEList", privateequityDEADLINEList);
			mv.addObject("RETURNSBENCHMARKList", RETURNSBENCHMARKList);
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
		logBefore(logger, "去新增privateequity页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			mv.setViewName("system/privateequity/privateequity_edit");
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
		logBefore(logger, "去修改privateequity页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = PrivateEquityService.findById(pd);	//根据ID读取
			mv.setViewName("system/privateequity/privateequity_edit");
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
		logBefore(logger, "批量删除privateequity");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				PrivateEquityService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出privateequity到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("名称");	//1
			dataMap.put("titles", titles);
			List<PageData> varOList = PrivateEquityService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("NAME"));	//1
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
