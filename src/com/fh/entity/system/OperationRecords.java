package com.fh.entity.system;

import java.util.Date;

public class OperationRecords {
	private String id;
	private String operation_staff; //操作人
	private Date operating_time; //操作时间
	private String operate; //操作内容
	private Integer logincount; //登录次数
	private String comment;//备注
	private String productid;
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOperation_staff() {
		return operation_staff;
	}
	public void setOperation_staff(String operation_staff) {
		this.operation_staff = operation_staff;
	}
	public Date getOperating_time() {
		return operating_time;
	}
	public void setOperating_time(Date operating_time) {
		this.operating_time = operating_time;
	}
	public String getOperate() {
		return operate;
	}
	public void setOperate(String operate) {
		this.operate = operate;
	}
	public Integer getLogincount() {
		return logincount;
	}
	public void setLogincount(Integer logincount) {
		this.logincount = logincount;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
}
