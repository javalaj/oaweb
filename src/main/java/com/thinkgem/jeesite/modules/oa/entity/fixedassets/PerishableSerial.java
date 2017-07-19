/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.fixedassets;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.modules.act.entity.Act;

/**
 * 易耗品序列Entity
 * @author 易耗品序列
 * @version 2016-12-02
 */
public class PerishableSerial extends ActEntity<PerishableSerial> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String procInsId;		// 流程相关id
	private Act act;
	
	/**自定义流程id*/
	public static final String PROC_DEF_KEY = "perishable_products";
	
	/**物业表名*/
	public static final String BUSINESS_TABLE = "perishable_serial";
	
	/**流程名称*/
	public static final String WORKFLOW_NAME = "办公用品申请";
	
	/**流程审核路径*/
	public static final String WORKFLOW_URL_EXAM = "@@proNotify@@/oa/a/oa/fixedassets/perishableSerial/exam?id=";
	
	/**流程查看路径*/
	public static final String WORKFLOW_URL_FORM = "@@proNotify@@/oa/a/oa/fixedassets/perishableSerial/view?id=";
	
	private List<PerishableApply> applyList;
	
	public PerishableSerial() {
		super();
	}

	public PerishableSerial(String id){
		super(id);
	}

	@Length(min=0, max=255, message="标题长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=255, message="流程相关id长度必须介于 0 和 255 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public Act getAct() {
		return act;
	}

	public void setAct(Act act) {
		this.act = act;
	}

	public List<PerishableApply> getApplyList() {
		return applyList;
	}

	public void setApplyList(List<PerishableApply> applyList) {
		this.applyList = applyList;
	}
	
}