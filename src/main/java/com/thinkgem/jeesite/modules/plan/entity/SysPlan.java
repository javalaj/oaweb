/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.plan.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 日程 管理Entity
 * @author liaijun
 * @version 2016-10-19
 */
public class SysPlan extends DataEntity<SysPlan> {
	
	private static final long serialVersionUID = 1L;
	private String planIcon;		// 日程图标
	private String planTitle;		// 标题
	private String content;		// 日程内容
	private Date startTime;		// 开始时间
	private Date endTime;		// 结束时间
	private String planType;		// 日程类型
	private String state;		// 状态
	
	public SysPlan() {
		super();
	}

	public SysPlan(String id){
		super(id);
	}

	@Length(min=0, max=64, message="日程图标长度必须介于 0 和 64 之间")
	public String getPlanIcon() {
		return planIcon;
	}

	public void setPlanIcon(String planIcon) {
		this.planIcon = planIcon;
	}
	
	@Length(min=1, max=255, message="标题长度必须介于 1 和 255 之间")
	public String getPlanTitle() {
		return planTitle;
	}

	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}
	
	@Length(min=1, max=1000, message="日程内容长度必须介于 1 和 1000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="开始时间不能为空")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@Length(min=0, max=1, message="日程类型长度必须介于 0 和 1 之间")
	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}
	
	@Length(min=0, max=1, message="状态长度必须介于 0 和 1 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}