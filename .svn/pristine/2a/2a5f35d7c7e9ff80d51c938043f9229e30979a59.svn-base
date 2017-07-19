package com.thinkgem.jeesite.modules.oa.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.oa.entity.mytask.OaPlan;
import com.thinkgem.jeesite.modules.sys.entity.User;

public class OaTaskRecord extends DataEntity<OaTaskRecord>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private String oaTaskId;		// 任务ID
	private String userId;		// 接受人
	
	private String taskFlag;		// 任务状态（0：进行中；1：已完成；2：已超期）
	private Date taskDate;	// 任务时间
	public OaTaskRecord(){
		super();		
	}
	public OaTaskRecord(String id){
		super(id);
	}
	
	
	public String getOaTaskId() {
		return oaTaskId;
	}
	public void setOaTaskId(String oaTaskId) {
		this.oaTaskId = oaTaskId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Length(min=0, max=1, message="任务标记（0：进行中；1：已完结；2：已超期；3：未接收）长度必须介于 0 和 1 之间")
	public String getTaskFlag() {
		return taskFlag;
	}
	public void setTaskFlag(String taskFlag) {
		this.taskFlag = taskFlag;
	}
	public Date getTaskDate() {
		return taskDate;
	}
	public void setTaskDate(Date taskDate) {
		this.taskDate = taskDate;
	}
	
	

}
