package com.fh.entity.system;

import java.util.Date;

public class MessageManagement {
	private String id;
	private String messagetype;   //0,产品 消息，1，系统消息
	private String messagecontent;
	private String sendtime;
	private String sendee_id;  //接收人ID
	private String status;  //0,发布；1，保存
	private String ctdate;
	private String subject;
	private String productids;
	private int pageSize;
	private int pageNumber;
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getProductids() {
		return productids;
	}
	public void setProductids(String productids) {
		this.productids = productids;
	}
	private String ids[];
	public String[] getIds() {
		return ids;
	}
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCtdate() {
		return ctdate;
	}
	public void setCtdate(String ctdate) {
		this.ctdate = ctdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMessagetype() {
		return messagetype;
	}
	public void setMessagetype(String messagetype) {
		this.messagetype = messagetype;
	}
	public String getMessagecontent() {
		return messagecontent;
	}
	public void setMessagecontent(String messagecontent) {
		this.messagecontent = messagecontent;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getSendee_id() {
		return sendee_id;
	}
	public void setSendee_id(String sendee_id) {
		this.sendee_id = sendee_id;
	}
	
}
