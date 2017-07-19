/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.staffturnover;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.modules.oa.entity.assetsturnover.AssetsTurnOver;
import com.thinkgem.jeesite.modules.oa.entity.workturnover.WorkTurnOver;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 人员异动Entity
 * @author zf
 * @version 2017-01-12
 */
public class StaffTurnover extends ActEntity<StaffTurnover> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 申请人
	private String employeeId;		// 工号
	private String position;		// 职位
	private String type;		// 异动类型
	private String reason;		// 异动原因
	private String postitionBefore;		// 异动前岗位
	private String postitionAfter;		// 异动后岗位
	private String officeLocatedBefore;		// 异动前办公地点
	private String officeLocatedAfter;		// 异动后办公地点
	private String phoneBefore;		// 异动前电话
	private String phoneAfter;		// 异动后电话
	private String deptDirectorSuggestionBefore;		// 前主管意见
	private String deptDirectorSuggestionAfter;		// 后主管意见
	private String deptManagerSuggestionBefore;		// 前部门经理意见
	private String deptManagerSuggestionAfter;		// 后部门经理意见
	private String deptBefore;		// 前部门
	private String deptAfter;		// 后部门
	private String generalManagerSuggestion;		// 总经理意见
	private Date effectiveDate;		// 生效日期
	private User workTurnoverReceiver;		// 工作交接接收人
	private User workTakeoverAcceptor;		// 工作交接监交人
	private User assetsTurnoverReceiver;		// 资产交接接受人
	private User assetsTakeoverAcceptor;		// 资产交接监交人
	private String onAccountYuan;		// 挂账
	private User onAccountStaff;		// 代冲人员
	private String payInBack;		// 补交
	private User financialStaff;	//财务人员
	/*private String procInsId;		// 流程ID*/
	private String title;		// 标题
	private String financeStatus; //财务状态
	private String status;		// 审核状态
	private String isStart;		// 是否已进入流程（0：未开启；1：已开启）
	
	private List<WorkTurnOver> workList; //工作交接
	
	private List<AssetsTurnOver> assetsList;	//资产交接
	
	/**自定义流程id*/
	public static final String PROC_DEF_KEY = "staff_turnover";
	
	/**物业表名*/
	public static final String BUSINESS_TABLE = "staff_turnover";
	
	/**流程查看路径*/
	public static final String WORKFLOW_URL = "@@proNotify@@/oa/a/oa/staffturnover/staffTurnover/form?id=";
	
	/**流程名称*/
	public static final String WORKFLOW_NAME = "人员异动申请";
	
	/**未送审*/
	public static final String WITHOUT_APPROVAL = "0";
	
	public StaffTurnover() {
		super();
	}

	public StaffTurnover(String id){
		super(id);
	}

	@Length(min=0, max=10, message="工号长度必须介于 0 和 10 之间")
	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	
	@Length(min=0, max=10, message="职位长度必须介于 0 和 10 之间")
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	@Length(min=0, max=2, message="异动类型长度必须介于 0 和 2 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=200, message="异动原因长度必须介于 0 和 200 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Length(min=0, max=10, message="异动前岗位长度必须介于 0 和 10 之间")
	public String getPostitionBefore() {
		return postitionBefore;
	}

	public void setPostitionBefore(String postitionBefore) {
		this.postitionBefore = postitionBefore;
	}
	
	@Length(min=0, max=10, message="异动后岗位长度必须介于 0 和 10 之间")
	public String getPostitionAfter() {
		return postitionAfter;
	}

	public void setPostitionAfter(String postitionAfter) {
		this.postitionAfter = postitionAfter;
	}
	
	@Length(min=0, max=30, message="异动前办公地点长度必须介于 0 和 30 之间")
	public String getOfficeLocatedBefore() {
		return officeLocatedBefore;
	}

	public void setOfficeLocatedBefore(String officeLocatedBefore) {
		this.officeLocatedBefore = officeLocatedBefore;
	}
	
	@Length(min=0, max=30, message="异动后办公地点长度必须介于 0 和 30 之间")
	public String getOfficeLocatedAfter() {
		return officeLocatedAfter;
	}

	public void setOfficeLocatedAfter(String officeLocatedAfter) {
		this.officeLocatedAfter = officeLocatedAfter;
	}
	
	@Length(min=0, max=11, message="异动前电话长度必须介于 0 和 11 之间")
	public String getPhoneBefore() {
		return phoneBefore;
	}

	public void setPhoneBefore(String phoneBefore) {
		this.phoneBefore = phoneBefore;
	}
	
	@Length(min=0, max=11, message="异动后电话长度必须介于 0 和 11 之间")
	public String getPhoneAfter() {
		return phoneAfter;
	}

	public void setPhoneAfter(String phoneAfter) {
		this.phoneAfter = phoneAfter;
	}
	
	@Length(min=0, max=30, message="前主管意见长度必须介于 0 和 30 之间")
	public String getDeptDirectorSuggestionBefore() {
		return deptDirectorSuggestionBefore;
	}

	public void setDeptDirectorSuggestionBefore(String deptDirectorSuggestionBefore) {
		this.deptDirectorSuggestionBefore = deptDirectorSuggestionBefore;
	}
	
	@Length(min=0, max=30, message="后主管意见长度必须介于 0 和 30 之间")
	public String getDeptDirectorSuggestionAfter() {
		return deptDirectorSuggestionAfter;
	}

	public void setDeptDirectorSuggestionAfter(String deptDirectorSuggestionAfter) {
		this.deptDirectorSuggestionAfter = deptDirectorSuggestionAfter;
	}
	
	@Length(min=0, max=30, message="前部门经理意见长度必须介于 0 和 30 之间")
	public String getDeptManagerSuggestionBefore() {
		return deptManagerSuggestionBefore;
	}

	public void setDeptManagerSuggestionBefore(String deptManagerSuggestionBefore) {
		this.deptManagerSuggestionBefore = deptManagerSuggestionBefore;
	}
	
	@Length(min=0, max=30, message="后部门经理意见长度必须介于 0 和 30 之间")
	public String getDeptManagerSuggestionAfter() {
		return deptManagerSuggestionAfter;
	}

	public void setDeptManagerSuggestionAfter(String deptManagerSuggestionAfter) {
		this.deptManagerSuggestionAfter = deptManagerSuggestionAfter;
	}
	
	@Length(min=0, max=64, message="前部门长度必须介于 0 和 64 之间")
	public String getDeptBefore() {
		return deptBefore;
	}

	public void setDeptBefore(String deptBefore) {
		this.deptBefore = deptBefore;
	}
	
	@Length(min=0, max=64, message="后部门长度必须介于 0 和 64 之间")
	public String getDeptAfter() {
		return deptAfter;
	}

	public void setDeptAfter(String deptAfter) {
		this.deptAfter = deptAfter;
	}
	
	@Length(min=0, max=30, message="总经理意见长度必须介于 0 和 30 之间")
	public String getGeneralManagerSuggestion() {
		return generalManagerSuggestion;
	}

	public void setGeneralManagerSuggestion(String generalManagerSuggestion) {
		this.generalManagerSuggestion = generalManagerSuggestion;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	
	@Length(min=0, max=5, message="挂账长度必须介于 0 和 5 之间")
	public String getOnAccountYuan() {
		return onAccountYuan;
	}

	public void setOnAccountYuan(String onAccountYuan) {
		this.onAccountYuan = onAccountYuan;
	}
	
	@Length(min=0, max=5, message="补交长度必须介于 0 和 5 之间")
	public String getPayInBack() {
		return payInBack;
	}

	public void setPayInBack(String payInBack) {
		this.payInBack = payInBack;
	}
	
	/*@Length(min=0, max=64, message="流程ID长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}*/
	
	@Length(min=0, max=30, message="标题长度必须介于 0 和 30 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=2, message="审核状态长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=1, message="是否已进入流程（0：未开启；1：已开启）长度必须介于 0 和 1 之间")
	public String getIsStart() {
		return isStart;
	}

	public void setIsStart(String isStart) {
		this.isStart = isStart;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getWorkTurnoverReceiver() {
		return workTurnoverReceiver;
	}

	public void setWorkTurnoverReceiver(User workTurnoverReceiver) {
		this.workTurnoverReceiver = workTurnoverReceiver;
	}

	public User getWorkTakeoverAcceptor() {
		return workTakeoverAcceptor;
	}

	public void setWorkTakeoverAcceptor(User workTakeoverAcceptor) {
		this.workTakeoverAcceptor = workTakeoverAcceptor;
	}

	public User getAssetsTurnoverReceiver() {
		return assetsTurnoverReceiver;
	}

	public void setAssetsTurnoverReceiver(User assetsTurnoverReceiver) {
		this.assetsTurnoverReceiver = assetsTurnoverReceiver;
	}

	public User getAssetsTakeoverAcceptor() {
		return assetsTakeoverAcceptor;
	}

	public void setAssetsTakeoverAcceptor(User assetsTakeoverAcceptor) {
		this.assetsTakeoverAcceptor = assetsTakeoverAcceptor;
	}

	public String getFinanceStatus() {
		return financeStatus;
	}

	public void setFinanceStatus(String financeStatus) {
		this.financeStatus = financeStatus;
	}

	public User getOnAccountStaff() {
		return onAccountStaff;
	}

	public void setOnAccountStaff(User onAccountStaff) {
		this.onAccountStaff = onAccountStaff;
	}

	public User getFinancialStaff() {
		return financialStaff;
	}

	public void setFinancialStaff(User financialStaff) {
		this.financialStaff = financialStaff;
	}

	public List<WorkTurnOver> getWorkList() {
		return workList;
	}

	public void setWorkList(List<WorkTurnOver> workList) {
		this.workList = workList;
	}

	public List<AssetsTurnOver> getAssetsList() {
		return assetsList;
	}

	public void setAssetsList(List<AssetsTurnOver> assetsList) {
		this.assetsList = assetsList;
	}

	
}