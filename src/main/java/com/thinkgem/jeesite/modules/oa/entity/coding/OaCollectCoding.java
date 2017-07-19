/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.coding;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 整理后每日打卡资料Entity
 * @author 李正曦
 * @version 2016-11-07
 */
public class OaCollectCoding extends DataEntity<OaCollectCoding> {
	
	private static final long serialVersionUID = 1L;
	private String userNo;		// user_no
	private Date codingBegindate;		// coding_begindate
	private Date codingEnddate;		// coding_enddate
	private String workingType;		// working_type
	private String elseType;		// else_type
	
	private Date searchDate;
	
	/**
	 * 日工作时长
	 */
	private long timeOffset;
	
	public static final String WORKING_TYPE="WORKING_TYPE";
	public static final String TIME_OFFSET="TIME_OFFSET";
	
	/**有效出勤天数**/
	public static final String WORKING_VALID_DAYS = "WORKING_VALID_DAYS";
	
	/**工作总时长**/
	public static final String WORKING_HOURS = "WORKING_HOURS";
	/**
	 * 夏时令午休时间
	 */
	public static final Long SUMMBERTIME = 5400000L;
	
	/**
	 * 冬时令午休时间
	 */
	public static final Long WINTERRTIME = 3600000L;
	/**
	 * 月平均工作时长
	 */
	public static final String AVERAGE_WORK_TIME = "AVERAGE_WORK_TIME";
	
	public OaCollectCoding() {
		super();
	}

	public OaCollectCoding(String id){
		super(id);
	}

	@Length(min=1, max=11, message="user_no长度必须介于 1 和 11 之间")
	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="coding_begindate不能为空")
	public Date getCodingBegindate() {
		return codingBegindate;
	}

	public void setCodingBegindate(Date codingBegindate) {
		this.codingBegindate = codingBegindate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="coding_enddate不能为空")
	public Date getCodingEnddate() {
		return codingEnddate;
	}

	public void setCodingEnddate(Date codingEnddate) {
		this.codingEnddate = codingEnddate;
	}
	
	@Length(min=1, max=255, message="working_type长度必须介于 1 和 255 之间")
	public String getWorkingType() {
		return workingType;
	}

	public void setWorkingType(String workingType) {
		this.workingType = workingType;
	}
	
	@Length(min=0, max=255, message="else_type长度必须介于 0 和 255 之间")
	public String getElseType() {
		return elseType;
	}

	public void setElseType(String elseType) {
		this.elseType = elseType;
	}

	public Date getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(Date searchDate) {
		this.searchDate = searchDate;
	}

	public long getTimeOffset() {
		return timeOffset;
	}

	public void setTimeOffset(long timeOffset) {
		this.timeOffset = timeOffset;
	}
	
}