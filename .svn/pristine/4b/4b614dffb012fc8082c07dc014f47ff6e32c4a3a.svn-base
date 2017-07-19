/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.entertainmentr;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 招待费Entity
 * @author niting
 * @version 2017-01-12
 */
public class OaEntertainmentReimbursement  extends ActEntity<OaEntertainmentReimbursement> {
	
	private static final long serialVersionUID = 1L;
	private String procInsId;		// 流程关联Id
	private String fileId;		// 文件编号
	private Date date;		// 日期
	private String currentunit;		// 往来单位
	private String reason;		// 洽谈事由及项目名称
	private String meals;		// 餐费
	private String alcoholtobacco;		// 烟酒费
	private String numOur;		// 我们公司的人数
	private String numCustomers;		// 客户人数
	private String ispriorapproval;		// 是否在事前报批
	private String examname;		// 部门负责人签字
	private String examtext;		// 部门负责人意见
	private String examname1;		// 总经理签字
	private String examtext1;		// 总经理意见
	private String examname2;		// 财务单据签字
	private String examtext2;		// 财务单据意见
	private String moneyDouble;		// 合计金额（小写）
	private String moneyString;		// 合计金额（大写）
	private String officename;      //申请部门
	private String sameid;          //相同id
	private String isagree;			//部门负责人是否同意
	private String isagree1;		//总经理是否同意
	private String isagree2;		//财务是否同意
	private String flag;//提交还是废弃
	
	public OaEntertainmentReimbursement() {
		super();
	}

	public OaEntertainmentReimbursement(String id){
		super(id);
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getIsagree1() {
		return isagree1;
	}

	public void setIsagree1(String isagree1) {
		this.isagree1 = isagree1;
	}

	public String getIsagree2() {
		return isagree2;
	}

	public void setIsagree2(String isagree2) {
		this.isagree2 = isagree2;
	}

	public String getIsagree() {
		return isagree;
	}

	public void setIsagree(String isagree) {
		this.isagree = isagree;
	}

	@Length(min=0, max=64, message="流程关联Id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}	
		
	public String getSameid() {
		return sameid;
	}

	public void setSameid(String sameid) {
		this.sameid = sameid;
	}

	public String getOfficename() {
		return officename;
	}

	public void setOfficename(String officename) {
		this.officename = officename;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
	@Length(min=0, max=64, message="文件编号长度必须介于 0 和 64 之间")
	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="日期不能为空")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	@Length(min=1, max=100, message="往来单位长度必须介于 1 和 100 之间")
	public String getCurrentunit() {
		return currentunit;
	}

	public void setCurrentunit(String currentunit) {
		this.currentunit = currentunit;
	}
	
	@Length(min=1, max=255, message="洽谈事由及项目名称长度必须介于 1 和 255 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public String getMeals() {
		return meals;
	}

	public void setMeals(String meals) {
		this.meals = meals;
	}
	
	public String getAlcoholtobacco() {
		return alcoholtobacco;
	}

	public void setAlcoholtobacco(String alcoholtobacco) {
		this.alcoholtobacco = alcoholtobacco;
	}
	
	@Length(min=1, max=4, message="我们公司的人数长度必须介于 1 和 4 之间")
	public String getNumOur() {
		return numOur;
	}

	public void setNumOur(String numOur) {
		this.numOur = numOur;
	}
	
	@Length(min=1, max=4, message="客户人数长度必须介于 1 和 4 之间")
	public String getNumCustomers() {
		return numCustomers;
	}

	public void setNumCustomers(String numCustomers) {
		this.numCustomers = numCustomers;
	}
	
	@Length(min=0, max=10, message="是否在事前报批长度必须介于 0 和 10 之间")
	public String getIspriorapproval() {
		return ispriorapproval;
	}

	public void setIspriorapproval(String ispriorapproval) {
		this.ispriorapproval = ispriorapproval;
	}
	
	@Length(min=0, max=64, message="部门负责人签字长度必须介于 0 和 64 之间")
	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}
	
	@Length(min=0, max=100, message="部门负责人意见长度必须介于 0 和 100 之间")
	public String getExamtext() {
		return examtext;
	}

	public void setExamtext(String examtext) {
		this.examtext = examtext;
	}
	
	@Length(min=0, max=64, message="总经理签字长度必须介于 0 和 64 之间")
	public String getExamname1() {
		return examname1;
	}

	public void setExamname1(String examname1) {
		this.examname1 = examname1;
	}
	
	@Length(min=0, max=100, message="总经理意见长度必须介于 0 和 100 之间")
	public String getExamtext1() {
		return examtext1;
	}

	public void setExamtext1(String examtext1) {
		this.examtext1 = examtext1;
	}
	
	@Length(min=0, max=64, message="财务单据签字长度必须介于 0 和 64 之间")
	public String getExamname2() {
		return examname2;
	}

	public void setExamname2(String examname2) {
		this.examname2 = examname2;
	}
	
	@Length(min=0, max=100, message="财务单据意见长度必须介于 0 和 100 之间")
	public String getExamtext2() {
		return examtext2;
	}

	public void setExamtext2(String examtext2) {
		this.examtext2 = examtext2;
	}
	
	public String getMoneyDouble() {
		return moneyDouble;
	}

	public void setMoneyDouble(String moneyDouble) {
		this.moneyDouble = moneyDouble;
	}
	
	@Length(min=0, max=100, message="合计金额（大写）长度必须介于 0 和 100 之间")
	public String getMoneyString() {
		return moneyString;
	}

	public void setMoneyString(String moneyString) {
		this.moneyString = moneyString;
	}
	
}