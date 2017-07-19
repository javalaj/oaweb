/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.filling;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 人事部归档Entity
 * 
 * @author lzx
 * @version 2016-11-23
 */
public class OaFilling extends DataEntity<OaFilling> {

	private static final long serialVersionUID = 1L;
	private User applyUser; // 发起人
	private Date applyDate; // 发起日期
	private String applyType; // 申请种类
	private String applyTypeLit; // 申请小类
	private Date fillingDate; // 归档时间
	private String applyReason; // 申请理由
	private Date beginDate; // 开始日期
	private Date endDate; // 结束日期
	private String hours; // 时长
	// 查询条件额外字段，数据库没有记录
	private String type;// 申请类型
	private String updateName;// 归档人姓名
	private String createName;// 发起人姓名
	private Date begindate2;// 归档时间段开始日期
	private Date enddate2;// 归档时间段结束日期

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUpdateName() {
		return updateName;
	}

	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	

	public Date getBegindate2() {
		return begindate2;
	}

	public void setBegindate2(Date begindate2) {
		this.begindate2 = begindate2;
	}

	public Date getEnddate2() {
		return enddate2;
	}

	public void setEnddate2(Date enddate2) {
		this.enddate2 = enddate2;
	}

	public OaFilling() {
		super();
	}

	public OaFilling(String id) {
		super(id);
	}

	@Length(min = 0, max = 255, message = "发起人长度必须介于 0 和 255 之间")
	public User getApplyUser() {
		return applyUser;
	}

	public void setApplyUser(User applyUser) {
		this.applyUser = applyUser;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	@Length(min = 0, max = 255, message = "申请种类长度必须介于 0 和 255 之间")
	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	@Length(min = 0, max = 255, message = "申请小类长度必须介于 0 和 255 之间")
	public String getApplyTypeLit() {
		return applyTypeLit;
	}

	public void setApplyTypeLit(String applyTypeLit) {
		this.applyTypeLit = applyTypeLit;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getFillingDate() {
		return fillingDate;
	}

	public void setFillingDate(Date fillingDate) {
		this.fillingDate = fillingDate;
	}

	@Length(min = 0, max = 255, message = "申请理由长度必须介于 0 和 255 之间")
	public String getApplyReason() {
		return applyReason;
	}

	public void setApplyReason(String applyReason) {
		this.applyReason = applyReason;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Length(min = 0, max = 11, message = "时长长度必须介于 0 和 11 之间")
	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}

}