/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.project;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目成员管理Entity
 * @author 李廷龙
 * @version 2017-02-22
 */
public class OaProjectMember extends DataEntity<OaProjectMember> {
	
	private static final long serialVersionUID = 1L;
	private OaProject project;		// 关联的项目
	private User user;		// 关联的用户
	private String duty;		// 职责
	private String type;		// 成员类型
	/**
	 * 来源类型，虚字段
	 */
	private String sourceType;
	public OaProjectMember() {
		super();
	}

	public OaProjectMember(String id){
		super(id);
	}
	public OaProjectMember(OaProject project){
		this.project=project;
	}

	public OaProject getProject() {
		return project;
	}

	public void setProject(OaProject project) {
		this.project = project;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=200, message="职责长度必须介于 0 和 200 之间")
	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getSourceType() {
		return sourceType;
	}

	public void setSourceType(String sourceType) {
		this.sourceType = sourceType;
	}

	public static final String TYPE_SUPER_ADMIN="0";
	public static final String TYPE_ADMIN="1";
	public static final String TYPE_COMMON="2";
	/**
	 * 历史来源，如项目中的客户经理，工程经理等
	 */
	public static final String SOURCE_TYPE_HISTORY="0";
}