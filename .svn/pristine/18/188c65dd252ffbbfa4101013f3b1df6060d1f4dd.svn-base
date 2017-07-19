/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.mail;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
/**
 * 站内邮件（意见从表）Entity
 * @author liuxin
 * @version 2017-04-27
 */
public class OaMailRecord extends DataEntity<OaMailRecord> {
	
	private static final long serialVersionUID = 1L;
	private String text;		// 意见
	private String mailId;		// 邮件主表id
	
	public OaMailRecord() {
		super();
	}

	public OaMailRecord(String id){
		super(id);
	}

	@Length(min=0, max=3000, message="意见长度必须介于 0 和 3000 之间")
			
	@ExcelField(title="意见", align=2, sort=7)
	
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	@Length(min=0, max=64, message="邮件主表id长度必须介于 0 和 64 之间")
			
	@ExcelField(title="邮件主表id", align=2, sort=8)
	
	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}
	
}