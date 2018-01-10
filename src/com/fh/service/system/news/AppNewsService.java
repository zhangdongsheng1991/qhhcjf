package com.fh.service.system.news;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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


@Service("newsService")
public class AppNewsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 保存
	*/
	public void save(PageData pd)throws Exception{
		dao.save("NewsMapper.save", pd);
	}
	/**
	 * 保存TAG
	 */
	public void savetag(PageData pd)throws Exception{
		dao.save("NewsMapper.savetag", pd);
	}
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("NewsMapper.delete", pd);
	}
	/*
	* 删除
	*/
	public void deletetag(PageData pd)throws Exception{
		dao.delete("NewsMapper.deletetag", pd);
	}
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("NewsMapper.edit", pd);
	}
	public void edittag(PageData pd)throws Exception{
		dao.update("NewsMapper.edittag", pd);
	}
	/*
	* 修改
	*/
	public void editSidIsNull(PageData pd)throws Exception{
		dao.update("NewsMapper.editSidIsNull", pd);
	}
	
	/*
	* 修改
	*/
	public void editXidIsNull(PageData pd)throws Exception{
		dao.update("NewsMapper.editXidIsNull", pd);
	}
	
	/*
	* 根据主键获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("NewsMapper.findById", pd);
	}
	/*
	* 根据主键获取数据
	*/
	public List<PageData> findByNewsId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("NewsMapper.findByNewsId", pd);
	}
	
	/*
	* 根据TYPE获取最后一次添加的数据 
	*/
	public PageData lastAdd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("NewsMapper.lastAdd", pd);
	}
	
	/*
	* 根据参数获取数据
	*/
	public PageData findByParam(PageData pd)throws Exception{
		return (PageData)dao.findForObject("NewsMapper.findByParam", pd);
	}
	
	
	
	/*
	* 根据TYPE获取数据集合 
	*/
	public List<PageData> getTypeListAll(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("NewsMapper.getTypeListAll", pd);
	}
	
	/*
	* 列表
	*/
	public List<PageData> getNewsList(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("NewsMapper.getNewsList", pd);
	}
	public List<PageData> getTagList(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("NewsMapper.getTagList", pd);
	}
	/*
	* 列表
	*/
	public List<PageData> getNewsIndexList(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("NewsMapper.getNewsIndexList", pd);
	}
	
	/*
	* 列表
	*/
	public List<PageData> datalistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("NewsMapper.datalistPage", page);
	}
	
	/*
	* app列表
	*/
	public List<PageData> applistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("NewsMapper.applistPage", page);
	}
	
	/*
	* 获取产品 新闻
	*/
	public List<PageData> getList(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("NewsMapper.getList", pd);
	}
	
	/*
	* 列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("NewsMapper.listAll", pd);
	}
	
	/*
	* 批量删除用户
	*/
	public void deleteAll(String[] USER_IDS)throws Exception{
		dao.delete("NewsMapper.deleteAll", USER_IDS);
	}
	public void deletetagbyid(PageData pd)throws Exception{
		dao.delete("NewsMapper.deletetagbyid", pd);
	}
	public List<PageData> getHotNewsList(PageData pd) throws Exception{
		List<PageData> t_hotList =   (List<PageData>)dao.findForList("NewsMapper.getHotNewsList", pd);
		List<PageData> hostList = new ArrayList<PageData>();
		Random r = new Random();
		int count = 7;
		if(t_hotList.size()<7){
			hostList.addAll(t_hotList);
		}else{
			for(int i=0;i<7;i++){
				int random = r.nextInt(t_hotList.size());
				pd = t_hotList.get(random);
				if(!hostList.contains(pd)){
					hostList.add(pd);
				}else{
					i--;
				}
			}
		}
		return hostList;
	}
}

