/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.common.persistence.TreeEntity;

/**
 * 栏目管理Entity
 * @author liaijun
 * @version 2016-11-03
 */
public class OaDocmanage extends TreeEntity<OaDocmanage> {
	
	private static final long serialVersionUID = 1L;

	private Office office;		// 部门id
	private User admin;        //指定管理员
	public OaDocmanage() {
		super();
	}

	public OaDocmanage(String id){
		super(id);
	}

	
	
	public User getAdmin() {
		return admin;
	}

	public void setAdmin(User admin) {
		this.admin = admin;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	@Override
	public OaDocmanage getParent() {
		// TODO Auto-generated method stub
		return parent;
	}

	@Override
	public void setParent(OaDocmanage parent) {
		// TODO Auto-generated method stub
		this.parent=parent;
	}
	

}