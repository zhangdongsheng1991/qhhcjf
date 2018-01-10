package com.fh.service.system.usermanagement.usermanagement.userlog;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.system.OperationRecords;
import com.fh.entity.system.UserLoginLog;

@Service("userloginlogService")
public class UserLoginLogService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	public void addUserLoginLog(UserLoginLog userloginlog) throws Exception{
		dao.save("UserLoginLogMapper.addUserLoginLog", userloginlog);
	}
	public void addOperationRecords(OperationRecords records) throws Exception{
		dao.save("UserLoginLogMapper.addOperationRecords", records);
	}
	
	public List findLoginLogByPhone(String phone)throws Exception{
		return (List) dao.findForList("UserLoginLogMapper.findLoginLogByPhone", phone);
	}
	public List findOperationRecordsByLoginCount(Map map)throws Exception{
		return (List) dao.findForList("UserLoginLogMapper.findOperationRecordsByLoginCount", map);
	}
}
