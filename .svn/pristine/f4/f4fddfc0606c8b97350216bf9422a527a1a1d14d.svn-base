/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.project;

import java.util.Date;



import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目表的管理Entity
 * @author 李廷龙
 * @version 2016-11-17
 */
public class OaProjectChange extends DataEntity<OaProjectChange> {
	
	private static final long serialVersionUID = 1L;
	private Integer changeDay;		// 变更有效天数
	private String changeType;		// 变更类别(0.暂停、1.工期延长、2.工期缩短)
	private Date changeStartDate;		// 变更开始日期
	private Date changeEndDate;		// 变更结束日期
	private OaProject changeProject;		// 变更的项目
	
	public OaProjectChange() {
		super();
	}

	public OaProjectChange(String id){
		super(id);
	}

	public Integer getChangeDay() {
		return changeDay;
	}

	public void setChangeDay(Integer changeDay) {
		this.changeDay = changeDay;
	}

	public String getChangeType() {
		return changeType;
	}

	public void setChangeType(String changeType) {
		this.changeType = changeType;
	}

	public Date getChangeStartDate() {
		return changeStartDate;
	}

	public void setChangeStartDate(Date changeStartDate) {
		this.changeStartDate = changeStartDate;
	}

	public Date getChangeEndDate() {
		return changeEndDate;
	}

	public void setChangeEndDate(Date changeEndDate) {
		this.changeEndDate = changeEndDate;
	}

	public OaProject getChangeProject() {
		return changeProject;
	}

	public void setChangeProject(OaProject changeProject) {
		this.changeProject = changeProject;
	}
	
	/**
	 * 暂停
	 */
	public static final String CHANGE_TYPE_PAUSE="0";
	
	/**
	 * 工期加长
	 */
	public static final String CHANGE_TYPE_WORKDAY_LONGER="1";
	
	/**
	 * 工期缩短
	 */
	public static final String CHANGE_TYPE_WORKDAY_SHORTER="2";
	
}