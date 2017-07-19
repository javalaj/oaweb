/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 公文查询封装类Entity
 * 
 * @author liuxin
 * @version 2016-12-21
 */
public class OaFileQuery extends DataEntity<OaFileQuery> {

	private static final long serialVersionUID = 1L;
	// 结果封装
	private String title;// 标题
	private String code;// 字号
	private Date createDate;// 发起日期
	private String nowNode;// 当前环节
	private String nowName;// 当前处理人
	private String id;// 业务表id
	// url

	// 查询条件
	private String type;// 类型
	private String state;// 状态
	private String createName;// 发起人名称
	private String officeName;// 发起部门名称
	private Date beginDate;// 发起时间----
	private Date endDate;// 结束时间----

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getNowNode() {
		return nowNode;
	}

	public void setNowNode(String nowNode) {
		this.nowNode = nowNode;
	}

	public String getNowName() {
		return nowName;
	}

	public void setNowName(String nowName) {
		this.nowName = nowName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

}