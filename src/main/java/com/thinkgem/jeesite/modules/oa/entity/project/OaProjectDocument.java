/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.project;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目表的管理Entity
 * @author 李廷龙
 * @version 2016-11-21
 */
public class OaProjectDocument extends DataEntity<OaProjectDocument> {
	
	private static final long serialVersionUID = 1L;
	private String projectFile;		// 文档名称
	private User uploadUser;		// 上传人
	private User updateUser;		// 更新人
	private String fileVersion;		// 版本号
	private OaProject project;		// 所属项目 父类
	
	public OaProjectDocument() {
		super();
	}

	public OaProjectDocument(String id){
		super(id);
	}

	public OaProjectDocument(OaProject project){
		this.project = project;
	}

	@Length(min=0, max=1000, message="文档名称长度必须介于 0 和 1000 之间")
	public String getProjectFile() {
		return projectFile;
	}

	public void setProjectFile(String projectFile) {
		this.projectFile = projectFile;
	}
	
	public User getUploadUser() {
		return uploadUser;
	}

	public void setUploadUser(User uploadUser) {
		this.uploadUser = uploadUser;
	}
	
	
	
	public User getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(User updateUser) {
		this.updateUser = updateUser;
	}

	@Length(min=0, max=64, message="版本号长度必须介于 0 和 64 之间")
	public String getFileVersion() {
		return fileVersion;
	}

	public void setFileVersion(String fileVersion) {
		this.fileVersion = fileVersion;
	}
	
	@Length(min=0, max=64, message="所属项目长度必须介于 0 和 64 之间")
	public OaProject getProject() {
		return project;
	}

	public void setProject(OaProject project) {
		this.project = project;
	}
	
}