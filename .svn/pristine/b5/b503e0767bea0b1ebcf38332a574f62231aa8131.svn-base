/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.workturnover;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 工作交接Entity
 * @author zf
 * @version 2017-01-17
 */
public class WorkTurnOver extends DataEntity<WorkTurnOver> {
	
	private static final long serialVersionUID = 1L;
	private String project;		// 资产名称
	private String content;		// 具体内容
	private String number;		// 数量
	private String staffTurnoverId;		// 人员异动id
	
	public WorkTurnOver() {
		super();
	}

	public WorkTurnOver(String id){
		super(id);
	}

	@Length(min=0, max=10, message="资产名称长度必须介于 0 和 10 之间")
	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}
	
	@Length(min=0, max=64, message="具体内容长度必须介于 0 和 64 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=5, message="数量长度必须介于 0 和 5 之间")
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	@Length(min=0, max=64, message="人员异动id长度必须介于 0 和 64 之间")
	public String getStaffTurnoverId() {
		return staffTurnoverId;
	}

	public void setStaffTurnoverId(String staffTurnoverId) {
		this.staffTurnoverId = staffTurnoverId;
	}
	
}