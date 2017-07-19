/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.mail;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 站内邮件（主表）Entity
 * 
 * @author liuxin
 * @version 2017-04-27
 */
public class OaMail extends DataEntity<OaMail> {

	private static final long serialVersionUID = 1L;
	private String mainId; // 主送人员
	private String mainName; // 主送人员
	private String otherId; // 抄送人员
	private String otherName; // 抄送人员
	private String title; // 标题
	private String file; // 文件
	private String content; // 内容
	private String isdraft;// 状态信息，0：草稿，2：处理中，3：已办结

	public OaMail() {
		super();
	}

	public String getIsdraft() {
		return isdraft;
	}

	public void setIsdraft(String isdraft) {
		this.isdraft = isdraft;
	}

	public OaMail(String id) {
		super(id);
	}

	public String getMainId() {
		return mainId;
	}

	public void setMainId(String mainId) {
		this.mainId = mainId;
	}

	public String getMainName() {
		return mainName;
	}

	public void setMainName(String mainName) {
		this.mainName = mainName;
	}

	public String getOtherId() {
		return otherId;
	}

	public void setOtherId(String otherId) {
		this.otherId = otherId;
	}

	public String getOtherName() {
		return otherName;
	}

	public void setOtherName(String otherName) {
		this.otherName = otherName;
	}

	@Length(min = 0, max = 1000, message = "标题长度必须介于 0 和 1000 之间")

	@ExcelField(title = "标题", align = 2, sort = 9)

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Length(min = 0, max = 3000, message = "文件长度必须介于 0 和 3000 之间")

	@ExcelField(title = "文件", align = 2, sort = 10)

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	@Length(min = 0, max = 3000, message = "内容长度必须介于 0 和 3000 之间")

	@ExcelField(title = "内容", align = 2, sort = 11)

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}