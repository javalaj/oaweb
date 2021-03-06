/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.coding;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.act.entity.Act;

/**
 * 请假流程Entity
 * 
 * @author lzx
 * @version 2016-11-10
 */
public class OaProVacate extends DataEntity<OaProVacate> {

	private static final long serialVersionUID = 1L;
	private Date applydate; // 申请日期
	private Date vacatebegindate; // 请假开始日期
	private Date vacateenddate; // 请假截止日期
	private String vacatedays; // 请假小时数
	private String vacatetype; // 请假事由
	private String vacatedesc; // 请假说明
	private String procInsId;
	private String vacateTitle;
	private String toSendMessageUserid;// 抄送id
	private String toSendMessageUsername;// 抄送name

	private Act act;

	public String getToSendMessageUserid() {
		return toSendMessageUserid;
	}

	public void setToSendMessageUserid(String toSendMessageUserid) {
		this.toSendMessageUserid = toSendMessageUserid;
	}

	public String getToSendMessageUsername() {
		return toSendMessageUsername;
	}

	public void setToSendMessageUsername(String toSendMessageUsername) {
		this.toSendMessageUsername = toSendMessageUsername;
	}

	public Act getAct() {
		return act;
	}

	public void setAct(Act act) {
		this.act = act;
	}

	public String getVacateTitle() {
		return vacateTitle;
	}

	public void setVacateTitle(String vacateTitle) {
		this.vacateTitle = vacateTitle;
	}

	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public OaProVacate() {
		super();
	}

	public OaProVacate(String id) {
		super(id);
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplydate() {
		return applydate;
	}

	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getVacatebegindate() {
		return vacatebegindate;
	}

	public void setVacatebegindate(Date vacatebegindate) {
		this.vacatebegindate = vacatebegindate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getVacateenddate() {
		return vacateenddate;
	}

	public void setVacateenddate(Date vacateenddate) {
		this.vacateenddate = vacateenddate;
	}

	@Length(min = 0, max = 11, message = "vacatedays长度必须介于 0 和 11 之间")
	public String getVacatedays() {
		return vacatedays;
	}

	public void setVacatedays(String vacatedays) {
		this.vacatedays = vacatedays;
	}

	@Length(min = 0, max = 255, message = "vacatetype长度必须介于 0 和 255 之间")
	public String getVacatetype() {
		return vacatetype;
	}

	public void setVacatetype(String vacatetype) {
		this.vacatetype = vacatetype;
	}

	@Length(min = 0, max = 10000, message = "vacatedesc长度必须介于 0 和 10000 之间")
	public String getVacatedesc() {
		return vacatedesc;
	}

	public void setVacatedesc(String vacatedesc) {
		this.vacatedesc = vacatedesc;
	}

}