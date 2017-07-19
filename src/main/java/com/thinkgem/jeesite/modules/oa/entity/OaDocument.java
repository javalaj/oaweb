/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 管理文档，对文档进行分类Entity
 * @author liaijun
 * @version 2016-11-03
 */
public class OaDocument extends DataEntity<OaDocument> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 公文标题
	private String type;		// 文档类型
	private String content;		// 公文内容
	private String files;		// 附件
	private String status;		// 流程状态
	private OaDocmanage oaManage;//栏目
	public OaDocmanage getOaManage() {
		return oaManage;
	}

	public void setOaManage(OaDocmanage oaManage) {
		this.oaManage = oaManage;
	}

	public OaDocument() {
		super();
	}

	public OaDocument(String id){
		super(id);
	}

	@Length(min=0, max=200, message="公文标题长度必须介于 0 和 200 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=1, max=1, message="文档类型长度必须介于 1 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=2000, message="公文内容长度必须介于 0 和 2000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=2000, message="附件长度必须介于 0 和 2000 之间")
	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}
	
	@Length(min=0, max=1, message="流程状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}