package com.fh.service.system.usermanagement;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.system.Reading;
import com.fh.entity.system.UserManageMent;
import com.fh.util.PageData;

@Service("usermanagementService")
public class UserManageMentService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public void saveUser(UserManageMent user) throws Exception{
		dao.save("UserManageMentMapper.saveUser", user);
	}
	
	public List<UserManageMent> listAll(UserManageMent user) throws Exception{
		return (List<UserManageMent>)dao.findForList("UserManageMentMapper.listAll", user);
	}
	/*
	 * 根据Id查找用户
	 */
	public Object findUserById(String id) throws Exception{
		return dao.findForObject("UserManageMentMapper.findUserById", id);
	}
	/*
	 * 根据year查找用户
	 */
	public List findUsersByYear(String id) throws Exception{
		return (List) dao.findForList("UserManageMentMapper.findUsersByYear", id);
	}
	public List findUsersByYearMonth(PageData pd) throws Exception{
		return (List) dao.findForList("UserManageMentMapper.findUsersByYearMonth",pd);
	}
	/*
	* 登录判断
	*/
	public PageData getUserByNameAndPwd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserManageMentMapper.getUserInfo", pd);
	}
	/*
	* 跟新登录时间和登录次数
	*/
	public void updateLastLoginAndLoginCount(PageData pd)throws Exception{
		dao.update("UserManageMentMapper.updateLastLoginAndLoginCount", pd);
	}
	
	/*
	 * 检查手机号是否存在
	 */
	public boolean checkphone(String phone) throws Exception{
		String id = (String) dao.findForObject("UserManageMentMapper.checkphone", phone);
		if(null!=id&&!id.isEmpty()){
			return true;
		}else{
			return false;
		}
	}
	/*
	 * 更新tempid
	 */
	public void updateTempId(String temp_id,String phone)throws Exception{
		UserManageMent u = new UserManageMent();
		u.setTemp_id(temp_id);
		u.setU_phone(phone);
		dao.update("UserManageMentMapper.updateTempId",u);
	}
	/*
	 * 获取tempid count
	 */
	public Object getTempIdCount(String phone)throws Exception{
		return dao.findForObject("UserManageMentMapper.getTempIdCount",phone);
	}
	public Object getPhoneByTempId(String temp_id)throws Exception{
		return dao.findForObject("UserManageMentMapper.getPhoneByTempId",temp_id);
	}
	
	/*
	 * 更新tempid2
	 */
	public void updateTempId2(String temp_id2,String phone)throws Exception{
		UserManageMent u = new UserManageMent();
		u.setTemp_id2(temp_id2);
		u.setU_phone(phone);
		dao.update("UserManageMentMapper.updateTempId2",u);
	}
	/*
	 * 获取tempid2 count
	 */
	public Object getTempId2(String key)throws Exception{
		if(dao.findForObject("UserManageMentMapper.getTempId2",key)!=null){
			return dao.findForObject("UserManageMentMapper.getTempId2",key);
		}else{
			return null;
		}
	}
	/*
	 * 修改密码
	 */
	public void updatePwd(PageData pd)throws Exception{
		dao.update("UserManageMentMapper.updatePwd",pd);
	}
	/*
	 * update用户
	 */
	public void updateUser(UserManageMent user) throws Exception{
		dao.update("UserManageMentMapper.updateUser",user);
	}
	
	public List<Reading> findMessageByPhone(String PHONE)throws Exception{
		return (List<Reading>) dao.findForList("UserManageMentMapper.findMessageByPhone", PHONE);
	}
	
	public UserManageMent findUserByPhone(String phone)throws Exception{
		return (UserManageMent) dao.findForObject("UserManageMentMapper.findUserByPhone", phone);
	}
	
	public void initFindpwd(String phone)throws Exception{
		dao.update("UserManageMentMapper.initFindpwd", phone);
	}
	public void updateFindPwdCounts(String phone)throws Exception{
		dao.update("UserManageMentMapper.updateFindPwdCounts", phone);
	}
	public Integer getLoginCount(String phone) throws Exception{
		return (Integer) dao.findForObject("UserManageMentMapper.getLoginCount", phone);
	}
	public void updateUserByU_phone(UserManageMent user) throws Exception{
		dao.update("UserManageMentMapper.updateUserByU_phone",user);
	}
}
