package com.fh.entity.system;

import java.util.Date;

public class UserLoginLog {
	private String id;
	private String u_phone;
	private Integer logincount;
	private Date logintime;
	private Date loginout;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	
	public Integer getLogincount() {
		return logincount;
	}
	public void setLogincount(Integer logincount) {
		this.logincount = logincount;
	}
	public Date getLogintime() {
		return logintime;
	}
	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}
	public Date getLoginout() {
		return loginout;
	}
	public void setLoginout(Date loginout) {
		this.loginout = loginout;
	}
}
