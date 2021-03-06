/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.project;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.common.persistence.ActEntity;

/**
 * 售前项目立项审批管理Entity
 * @author 李廷龙
 * @version 2016-11-15
 */
public class OaProjectApproval extends ActEntity<OaProjectApproval> {
	
	private static final long serialVersionUID = 1L;
	private String projectStage;		// 项目阶段
	private String contractType;		// 服务类别
	private String isBid;		// 是否投标
	private Date writeTime;		// 录入时间
	private Date expectedBidTime;		// 预计投标日期
	private Date establishmentTime;		// 立项日期
	private Date bookContractTime;		// 预计签约时间
	private Date actualContractTime;		// 实际签约时间
	private Date actualBidTime;		// 实际投标日期
	private Date projectStartTime;		// 项目启动日期
	private Double projectMoney;		// 项目金额
	private Double expectedMoney;		// 预计金额
	private Double contractMoney;		// 合同金额
	private User accountManager;		// 客户经理
	private User businessManager;		// 商务支持
	private User technicalManager;		// 技术支持
	private User projectManager;		// 工程经理
	private String accountName;		// 客户名称
	private String projectNo;		// 项目编号
	private String projectName;		// 项目名称
	private String projectBgDescription;		// 项目背景描述
	private String ownedIndustry;		// 所属行业
	private String projectFile;		// 项目附件
	private String marketingDirectorOpinion;		// 市场部主管意见
	private String viceMinisterOpinion;		// 商务部副总意见
	private String preSalesManagerOpinion;		// 售前部经理意见
	private String viewPermission;		// 可查看的人员权限列表（id集合用,分割）
	private Date beginEstablishmentTime;		// 开始 立项日期
	private Date endEstablishmentTime;		// 结束 立项日期
	private String remarkText;
	private String status;		// 审批状态（0：未送审；1：市场部主管审批；2：商务部副总审批；3：商务部联系人审批；4：售前经理审批；5：项目售前技术确认；6：项目管理专员编号；7：已结案；x:已销毁）
	private String isStart;		// 是否已进入流程（0：未开启；1：已开启）
	
	private User applicant;		// 申请人
	private Date applyDate;		// 申请日期
	private String currentUserId;
	/**
	 * 标题
	 */
	private String title;
	
	public OaProjectApproval() {
		super();
	}

	public OaProjectApproval(String id){
		super(id);
	}

	@Length(min=0, max=1, message="项目阶段长度必须介于 0 和 1 之间")
	public String getProjectStage() {
		return projectStage;
	}

	public void setProjectStage(String projectStage) {
		this.projectStage = projectStage;
	}
	
	@Length(min=0, max=1, message="服务类别长度必须介于 0 和 1 之间")
	public String getContractType() {
		return contractType;
	}

	public void setContractType(String contractType) {
		this.contractType = contractType;
	}
	
	@Length(min=0, max=1, message="是否投标长度必须介于 0 和 1 之间")
	public String getIsBid() {
		return isBid;
	}

