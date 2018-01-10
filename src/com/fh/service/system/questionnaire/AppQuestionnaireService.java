package com.fh.service.system.questionnaire;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.FileUpload;
import com.fh.util.MD5;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;


@Service("questionnaireService")
public class AppQuestionnaireService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//======================================================================================
	
	/*
	* 保存
	*/
	public void save(PageData pd)throws Exception{
		dao.save("QuestionnaireMapper.save", pd);
	}
	
	/*
	* 保存
	*/
	public void saves(PageData pd)throws Exception{
		String questionnaires = pd.getString("questionnaires");
		if(pd.getString("ID")!=null && !"".equals(pd.getString("ID"))){
			dao.update("QuestionnaireMapper.edit", pd);
		}else{
			pd.put("ID", UuidUtil.get32UUID());
			pd.put("CTDATE", Tools.date2Str(new Date()));
			dao.save("QuestionnaireMapper.save", pd);
		}
		dao.delete("QuestionnaireoptionMapper.deletes", pd.getString("ID"));
		dao.delete("QuestionnairetitleMapper.deletes", pd.getString("ID"));
		String questionnairetitles [] = questionnaires.split("===");
		for (int i = 0; i < questionnairetitles.length; i++) {
				String questionnaireoptions [] = questionnairetitles[i].split(",,,");
				PageData title = new PageData();
				for (int j = 0; j < questionnaireoptions.length; j++) {
					String questionnairetitle = questionnaireoptions[j];
					String questionnairetitless[] = questionnairetitle.split("---");
					System.out.println("questionnairetitless.length="+questionnairetitless.length);
					if(questionnairetitless.length>=2){
						if(j==0){
							title.put("ID", questionnairetitless[1]);
							title.put("NAME", questionnairetitless[0]);
							title.put("QUESTIONNAIREID", pd.getString("ID"));
							title.put("NUMBER", (i+1));
							if("0".equals(title.get("ID").toString())){
								title.put("ID", UuidUtil.get32UUID());
								dao.save("QuestionnairetitleMapper.save", title);
							}else{
								dao.save("QuestionnairetitleMapper.save", title);
							}
						}else{
							PageData ques = new PageData();
							ques.put("ID", questionnairetitless[1]);
							ques.put("NAME", questionnairetitless[0]);
							ques.put("QUESTIONNAIRETITLEID", title.get("ID").toString());
							ques.put("NUMBER", (j));
							ques.put("QUESTIONNAIREID", pd.getString("ID"));
							if("0".equals(ques.get("ID").toString())){
								ques.put("ID", UuidUtil.get32UUID());
								dao.save("QuestionnaireoptionMapper.save", ques);
							}else{
								dao.save("QuestionnaireoptionMapper.save", ques);
							}
						}
					}
				}
		}
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("QuestionnaireMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("QuestionnaireMapper.edit", pd);
	}
	
	/*
	* 修改
	*/
	public void editStatus(PageData pd)throws Exception{
		dao.update("QuestionnaireMapper.editStatus", pd);
	}
	
	/*
	* 根据主键获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("QuestionnaireMapper.findById", pd);
	}
	
	/*
	* 根据参数获取数据
	*/
	public PageData findByParam(PageData pd)throws Exception{
		return (PageData)dao.findForObject("QuestionnaireMapper.findByParam", pd);
	}
	
	/*
	* 列表
	*/
	public List<PageData> datalistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("QuestionnaireMapper.datalistPage", page);
	}
	
	/*
	* app列表
	*/
	public List<PageData> applistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("QuestionnaireMapper.applistPage", page);
	}
	
	/*
	* 列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("QuestionnaireMapper.listAll", pd);
	}
	
	/*
	* 批量删除用户
	*/
	public void deleteAll(String[] USER_IDS)throws Exception{
		dao.delete("QuestionnaireMapper.deleteAll", USER_IDS);
	}
	
}

