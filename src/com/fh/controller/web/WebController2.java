package com.fh.controller.web;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.news.AppNewsService;
import com.fh.util.FyUtil;
import com.fh.util.PageData;


@Controller
@RequestMapping(value="/web")
public class WebController2 extends BaseController{
	@Resource(name="fyutil")
	private FyUtil fyutil;
	@Resource(name="newsService")
	private AppNewsService newsService;
	
	/**
	 * 去新新闻页面
	 */
	@RequestMapping(value="/newsList")
	public ModelAndView getNewsList(Page page){
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
			mv.setViewName("web/news_list");
			mv.addObject("msg","getNewsList");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 去新新闻页面
	 */
	@RequestMapping(value="/appNews")
	public ModelAndView appNews(Page page){
		logBefore(logger, "去新news_list页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			if(pd.get("TYPE") != null){
				
			}else{
				pd.put("TYPE",5);
			}
			page.setPd(pd);
			List<PageData> list = new ArrayList<>();
			// 当前页数
			if (pd.get("currentPage") != null
					&& !"".equals(pd.get("currentPage"))) {
				page.setCurrentPage((Integer.parseInt(pd.get("currentPage")
						.toString())));
			}
			
			list = newsService.applistPage(page);
			
			//获取“热门资讯”
			List<PageData> hotNewsList = newsService.getHotNewsList(pd);
			mv.addObject("hotNewsList", hotNewsList);
			
			
			mv.addObject("list",list);
			mv.addObject("page",page);
			page.getTotalPage();
			mv.addObject("pd",pd);
			mv.setViewName("web/app/appNews/appNew");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	@RequestMapping("/getAppNewsList")
	@ResponseBody
	public  Object getAppNewsList(Page page){
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
			list =  newsService.applistPage(page);
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
	@RequestMapping("/goAppNewsInfo")
	public ModelAndView goAppNewsInfo(){
		logBefore(logger, "去新闻详情页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData info = new PageData();
			info = newsService.findById(pd);
			List<PageData> newsList = newsService.getNewsList(pd);
			List<PageData> tagList = newsService.getTagList(pd);
			
			List<PageData> hotNewsList = newsService.getHotNewsList(pd);
			mv.addObject("hotNewsList", hotNewsList);
			mv.addObject("info",info);
			mv.addObject("newsList",newsList);
			mv.addObject("tagList",tagList);
			mv.setViewName("web/app/appNews/appNew_con");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
}
