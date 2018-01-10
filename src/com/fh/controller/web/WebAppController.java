package com.fh.controller.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.system.activityapply.AppActivityApplyService;
import com.fh.service.system.productappointment.AppProductAppointmentService;
import com.fh.service.system.userreferer.UserRefererService;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;

@Controller
@RequestMapping("/web")
public class WebAppController extends BaseController{
	@Resource(name="activityapplyService")
	private AppActivityApplyService activityapplyService;
	@Resource(name="userrefererService")
	private UserRefererService userrefererService;
	
	@RequestMapping("/trust_searchpc")
	public ModelAndView trust_searchpc(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("web/index_carousel/trust_search/trust_search");
		return mv;
	}
	
	@RequestMapping("/trust_search")
	public ModelAndView trust_search(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("web/app/index_carousel/trust_search/trust_search");
		return mv;
	}
	
	@RequestMapping("/submitConsult")
	@ResponseBody
	public Object submitConsult(){
		
		PageData pd = this.getPageData();
		pd.put("ID", UuidUtil.get32UUID());
		pd.put("CTDATE", Tools.date2Str(new Date()));
		try {
			
			activityapplyService.save(pd);
			pd.clear();
			pd.put("msg", "操作成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			pd.clear();
			pd.put("msg", "操作失败");
		}
		System.out.println("");
		return pd;
	}
	
	@RequestMapping("/submitConsultCount")
	@ResponseBody
	public Object submitConsultCount(){
		PageData pd = this.getPageData();
		try {
			userrefererService.updateCount(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
}
