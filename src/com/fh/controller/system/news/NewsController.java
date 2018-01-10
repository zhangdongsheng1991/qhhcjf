package com.fh.controller.system.news;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.news.AppNewsService;
import com.fh.util.AppUtil;
import com.fh.util.FileUpload;
import com.fh.util.ObjectExcelView;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.PropertiesUtils;
import com.fh.util.Tools;
import com.fh.util.Jurisdiction;
import com.fh.util.UuidUtil;

/** 
 * 类名称：ConditionController
 * 创建人：FH 
 * 创建时间：2017-03-17
 */
@Controller
@RequestMapping(value="/news")
public class NewsController extends BaseController {
	
	String menuUrl = "news/list.do"; //菜单地址(权限用)
	
	@Resource(name="newsService")
	private AppNewsService newsService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(MultipartFile file,String NAME,String DETAILED,String SOURCE,String TYPE,String COMMENT,String PVIEWS,String[]tagname,String []tagurl) throws Exception{
		logBefore(logger, "新增news");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		/*pd = this.getPageData();*/
		//封面图片
		String filename = this.get32UUID();
		String showfilePath =  PathUtil.getClasspath() + Const.FILEPATHIMG ;	//文件上传路径
		String showfileName = FileUpload.fileUp(file, showfilePath, filename);
		pd.put("IMG",Const.FILEPATHIMG + showfileName);
		pd.put("NAME", NAME);
		pd.put("COMMENT", COMMENT);
		pd.put("DETAILED", DETAILED);
		pd.put("SOURCE", SOURCE);
		pd.put("TYPE", TYPE);
		pd.put("PVIEWS", PVIEWS);
		pd.put("ID", this.get32UUID());	//主键
		pd.put("CTDATE", Tools.date2Str(new Date()));
		//根据TYPE获取最后一次添加的数据
		PageData last = null;
		last = newsService.lastAdd(pd);
		if(last != null){
			pd.put("SID",last.getString("ID"));
		}
		newsService.save(pd);
		if(last != null){
			last.put("XID",pd.getString("ID"));
			newsService.edit(last);
		}
		if(tagname!=null){
			for(int i=0;i<tagname.length;i++){
				pd.put("TAGID", this.get32UUID());
				pd.put("TAGNAME",tagname[i]);
				pd.put("TAGURL", tagurl[i]);
				pd.put("NEWS_ID", pd.getString("ID"));
				newsService.savetag(pd);
			}
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除news");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd = newsService.findById(pd);//本页
			PageData last = null;//下一页
			PageData earliest = null;//上一页
			if(pd.getString("XID")!=null && !"".equals(pd.getString("XID")) && !"null".equals(pd.getString("XID"))){
				last = new PageData();
				last.put("ID", pd.getString("XID"));
				last = newsService.findById(last);
			}
			if(pd.getString("SID")!=null && !"".equals(pd.getString("SID")) && !"null".equals(pd.getString("SID"))){
				earliest = new PageData();
				earliest.put("ID", pd.getString("SID"));
				earliest = newsService.findById(earliest);
			}
			if(earliest!=null){
				earliest.put("XID",pd.getString("XID"));
				if(earliest.getString("XID")==null || "".equals(earliest.getString("XID"))|| "null".equals(earliest.getString("XID"))){
					newsService.editXidIsNull(earliest);
				}else{
					newsService.edit(earliest);
				}
			}
			if(last!=null){
				last.put("SID",pd.getString("SID"));
				newsService.edit(last);
				if(earliest.getString("SID")==null || "".equals(earliest.getString("SID"))|| "null".equals(earliest.getString("SID"))){
					newsService.editSidIsNull(last);
				}else{
					newsService.edit(last);
				}
			}
			newsService.deletetag(pd);
			newsService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	@RequestMapping(value="/deletetagbyid")
	public void deletetagbyid(String ID){
		logBefore(logger, "删除tag");
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			newsService.deletetagbyid(pd);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(MultipartFile file,String ID,String NAME,String IMG,String DETAILED,String SOURCE,String TYPE,String COMMENT,String PVIEWS,String[]tagname,String []tagurl,String[] tag_id) throws Exception{
		logBefore(logger, "修改news");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		/*pd = this.getPageData();*/
		pd.put("IMG",IMG);
		if(!file.isEmpty()){//修改图片
			String filename = UuidUtil.get32UUID();
			if(IMG!=null && !"".equals(IMG)){
				if(IMG.lastIndexOf("/")>0){ //替换原图片
					filename = IMG.substring(IMG.lastIndexOf("/")+1,IMG.lastIndexOf("."));
				}
			}
			String showfilePath = PathUtil.getClasspath() + Const.FILEPATHIMG ;		//文件上传路径
			String showfileName = FileUpload.fileUp(file, showfilePath, filename);
			pd.put("IMG", Const.FILEPATHIMG + showfileName);
		}
		pd.put("ID", ID);
		pd.put("NAME", NAME);
		pd.put("COMMENT", COMMENT);
		pd.put("DETAILED", DETAILED);
		pd.put("SOURCE", SOURCE);
		pd.put("TYPE", TYPE);
		pd.put("PVIEWS", PVIEWS);
		newsService.edit(pd);
		if(tagname!=null){
			for(int i=0;i<tagname.length;i++){
				if("1".equals(tag_id[i])){
					tag_id[i] = this.get32UUID();
					pd.put("TAGID",tag_id[i]);
					pd.put("TAGNAME",tagname[i]);
					pd.put("TAGURL", tagurl[i]);
					pd.put("NEWS_ID",ID);
					newsService.savetag(pd);
				}else{
					pd.put("TAGID",tag_id[i]);
					pd.put("TAGNAME",tagname[i]);
					pd.put("TAGURL", tagurl[i]);
					newsService.edittag(pd);
				}
			}
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 审核
	 */
	@RequestMapping(value="/shenhe")
	public void shenhe(PrintWriter out){
		logBefore(logger, "审核news");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("STATUS", 2);
			pd.put("UPDATE", Tools.date2Str(new Date()));
			newsService.edit(pd);
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
		logBefore(logger, "列表news");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = newsService.datalistPage(page);	//列出news列表
			mv.setViewName("system/news/news_list");
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
		logBefore(logger, "去新增news页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/news/news_edit");
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
		logBefore(logger, "去修改news页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = newsService.findById(pd);	//根据ID读取
			List list = newsService.findByNewsId(pd);	//根据ID读取
			mv.setViewName("system/news/news_edit");
			mv.addObject("msg", "edit");
//			mv.addObject("conditionList", conditionList);
			mv.addObject("pd", pd);
			mv.addObject("list",list);
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
		logBefore(logger, "批量删除news");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				newsService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出news到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("名称");	//1
			dataMap.put("titles", titles);
			List<PageData> varOList = newsService.listAll(pd);
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
