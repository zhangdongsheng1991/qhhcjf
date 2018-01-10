package com.fh.service.system.collection;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.system.OperationRecords;
import com.fh.util.PageData;

@Service("collectionService")
public class CollectionService {
	
	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	//收藏、取消收藏产品
	public void collectionProduct(PageData pd) throws Exception{
		if("no".equals(pd.getString("collection"))){
			dao.save("CollectionMapper.insertCollection", pd);
		}else if("yes".equals(pd.getString("collection"))){
			dao.delete("CollectionMapper.deleteCollection",pd);
		}
	}
	public List listByPhone(PageData pd)throws Exception{
		return (List) dao.findForList("CollectionMapper.listcollection",pd);
	}
	
	//浏览记录
	public List<OperationRecords> findHistory(Map<String,String> parms)throws Exception{
		return (List<OperationRecords>) dao.findForList("CollectionMapper.findHistory",parms);
	}
	//删除浏览记录
	public void delHistory(PageData pd)throws Exception{
		dao.update("CollectionMapper.delHistory",pd);
	}
}