	public void setIsBid(String isBid) {
		this.isBid = isBid;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getWriteTime() {
		return writeTime;
	}

	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getExpectedBidTime() {
		return expectedBidTime;
	}

	public void setExpectedBidTime(Date expectedBidTime) {
		this.expectedBidTime = expectedBidTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEstablishmentTime() {
		return establishmentTime;
	}

	public void setEstablishmentTime(Date establishmentTime) {
		this.establishmentTime = establishmentTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBookContractTime() {
		return bookContractTime;
	}

	public void setBookContractTime(Date bookContractTime) {
		this.bookContractTime = bookContractTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getActualContractTime() {
		return actualContractTime;
	}

	public void setActualContractTime(Date actualContractTime) {
		this.actualContractTime = actualContractTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getActualBidTime() {
		return actualBidTime;
	}

	public void setActualBidTime(Date actualBidTime) {
		this.actualBidTime = actualBidTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getProjectStartTime() {
		return projectStartTime;
	}

	public void setProjectStartTime(Date projectStartTime) {
		this.projectStartTime = projectStartTime;
	}
	
	public Double getProjectMoney() {
		return projectMoney;
	}

	public void setProjectMoney(Double projectMoney) {
		this.projectMoney = projectMoney;
	}
	
	public Double getExpectedMoney() {
		return expectedMoney;
	}

	public void setExpectedMoney(Double expectedMoney) {
		this.expectedMoney = expectedMoney;
	}
	
	public Double getContractMoney() {
		return contractMoney;
	}

	public void setContractMoney(Double contractMoney) {
		this.contractMoney = contractMoney;
	}
	
	public User getAccountManager() {
		return accountManager;
	}

	public void setAccountManager(User accountManager) {
		this.accountManager = accountManager;
	}
	
	public User getBusinessManager() {
		return businessManager;
	}

	public void setBusinessManager(User businessManager) {
		this.businessManager = businessManager;
	}
	
	public User getTechnicalManager() {
		return technicalManager;
	}

	public void setTechnicalManager(User technicalManager) {
		this.technicalManager = technicalManager;
	}
	
	public User getProjectManager() {
		return projectManager;
	}

	public void setProjectManager(User projectManager) {
		this.projectManager = projectManager;
	}
	
	@Length(min=0, max=64, message="客户名称长度必须介于 0 和 64 之间")
	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	
	@Length(min=0, max=64, message="项目编号长度必须介于 0 和 64 之间")
	public String getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	
	@Length(min=1, max=64, message="项目名称长度必须介于 0 和 64 之间")
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	@Length(min=0, max=500, message="项目背景描述长度必须介于 0 和 500 之间")
	public String getProjectBgDescription() {
		return projectBgDescription;
	}

	public void setProjectBgDescription(String projectBgDescription) {
		this.projectBgDescription = projectBgDescription;
	}
	
	@Length(min=0, max=64, message="所属行业长度必须介于 0 和 64 之间")
	public String getOwnedIndustry() {
		return ownedIndustry;
	}

	public void setOwnedIndustry(String ownedIndustry) {
		this.ownedIndustry = ownedIndustry;
	}
	
	
	@Length(min=0, max=1000, message="项目附件长度必须介于 0 和 1000 之间")
	public String getProjectFile() {
		return projectFile;
	}

	public void setProjectFile(String projectFile) {
		this.projectFile = projectFile;
	}
	
	@Length(min=0, max=200, message="市场部主管意见长度必须介于 0 和 200 之间")
	public String getMarketingDirectorOpinion() {
		return marketingDirectorOpinion;
	}

	public void setMarketingDirectorOpinion(String marketingDirectorOpinion) {
		this.marketingDirectorOpinion = marketingDirectorOpinion;
	}
	
	@Length(min=0, max=200, message="商务部副总意见长度必须介于 0 和 200 之间")
	public String getViceMinisterOpinion() {
		return viceMinisterOpinion;
	}

	public void setViceMinisterOpinion(String viceMinisterOpinion) {
		this.viceMinisterOpinion = viceMinisterOpinion;
	}
	
	@Length(min=0, max=200, message="售前部经理意见长度必须介于 0 和 200 之间")
	public String getPreSalesManagerOpinion() {
		return preSalesManagerOpinion;
	}

	public void setPreSalesManagerOpinion(String preSalesManagerOpinion) {
		this.preSalesManagerOpinion = preSalesManagerOpinion;
	}
	
	@Length(min=0, max=2000, message="可查看的人员权限列表（id集合用,分割）长度必须介于 0 和 2000 之间")
	public String getViewPermission() {
		return viewPermission;
	}

	public void setViewPermission(String viewPermission) {
		this.viewPermission = viewPermission;
	}
	
	public Date getBeginEstablishmentTime() {
		return beginEstablishmentTime;
	}

	public void setBeginEstablishmentTime(Date beginEstablishmentTime) {
		this.beginEstablishmentTime = beginEstablishmentTime;
	}
	
	public Date getEndEstablishmentTime() {
		return endEstablishmentTime;
	}

	public void setEndEstablishmentTime(Date endEstablishmentTime) {
		this.endEstablishmentTime = endEstablishmentTime;
	}

	public String getRemarkText() {
		return remarkText;
	}

	public void setRemarkText(String remarkText) {
		this.remarkText = remarkText;
	}
	
	@Length(min=0, max=1, message="审批状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIsStart() {
		return isStart;
	}

	public void setIsStart(String isStart) {
		this.isStart = isStart;
	}

	public User getApplicant() {
		return applicant;
	}

	public void setApplicant(User applicant) {
		this.applicant = applicant;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getCurrentUserId() {
		return currentUserId;
	}

	public void setCurrentUserId(String currentUserId) {
		this.currentUserId = currentUserId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
		
}