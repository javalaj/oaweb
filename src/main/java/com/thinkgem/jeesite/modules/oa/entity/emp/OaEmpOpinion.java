/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.emp;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户意见管理Entity
 * @author 李廷龙
 * @version 2016-12-05
 */
public class OaEmpOpinion extends DataEntity<OaEmpOpinion> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 意见类别（0：漏洞提交；1：新功能建议）
	private String title;		// 意见标题
	private String opinion;		// 意见
	private String file;		// 附件
	private String istreated;		// 是否已处理（0：未处理；1：已处理）
	private User treatedUser;		// 处理人
	
	public OaEmpOpinion() {
		super();
	}

	public OaEmpOpinion(String id){
		super(id);
	}

	@Length(min=0, max=1, message="意见类别（0：漏洞提交；1：新功能建议）长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=1, max=64, message="意见标题长度必须介于 1 和 64 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=1, max=1000, message="意见长度必须介于 1 和 1000 之间")
	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	
	@Length(min=0, max=1000, message="附件长度必须介于 0 和 1000 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	@Length(min=0, max=1, message="是否已处理（0：未处理；1：已处理）长度必须介于 0 和 1 之间")
	public String getIstreated() {
		return istreated;
	}

	public void setIstreated(String istreated) {
		this.istreated = istreated;
	}
	
	public User getTreatedUser() {
		return treatedUser;
	}

	public void setTreatedUser(User treatedUser) {
		this.treatedUser = treatedUser;
	}
	
}