/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.flowback;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 流程撤回操作Entity
 * 
 * @author liuxin
 * @version 2017-05-04
 */
public class OaFlowBack extends DataEntity<OaFlowBack> {

	private static final long serialVersionUID = 1L;
	private String procInsId; // 流程关联id
	private String canBackId; // 具有退回权的用户id
	private String canBackNode; // 可以退回的节点标识
	private String resultURL;// 撤回后跳转链接

	public OaFlowBack() {
		super();
	}

	/**
	 * 构造一个oaflowback对象
	 * 
	 * 四个参数都不能为空，都必须填上
	 * 
	 * @param procInsId
	 *            : 流程关联id
	 * @param canBackId
	 *            : 具有退回权的用户id
	 * @param canBackNode
	 *            : 可以退回的节点标识
	 * @param resultURL
	 *            : 撤回后跳转链接
	 * 
	 */
	public OaFlowBack(String procInsId, String canBackId, String canBackNode, String resultURL) {
		super();
		this.procInsId = procInsId;
		this.canBackId = canBackId;
		this.canBackNode = canBackNode;
		this.resultURL = resultURL;
	}

	public OaFlowBack(String id) {
		super(id);
	}

	public String getResultURL() {
		return resultURL;
	}

	public void setResultURL(String resultURL) {
		this.resultURL = resultURL;
	}

	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public String getCanBackId() {
		return canBackId;
	}

	public void setCanBackId(String canBackId) {
		this.canBackId = canBackId;
	}

	public String getCanBackNode() {
		return canBackNode;
	}

	public void setCanBackNode(String canBackNode) {
		this.canBackNode = canBackNode;
	}

}