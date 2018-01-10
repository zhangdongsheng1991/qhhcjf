package com.fh.service.system.financialplanner;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.FileUpload;
import com.fh.util.MD5;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;


@Service("financialplannerService")
public class AppFinancialplannerService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 保存
	*/ 
	public void save(PageData pd)throws Exception{
		dao.save("FinancialplannerMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("FinancialplannerMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("FinancialplannerMapper.edit", pd);
	}
	
	/*
	* 根据主键获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("FinancialplannerMapper.findById", pd);
	}
	
	/*
	* 根据参数获取数据
	*/
	public PageData findByParam(PageData pd)throws Exception{
		return (PageData)dao.findForObject("FinancialplannerMapper.findByParam", pd);
	}
	
	/*
	* 列表
	*/
	public List<PageData> datalistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("FinancialplannerMapper.datalistPage", page);
	}
	
	/*
	* app列表
	*/
	public List<PageData> applistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("FinancialplannerMapper.applistPage", page);
	}
	
	/*
	* 列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("FinancialplannerMapper.listAll", pd);
	}
	
	/*
	* 首页推荐理财师
	*/
	public List<PageData> applistChoose(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("FinancialplannerMapper.applistChoose", pd);
	}
	
	/*
	* 详情推荐理财师
	*/
	public List<PageData> appDetailsChoose(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("FinancialplannerMapper.appDetailsChoose", pd);
	}
	
	/*
	* 核心团队理财师
	*/
	public List<PageData> appMainChoose(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("FinancialplannerMapper.appMainChoose", pd);
	}
	
	/*
	* 批量删除用户segmentfault
	*/
	public void deleteAll(String[] USER_IDS)throws Exception{
		dao.delete("FinancialplannerMapper.deleteAll", USER_IDS);
	}
	public static String filterHtmlTag(String str){
		str.replaceFirst("资金运行情况", "<br/>资金运行情况");
		str = str.replaceAll("<hr\\s*/?>", "\n\n");
		str = str.replaceAll("<br\\s*/?>", "\n");
		String regEx_html="<[^>]+>"; //定义HTML标签的正则表达式 
		Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
	    Matcher m_html=p_html.matcher(str); 
	    str=m_html.replaceAll(""); //过滤html标签 
	    str = str.replaceAll("\\n{2,}", "\n");
	    return str.trim(); //返回文本字符串 
	}
}

