package com.fh.service.system.usermanagement;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.system.MessageManagement;
import com.fh.entity.system.Reading;
import com.fh.util.PageData;

@Service("messagemanagementservice")
public class MessageManagementService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public List<MessageManagement> listMessages(MessageManagement mm) throws Exception{
		return (List<MessageManagement>) dao.findForList("MessageManagementMapper.listMessages", mm);
	}
	
	public Object findMessageById(String id) throws Exception{
		return dao.findForObject("MessageManagementMapper.findMessageById", id);
	}
	
	public void saveMessage(MessageManagement mm) throws Exception{
		dao.save("MessageManagementMapper.saveMessage", mm);
	}
	public void updateMessage(MessageManagement mm) throws Exception{
		dao.save("MessageManagementMapper.updateMessage", mm);
	}
	
	public void addReading(Reading r)throws Exception{
		dao.save("MessageManagementMapper.addReading", r);
	}
	public void deleteReading(String id)throws Exception{
		dao.save("MessageManagementMapper.deleteReading", id);
	}
	
	public void minusReading(PageData pd)throws Exception{
		dao.update("MessageManagementMapper.minusReading", pd);
	}
	
	public void deleteMessage(String sf_ids[]) throws Exception{
		dao.delete("MessageManagementMapper.deleteMessage",sf_ids);
		dao.delete("MessageManagementMapper.deleteAllReading",sf_ids);
	}
	
	public List findReadingByMessageId(Map map) throws Exception{
		return (List) dao.findForList("MessageManagementMapper.findReadingByMessageId", map);
	}
	
	public Integer findReadingCountByMessageId(String messageid) throws Exception{
		return (Integer) dao.findForObject("MessageManagementMapper.findReadingCountByMessageId", messageid);
	}
	
	public Integer listMessagesCount(MessageManagement mm) throws Exception{
		return (Integer) dao.findForObject("MessageManagementMapper.listMessagesCount", mm);
	}
}
