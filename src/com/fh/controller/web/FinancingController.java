package com.fh.controller.web;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.institution.AppInstitutionService;
import com.fh.service.system.news.AppNewsService;
import com.fh.util.FyUtil;
import com.fh.util.PageData;

@Controller
@RequestMapping("/web")
public class FinancingController extends BaseController{
	
	@Resource(name="institutionService")
	private AppInstitutionService institutionService;
	
	@Resource(name="fyutil")
	private FyUtil fyutil;
	@Resource(name="newsService")
	private AppNewsService newsService;
	/**
	 * “我要融资”页
	 */
	@RequestMapping("/financing")
	public ModelAndView financing()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		List<PageData> listall = institutionService.listAllXT(pd);
		List<PageData> hotList = new ArrayList<PageData>(); 
	    int count = listall.size();
	    int r;
	    Random random = new Random();
	    for(int i=0;i<6;i++){
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
		mv.setViewName("web/financing/index");
		mv.addObject("pd",pd);
		return mv;
	}
	@RequestMapping("/capital")
	public ModelAndView capital(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setShowCount(12);
		page.setPd(pd);
		page.setState(2);
		List<String> locationList = institutionService.getLocation(pd);
		Map<String,Set<String>> locationMap = institutionService.getPinYinLocation(locationList);
		List<PageData> list=institutionService.applistPage(page);
		mv.addObject("list",list);
		mv.addObject("locationMap",locationMap);
		mv.setViewName("web/financing/capital");
		mv.addObject("pd",pd);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/getInstitution")
	public Object getInstitution(Page page){
		logBefore(logger, "获取公司列表");
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setShowCount(12);
		if(null!=pd.getString("LOCATION")&&!"".equals(pd.getString("LOCATION"))){
			pd.put("LOCATION", pd.getString("LOCATION").trim());
		}
		page.setPd(pd);
		page.setState(2);
		try {
			
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			List<PageData> list=institutionService.applistPage(page);
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
	@RequestMapping("/sch_finance")
	public ModelAndView sch_finance(Page page){
		logBefore(logger, "去新news_list页面");
		ModelAndView mv = this.getModelAndView();
		int pageSize = 6;
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> list = null;
		try {
			String typenamecode = pd.getString("typename");
			String typename="";
			if(typenamecode!=null){
				typename = URLDecoder.decode(typenamecode,"utf-8");
			}else{
				typename = "财经要闻";
			}
			if("股权投资".equals(typename)){
				pd.put("TYPE", 1);
			}else if("阳光私募".equals(typename.trim())){
				pd.put("TYPE", 2);
			}else if("信托资管".equals(typename.trim())){
				pd.put("TYPE", 3);
			}else if("海外保险".equals(typename.trim())){
				pd.put("TYPE", 4);
			}else if("财经要闻".equals(typename.trim())){
				pd.put("TYPE", 5);
			}
			
			//获取“热门资讯”
			List<PageData> hotNewsList = newsService.getHotNewsList(pd);
			mv.addObject("hotNewsList", hotNewsList);
			//分页
			int count = newsService.listAll(pd).size();
			int pageCount = fyutil.getPageCount(count,pageSize);
			String condition = " where 1=1 and a.TYPE = "+pd.get("TYPE");
			String order = " order by a.CTDATE DESC, a.PVIEWS DESC";
			list = fyutil.list_fy("1","" ,"td_news",condition,order,pageSize, pd);
			mv.addObject("list",list);
			mv.addObject("pageNow",1);
			mv.addObject("pageCount",pageCount);
			mv.addObject("condition",condition);
			mv.addObject("order",order);
			
			mv.addObject("typename", typename);
			mv.setViewName("web/financing/news_list");
			mv.addObject("msg","getNewsList");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
}
