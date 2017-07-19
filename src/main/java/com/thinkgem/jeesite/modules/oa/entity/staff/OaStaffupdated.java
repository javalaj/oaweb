/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.staff;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 人员增补Entity
 * @author cz
 * @version 2017-01-12
 */
public class OaStaffupdated extends  ActEntity<OaStaffupdated> {
	
	private static final long serialVersionUID = 1L;
	private String department;		// 需求部门
	private String number;		// 现有人数
	private String upNumber;		// 拟增人数
	private String upPostname;		// 岗位名称
	private String trial;		// 试用期
	private String official;		// 转正
	private String upReason;		// 增补原因(0:补缺，1：增加，2：储备)
	private Date expectationTime;		// 期望到岗时间
	private String upPostcontent;		// 岗位工作内容
	private String upPostclaim;		// 增补岗位要求
	private String demandOpinion;		// demand_opinion
	private String personnelmattersOpinion;		// 人事部意见
	private String bossOpinion;		// 总经理意见
	private String procInsId;  //流程实例id
	
	public OaStaffupdated() {
		super();
	}

	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public OaStaffupdated(String id){
		super(id);
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	public String getNumber() {
		return number;
	}
	
	public void setNumber(String number) {
		this.number = number;
	}
	
	public String getUpNumber() {
		return upNumber;
	}

	public void setUpNumber(String upNumber) {
		this.upNumber = upNumber;
	}
	
	public String getUpPostname() {
		return upPostname;
	}

	public void setUpPostname(String upPostname) {
		this.upPostname = upPostname;
	}
	
	public String getTrial() {
		return trial;
	}

	public void setTrial(String trial) {
		this.trial = trial;
	}
	
	public String getOfficial() {
		return official;
	}

	public void setOfficial(String official) {
		this.official = official;
	}
	
	public String getUpReason() {
		return upReason;
	}

	public void setUpReason(String upReason) {
		this.upReason = upReason;
	}
	
	public Date getExpectationTime() {
		return expectationTime;
	}

	public void setExpectationTime(Date expectationTime) {
		this.expectationTime = expectationTime;
	}
	
	public String getUpPostcontent() {
		return upPostcontent;
	}

	public void setUpPostcontent(String upPostcontent) {
		this.upPostcontent = upPostcontent;
	}
	
	public String getUpPostclaim() {
		return upPostclaim;
	}

	public void setUpPostclaim(String upPostclaim) {
		this.upPostclaim = upPostclaim;
	}
	
	public String getDemandOpinion() {
		return demandOpinion;
	}

	public void setDemandOpinion(String demandOpinion) {
		this.demandOpinion = demandOpinion;
	}
	
	public String getPersonnelmattersOpinion() {
		return personnelmattersOpinion;
	}

	public void setPersonnelmattersOpinion(String personnelmattersOpinion) {
		this.personnelmattersOpinion = personnelmattersOpinion;
	}
	public String getBossOpinion() {
		return bossOpinion;
	}

	public void setBossOpinion(String bossOpinion) {
		this.bossOpinion = bossOpinion;
	}
	
}