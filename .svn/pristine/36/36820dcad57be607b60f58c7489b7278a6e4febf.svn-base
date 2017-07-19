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
public class OaProjectWeekreport extends DataEntity<OaProjectWeekreport> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String reportNo;		// 编号
	private String projectReportFile;		// 周报文档
	private User writeUser;		// 填写人
	private String completedTask;		// 完成任务数
	private String addedTask;		// 新增任务数
	private User updateUser;		// 更新人
	private OaProject project;		// 所属项目 父类
	
	public OaProjectWeekreport() {
		super();
	}

	public OaProjectWeekreport(String id){
		super(id);
	}

	public OaProjectWeekreport(OaProject project){
		this.project = project;
	}

	@Length(min=0, max=64, message="标题长度必须介于 0 和 64 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=64, message="编号长度必须介于 0 和 64 之间")
	public String getReportNo() {
		return reportNo;
	}

	public void setReportNo(String reportNo) {
		this.reportNo = reportNo;
	}
	
	@Length(min=0, max=1000, message="周报文档长度必须介于 0 和 1000 之间")
	public String getProjectReportFile() {
		return projectReportFile;
	}

	public void setProjectReportFile(String projectReportFile) {
		this.projectReportFile = projectReportFile;
	}
	
	public User getWriteUser() {
		return writeUser;
	}

	public void setWriteUser(User writeUser) {
		this.writeUser = writeUser;
	}
	
	@Length(min=0, max=64, message="完成任务数长度必须介于 0 和 64 之间")
	public String getCompletedTask() {
		return completedTask;
	}

	public void setCompletedTask(String completedTask) {
		this.completedTask = completedTask;
	}
	
	@Length(min=0, max=64, message="新增任务数长度必须介于 0 和 64 之间")
	public String getAddedTask() {
		return addedTask;
	}

	public void setAddedTask(String addedTask) {
		this.addedTask = addedTask;
	}
	
	public User getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(User updateUser) {
		this.updateUser = updateUser;
	}
	
	@Length(min=0, max=64, message="所属项目长度必须介于 0 和 64 之间")
	public OaProject getProject() {
		return project;
	}

	public void setProject(OaProject project) {
		this.project = project;
	}
	
}