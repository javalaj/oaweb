/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.project;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.oa.web.project.utils.annotation.CompareField;
import com.thinkgem.jeesite.modules.sys.entity.User;
import java.util.List;


import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 项目表的管理Entity
 * @author 李廷龙
 * @version 2016-11-17
 */
public class OaProject extends DataEntity<OaProject> {
	
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
	private String procInsId;		// 流程实例ID
	private String projectFile;		// 项目附件
	private String marketingDirectorOpinion;		// 市场部主管意见
	private String viceMinisterOpinion;		// 商务部副总意见
	private String preSalesManagerOpinion;		// 售前部经理意见
	private String viewPermission;		// 可查看的人员权限列表
	private String writeWay;		// 录入方式（0：申请审批转档，1：手动录入）
	private Date beginEstablishmentTime;		// 开始 立项日期
	private Date endEstablishmentTime;		// 结束 立项日期
	private Double beginProjectMoney;		// 开始 项目金额
	private Double endProjectMoney;		// 结束 项目金额
	private String searchUserId;	// 查询用户
	private String  statisticsWordType;	// 项目统计字段类型
	
	private Date  startDate;	// 项目开始日期
	private Integer  planDay;	// 项目计划工期
	private Date  pauseDate;	// 暂停日期
	private Date  cancelDate;	// 取消日期
	private String  state;	// 项目状态（0.未完成、1.完成、2.暂停、3.取消）
	
	private String  programVersion;// 程序版本
	
	private int documentCount;
	private int weekreportCount;
	private Integer totalChangeDay;
	private int oaPlanCount;
	
	
	private List<OaProjectOperation> oaProjectOperationList = Lists.newArrayList();		// 子表列表
	private List<OaProjectDocument> oaProjectDocumentList = Lists.newArrayList();		// 子表列表
	private List<OaProjectWeekreport> oaProjectWeekreportList = Lists.newArrayList();		// 子表列表
	
	private List<OaProjectMember> oaProjectMemberList = Lists.newArrayList();		// 子表列表
	
	public OaProject() {
		super();
	}

	public OaProject(String id){
		super(id);
	}

	@Length(min=0, max=1, message="项目阶段长度必须介于 0 和 1 之间")
	@CompareField(title="项目阶段",sort=15,dictType="oa_project_projectStage")
	public String getProjectStage() {
		return projectStage;
	}

	public void setProjectStage(String projectStage) {
		this.projectStage = projectStage;
	}
	
	
	@ExcelField(title="ID", type=1, align=2, sort=1)
	public String getId() {
		return id;
	}
	
	@Length(min=0, max=1, message="服务类别长度必须介于 0 和 1 之间")
	@ExcelField(title="服务类别", align=2, sort=20)
	@CompareField(title="服务类别",sort=6,dictType="oa_project_contractType")
	public String getContractType() {
		return contractType;
	}

	public void setContractType(String contractType) {
		this.contractType = contractType;
	}
	
	@Length(min=0, max=1, message="是否投标长度必须介于 0 和 1 之间")
	@ExcelField(title="是否投标", align=2, sort=21)
	@CompareField(title="是否投标",sort=9,dictType="yes_no")
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
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@CompareField(title="预计投标日期",sort=10,dateFormate="yyyy-MM-dd")
	public Date getExpectedBidTime() {
		return expectedBidTime;
	}

