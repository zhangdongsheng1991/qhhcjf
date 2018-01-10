package com.fh.service.system.condition;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("conditionService")
public class AppConditionService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 保存
	*/
	public void save(PageData pd)throws Exception{
		dao.save("ConditionMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("ConditionMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("ConditionMapper.edit", pd);
	}
	
	/*
	* 根据主键获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ConditionMapper.findById", pd);
	}
	
	/*
	* 根据参数获取数据
	*/
	public PageData findByParam(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ConditionMapper.findByParam", pd);
	}
	
	/*
	* 列表
	*/
	public List<PageData> datalistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ConditionMapper.datalistPage", page);
	}
	
	/*
	* app列表
	*/
	public List<PageData> applistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ConditionMapper.applistPage", page);
	}
	
	/*
	* 列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ConditionMapper.listAll", pd);
	}
	
	/*
	* 批量删除用户
	*/
	public void deleteAll(String[] USER_IDS)throws Exception{
		dao.delete("ConditionMapper.deleteAll", USER_IDS);
	}
	
}

