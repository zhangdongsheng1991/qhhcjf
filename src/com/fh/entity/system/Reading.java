package com.fh.entity.system;

public class Reading {
	private String id;
	private String messageid;
	private String userid;
	private String readingdate;
	private String sendtime;
	private String state;  //0,未读，1,已读
	private String messagetype; //0,产品消息 1,系统消息
	public String getMessagetype() {
		return messagetype;
	}
	public void setMessagetype(String messagetype) {
		this.messagetype = messagetype;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMessageid() {
		return messageid;
	}
	public void setMessageid(String messageid) {
		this.messageid = messageid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReadingdate() {
		return readingdate;
	}
	public void setReadingdate(String readingdate) {
		this.readingdate = readingdate;
	}
	
}
