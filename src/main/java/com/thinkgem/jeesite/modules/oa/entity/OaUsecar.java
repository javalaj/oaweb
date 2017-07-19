/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 车辆管理流程Entity
 * @author niting
 * @version 2016-11-21
 */
public class OaUsecar extends ActEntity<OaUsecar> {
	
	private static final long serialVersionUID = 1L;
	private String procInsId;		// 流程关联id
	private String fileId;		// 文件编号
	private String department;		// 用车部门
	private Date usetime;		// 用车时间
	private String usereason;		// 用车原因
	private String destination;		// 目的地
	private String examname;		// 主管负责人名字
	private String examtext;		// 主管负责人审核意见
	private String examname2;		// 负责人第二次签名
	private String examtext2;		// 变更目的地之后负责人意见
	private String usescope;		// 用车范围
	private String destinationchange;		// 变更目的地
	private String platenum;		// 车牌号
	private String driver;		// 司机
	private Date gotime;		// 出发时间
	private Date backtime;		// 返回时间
	private String gokilometer;		// 起始公里数
	private String backkilometer;		// 返回公里数
	private String safearrive;		// 是否安全到达
	private String fillingName;//归档人
	private String fillingTime;//归档时间
		
	
	public String getFillingTime() {
		return fillingTime;
	}

	public void setFillingTime(String fillingTime) {
		this.fillingTime = fillingTime;
	}

	public String getFillingName() {
		return fillingName;
	}

	public void setFillingName(String fillingName) {
		this.fillingName = fillingName;
	}

	public OaUsecar() {
		super();
	}

	public OaUsecar(String id){
		super(id);
	}

	@Length(min=0, max=64, message="流程关联id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
	@Length(min=0, max=100, message="文件编号长度必须介于 0 和 100 之间")
	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	
	@Length(min=1, max=64, message="用车部门长度必须介于 1 和 64 之间")
	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="用车时间不能为空")
	public Date getUsetime() {
		return usetime;
	}

	public void setUsetime(Date usetime) {
		this.usetime = usetime;
	}
	
	@Length(min=1, max=64, message="用车原因长度必须介于 1 和 64 之间")
	public String getUsereason() {
		return usereason;
	}

	public void setUsereason(String usereason) {
		this.usereason = usereason;
	}
	
	@Length(min=1, max=64, message="目的地长度必须介于 1 和 64 之间")
	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}
	
	@Length(min=0, max=64, message="主管负责人名字长度必须介于 0 和 64 之间")
	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}
	
	@Length(min=0, max=1000, message="主管负责人审核意见长度必须介于 0 和 1000之间")
	public String getExamtext() {
		return examtext;
	}

	public void setExamtext(String examtext) {
		this.examtext = examtext;
	}
	
	@Length(min=0, max=64, message="负责人第二次签名长度必须介于 0 和 64 之间")
	public String getExamname2() {
		return examname2;
	}

	public void setExamname2(String examname2) {
		this.examname2 = examname2;
	}
	
	@Length(min=0, max=1000, message="变更目的地之后负责人意见长度必须介于 0 和 1000 之间")
	public String getExamtext2() {
		return examtext2;
	}

	public void setExamtext2(String examtext2) {
		this.examtext2 = examtext2;
	}		
	
	@Length(min=0, max=64, message="用车范围长度必须介于 0 和 64 之间")
	@NotNull(message="用车范围不能为空")
	public String getUsescope() {
		return usescope;
	}

	public void setUsescope(String usescope) {
		this.usescope = usescope;
	}
	
	@Length(min=0, max=64, message="变更目的地长度必须介于 0 和 64 之间")
	public String getDestinationchange() {
		return destinationchange;
	}

	public void setDestinationchange(String destinationchange) {
		this.destinationchange = destinationchange;
	}
	
	@Length(min=0, max=64, message="车牌号长度必须介于 0 和 64 之间")
	public String getPlatenum() {
		return platenum;
	}

	public void setPlatenum(String platenum) {
		this.platenum = platenum;
	}
	
	@Length(min=0, max=64, message="司机长度必须介于 0 和 64 之间")
	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getGotime() {
		return gotime;
	}

	public void setGotime(Date gotime) {
		this.gotime = gotime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBacktime() {
		return backtime;
	}

	public void setBacktime(Date backtime) {
		this.backtime = backtime;
	}
	
	@Length(min=0, max=64, message="起始公里数长度必须介于 0 和 64 之间")
	public String getGokilometer() {
		return gokilometer;
	}

	public void setGokilometer(String gokilometer) {
		this.gokilometer = gokilometer;
	}
	
	@Length(min=0, max=64, message="返回公里数长度必须介于 0 和 64 之间")
	public String getBackkilometer() {
		return backkilometer;
	}

	public void setBackkilometer(String backkilometer) {
		this.backkilometer = backkilometer;
	}
	
	@Length(min=0, max=4, message="是否安全到达长度必须介于 0 和 4 之间")
	public String getSafearrive() {
		return safearrive;
	}

	public void setSafearrive(String safearrive) {
		this.safearrive = safearrive;
	}
	
}