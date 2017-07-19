/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.utils.Collections3;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 公文Entity
 * 
 * @author liaijun
 * @version 2016-11-09
 */
public class OaArchives extends ActEntity<OaArchives> {

	private static final long serialVersionUID = 1L;

	// 公共字段 ---start
	private String procInsId; // 流程实例ID
	private String status; // 是否为草稿状态状，0是1否
	private String type;// 公文类型，公司发文0，公司收文1，签报2
	// 公共字段 ----end

	private User user; // 用户
	private Office office; // 归属部门
	private String title; // 标题
	private String code; // 发文字号
	private String content; // 内容
	private String keyword; // 主题词
	private String secrets; // 密级
	private String urgency; // 紧急程度
	private String files; // 附件
	private Date exeDate; // 执行时间
	private String leadText; // 本部门领导意见

	private String managerText; // 总经理签发意见
	
	private String signYfOpinion;		// 研发意见
	private String signJsOpinion;		// 技术意见
	private String signSwOpinion;		// 商务意见
	private String signScOpinion;		// 市场意见
	private String signRsOpinion;		// 人事意见
	private String signCwOpinion;		// 财务意见

	// niting start
	private String isdraft; // 判断发文是草稿状态还是已经保存并提交
	private String departmentsign;//会签部门
	private String officeName; //部门名称
	private Date completeDate;		// 完成时间
	private String ccunit;//抄送单位
	private Date issuingtime; //印发时间
	private String issuedNum;//印发份数
	private Date issuedate;//核稿日期
	private Date draftdate;//拟稿日期
	private Date qianfadate;//总经理签发日期
	private String leadName; // 本部门领导名字
	// niting end

	// 查询使用字段，数据库没有对应字段
	private Date beginExeDate; // 开始 执行时间
	private Date endExeDate; // 结束 执行时间

	// liuxin ---start
	// liuxin查询条件
	private Date beginExeDate2; // 开始 执行时间
	private Date endExeDate2; // 结束 执行时间
	private String createName; // 发起人名称
	private String createOfficeName; // 发起部门名称
	private String queryState;// 流程状态 ,0审批中， 1已办结
	// liuxin ---end
	/*private String oaArchivesRecordIds;//分发人员记录*/
	private String oaArchivesNames;//分发人员名字
	private String oaIds;
	
	
//	private List<OaArchivesRecord> oaArchivesRecordList = Lists.newArrayList();
				
	
	public String getLeadName() {
		return leadName;
	}

	public void setLeadName(String leadName) {
		this.leadName = leadName;
	}

	public Date getIssuedate() {
		return issuedate;
	}

	public void setIssuedate(Date issuedate) {
		this.issuedate = issuedate;
	}

	public Date getDraftdate() {
		return draftdate;
	}

	public void setDraftdate(Date draftdate) {
		this.draftdate = draftdate;
	}

	public Date getQianfadate() {
		return qianfadate;
	}

	public void setQianfadate(Date qianfadate) {
		this.qianfadate = qianfadate;
	}

	public Date getIssuingtime() {
		return issuingtime;
	}

	public void setIssuingtime(Date issuingtime) {
		this.issuingtime = issuingtime;
	}

	public String getIssuedNum() {
		return issuedNum;
	}

	public void setIssuedNum(String issuedNum) {
		this.issuedNum = issuedNum;
	}

	public String getCcunit() {
		return ccunit;
	}

	public void setCcunit(String ccunit) {
		this.ccunit = ccunit;
	}

	public String getOaIds() {
		return oaIds;
	}

	public void setOaIds(String oaIds) {
		this.oaIds = oaIds;
	}

	public String getOaArchivesNames() {
		return oaArchivesNames;
	}

	public void setOaArchivesNames(String oaArchivesNames) {
		this.oaArchivesNames = oaArchivesNames;
	}

