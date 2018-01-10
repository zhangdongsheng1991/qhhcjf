package com.fh.service.system.friendlylink;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service(value="friendlylinkService")
public class FriendlyLinkService {
	
	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	public List<PageData> datalistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("FriendlyLinkMapper.datalistPage", page);
	}
	public List<PageData> listAll(String temp) throws Exception{
		return (List<PageData>) dao.findForList("FriendlyLinkMapper.listAll", temp);
	} 
	public void saveFriendlyLink(PageData pd) throws Exception{
		dao.save("FriendlyLinkMapper.saveFriendlyLink", pd);
	}
	
	public void deleteFriendlyLink(PageData pd)throws Exception{
		dao.delete("FriendlyLinkMapper.deleteFriendlyLink", pd);
	}
	/*
	* 批量删除用户
	*/
	public void deleteAll(String[] IDS)throws Exception{
		dao.delete("FriendlyLinkMapper.deleteAll", IDS);
	}
	
	public void updateFriendlyLink(PageData pd)throws Exception{
		dao.delete("FriendlyLinkMapper.updateFriendlyLink", pd);
	}
	
	public PageData getFriendlyLinkById(PageData pd) throws Exception{
		return (PageData)dao.findForObject("FriendlyLinkMapper.getFriendlyLinkById", pd);
	}
}
