/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.coding;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 从打卡机导出的数据存储Entity
 * @author 李正曦
 * @version 2016-11-04
 */
public class OaCoding extends DataEntity<OaCoding> {
	
	private static final long serialVersionUID = 1L;
	private String deptName;		// 部门名称
	private String userName;		// 人员姓名
	private String userNo;		// 人员编号
	private Date codingTime;		// 打卡时间
	private String equipNo;		// 记录设备编号
	
	/**
	 * 最晚打卡时间
	 */
	private Date maxCodingTime;
	/**
	 * 最早打卡时间
	 */
	private Date minCodingTime;
	
	/**
	 * 查询日期yyyy-MM-dd,用作设置查询条件
	 */
	private String searchDate;
	
	public OaCoding() {
		super();
	}

	public OaCoding(String id){
		super(id);
	}

	@Length(min=0, max=64, message="部门名称长度必须介于 0 和 64 之间")
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	@Length(min=0, max=64, message="人员姓名长度必须介于 0 和 64 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=11, message="人员编号长度必须介于 0 和 11 之间")
	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCodingTime() {
		return codingTime;
	}

	public void setCodingTime(Date codingTime) {
		this.codingTime = codingTime;
	}
	
	@Length(min=0, max=11, message="记录设备编号长度必须介于 0 和 11 之间")
	public String getEquipNo() {
		return equipNo;
	}

	public void setEquipNo(String equipNo) {
		this.equipNo = equipNo;
	}

	/**
	 * 最晚打卡时间
	 * @return
	 */
	public Date getMaxCodingTime() {
		return maxCodingTime;
	}

	public void setMaxCodingTime(Date maxCodingTime) {
		this.maxCodingTime = maxCodingTime;
	}

	/**
	 * 最早打卡时间
	 * @return
	 */
	public Date getMinCodingTime() {
		return minCodingTime;
	}

	public void setMinCodingTime(Date minCodingTime) {
		this.minCodingTime = minCodingTime;
	}

	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	
}