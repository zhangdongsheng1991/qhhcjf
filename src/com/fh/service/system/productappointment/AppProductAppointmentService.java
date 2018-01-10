package com.fh.service.system.productappointment;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.AddressUtils;
import com.fh.util.Const;
import com.fh.util.FileUpload;
import com.fh.util.MD5;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;


@Service("productAppointmentService")
public class AppProductAppointmentService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 保存
	*/
	public void save(PageData pd)throws Exception{
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		AddressUtils u = new AddressUtils();
		String ip = (String) session.getAttribute("ip");
		String channelurl = (String) session.getAttribute("channelurl");
		Integer _port = (Integer) session.getAttribute("_port");
		String pcOrPhone = (String)session.getAttribute("pcOrPhone");
		if(pcOrPhone==null||"".equals(pcOrPhone)){
			pcOrPhone = "电脑端";
		}
		pd.put("IP", ip);
		pd.put("CHANNELURL", channelurl);
		pd.put("_PORT", _port);
		pd.put("PCORPHONE", pcOrPhone);
		String city = u.getAddresses("ip="+ip, "utf-8");
		if(null!=city&&!("").equals(city)){
			pd.put("CITY", city);
		}else{
			pd.put("CITY","未知城市");
		}
		if(session.getAttribute("CHANNEL")==null){
			pd.put("CHANNEL", "直接访问");
		}else{
			pd.put("CHANNEL", session.getAttribute("CHANNEL"));
		}
		dao.save("productAppointmentMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("productAppointmentMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("productAppointmentMapper.edit", pd);
	}
	
	/*
	* 根据主键获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("productAppointmentMapper.findById", pd);
	}
	
	/*
	* 根据参数获取数据
	*/
	public PageData findByParam(PageData pd)throws Exception{
		return (PageData)dao.findForObject("productAppointmentMapper.findByParam", pd);
	}
	
	/*
	* 列表
	*/
	public List<PageData> datalistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("productAppointmentMapper.datalistPage", page);
	}
	
	/*
	* app列表
	*/
	public List<PageData> applistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("productAppointmentMapper.applistPage", page);
	}
	
	/*
	* 列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("productAppointmentMapper.listAll", pd);
	}
	
	/*
	* 批量删除用户
	*/
	public void deleteAll(String[] USER_IDS)throws Exception{
		dao.delete("productAppointmentMapper.deleteAll", USER_IDS);
	}
	
}