	public Date getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(Date completeDate) {
		this.completeDate = completeDate;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	public String getDepartmentsign() {
		return departmentsign;
	}

	public void setDepartmentsign(String departmentsign) {
		this.departmentsign = departmentsign;
	}

	public OaArchives() {
		super();
	}

	public OaArchives(String id) {
		super(id);
	}
	
	/*public List<OaArchivesRecord> getOaArchivesRecordList() {
		return oaArchivesRecordList;
	}

	public void setOaArchivesRecordList(List<OaArchivesRecord> oaArchivesRecordList) {
		this.oaArchivesRecordList = oaArchivesRecordList;
	}*/

	/**
	 * 获取通知发送记录用户ID
	 * @return
	 *//*
	public String getOaArchivesRecordIds() {
		return Collections3.extractToString(oaArchivesRecordList, "user.id", ",") ;
	}
	
	*//**
	 * 设置通知发送记录用户ID
	 * @return
	 *//*
	public void setOaArchivesRecordIds(String oaArchivesRecord) {
		this.oaArchivesRecordList = Lists.newArrayList();
		for (String id : StringUtils.split(oaArchivesRecord, ",")){
			OaArchivesRecord entity = new OaArchivesRecord();
			entity.setId(IdGen.uuid());
			entity.setOaArchives(this);
			entity.setUser(new User(id));
			entity.setReadFlag("0"); 
			this.oaArchivesRecordList.add(entity);
		}
	}

	*//**
	 * 获取通知发送记录用户Name
	 * @return
	 *//*
	public String getOaArchivesRecordNames() {
		return Collections3.extractToString(oaArchivesRecordList, "user.name", ",") ;
	}
	
	*//**
	 * 设置通知发送记录用户Name
	 * @return
	 *//*
	public void setOaArchivesRecordNames(String oaArchivesRecord) {
		// 什么也不做
	}*/

	
	public String getQueryState() {
		return queryState;
	}

	public void setQueryState(String queryState) {
		this.queryState = queryState;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public String getCreateOfficeName() {
		return createOfficeName;
	}

	public void setCreateOfficeName(String createOfficeName) {
		this.createOfficeName = createOfficeName;
	}

	public String getIsdraft() {
		return isdraft;
	}

	public void setIsdraft(String isdraft) {
		this.isdraft = isdraft;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	

	@Length(min = 0, max = 64, message = "流程实例ID长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	@Length(min = 0, max = 255, message = "标题长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Length(min = 0, max = 64, message = "发文字号长度必须介于 0 和 64 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Length(min = 0, max = 255, message = "主题词长度必须介于 0 和 255 之间")
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Length(min = 0, max = 10, message = "密级长度必须介于 0 和 10 之间")
	public String getSecrets() {
		return secrets;
	}

	public void setSecrets(String secrets) {
		this.secrets = secrets;
	}

	@Length(min = 0, max = 20, message = "紧急程度长度必须介于 0 和 20 之间")
	public String getUrgency() {
		return urgency;
	}

	public void setUrgency(String urgency) {
		this.urgency = urgency;
	}

	@Length(min = 0, max = 1, message = "状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Length(min = 0, max = 2000, message = "附件长度必须介于 0 和 2000 之间")
	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getExeDate() {
		return exeDate;
	}

	public void setExeDate(Date exeDate) {
		this.exeDate = exeDate;
	}	
	
	@Length(min = 0, max = 255, message = "总经理会签长度必须介于 0 和 255 之间")
	public String getManagerText() {
		return managerText;
	}

	public void setManagerText(String managerText) {
		this.managerText = managerText;
	}

	@Length(min = 0, max = 255, message = "本部门领导会签长度必须介于 0 和 255 之间")
	public String getLeadText() {
		return leadText;
	}

	public void setLeadText(String leadText) {
		this.leadText = leadText;
	}

	
	@Length(min = 0, max = 255, message = "研发部领导会签长度必须介于 0 和 255 之间")
	public String getSignYfOpinion() {
		return signYfOpinion;
	}

	public void setSignYfOpinion(String signYfOpinion) {
		this.signYfOpinion = signYfOpinion;
	}
	
	@Length(min = 0, max = 255, message = "技术部领导会签长度必须介于 0 和 255 之间")
	public String getSignJsOpinion() {
		return signJsOpinion;
	}

	public void setSignJsOpinion(String signJsOpinion) {
		this.signJsOpinion = signJsOpinion;
	}

	@Length(min = 0, max = 255, message = "商务部领导会签长度必须介于 0 和 255 之间")
	public String getSignSwOpinion() {
		return signSwOpinion;
	}

	public void setSignSwOpinion(String signSwOpinion) {
		this.signSwOpinion = signSwOpinion;
	}
	
	@Length(min = 0, max = 255, message = "市场部领导会签长度必须介于 0 和 255 之间")
	public String getSignScOpinion() {
		return signScOpinion;
	}

	public void setSignScOpinion(String signScOpinion) {
		this.signScOpinion = signScOpinion;
	}

	@Length(min = 0, max = 255, message = "人事部领导会签长度必须介于 0 和 255 之间")
	public String getSignRsOpinion() {
		return signRsOpinion;
	}

	public void setSignRsOpinion(String signRsOpinion) {
		this.signRsOpinion = signRsOpinion;
	}

	@Length(min = 0, max = 255, message = "财务部领导会签长度必须介于 0 和 255 之间")
	public String getSignCwOpinion() {
		return signCwOpinion;
	}

	public void setSignCwOpinion(String signCwOpinion) {
		this.signCwOpinion = signCwOpinion;
	}

	public Date getBeginExeDate() {
		return beginExeDate;
	}

	public void setBeginExeDate(Date beginExeDate) {
		this.beginExeDate = beginExeDate;
	}

	public Date getEndExeDate() {
		return endExeDate;
	}

	public void setEndExeDate(Date endExeDate) {
		this.endExeDate = endExeDate;
	}

	public Date getBeginExeDate2() {
		return beginExeDate2;
	}

	public void setBeginExeDate2(Date beginExeDate2) {
		this.beginExeDate2 = beginExeDate2;
	}

	public Date getEndExeDate2() {
		return endExeDate2;
	}

	public void setEndExeDate2(Date endExeDate2) {
		this.endExeDate2 = endExeDate2;
	}

}