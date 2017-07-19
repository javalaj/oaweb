/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.thinkgem.jeesite.common.persistence.TreeEntity;

/**
 * 分组Entity
 * @author cz
 * @version 2016-11-04
 */
public class CyTspOaAddressGroup extends TreeEntity<CyTspOaAddressGroup> {
	





	private static final long serialVersionUID = 1L;
	private String name;		// 分组名字
	private String userId;		// user_id
	private Integer groupId;
 private String type;
	private String parentIds;
	private String grade;
	private CyTspOaAddressGroup parent;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public CyTspOaAddressGroup() {
		super();
	}

	public CyTspOaAddressGroup(String id){
		super(id);
	}
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	@Length(min=0, max=255, message="分组名字长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getParentId() {
		return parent != null && parent.getParentId() != null ? parent.getParentId() : "0";
	}

	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	@JsonBackReference
	public CyTspOaAddressGroup getParent() {
		return parent;
	}

	public void setParent(CyTspOaAddressGroup parent) {
		this.parent = parent;
	}

}