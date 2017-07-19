/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.project;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目表的管理Entity
 * @author 李廷龙
 * @version 2016-11-17
 */
public class OaProjectOperation extends DataEntity<OaProjectOperation> {
	
	private static final long serialVersionUID = 1L;
	private OaProject project;		// 所属项目 父类
	private Date operationTime;		// 处理时间
	private User operationPerson;		// 处理人
	private String operationDescription;		// 处理描述
	
	public OaProjectOperation() {
		super();
	}

	public OaProjectOperation(String id){
		super(id);
	}

	public OaProjectOperation(OaProject project){
		this.project = project;
	}

	@Length(min=0, max=64, message="所属项目长度必须介于 0 和 64 之间")
	public OaProject getProject() {
		return project;
	}

	public void setProject(OaProject project) {
		this.project = project;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="处理时间不能为空")
	public Date getOperationTime() {
		return operationTime;
	}

	public void setOperationTime(Date operationTime) {
		this.operationTime = operationTime;
	}
	
	public User getOperationPerson() {
		return operationPerson;
	}

	public void setOperationPerson(User operationPerson) {
		this.operationPerson = operationPerson;
	}
	
	@Length(min=0, max=500, message="处理描述长度必须介于 0 和 500 之间")
	public String getOperationDescription() {
		return operationDescription;
	}

	public void setOperationDescription(String operationDescription) {
		this.operationDescription = operationDescription;
	}

	@Override
	public String toString() {
		return "OaProjectOperation [project=" + project.getId() + ", operationTime=" + operationTime + ", operationPerson="
				+ operationPerson + ", operationDescription=" + operationDescription + "]";
	}
	
}