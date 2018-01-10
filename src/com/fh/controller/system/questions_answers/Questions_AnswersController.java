package com.fh.controller.system.questions_answers;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.questions_answers.Questions_AnswersService;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.Logger;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Tools;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping({"/questions_answers"})
public class Questions_AnswersController extends BaseController
{
  String menuUrl = "questions_answers/list.do";

  @Resource(name="questions_answersService")
  private Questions_AnswersService questions_answersService;

  @RequestMapping({"/save"})
  public ModelAndView save() throws Exception { logBefore(this.logger, "新增Questions_Answers");
    if (!Jurisdiction.buttonJurisdiction(this.menuUrl, "add")) return null;
    ModelAndView mv = getModelAndView();
    PageData pd = new PageData();
    pd = getPageData();
    pd.put("ID", get32UUID());
    pd.put("DATE", Tools.date2Str(new Date()));
    this.questions_answersService.save(pd);
    mv.addObject("msg", "success");
    mv.setViewName("save_result");
    return mv;
  }

  @RequestMapping({"/delete"})
  public void delete(PrintWriter out)
  {
    logBefore(this.logger, "删除Questions_Answers");
    if (!Jurisdiction.buttonJurisdiction(this.menuUrl, "del")) return;
    PageData pd = new PageData();
    try {
      pd = getPageData();
      this.questions_answersService.delete(pd);
      out.write("success");
      out.close();
    } catch (Exception e) {
      this.logger.error(e.toString(), e);
    }
  }

  @RequestMapping({"/edit"})
  public ModelAndView edit()
    throws Exception
  {
    logBefore(this.logger, "修改Questions_Answers");
    if (!Jurisdiction.buttonJurisdiction(this.menuUrl, "edit")) return null;
    ModelAndView mv = getModelAndView();
    PageData pd = new PageData();
    pd = getPageData();
    this.questions_answersService.edit(pd);
    mv.addObject("msg", "success");
    mv.setViewName("save_result");
    return mv;
  }

  @RequestMapping({"/list"})
  public ModelAndView list(Page page)
  {
    logBefore(this.logger, "列表Questions_Answers");

    ModelAndView mv = getModelAndView();
    PageData pd = new PageData();
    try {
      pd = getPageData();
      page.setPd(pd);
      List varList = this.questions_answersService.list(page);
      mv.setViewName("system/questions_answers/questions_answers_list");
      mv.addObject("varList", varList);
      mv.addObject("pd", pd);
      mv.addObject("QX", getHC());
    } catch (Exception e) {
      this.logger.error(e.toString(), e);
    }
    return mv;
  }

  @RequestMapping({"/goAdd"})
  public ModelAndView goAdd()
  {
    logBefore(this.logger, "去新增Questions_Answers页面");
    ModelAndView mv = getModelAndView();
    PageData pd = new PageData();
    pd = getPageData();
    try {
      mv.setViewName("system/questions_answers/questions_answers_edit");
      mv.addObject("msg", "save");
      mv.addObject("pd", pd);
    } catch (Exception e) {
      this.logger.error(e.toString(), e);
    }
    return mv;
  }

  @RequestMapping({"/goEdit"})
  public ModelAndView goEdit()
  {
    logBefore(this.logger, "去修改Questions_Answers页面");
    ModelAndView mv = getModelAndView();
    PageData pd = new PageData();
    pd = getPageData();
    try {
      pd = this.questions_answersService.findById(pd);
      mv.setViewName("system/questions_answers/questions_answers_edit");
      mv.addObject("msg", "edit");
      mv.addObject("pd", pd);
    } catch (Exception e) {
      this.logger.error(e.toString(), e);
    }
    return mv;
  }

  @RequestMapping({"/deleteAll"})
  @ResponseBody
  public Object deleteAll()
  {
    logBefore(this.logger, "批量删除Questions_Answers");
    if (!Jurisdiction.buttonJurisdiction(this.menuUrl, "dell")) return null;
    PageData pd = new PageData();
    Map map = new HashMap();
    try {
      pd = getPageData();
      List pdList = new ArrayList();
      String DATA_IDS = pd.getString("DATA_IDS");
      if ((DATA_IDS != null) && (!"".equals(DATA_IDS))) {
        String[] ArrayDATA_IDS = DATA_IDS.split(",");
        this.questions_answersService.deleteAll(ArrayDATA_IDS);
        pd.put("msg", "ok");
      } else {
        pd.put("msg", "no");
      }
      pdList.add(pd);
      map.put("list", pdList);
    } catch (Exception e) {
      this.logger.error(e.toString(), e);
    } finally {
      logAfter(this.logger);
    }
    return AppUtil.returnObject(pd, map);
  }

  @RequestMapping({"/excel"})
  public ModelAndView exportExcel()
  {
    logBefore(this.logger, "导出Questions_Answers到excel");
    if (!Jurisdiction.buttonJurisdiction(this.menuUrl, "cha")) return null;
    ModelAndView mv = new ModelAndView();
    PageData pd = new PageData();
    pd = getPageData();
    try {
      Map dataMap = new HashMap();
      List titles = new ArrayList();
      titles.add("类别");
      titles.add("问题");
      titles.add("回答");
      titles.add("阅读量");
      titles.add("优先级");
      titles.add("是否精华");
      dataMap.put("titles", titles);
      List varOList = this.questions_answersService.listAll(pd);
      List varList = new ArrayList();
      for (int i = 0; i < varOList.size(); i++) {
        PageData vpd = new PageData();
        vpd.put("var1", ((PageData)varOList.get(i)).getString("CATEGORY"));
        vpd.put("var2", ((PageData)varOList.get(i)).getString("QUESTION"));
        vpd.put("var3", ((PageData)varOList.get(i)).getString("ANSWER"));
        vpd.put("var4", ((PageData)varOList.get(i)).get("READING").toString());
        vpd.put("var5", ((PageData)varOList.get(i)).get("PRIORITY").toString());
        vpd.put("var6", ((PageData)varOList.get(i)).get("RSUV").toString());
        varList.add(vpd);
      }
      dataMap.put("varList", varList);
      ObjectExcelView erv = new ObjectExcelView();
      mv = new ModelAndView(erv, dataMap);
    } catch (Exception e) {
      this.logger.error(e.toString(), e);
    }
    return mv;
  }

  public Map<String, String> getHC()
  {
    Subject currentUser = SecurityUtils.getSubject();
    Session session = currentUser.getSession();
    return (Map)session.getAttribute("QX");
  }

  @InitBinder
  public void initBinder(WebDataBinder binder) {
    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
  }
}