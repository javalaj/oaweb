/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity.workflow;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 工作流变量维护Entity
 * @author 李廷龙
 * @version 2016-11-29
 */
public class SysWorkflowVar extends DataEntity<SysWorkflowVar> {
	
	private static final long serialVersionUID = 1L;
	private String workflowName;		// 流程名称
	private String workflowIdentification;		// 流程标识
	private String varName;		// 变量名称
	private String varDescription;		// 变量描述
	private String varValue;		// 变量值
	private String varType;		// 变量类型（0：自解析；1：用户名；2：角色名）
	private User varValueUser;
	private Role varValueRole;
	private boolean addMore;
	public static final String VAR_TYPE_SELF_DEFINED="0";
	public static final String VAR_TYPE_USER="1";
	public static final String VAR_TYPE_ROLE="2";
	public SysWorkflowVar() {
		super();
	}

	public SysWorkflowVar(String id){
		super(id);
	}

	@Length(min=1, max=64, message="流程名称长度必须介于 1 和 64 之间")
	public String getWorkflowName() {
		return workflowName;
	}

	public void setWorkflowName(String workflowName) {
		this.workflowName = workflowName;
	}
	
	@Length(min=1, max=64, message="流程标识长度必须介于 1 和 64 之间")
	public String getWorkflowIdentification() {
		return workflowIdentification;
	}

	public void setWorkflowIdentification(String workflowIdentification) {
		this.workflowIdentification = workflowIdentification;
	}
	
	@Length(min=1, max=64, message="变量名称长度必须介于 1 和 64 之间")
	public String getVarName() {
		return varName;
	}

	public void setVarName(String varName) {
		this.varName = varName;
	}
	
	@Length(min=1, max=64, message="变量描述长度必须介于 1 和 64 之间")
	public String getVarDescription() {
		return varDescription;
	}

	public void setVarDescription(String varDescription) {
		this.varDescription = varDescription;
	}
	
	@Length(min=0, max=1000, message="变量值长度必须介于 0 和 1000 之间")
	public String getVarValue() {
		return varValue;
	}

	public void setVarValue(String varValue) {
		this.varValue = varValue;
	}
	
	@Length(min=1, max=1, message="变量类型（0：自解析；1：用户名；2：角色名）长度必须介于 1 和 1 之间")
	public String getVarType() {
		return varType;
	}

	public void setVarType(String varType) {
		this.varType = varType;
	}

	public User getVarValueUser() {
		return varValueUser;
	}

	public void setVarValueUser(User varValueUser) {
		this.varValueUser = varValueUser;
	}

	public Role getVarValueRole() {
		return varValueRole;
	}

	public void setVarValueRole(Role varValueRole) {
		this.varValueRole = varValueRole;
	}

	public boolean getAddMore() {
		return addMore;
	}

	public void setAddMore(boolean addMore) {
		this.addMore = addMore;
	}
	
}