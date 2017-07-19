/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.common.collect.Lists;

import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.Collections3;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 我的任务Entity
 * @author liaijun
 * @version 2016-11-28
 */
public class OaTask extends DataEntity<OaTask> {
	
	private static final long serialVersionUID = 1L;
	private String parentid;		// 父任务id
	private String type;		// 类型
	private String title;		// 任务名称
	private String content;		// 内容
	private String files;		// 附件
	private String prefer;		// 优先级
	private String backfiles;		// 反馈附件
	private String status;		// 状态
	private String projectid;		// 关联项目id
	private String inDoingNum ; //本人进行中的任务数量
	private String isDoneNum;  //已完成的任务数量
	private String overDateNum;//已超期的任务数量
	private Date startTime;		// 任务开始时间
	private Date endTime;		// 任务结束时间
private boolean isSelf;		// 是否只查询自己收到的任务	
	private String taskFlag;	// 本人的任务状态(0:进行中；1：已完成：2：已 超期3:未处理)
	private List<OaTaskRecord> oaTaskRecordList = Lists.newArrayList();	
	public OaTask() {
		super();
	}

	public OaTask(String id){
		super(id);
	}

	@Length(min=0, max=64, message="父任务id长度必须介于 0 和 64 之间")
	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	
	@Length(min=0, max=1, message="类型长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=200, message="任务名称长度必须介于 0 和 200 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=2000, message="内容长度必须介于 0 和 2000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=2000, message="附件长度必须介于 0 和 2000 之间")
	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}
	
	@Length(min=0, max=1, message="优先级长度必须介于 0 和 1 之间")
	public String getPrefer() {
		return prefer;
	}

	public void setPrefer(String prefer) {
		this.prefer = prefer;
	}
	
	@Length(min=0, max=2000, message="反馈附件长度必须介于 0 和 2000 之间")
	public String getBackfiles() {
		return backfiles;
	}

	public void setBackfiles(String backfiles) {
		this.backfiles = backfiles;
	}
	
	@Length(min=0, max=1, message="状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=1, max=64, message="关联项目id长度必须介于 1 和 64 之间")
	public String getProjectid() {
		return projectid;
	}

	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="任务开始时间不能为空")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="任务结束时间不能为空")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public boolean isSelf() {
		return isSelf;
	}

	public void setSelf(boolean isSelf) {
		this.isSelf = isSelf;
	}
	@Length(min=0, max=1, message="任务标记（0：进行中；1：已完结；2：已超期；3：未接收）长度必须介于 0 和 1 之间")
	public String getTaskFlag() {
		return taskFlag;
	}

	public void setTaskFlag(String taskFlag) {
		this.taskFlag = taskFlag;
	}

	public List<OaTaskRecord> getOaTaskRecordList() {
		return oaTaskRecordList;
	}

	public void setOaTaskRecordList(List<OaTaskRecord> oaTaskRecordList) {
		this.oaTaskRecordList = oaTaskRecordList;
	}
	/**
	 * 获取任务发送记录用户ID
	 * @return
	 */
	public String getOaNotifyRecordIds() {
		return Collections3.extractToString(oaTaskRecordList, "user.id", ",") ;
	}
	
	/**
	 * 设置任务发送记录用户ID
	 * @return
	 */
//	public void setOaNotifyRecordIds(String oaTaskRecordIds) {
//		this.oaTaskRecordList = Lists.newArrayList();
//		for (String id : StringUtils.split(oaTaskRecordIds, ",")){
//			OaTaskRecord entity = new OaTaskRecord();
//			entity.setId(IdGen.uuid());
//			entity.setOaTask(this);
//			entity.setUser(new User(id));
//			entity.setTaskFlag("3");//未处理
//			this.oaTaskRecordList.add(entity);
//		}
//	}

	/**
	 * 获取任务发送记录用户Name
	 * @return
	 */
	public String getOaNotifyRecordNames() {
		return Collections3.extractToString(oaTaskRecordList, "user.name", ",") ;
	}
	
	/**
	 * 设置任务发送记录用户Name
	 * @return
	 */
	public void setOaNotifyRecordNames(String oaTaskRecordIds) {
		// 什么也不做
	}

	public String getInDoingNum() {
		return inDoingNum;
	}

	public void setInDoingNum(String inDoingNum) {
		this.inDoingNum = inDoingNum;
	}

	public String getIsDoneNum() {
		return isDoneNum;
	}

	public void setIsDoneNum(String isDoneNum) {
		this.isDoneNum = isDoneNum;
	}

	public String getOverDateNum() {
		return overDateNum;
	}

	public void setOverDateNum(String overDateNum) {
		this.overDateNum = overDateNum;
	}
	
	
}