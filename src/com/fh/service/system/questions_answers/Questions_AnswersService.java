package com.fh.service.system.questions_answers;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("questions_answersService")
public class Questions_AnswersService
{

  @Resource(name="daoSupport")
  private DaoSupport dao;

  public void save(PageData pd)
    throws Exception
  {
    this.dao.save("Questions_AnswersMapper.save", pd);
  }

  public void delete(PageData pd)
    throws Exception
  {
    this.dao.delete("Questions_AnswersMapper.delete", pd);
  }

  public void edit(PageData pd)
    throws Exception
  {
    this.dao.update("Questions_AnswersMapper.edit", pd);
  }

  public List<PageData> list(Page page)
    throws Exception
  {
    return (List)this.dao.findForList("Questions_AnswersMapper.datalistPage", page);
  }
  public List<PageData> listOrderByReading(Page page) throws Exception {
    return (List)this.dao.findForList("Questions_AnswersMapper.listOrderByReading", page);
  }

  public List<PageData> listAll(PageData pd)
    throws Exception
  {
    return (List)this.dao.findForList("Questions_AnswersMapper.listAll", pd);
  }

  public PageData findById(PageData pd)
    throws Exception
  {
    return (PageData)this.dao.findForObject("Questions_AnswersMapper.findById", pd);
  }

  public void deleteAll(String[] ArrayDATA_IDS)
    throws Exception
  {
    this.dao.delete("Questions_AnswersMapper.deleteAll", ArrayDATA_IDS);
  }

  public List<PageData> findByCategory(Page page) throws Exception {
    return (List)this.dao.findForList("Questions_AnswersMapper.findByCategory", page);
  }

  public List<PageData> findByCategoryOrderByReading(Page page) throws Exception {
    return (List)this.dao.findForList("Questions_AnswersMapper.findByCategoryOrderByReading", page);
  }
  public List<PageData> findByCategoryOrderbyDate(Page page) throws Exception {
    return (List)this.dao.findForList("Questions_AnswersMapper.findByCategoryOrderbyDate", page);
  }
  public List<PageData> getRightList(Page page) throws Exception {
    return (List)this.dao.findForList("Questions_AnswersMapper.getRightList", page);
  }
  
}