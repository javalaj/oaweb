/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.persistence;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.modules.act.entity.Act;

/**
 * Activiti Entity类
 * @author ThinkGem
 * @version 2013-05-28
 */
public abstract class ActEntity<T> extends DataEntity<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**流程开始*/
	public static final String ACT_IS_START = "1";
	/**
	 * 流程未开始
	 */
	public static final String ACT_STATUS_NOT_START = "0";
	/**
	 * 流程审核中
	 */
	public static final String ACT_STATUS_RUNNING = "1";
	/**
	 * 流程编辑中
	 */
	public static final String ACT_STATUS_Edit = "2";
	/**
	 * 流程已结案
	 */
	public static final String ACT_STATUS_COMPLETDD = "y";
	/**
	 * 流程已销毁
	 */
	public static final String ACT_STATUS_DESTROYED = "x";
	
	/**流程第一个审核阶段*/
	public static final String FIRST_AUDIT_PHASE = "exam1";

	/**流程第二个审核阶段*/
	public static final String SECOND_AUDIT_PHASE = "exam2";

	/**流程第三个审核阶段*/
	public static final String THIRD_AUDIT_PHASE = "exam3";

	/**流程第四个审核阶段*/
	public static final String FOURTH_AUDIT_PHASE = "exam4";

	/**流程第五个审核阶段*/
	public static final String FIFTH_AUDIT_PHASE = "exam5";

	/**流程第六个审核阶段*/
	public static final String SIXTH_AUDIT_PHASE = "exam6";

	/**流程第七个审核阶段*/
	public static final String SEVENTH_AUDIT_PHASE = "exam7";

	/**流程第八个审核阶段*/
	public static final String EIGHTH_AUDIT_PHASE = "exam8";
	
	/**流程第九个审核阶段*/
	public static final String NINTH_AUDIT_PHASE = "exam9";
	
	/**流程第十个审核阶段*/
	public static final String TENTH_AUDIT_PHASE = "exam10";
	
	/**流程第十一个审核阶段*/
	public static final String ELEVENTH_AUDIT_PHASE = "exam11";
	
	/**流程第十二个审核阶段*/
	public static final String TWELFTH_AUDIT_PHASE = "exam12";
	
	/**流程第十三个审核阶段*/
	public static final String THIRTEENTH_AUDIT_PHASE = "exam13";
	
	/**流程第十四个审核阶段*/
	public static final String FOURTEENTH_AUDIT_PHASE = "exam14";
	
	/**流程第十五个审核阶段*/
	public static final String FIFTEENTH_AUDIT_PHASE = "exam15";
	
	protected Act act; 		// 流程任务对象

	public ActEntity() {
		super();
	}
	
	public ActEntity(String id) {
		super(id);
	}
	
	@JsonIgnore
	public Act getAct() {
		if (act == null){
			act = new Act();
		}
		return act;
	}

	public void setAct(Act act) {
		this.act = act;
	}

	/**
	 * 获取流程实例ID
	 * @return
	 */
	public String getProcInsId() {
		return this.getAct().getProcInsId();
	}

	/**
	 * 设置流程实例ID
	 * @param procInsId
	 */
	public void setProcInsId(String procInsId) {
		this.getAct().setProcInsId(procInsId);
	}
}
