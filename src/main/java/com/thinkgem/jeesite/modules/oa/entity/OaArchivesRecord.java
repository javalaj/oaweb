/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 公司发文记录Entity
 * @author niting
 * @version 2016-12-22
 */
public class OaArchivesRecord extends DataEntity<OaArchivesRecord> {
	
	private static final long serialVersionUID = 1L;
	private OaArchives oaArchives;		// 公文ID
	private User user;		// 接受人
	private String readFlag;		// 阅读标记
	private Date readDate;		// 阅读时间
	
	public OaArchivesRecord() {
		super();
	}

	public OaArchivesRecord(String id){
		super(id);
	}

	public OaArchives getOaArchives() {
		return oaArchives;
	}

	public void setOaArchives(OaArchives oaArchives) {
		this.oaArchives = oaArchives;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=1, message="阅读标记长度必须介于 0 和 1 之间")
	public String getReadFlag() {
		return readFlag;
	}

	public void setReadFlag(String readFlag) {
		this.readFlag = readFlag;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getReadDate() {
		return readDate;
	}

	public void setReadDate(Date readDate) {
		this.readDate = readDate;
	}
	
}