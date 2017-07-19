/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.doc;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 文档阅读申请管理Entity
 * @author 李廷龙
 * @version 2017-02-28
 */
public class OaDocReadApply extends DataEntity<OaDocReadApply> {
	
	private static final long serialVersionUID = 1L;
	private OaDoc doc;		// 申请的文档
	private String lendStatus;		// 借阅状态（0：申请中；1：同意；2：不同意）
	private User lendUser;		// 借阅人
	
	public OaDocReadApply() {
		super();
	}

	public OaDocReadApply(String id){
		super(id);
	}

	public OaDoc getDoc() {
		return doc;
	}

	public void setDoc(OaDoc doc) {
		this.doc = doc;
	}
	
	@Length(min=0, max=1, message="借阅状态（0：申请中；1：同意；2：不同意）长度必须介于 0 和 1 之间")
	public String getLendStatus() {
		return lendStatus;
	}

	public void setLendStatus(String lendStatus) {
		this.lendStatus = lendStatus;
	}
	
	public User getLendUser() {
		return lendUser;
	}

	public void setLendUser(User lendUser) {
		this.lendUser = lendUser;
	}
	
}