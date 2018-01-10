package com.fh.controller.web;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.OperationRecords;
import com.fh.entity.system.UserLoginLog;
import com.fh.entity.system.UserManageMent;
import com.fh.service.system.collection.CollectionService;
import com.fh.service.system.product.AppProductService;
import com.fh.service.system.product.AppProductStableService;
import com.fh.service.system.usermanagement.UserManageMentService;
import com.fh.util.Const;
import com.fh.util.PageData;

@Controller
@RequestMapping("/home")
public class HomeController extends BaseController{
	@Resource(name="usermanagementService")
	private UserManageMentService usermanagementService;
	//关注中心Service
	@Resource(name="collectionService")
	private CollectionService collectionService;
	//固定产品
	@Resource(name="productService")
	private AppProductService appproductService;
	//浮动产品
	@Resource(name="productStableService")
	private AppProductStableService appProductStableService;
	
	@RequestMapping
	public ModelAndView home(String u_phone){
		ModelAndView mv = new ModelAndView();
		try {
			UserManageMent user = usermanagementService.findUserByPhone(u_phone);
			mv.addObject("user",user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("home/home");
		return mv;
	}
	
	@RequestMapping(value="/updateUser")
	@ResponseBody
	public Object updateUser(String u_phone,String u_name,String u_sex){
		UserManageMent user = new UserManageMent();
		user.setU_phone(u_phone);
		user.setU_name(u_name);
		user.setU_sex(u_sex);
		try {
			usermanagementService.updateUserByU_phone(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	/*
	 * 收藏产品列表
	 */
	@RequestMapping("/collectionProducts")
	public ModelAndView collectionProducts(String t){
		ModelAndView mv = null;
		UserManageMent user = (UserManageMent) getSession().getAttribute(Const.SESSION_WEBUSER);
		if(null==user){
			mv = new ModelAndView("redirect:web/index");
			return mv;
		}
		mv = new ModelAndView();
		PageData pd = getPageData();
		pd.put("phone", user.getU_phone());
		try {
			//获取收藏的产品
			List conllectionList =  collectionService.listByPhone(pd);
			List allProductsList = new ArrayList();
			//参数Ids
			List gdids = new ArrayList();
			List fdids = new ArrayList();
			//各类型产品数量
			Map <String,Integer>productCount = new HashMap<String,Integer>();
			//组装产品ids
			for(int i=0;i<conllectionList.size();i++){
				PageData pd1 = (PageData) conllectionList.get(i);
				if("xt".equals(pd1.get("PRODUCT_TYPE"))||"zg".equals(pd1.get("PRODUCT_TYPE"))||
					"qyx".equals(pd1.get("PRODUCT_TYPE"))){
					gdids.add(pd1.get("COLLECTION_PRODUCTID"));
				}else{
					fdids.add(pd1.get("COLLECTION_PRODUCTID"));
				}
			}
			//根据产品ids获取产品列表，并将各类型产品数量统计出来
			if(gdids!=null&&!gdids.isEmpty()){
				List<PageData> gdList = appproductService.findByIds(gdids);
					for(int i=0;i<gdList.size();i++){
						gdList.get(i).put("PRODUCTTYPE", "1");
						if(t!=null&&!"".equals(t)){
							if("xt".equals(t)){
								if(gdList.get(i).get("TYPE").equals("1")){
									allProductsList.add(gdList.get(i));
								}
							}else if("zg".equals(t)){
								if(gdList.get(i).get("TYPE").equals("2")){
									allProductsList.add(gdList.get(i));
								}
							}else if("qyx".equals(t)){
								if(gdList.get(i).get("TYPE").equals("3")){
									allProductsList.add(gdList.get(i));
								}
							}
						}else{
							allProductsList.add(gdList.get(i));
						}
						String typename = (String)gdList.get(i).get("TYPENAME");
						if(productCount.get(typename)==null){
							productCount.put(typename,1);
						}else if(productCount.get(typename)!=null){
							productCount.put(typename,productCount.get(typename)+1);
						}
					}
			}
			if(fdids!=null&&!fdids.isEmpty()){
				List<PageData> fdList = appProductStableService.findByIds(fdids);
				for(int i=0;i<fdList.size();i++){
					fdList.get(i).put("PRODUCTTYPE", "2");
					if(t!=null&&!"".equals(t)){
						if("gqtz".equals(t)){
							if(fdList.get(i).get("TYPE").equals("1")){
								allProductsList.add(fdList.get(i));
							}
						}else if("zfz".equals(t)){
							if(fdList.get(i).get("TYPE").equals("2")){
								allProductsList.add(fdList.get(i));
							}
						}else if("dcdz".equals(t)){
							if(fdList.get(i).get("TYPE").equals("3")){
								allProductsList.add(fdList.get(i));
							}
						}
					}else{
						allProductsList.add(fdList.get(i));
					}
					String typename = (String)fdList.get(i).get("TYPENAME");
					if(productCount.get(typename)==null){
						productCount.put(typename,1);
					}else if(productCount.get(typename)!=null){
						productCount.put(typename,productCount.get(typename)+1);
					}
				}
			}
			mv.addObject("li",t);
			mv.addObject("productCount",productCount);
			mv.addObject("productList",allProductsList);
			mv.addObject("conllectionList",conllectionList);
			mv.setViewName("home/collectionProducts");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	/*
	 * 浏览历史
	 */
	@RequestMapping("/history")
	public ModelAndView history(){
		ModelAndView mv = null;
		UserManageMent user = (UserManageMent) getSession().getAttribute(Const.SESSION_WEBUSER);
		if(null==user){
			mv = new ModelAndView("redirect:web/index");
			return mv;
		}
		mv = new ModelAndView();
		Map<String,String> parms = new HashMap<String,String>();
		parms.put("phone",user.getU_phone());
		parms.put("interval", "2");
		Set<String> typeSet = new HashSet<String>();
		try {
			List<OperationRecords> logList = collectionService.findHistory(parms);
			Map<String,List<JSONObject>> productsMap = new HashMap<String,List<JSONObject>>();
			for(int i=0;i<logList.size();i++){
				OperationRecords log = logList.get(i);
				String comment = log.getComment().split("]]]")[1];
				System.out.println(comment);
				JSONObject product = JSONObject.fromObject(comment); 
				//获取分类
				if(product.get("PRODUCTTYPE").equals("1")){
					if(product.get("TYPE").equals("1")){
						typeSet.add("信托");
					}
					if(product.get("TYPE").equals("2")){
						typeSet.add("资管");
					}
					if(product.get("TYPE").equals("3")){
						typeSet.add("契约型");
					}
				}else{
					if(product.get("TYPE").equals("1")){
						typeSet.add("股权投资");
					}
					if(product.get("TYPE").equals("2")){
						typeSet.add("政府债");
					}
					if(product.get("TYPE").equals("3")){
						typeSet.add("对冲定增");
					}
				}
				List<JSONObject> temlist = productsMap.get((String)product.get("DATE"));
				//放入数据
				if(temlist==null){
					temlist = new ArrayList<JSONObject>();
					temlist.add(product);
					productsMap.put((String)product.get("DATE"),temlist);
				}else{
					if(!temlist.contains(product)){
						temlist.add(product);
						productsMap.put((String)product.get("DATE"),temlist);
					}
				}
			}
			mv.addObject("today",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			mv.addObject("type", typeSet);
			mv.addObject("products", productsMap);
			mv.setViewName("home/history");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	/*
	 * 删除浏览记录
	 */
	@RequestMapping("/delHistory")
	@ResponseBody
	public Object delHistory(){
		PageData pd = getPageData();
		try {
			collectionService.delHistory(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
}
