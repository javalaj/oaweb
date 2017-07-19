/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.emp;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.common.persistence.ActEntity;

/**
 * 人员入职审批Entity
 * @author 李廷龙
 * @version 2016-11-28
 */
public class OaEmpJoinApproval extends ActEntity<OaEmpJoinApproval> {
	
	private static final long serialVersionUID = 1L;
	private String sex;		// 性别
	private String degrees;		// 最高学历
	private Date entryTime;		// 入职时间
	private String empName;		// 姓名
	private String nation;		// 民族
	private Office office;		// 归属部门
	private String duty;		// 职务
	private String title;		// 职称
	private String idNumber;		// 身份证号
	private String homeAddress;		// 现家庭住址
	private String probationSalary;		// 试用期工资
	private String regularSalary;		// 正式期工资
	private String deptMinisterOpinion;		// 部门副总意见
	private String hrOpinion;		// 人力资源部意见
	private String hrMinisterOpinion;		// 行政人事副总意见
	private String status;		// 审批状态（0：未送审；1：部门副总审批；2：人力资源审批；3：行政人事副总审批；x：已结案；y：已销毁）
	private String isConverttouser="0";		// 是否已经转为用户信息数据（0：未转；1：已转；）
	private Date beginEntryTime;		// 开始 入职时间
	private Date endEntryTime;		// 结束 入职时间
	private String isStart="0";		// 是否已开启流程（0：未开启；1：已开启；）
	
	private String examinerOpinion;		// 面试考官意见
	private String empDeptMinisterOpinion;		// 入职员工归属部门负责人意见
	private String telephone;		// 联系电话
	/**
	 * 标题
	 */
	private String titles;
	public OaEmpJoinApproval() {
		super();
	}

	public OaEmpJoinApproval(String id){
		super(id);
	}

	@Length(min=0, max=1, message="性别长度必须介于 0 和 1 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=0, max=1, message="最高学历长度必须介于 0 和 1 之间")
	public String getDegrees() {
		return degrees;
	}

	public void setDegrees(String degrees) {
		this.degrees = degrees;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}
	
	@Length(min=0, max=64, message="姓名长度必须介于 0 和 64 之间")
	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
	@Length(min=0, max=64, message="民族长度必须介于 0 和 64 之间")
	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}
	
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	@Length(min=0, max=64, message="职务长度必须介于 0 和 64 之间")
	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}
	
	@Length(min=0, max=64, message="职称长度必须介于 0 和 64 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=64, message="身份证号长度必须介于 0 和 64 之间")
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	@Length(min=0, max=64, message="现家庭住址长度必须介于 0 和 64 之间")
	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}
	
	@Length(min=0, max=64, message="试用期工资长度必须介于 0 和 64 之间")
	public String getProbationSalary() {
		return probationSalary;
	}

	public void setProbationSalary(String probationSalary) {
		this.probationSalary = probationSalary;
	}
	
	@Length(min=0, max=64, message="正式期工资长度必须介于 0 和 64 之间")
	public String getRegularSalary() {
		return regularSalary;
	}

	public void setRegularSalary(String regularSalary) {
		this.regularSalary = regularSalary;
	}
	
	@Length(min=0, max=200, message="部门副总意见长度必须介于 0 和 200 之间")
	public String getDeptMinisterOpinion() {
		return deptMinisterOpinion;
	}

	public void setDeptMinisterOpinion(String deptMinisterOpinion) {
		this.deptMinisterOpinion = deptMinisterOpinion;
	}
	
	@Length(min=0, max=200, message="人力资源部意见长度必须介于 0 和 200 之间")
	public String getHrOpinion() {
		return hrOpinion;
	}

	public void setHrOpinion(String hrOpinion) {
		this.hrOpinion = hrOpinion;
	}
	
	@Length(min=0, max=200, message="行政人事副总意见长度必须介于 0 和 200 之间")
	public String getHrMinisterOpinion() {
		return hrMinisterOpinion;
	}

	public void setHrMinisterOpinion(String hrMinisterOpinion) {
		this.hrMinisterOpinion = hrMinisterOpinion;
	}
	
	@Length(min=0, max=1, message="审批状态（0：未送审；1：部门副总审批；2：人力资源审批；3：行政人事副总审批；x：已结案；y：已销毁）长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=1, message="是否已经转为用户信息数据（0：未转；1：已转；）长度必须介于 0 和 1 之间")
	public String getIsConverttouser() {
		return isConverttouser;
	}

	public void setIsConverttouser(String isConverttouser) {
		this.isConverttouser = isConverttouser;
	}
	
	public Date getBeginEntryTime() {
		return beginEntryTime;
	}

	public void setBeginEntryTime(Date beginEntryTime) {
		this.beginEntryTime = beginEntryTime;
	}
	
	public Date getEndEntryTime() {
		return endEntryTime;
	}

	public void setEndEntryTime(Date endEntryTime) {
		this.endEntryTime = endEntryTime;
	}

	public String getIsStart() {
		return isStart;
	}

	public void setIsStart(String isStart) {
		this.isStart = isStart;
	}
	@Length(min=0, max=200, message="面试考官意见长度必须介于 0 和 200 之间")
	public String getExaminerOpinion() {
		return examinerOpinion;
	}

	public void setExaminerOpinion(String examinerOpinion) {
		this.examinerOpinion = examinerOpinion;
	}
	@Length(min=0, max=200, message="入职员工归属部门负责人意见长度必须介于 0 和 200 之间")
	public String getEmpDeptMinisterOpinion() {
		return empDeptMinisterOpinion;
	}

	public void setEmpDeptMinisterOpinion(String empDeptMinisterOpinion) {
		this.empDeptMinisterOpinion = empDeptMinisterOpinion;
	}
	@Length(min=0, max=64, message="联系电话长度必须介于 0 和 64 之间")
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getTitles() {
		return titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
	}
		
}