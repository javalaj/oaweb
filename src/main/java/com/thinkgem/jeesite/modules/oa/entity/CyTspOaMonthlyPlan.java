/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 月计划Entity
 * @author cz
 * @version 2016-11-08
 */
public class CyTspOaMonthlyPlan extends DataEntity<CyTspOaMonthlyPlan> {
	
	
	private Office office;
	
	
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	/**
	 * 工作流属性
	 */
	
	private String procInsId; 	//流程实例id
	private String approvalState;//审批状态    1.审核中  2.通过 
	private String officeId;//ID
	private String approvalUserId;//审批人id
	private String approvalUserName;//审批人姓名
	private Date approvalDate;//审批时间
	
	private String superiorName;//上级姓名
	private Date applyDate;//申请时间
	
	private String transactor;//审核人(1:直属领导，2：部门副总)
	
	
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public String getApprovalState() {
		return approvalState;
	}

	public void setApprovalState(String approvalState) {
		this.approvalState = approvalState;
	}

	public String getOfficeId() {
		return officeId;
	}

	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}

	public String getApprovalUserId() {
		return approvalUserId;
	}

	public void setApprovalUserId(String approvalUserId) {
		this.approvalUserId = approvalUserId;
	}

	public String getApprovalUserName() {
		return approvalUserName;
	}

	public void setApprovalUserName(String approvalUserName) {
		this.approvalUserName = approvalUserName;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}


	public String getSuperiorName() {
		return superiorName;
	}

	public void setSuperiorName(String superiorName) {
		this.superiorName = superiorName;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getTransactor() {
		return transactor;
	}

	public void setTransactor(String transactor) {
		this.transactor = transactor;
	}

	private static final long serialVersionUID = 1L;
	private String taskName;		// 任务名
	private String creatTime;		// 创建时间
	private String definiti;		// 定义
	private String acceptanceDeliverables;		// 验收交付物
	private String startTime;		// 开始时间
	private String endTime;		// 结束时间
	private Integer myScores;		// 自我评分
	private Integer leaderScores;		// 直接领导
	private Integer viceScores;		// 副总评分
	private String  userId;		// 创建人
	private Integer taskScrores;		// 任务评分
	
	private String creatName;//创建人姓名
	private String commonId; //通用id
	
	
	private Map<String, String> map;
	
	
	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}

	public String getCreatName() {
		return creatName;
	}

	public void setCreatName(String creatName) {
		this.creatName = creatName;
	}

	public String getCommonId() {
		return commonId;
	}

	public void setCommonId(String commonId) {
		this.commonId = commonId;
	}

	public CyTspOaMonthlyPlan() {
		super();
	}

	public CyTspOaMonthlyPlan(String id){
		super(id);
	}

	@Length(min=0, max=255, message="任务名长度必须介于 0 和 255 之间")
	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	public String getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}
	
	@Length(min=0, max=255, message="定义长度必须介于 0 和 255 之间")
	public String getDefiniti() {
		return definiti;
	}

	public void setDefiniti(String definiti) {
		this.definiti = definiti;
	}
	
	@Length(min=0, max=255, message="验收交付物长度必须介于 0 和 255 之间")
	public String getAcceptanceDeliverables() {
		return acceptanceDeliverables;
	}

	public void setAcceptanceDeliverables(String acceptanceDeliverables) {
		this.acceptanceDeliverables = acceptanceDeliverables;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd ")
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	@Length(min=0, max=11, message="自我评分长度必须介于 0 和 11 之间")
	public Integer getMyScores() {
		return myScores;
	}

	public void setMyScores(Integer myScores) {
		this.myScores = myScores;
	}
	
	@Length(min=0, max=11, message="直接领导长度必须介于 0 和 11 之间")
	public Integer getLeaderScores() {
		return leaderScores;
	}

	public void setLeaderScores(Integer leaderScores) {
		this.leaderScores = leaderScores;
	}
	
	@Length(min=0, max=11, message="副总评分长度必须介于 0 和 11 之间")
	public Integer getViceScores() {
		return viceScores;
	}

	public void setViceScores(Integer viceScores) {
		this.viceScores = viceScores;
	}
	

	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Length(min=0, max=255, message="任务评分长度必须介于 0 和 255 之间")
	public Integer getTaskScrores() {
		return taskScrores;
	}

	public void setTaskScrores(Integer taskScrores) {
		this.taskScrores = taskScrores;
	}
	
}