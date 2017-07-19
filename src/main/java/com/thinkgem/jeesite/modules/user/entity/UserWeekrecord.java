/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 周计划计划的细节内容，与周计划一对多关联关系Entity
 * 
 * @author liuxin
 * @version 2016-11-04
 */
public class UserWeekrecord extends DataEntity<UserWeekrecord> {

	private static final long serialVersionUID = 1L;
	private String beginday; // 计划的开始日子 （1 第一天 2第二天。。。）
	private String endday; // 计划结束日子 （1 第一天 2第二天。。。）
	private String content; // 计划的内容
	private String weekplanId; // 一对多的weekplan主键关联
	private String deliverables;//交付物
	private String important;//权重
    private String schedule;//进度分
    private String commonid;//共同id
    private String procInsId;//流程实例id
    private  String procinsFlag;//审核标记;1：审核完成，null：未审核完成
    private String creatName;
	private Date plandate; // 计划的年月日，手动输入
	private String weeksign; // 每月周期标示（第一周07,第二周14,第三周21,第四周28,第五周31）
	private String createByid; //创建者id
	private  String preCommonid;
	 private String toProcinsFlag;
	 private String turndownFlag;//驳回标示，1代表驳回的
	 
	public String getTurndownFlag() {
		return turndownFlag;
	}

	public void setTurndownFlag(String turndownFlag) {
		this.turndownFlag = turndownFlag;
	}

	public String getToProcinsFlag() {
		return toProcinsFlag;
	}

	public void setToProcinsFlag(String toProcinsFlag) {
		this.toProcinsFlag = toProcinsFlag;
	}

	private String qualityScore;//质量分
	
	public String getTestScore() {
		return testScore;
	}

	public void setTestScore(String testScore) {
		this.testScore = testScore;
	}

	private String testScore;//任务分
	
	

	public String getQualityScore() {
		return qualityScore;
	}

	public void setQualityScore(String qualityScore) {
		this.qualityScore = qualityScore;
	}

	public String getCreateByid() {
		return createByid;
	}

	public void setCreateByid(String createByid) {
		this.createByid = createByid;
	}

	private String procInsIdPre;
	
	public String getProcInsIdPre() {
		return procInsIdPre;
	}

	public void setProcInsIdPre(String procInsIdPre) {
		this.procInsIdPre = procInsIdPre;
	}

	public String getPreCommonid() {
		return preCommonid;
	}

	public void setPreCommonid(String preCommonid) {
		this.preCommonid = preCommonid;
	}

	public Date getPlandate() {
		return plandate;
	}

	public void setPlandate(Date plandate) {
		this.plandate = plandate;
	}

	public String getWeeksign() {
		return weeksign;
	}

	public void setWeeksign(String weeksign) {
		this.weeksign = weeksign;
	}

	public String getCreatName() {
		return creatName;
	}

	public void setCreatName(String creatName) {
		this.creatName = creatName;
	}

	public String getProcinsFlag() {
		return procinsFlag;
	}

	public void setProcinsFlag(String procinsFlag) {
		this.procinsFlag = procinsFlag;
	}

	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public String getCommonid() {
		return commonid;
	}

	public void setCommonid(String commonid) {
		this.commonid = commonid;
	}

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getDeliverables() {
		return deliverables;
	}

	public void setDeliverables(String deliverables) {
		this.deliverables = deliverables;
	}

	public UserWeekrecord() {
		super();
	}

	public UserWeekrecord(String id) {
		super(id);
	}

	public String getContent() {
		return content;
	}

	public String getBeginday() {
		return beginday;
	}

	public void setBeginday(String beginday) {
		this.beginday = beginday;
	}

	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
		this.endday = endday;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWeekplanId() {
		return weekplanId;
	}

	public void setWeekplanId(String weekplanId) {
		this.weekplanId = weekplanId;
	}

}