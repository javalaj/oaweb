package com.thinkgem.jeesite.modules.user.entity;

import java.util.Date;

public class UserWorklogVo 
{
	private Date workdate;
	
	private String id;
	
	private String remarks;

	public Date getWorkdate() {
		return workdate;
	}

	public void setWorkdate(Date workdate) {
		this.workdate = workdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
}