	public void setExpectedBidTime(Date expectedBidTime) {
		this.expectedBidTime = expectedBidTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@CompareField(title="立项日期",sort=8,dateFormate="yyyy-MM-dd HH:mm:ss")
	public Date getEstablishmentTime() {
		return establishmentTime;
	}

	public void setEstablishmentTime(Date establishmentTime) {
		this.establishmentTime = establishmentTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@CompareField(title="预计签约日期",sort=11,dateFormate="yyyy-MM-dd")
	public Date getBookContractTime() {
		return bookContractTime;
	}

	public void setBookContractTime(Date bookContractTime) {
		this.bookContractTime = bookContractTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@CompareField(title="实际签约日期",sort=19,dateFormate="yyyy-MM-dd HH:mm:ss")
	public Date getActualContractTime() {
		return actualContractTime;
	}

	public void setActualContractTime(Date actualContractTime) {
		this.actualContractTime = actualContractTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@CompareField(title="实际投标日期",sort=20,dateFormate="yyyy-MM-dd HH:mm:ss")
	public Date getActualBidTime() {
		return actualBidTime;
	}

	public void setActualBidTime(Date actualBidTime) {
		this.actualBidTime = actualBidTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@CompareField(title="项目启动时间",sort=21,dateFormate="yyyy-MM-dd HH:mm:ss")
	public Date getProjectStartTime() {
		return projectStartTime;
	}

	public void setProjectStartTime(Date projectStartTime) {
		this.projectStartTime = projectStartTime;
	}
	@CompareField(title="项目金额",sort=17)
	public Double getProjectMoney() {
		return projectMoney;
	}

	public void setProjectMoney(Double projectMoney) {
		this.projectMoney = projectMoney;
	}
	@CompareField(title="预计金额",sort=7)
	public Double getExpectedMoney() {
		return expectedMoney;
	}

	public void setExpectedMoney(Double expectedMoney) {
		this.expectedMoney = expectedMoney;
	}
	@CompareField(title="合同金额",sort=18)
	public Double getContractMoney() {
		return contractMoney;
	}

	public void setContractMoney(Double contractMoney) {
		this.contractMoney = contractMoney;
	}
	
	@CompareField(title="客户经理",sort=3)
	public User getAccountManager() {
		return accountManager;
	}

	public void setAccountManager(User accountManager) {
		this.accountManager = accountManager;
	}
	@CompareField(title="商务支持",sort=12)
	public User getBusinessManager() {
		return businessManager;
	}

	public void setBusinessManager(User businessManager) {
		this.businessManager = businessManager;
	}
	@CompareField(title="技术支持",sort=13)
	public User getTechnicalManager() {
		return technicalManager;
	}

	public void setTechnicalManager(User technicalManager) {
		this.technicalManager = technicalManager;
	}
	@CompareField(title="工程经理",sort=16)
	public User getProjectManager() {
		return projectManager;
	}

	public void setProjectManager(User projectManager) {
		this.projectManager = projectManager;
	}
	
	@Length(min=1, max=64, message="客户名称长度必须介于 1 和 64 之间")
	@CompareField(title="客户名称",sort=4)
	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	
	@Length(min=1, max=64, message="项目编号长度必须介于 1 和 64 之间")
	@CompareField(title="项目编号",sort=2)
	public String getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	
	@Length(min=1, max=64, message="项目名称长度必须介于 1 和 64 之间")
	@ExcelField(title="项目名称", align=2, sort=22)
	@CompareField(title="项目名称",sort=1)
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	@Length(min=0, max=500, message="项目背景描述长度必须介于 0 和 500 之间")
	@CompareField(title="项目背景",sort=14)
	public String getProjectBgDescription() {
		return projectBgDescription;
	}

	public void setProjectBgDescription(String projectBgDescription) {
		this.projectBgDescription = projectBgDescription;
	}
	
	@Length(min=0, max=64, message="所属行业长度必须介于 0 和 64 之间")
	@CompareField(title="所属行业",sort=5,dictType="oa_project_ownedIndustry")
	public String getOwnedIndustry() {
		return ownedIndustry;
	}

	public void setOwnedIndustry(String ownedIndustry) {
		this.ownedIndustry = ownedIndustry;
	}
	
	@Length(min=0, max=64, message="流程实例ID长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
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
	
	@Length(min=0, max=2000, message="可查看的人员权限列表长度必须介于 0 和 2000 之间")
	public String getViewPermission() {
		return viewPermission;
	}

	public void setViewPermission(String viewPermission) {
		this.viewPermission = viewPermission;
	}
	
	@Length(min=0, max=1, message="录入方式（0：审批转档，1：手动录入）长度必须介于 0 和 1 之间")
	public String getWriteWay() {
		return writeWay;
	}

	public void setWriteWay(String writeWay) {
		this.writeWay = writeWay;
	}
	/**
	 * 审批转档
	 */
	public static final String WRITE_WAY_APPROVAL="0";
	/**
	 * 常规方式，非审批转档
	 */
	public static final String WRITE_WAY_COMMON="1";
	
	
	
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
		
	public Double getBeginProjectMoney() {
		return beginProjectMoney;
	}

	public void setBeginProjectMoney(Double beginProjectMoney) {
		this.beginProjectMoney = beginProjectMoney;
	}
	
	public Double getEndProjectMoney() {
		return endProjectMoney;
	}

	public void setEndProjectMoney(Double endProjectMoney) {
		this.endProjectMoney = endProjectMoney;
	}
		
	public List<OaProjectWeekreport> getOaProjectWeekreportList() {
		return oaProjectWeekreportList;
	}

	public void setOaProjectWeekreportList(List<OaProjectWeekreport> oaProjectWeekreportList) {
		this.oaProjectWeekreportList = oaProjectWeekreportList;
	}

	public List<OaProjectDocument> getOaProjectDocumentList() {
		return oaProjectDocumentList;
	}

	public void setOaProjectDocumentList(List<OaProjectDocument> oaProjectDocumentList) {
		this.oaProjectDocumentList = oaProjectDocumentList;
	}
	
	public List<OaProjectOperation> getOaProjectOperationList() {
		return oaProjectOperationList;
	}

	public void setOaProjectOperationList(List<OaProjectOperation> oaProjectOperationList) {
		this.oaProjectOperationList = oaProjectOperationList;
	}

	public String getSearchUserId() {
		return searchUserId;
	}

	public void setSearchUserId(String searchUserId) {
		this.searchUserId = searchUserId;
	}

	public String getStatisticsWordType() {
		return statisticsWordType;
	}

	public void setStatisticsWordType(String statisticsWordType) {
		this.statisticsWordType = statisticsWordType;
	}

	public int getDocumentCount() {
		return documentCount;
	}

	public void setDocumentCount(int documentCount) {
		this.documentCount = documentCount;
	}

	public int getWeekreportCount() {
		return weekreportCount;
	}

	public void setWeekreportCount(int weekreportCount) {
		this.weekreportCount = weekreportCount;
	}

	@Override
	public String toString() {
		return id;
	}

	public List<OaProjectMember> getOaProjectMemberList() {
		return oaProjectMemberList;
	}

	public void setOaProjectMemberList(List<OaProjectMember> oaProjectMemberList) {
		this.oaProjectMemberList = oaProjectMemberList;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Integer getPlanDay() {
		return planDay;
	}

	public void setPlanDay(Integer planDay) {
		this.planDay = planDay;
	}

	public Date getPauseDate() {
		return pauseDate;
	}

	public void setPauseDate(Date pauseDate) {
		this.pauseDate = pauseDate;
	}

	public Date getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	/**
	 * 未完成
	 */
	public static final String STATE_UNCOMPLETED="0";
	/**
	 * 新
	 */
	public static final String STATE_UNCOMPLETED_NEW="01";
	/**
	 * 进行
	 */
	public static final String STATE_UNCOMPLETED_RUNNING="02";
	/**
	 * 完成
	 */
	public static final String STATE_COMPLETED="1";
	/**
	 * 暂停
	 */
	public static final String STATE_PAUSE="2";
	/**
	 * 取消
	 */
	public static final String STATE_CANCEL="3";
	public Integer getTotalChangeDay() {
		return totalChangeDay;
	}

	public void setTotalChangeDay(Integer totalChangeDay) {
		this.totalChangeDay = totalChangeDay;
	}

	public String getProgramVersion() {
		return programVersion;
	}

	public void setProgramVersion(String programVersion) {
		this.programVersion = programVersion;
	}

	public int getOaPlanCount() {
		return oaPlanCount;
	}

	public void setOaPlanCount(int oaPlanCount) {
		this.oaPlanCount = oaPlanCount;
	}

	
	
}