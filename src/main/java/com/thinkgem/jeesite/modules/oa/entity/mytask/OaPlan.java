/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.mytask;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 我的日程Entity
 * 
 * @author chenzhang
 * @version 2016-12-01
 */
public class OaPlan extends DataEntity<OaPlan> {

	private static final long serialVersionUID = 1L;
	private String planIcon; // 日程图标
	private String planTitle; // 日程名称
	private String parentId; // 父级任务id
	private String content; // 日程内容
	private String prefer; // 优先级
	private String backfiles; // 反馈附件
	private String startTime; // 开始时间
	private String endTime; // 结束时间
	private String planType; // 计划类型
	private String state; // 状态
	private String isback; // 是否回执
	private User compere; // 主持人id

	private User actor; // 参与者id
	private OaProject projectid; // 项目id
	private String taskid; // 任务id
	private String tip; // 日程提醒
	private String cycle; // 重复周期
	private String files; // 附件
	private Date startDay; // 开始日期
	private Date factTime;// 实际任务完成时间
	private String issueState;//发布状态1：发布  0不发布
	private String remarks;//反馈内容
	//临时字段不参与数据库
	private  String actName;//分配人员名称
	private String moblieactName;//手机端分配人员
	private String proname;//关联项目名称
	
	private long indexDay;//天
	private String indexDayi;//转变天
	
	
	private Date endDate;
	
	private String flag;//页面状态表示(未开始,进行中,已超期)
	
	
	private String childActName;//子任务发布人
	public String getChildActName() {
		return childActName;
	}
	public void setChildActName(String childActName) {
		this.childActName = childActName;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Date getEndDate() {
		return endDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getIndexDayi() {
		return indexDayi;
	}

	public void setIndexDayi(String indexDayi) {
		this.indexDayi = indexDayi;
	}

	public long getIndexDay() {
		return indexDay;
	}

	public void setIndexDay(long indexDay) {
		this.indexDay = indexDay;
	}

	public String getMoblieactName() {
		return moblieactName;
	}

	public void setMoblieactName(String moblieactName) {
		this.moblieactName = moblieactName;
	}

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getIssueState() {
		return issueState;
	}

	public void setIssueState(String issueState) {
		this.issueState = issueState;
	}


	

	public String getActName() {
		return actName;
	}

	public void setActName(String actName) {
		this.actName = actName;
	}

	public Date getFactTime() {
		return factTime;
	}

	public void setFactTime(Date factTime) {
		this.factTime = factTime;
	}

	private String cruserid;

	public String getCruserid() {
		return cruserid;
	}

	public void setCruserid(String cruserid) {
		this.cruserid = cruserid;
	}

	@JsonFormat(pattern = "yyyy-MM-dd")
	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public OaPlan() {
		super();
	}

	public OaPlan(String id) {
		super(id);
	}

	@Length(min = 0, max = 64, message = "日程图标长度必须介于 0 和 64 之间")
	public String getPlanIcon() {
		return planIcon;
	}

	public void setPlanIcon(String planIcon) {
		this.planIcon = planIcon;
	}

	@Length(min = 0, max = 255, message = "日程名称长度必须介于 0 和 255 之间")
	public String getPlanTitle() {
		return planTitle;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getPrefer() {
		return prefer;
	}

	public void setPrefer(String prefer) {
		this.prefer = prefer;
	}



	public String getBackfiles() {
		return backfiles;
	}
	public void setBackfiles(String backfiles) {
		this.backfiles = backfiles;
	}
	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}

	@Length(min = 0, max = 1000, message = "日程内容长度必须介于 0 和 1000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@JsonFormat(pattern = "HH:mm:ss")
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	@JsonFormat(pattern = "HH:mm:ss")
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	@Length(min = 0, max = 1, message = "计划类型长度必须介于 0 和 1 之间")
	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

	@Length(min = 0, max = 1, message = "状态长度必须介于 0 和 1 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Length(min = 0, max = 1, message = "是否回执长度必须介于 0 和 1 之间")
	public String getIsback() {
		return isback;
	}

	public void setIsback(String isback) {
		this.isback = isback;
	}

	public User getCompere() {
		return compere;
	}

	public void setCompere(User compere) {
		this.compere = compere;
	}

	public User getActor() {
		return actor;
	}

	public void setActor(User actor) {
		this.actor = actor;
	}

	public OaProject getProjectid() {
		return projectid;
	}

	public void setProjectid(OaProject projectid) {
		this.projectid = projectid;
	}

	@Length(min = 0, max = 64, message = "任务id长度必须介于 0 和 64 之间")
	public String getTaskid() {
		return taskid;
	}

	public void setTaskid(String taskid) {
		this.taskid = taskid;
	}

	@Length(min = 0, max = 1, message = "日程提醒长度必须介于 0 和 1 之间")
	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	@Length(min = 0, max = 64, message = "重复周期长度必须介于 0 和 64 之间")
	public String getCycle() {
		return cycle;
	}

	public void setCycle(String cycle) {
		this.cycle = cycle;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

}