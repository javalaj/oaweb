/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.entity;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 每周计划集合类，没有具体计划细节Entity
 * 
 * @author liuxin
 * @version 2016-11-04
 */
public class UserWeekplan extends DataEntity<UserWeekplan> {

	private static final long serialVersionUID = 1L;
	private Date plandate; // 计划的年月日，手动输入
	private String weeksign; // 每月周期标示（第一周07,第二周14,第三周21,第四周28,第五周31）
	private String isdraft; // 是否为草稿(0是,1否)
	private Date firstdate;// 周一的日期
	private String date;// 查询日期

	private List<UserWeekrecord> userweekrecord;
	//不记录数据库
	private String name;//小组成员
	private String officeName;//小组名
	private int weekSum;
	private int avgWeekSum;
	
	public int getAvgWeekSum() {
		return avgWeekSum;
	}

	public void setAvgWeekSum(int avgWeekSum) {
		this.avgWeekSum = avgWeekSum;
	}

	public int getWeekSum() {
		return weekSum;
	}

	public void setWeekSum(int weekSum) {
		this.weekSum = weekSum;
	}

	public List<UserWeekrecord> getUserweekrecord() {
		return userweekrecord;
	}

	public void setUserweekrecord(List<UserWeekrecord> userweekrecord) {
		this.userweekrecord = userweekrecord;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Date getFirstdate() {
		return firstdate;
	}

	public void setFirstdate(Date firstdate) {
		this.firstdate = firstdate;
	}

	public UserWeekplan() {
		super();
	}

	public UserWeekplan(String id) {
		super(id);
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message = "计划的年月日，手动输入不能为空")
	public Date getPlandate() {
		return plandate;
	}

	public void setPlandate(Date plandate) {
		this.plandate = plandate;
	}

	@Length(min = 1, max = 1, message = "每月周期标示（第一周1,第二周2,第三周3,第四周4,第五周5）长度必须介于 1 和 1 之间")
	public String getWeeksign() {
		return weeksign;
	}

	public void setWeeksign(String weeksign) {
		this.weeksign = weeksign;
	}

	@Length(min = 1, max = 1, message = "是否为草稿(0是,1否)长度必须介于 1 和 1 之间")
	public String getIsdraft() {
		return isdraft;
	}

	public void setIsdraft(String isdraft) {
		this.isdraft = isdraft;
	}

}