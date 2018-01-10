package com.fh.service.system.institution;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.annotation.Resource;

import net.sourceforge.pinyin4j.PinyinHelper;

import org.junit.Test;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.FileUpload;
import com.fh.util.GetPinyin;
import com.fh.util.MD5;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;


@Service("institutionService")
public class AppInstitutionService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 保存
	*/ 
	public void save(PageData pd)throws Exception{
		dao.save("InstitutionMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("InstitutionMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("InstitutionMapper.edit", pd);
	}
	
	/*
	* 根据主键获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("InstitutionMapper.findById", pd);
	}
	
	/*
	* 根据参数获取数据
	*/
	public PageData findByParam(PageData pd)throws Exception{
		return (PageData)dao.findForObject("InstitutionMapper.findByParam", pd);
	}
	
	/*
	* 列表
	*/
	public List<PageData> datalistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("InstitutionMapper.datalistPage", page);
	}
	
	/*
	* app列表
	*/
	public List<PageData> applistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("InstitutionMapper.applistPage", page);
	}
	
	/*
	* 列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("InstitutionMapper.listAll", pd);
	}
	public List<PageData> listAllXT(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("InstitutionMapper.listAllXT", pd);
	}
	public List<PageData> list_fy(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("InstitutionMapper.list_fy", pd);
	}
	/*
	* 批量删除用户
	*/
	public void deleteAll(String[] USER_IDS)throws Exception{
		dao.delete("InstitutionMapper.deleteAll", USER_IDS);
	}
	public List<PageData> getProductsByCompany(Page page)throws Exception{
		return (List<PageData>) dao.findForList("InstitutionMapper.getProductsByCompany", page);
	}
	public List<PageData> listAllSearch(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("InstitutionMapper.listAllSearch", pd);
	}
	public List<String> getLocation(PageData pd)throws Exception{
		return (List<String>) dao.findForList("InstitutionMapper.getLocation", pd);
	}
	public Map getPinYinLocation(List<String> list){
		Map<String,Set<String>> pinyinLocation = new TreeMap<String,Set<String>>();
		for(int i=0;i<list.size();i++){
			String location = list.get(i);
			String pinyinHead = GetPinyin.getPinYinHeadChar(location);
			String pinyinfirstHead = "";
			if(null!=pinyinHead&&!pinyinHead.isEmpty()){
				pinyinfirstHead = pinyinHead.substring(0,1);
			}
			if(null==pinyinLocation.get(pinyinfirstHead)){
				if(pinyinfirstHead.matches("^[a-z]")){
					Set<String> set = new HashSet<String>();
					set.add(list.get(i).trim());
					pinyinLocation.put(pinyinfirstHead,set);
				}
			}else{
				Set<String> set = pinyinLocation.get(pinyinfirstHead);
				set.add(location.trim());
				pinyinLocation.put(pinyinfirstHead,set);
			}
		}
			
		return pinyinLocation;
	}
}

