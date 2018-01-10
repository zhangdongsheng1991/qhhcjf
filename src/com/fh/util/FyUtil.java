package com.fh.util;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;

@Service("fyutil")
public class FyUtil {
	private int pageSize=10;
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	public static int getPageCount(int count,int pageSize){
		int pagecount;
		if(count%pageSize==0){
				pagecount = count/pageSize;
		}else{
			pagecount = (count/pageSize)+1;
		}
		return pagecount;
	}
	public  List<PageData> list_fy(String pageNowStr,String columns,String tablename,String condition,String order,PageData pd)throws Exception{
		int begin;
		int pageNow = Integer.parseInt(pageNowStr);
		if(pageNow==1){
		   begin = 0;
		}
		begin = (pageNow-1)*pageSize;
		pd.put("begin", begin);
		pd.put("pageSize", pageSize);
		pd.put("tablename", tablename);
		pd.put("columns", columns);
		pd.put("condition", condition);
		pd.put("order", order);
		return (List<PageData>) dao.findForList("FyUtil.list_fy", pd);
	}
	public  List<PageData> list_fy(String pageNowStr,String columns,String tablename,String condition,String order,int pageSize,PageData pd)throws Exception{
		int begin;
		int pageNow = Integer.parseInt(pageNowStr);
		if(pageNow==1){
		   begin = 0; 
		}
		begin = (pageNow-1)*pageSize;
		pd.put("begin", begin);
		pd.put("pageSize", pageSize);
		pd.put("columns", columns);
		pd.put("tablename", tablename);
		pd.put("condition", condition);
		pd.put("order", order);
		return (List<PageData>) dao.findForList("FyUtil.list_fy", pd);
	}
}
