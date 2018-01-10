package com.fh.service.system.privateequity;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("PrivateEquityService")
public class AppPrivateEquityService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 保存
	*/
	public void save(PageData pd)throws Exception{
		dao.save("PrivateEquityMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("PrivateEquityMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("PrivateEquityMapper.edit", pd);
	}
	
	/*
	* 根据主键获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PrivateEquityMapper.findById", pd);
	}
	
	/*
	* 根据参数获取数据
	*/
	public PageData findByParam(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PrivateEquityMapper.findByParam", pd);
	}
	
	/*
	* 列表
	*/
	public List<PageData> datalistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("PrivateEquityMapper.datalistPage", page);
	}
	
	/*
	* app列表
	*/
	public List<PageData> applistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("PrivateEquityMapper.applistPage", page);
	}
	
	/*
	* 浮动收益右
	*/
	public List<PageData> appFloatlistRight(Page page)throws Exception{
		return (List<PageData>) dao.findForList("PrivateEquityMapper.appFloatlistRight", page);
	}
	/*
	* 浮动收益左
	*/
	public List<PageData> appPrivateEquityList(Page page)throws Exception{
		return (List<PageData>) dao.findForList("PrivateEquityMapper.appPrivateEquityList", page);
	}
	/*
	* 私募首页列表
	*/
	public List<PageData> appFloatlistLeft(Page page)throws Exception{
		return (List<PageData>) dao.findForList("PrivateEquityMapper.appFloatlistLeft", page);
	}
	
	/*
	* 列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("PrivateEquityMapper.listAll", pd);
	}
	
	/*
	* 批量删除用户
	*/
	public void deleteAll(String[] USER_IDS)throws Exception{
		dao.delete("PrivateEquityMapper.deleteAll", USER_IDS);
	}
	
}

