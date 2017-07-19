/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;

/**
 * 员工转正申请流程Entity
 * 
 * @author liuxin
 * @version 2016-12-15
 */
public class OaEmployeeFormal extends ActEntity<OaEmployeeFormal> {

	private static final long serialVersionUID = 1L;
	private String procInsId; // 流程关联id
	private String name; // 姓名
	private String age; // 年龄
	private String sex; // 性别
	private String officeName; // 部门名称
	private String phone; // 手机号码
	private Date tryoutDate; // 入职日期
	private String tryoutSalary; // 试用期薪酬(月薪)
	private Date formalDate; // 转正日期
	private String formalSalary; // 试用期薪酬(月薪)
	private String reason; // 转正申请备注
	private String examname; // 部门主管签名
	private String examtext; // 部门主管意见
	private String examname2; // 部门副总签名
	private String examtext2; // 部门副总意见
	private String examname3; // 人事行政部副总签名
	private String examtext3; // 人事行政部副总意见

	// 新加入，人事经理审核节点
	private String examname4;// 人事经理名字
	private String examtext4;// 人事经理意见

	public String getExamname4() {
		return examname4;
	}

	public void setExamname4(String examname4) {
		this.examname4 = examname4;
	}

	public String getExamtext4() {
		return examtext4;
	}

	public void setExamtext4(String examtext4) {
		this.examtext4 = examtext4;
	}

	public OaEmployeeFormal() {
		super();
	}

	public OaEmployeeFormal(String id) {
		super(id);
	}

	@Length(min = 0, max = 64, message = "流程关联id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	@Length(min = 1, max = 100, message = "姓名长度必须介于 1 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(min = 0, max = 64, message = "年龄长度必须介于 0 和 64 之间")
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	@Length(min = 0, max = 64, message = "性别长度必须介于 0 和 64 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Length(min = 0, max = 100, message = "部门名称长度必须介于 0 和 100 之间")
	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	@Length(min = 0, max = 64, message = "手机号码长度必须介于 0 和 64 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message = "入职日期不能为空")
	public Date getTryoutDate() {
		return tryoutDate;
	}

	public void setTryoutDate(Date tryoutDate) {
		this.tryoutDate = tryoutDate;
	}

	@Length(min = 1, max = 64, message = "试用期薪酬(月薪)长度必须介于 1 和 64 之间")
	public String getTryoutSalary() {
		return tryoutSalary;
	}

	public void setTryoutSalary(String tryoutSalary) {
		this.tryoutSalary = tryoutSalary;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message = "转正日期不能为空")
	public Date getFormalDate() {
		return formalDate;
	}

	public void setFormalDate(Date formalDate) {
		this.formalDate = formalDate;
	}

	@Length(min = 1, max = 64, message = "试用期薪酬(月薪)长度必须介于 1 和 64 之间")
	public String getFormalSalary() {
		return formalSalary;
	}

	public void setFormalSalary(String formalSalary) {
		this.formalSalary = formalSalary;
	}

	@Length(min = 0, max = 255, message = "转正申请备注长度必须介于 0 和 255 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Length(min = 0, max = 100, message = "部门主管签名长度必须介于 0 和 100 之间")
	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	@Length(min = 0, max = 255, message = "部门主管意见长度必须介于 0 和 255 之间")
	public String getExamtext() {
		return examtext;
	}

	public void setExamtext(String examtext) {
		this.examtext = examtext;
	}

	@Length(min = 0, max = 100, message = "部门副总签名长度必须介于 0 和 100 之间")
	public String getExamname2() {
		return examname2;
	}

	public void setExamname2(String examname2) {
		this.examname2 = examname2;
	}

	@Length(min = 0, max = 255, message = "部门副总意见长度必须介于 0 和 255 之间")
	public String getExamtext2() {
		return examtext2;
	}

	public void setExamtext2(String examtext2) {
		this.examtext2 = examtext2;
	}

	@Length(min = 0, max = 100, message = "人事行政部副总签名长度必须介于 0 和 100 之间")
	public String getExamname3() {
		return examname3;
	}

	public void setExamname3(String examname3) {
		this.examname3 = examname3;
	}

	@Length(min = 0, max = 255, message = "人事行政部副总意见长度必须介于 0 和 255 之间")
	public String getExamtext3() {
		return examtext3;
	}

	public void setExamtext3(String examtext3) {
		this.examtext3 = examtext3;
	}

}