package com.fh.service.system.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("productStableService")
public class AppProductStableService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 保存
	*/
	public void save(PageData pd)throws Exception{
		dao.save("ProductStableMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("ProductStableMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("ProductStableMapper.edit", pd);
	}
	
	/*
	* 修改
	*/
	public void editSort(PageData pd)throws Exception{
		dao.update("ProductStableMapper.editSort", pd);
	}
	
	
	/*
	* 根据主键获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProductStableMapper.findById", pd);
	}
	
	/*
	* 产品详情 产品列表
	*/
	public List<PageData> findProductInfoList(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.findProductInfoList", pd);
	}
	
	/*
	* 根据参数获取数据
	*/
	public PageData findByParam(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProductStableMapper.findByParam", pd);
	}
	
	/*
	* 列表
	*/
	public List<PageData> datalistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.datalistPage", page);
	}
	
	
	
	/*
	* 根据主键获取数据
	*/
	public PageData applistById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProductStableMapper.applistById", pd);
	}
	
	
	/*
	* app列表
	*/
	public List<PageData> applistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.applistPage", page);
	}
	
	/*
	* 浮动详情推荐列表
	*/
	public List<PageData> appFloatPush(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.appFloatPush", pd);
	}
	
	/*
	* 首页浮动收益列表右
	*/
	public List<PageData> appFloatlistRight(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.appFloatlistRight", page);
	}
	/*
	* 首页浮动收益列表左
	*/
	public List<PageData> appFloatlistLeft(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.appFloatlistLeft", pd);
	}
	
	/** 统计总条数 **/
	public int countNumber(PageData pd)throws Exception{
		return (int) dao.findForObject("ProductStableMapper.countNumber", pd);
	}
	/*
	* 私募首页列表
	*/
	public List<PageData> appPrivateList(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.appPrivateList", page);
	}
	
	/*
	* 定增首页列表
	*/
	public List<PageData> appSetincreaseList(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.appSetincreaseList", page);
	}
	
	/*
	* 定增首页列表
	*/
	public List<PageData> appOffsetList(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.appOffsetList", page);
	}
	
	/*
	* 热推首页列表
	*/
	public List<PageData> appHotList(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.appHotList", page);
	}
	
	/*
	* 列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ProductStableMapper.listAll", pd);
	}
	
	/*
	* 搜索
	*/
	public int countSearch(PageData pd)throws Exception{
		return  (int) dao.findForObject("ProductStableMapper.countSearch", pd);
	}
	
	/*
	* 搜索列表
	*/
	public List<PageData> countSearchlistPage(Page page)throws Exception{
		return  (List<PageData>) dao.findForList("ProductStableMapper.countSearchlistPage", page);
	}
	
	/*
	* 批量删除用户
	*/
	public void deleteAll(String[] USER_IDS)throws Exception{
		dao.delete("ProductStableMapper.deleteAll", USER_IDS);
	}
	public List<PageData> findByIds(List ids)throws Exception{
		return (List<PageData>)dao.findForObject("ProductStableMapper.findByIds", ids);
	}
}

