package com.fh.service.system.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("productService")
public class AppProductService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 保存
	*/
	public void save(PageData pd)throws Exception{
		dao.save("ProductMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("ProductMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("ProductMapper.edit", pd);
	}
	
	/*
	* 修改
	*/
	public void editSort(PageData pd)throws Exception{
		dao.update("ProductMapper.editSort", pd);
	}
	
	/*
	* 根据主键获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProductMapper.findById", pd);
	}
	
	/*
	* 根据参数获取数据
	*/
	public PageData findByParam(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProductMapper.findByParam", pd);
	}
	
	/*
	* 产品详情 产品列表
	*/
	public List<PageData> findProductInfoList(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.findProductInfoList", pd);
	}
	
	/*
	* 列表
	*/
	public List<PageData> datalistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.datalistPage", page);
	}
	
	
	
	/*
	* 根据主键获取数据
	*/
	public PageData applistById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProductMapper.applistById", pd);
	}
	
	/**
	 * 获取最新上线前四条
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> getNewProductList(Page page,PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ProductMapper.applistNewProduct", page);
	}
	
	/**
	 *  app首页 20条
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> appIndexlistNewProduct(Page page,PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ProductMapper.appIndexlistNewProduct", page);
	}
	
	public List<PageData> appfindProductsListBySearchName(Page page,PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ProductMapper.appfindProductsListBySearchName", page);
	}
	
	
	/*
	* 固定收益详情推荐列表
	*/
	public List<PageData> appSolidPush(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.applistNewProduct", pd);
	}
	
	/*
	* app列表
	*/
	public List<PageData> applistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.applistPage", page);
	}
	/*
	* 热门推荐列表上
	*/
	public List<PageData> applistPushTop(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.applistPushTop", page);
	}
	/*
	* 热门推荐列表下
	*/
	public List<PageData> applistPushBelow(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.applistPushBelow", page);
	}
	
	/*
	* 固定收益信托右
	*/
	public List<PageData> applistTrustRight(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.applistTrustRight", page);
	}
	
	/*
	* 固定收益信托左
	*/
	public List<PageData> applistTrustLeft(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.applistTrustLeft", pd);
	}
	
	/*
	* 统计总条数
	*/
	public int countNumber(PageData pd)throws Exception{
		return (int) dao.findForObject("ProductMapper.countNumber", pd);
	}
	
	/*
	* 信托首页列表
	*/
	public List<PageData> appTrustList(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.appTrustList", pd);
	}
	/*
	* 资管首页列表
	*/
	public List<PageData> appMISList(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.appMISList", page);
	}
	
	/*
	* 契约首页列表
	*/
	public List<PageData> appCovenantList(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.appCovenantList", page);
	}
	
	/*
	* 私募首页列表
	*/
	public List<PageData> appPrivateList(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.appPrivateList", page);
	}
	
	/*
	* 定增首页列表
	*/
	public List<PageData> appSetincreaseList(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.appSetincreaseList", page);
	}
	
	/*
	* 定增首页列表
	*/
	public List<PageData> appOffsetList(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.appOffsetList", page);
	}
	
	/*
	* 列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.listAll", pd);
	}
	
	/*
	* 搜索
	*/
	public int countSearch(PageData pd)throws Exception{
		return  (int) dao.findForObject("ProductMapper.countSearch", pd);
	}
	
	/*
	* 搜索列表
	*/
	public List<PageData> countSearchlistPage(Page page)throws Exception{
		return  (List<PageData>) dao.findForList("ProductMapper.countSearchlistPage", page);
	}
	public List<PageData> countAllSearchlistPage(Page page)throws Exception{
		return  (List<PageData>) dao.findForList("ProductMapper.countAllSearchlistPage", page);
	}
	/*
	* 批量删除用户
	*/
	public void deleteAll(String[] USER_IDS)throws Exception{
		dao.delete("ProductMapper.deleteAll", USER_IDS);
	}
	public List findAllBookingProduct()throws Exception{
		return (List) dao.findForList("ProductMapper.findAllBookingProduct","");
	}
	
	public Object findByIdStr(String productids) throws Exception{
		return dao.findForObject("ProductMapper.findByIdStr",productids);
	} 
	public List<PageData> findByIds(List ids)throws Exception{
		return (List<PageData>) dao.findForList("ProductMapper.findByIds",ids);
	}
}

