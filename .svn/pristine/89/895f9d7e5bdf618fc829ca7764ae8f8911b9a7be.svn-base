/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.entity.to;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 记录Entity
 * @author cz
 * @version 2017-02-13
 */
public class UserTotalrecords extends DataEntity<UserTotalrecords> {
	
	private static final long serialVersionUID = 1L;
	private String sumScore;		// 周总分
	private String weeksign;		// 周
	private String avgScore;		// 月平均分
	private String userId;//
	private  String preCommonid;
	private  String name;
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPreCommonid() {
		return preCommonid;
	}

	public void setPreCommonid(String preCommonid) {
		this.preCommonid = preCommonid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public UserTotalrecords() {
		super();
	}

	public UserTotalrecords(String id){
		super(id);
	}

	@Length(min=1, max=255, message="周总分长度必须介于 1 和 255 之间")
	public String getSumScore() {
		return sumScore;
	}

	public void setSumScore(String sumScore) {
		this.sumScore = sumScore;
	}
	
	@Length(min=1, max=50, message="周长度必须介于 1 和 50 之间")
	public String getWeeksign() {
		return weeksign;
	}

	public void setWeeksign(String weeksign) {
		this.weeksign = weeksign;
	}
	
	@Length(min=1, max=255, message="月平均分长度必须介于 1 和 255 之间")
	public String getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(String avgScore) {
		this.avgScore = avgScore;
	}
	
}