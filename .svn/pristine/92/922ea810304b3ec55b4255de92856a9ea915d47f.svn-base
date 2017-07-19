/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.fixedassets;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.modules.act.entity.Act;

/**
 * 资产序列Entity
 * @author zf
 * @version 2016-11-20
 */
public class AssetsSerial extends ActEntity<AssetsSerial> {
	
	private static final long serialVersionUID = 1L;
	private String serialNumber;		// 单据编号
	private String title;				// 标题
	private String procInsId;			//流程实例ID
	private String type;		// 申请类型
	private Act act;
	
	/**自定义流程id*/
	public static final String PROC_DEF_KEY = "assets_quisitions";
	
	/**物业表名称*/
	public static final String BUSINESS_TABLE = "assets_serial";
	
	/**流程名称*/
	public static final String WORKFLOW_NAME = "固定资产申请";
	
	/**流程审核路径*/
	public static final String WORKFLOW_URL_EXAM = "@@proNotify@@/oa/a/fixedassets/assetsSerial/exam?id=";
	
	/**流程查看路径*/
	public static final String WORKFLOW_URL_FORM = "@@proNotify@@/oa/a/fixedassets/assetsSerial/form?id=";
	
	/**查看路径*/
	public static final String URL_FORM = "/fixedassets/assetsSerial/form?id=";
	
	private List<String> ids;
	
	public AssetsSerial() {
		super();
	}

	public AssetsSerial(String id){
		super(id);
	}

	@Length(min=0, max=255, message="单据编号长度必须介于 0 和 255 之间")
	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	@Length(min=0, max=255, message="proc_ins_id长度必须介于 0 和 255 之间")
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

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	@Length(min=0, max=255, message="proc_ins_id长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}