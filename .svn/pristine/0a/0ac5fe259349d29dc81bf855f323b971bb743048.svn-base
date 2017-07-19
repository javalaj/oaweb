/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.publicprivatecar;

import org.hibernate.validator.constraints.Length;
import java.util.Date;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.oa.entity.qualificationb.OaQualificationb;

/**
 * 私车公用Entity
 * @author niting
 * @version 2017-01-10
 */
public class OaPublicPrivateCars extends ActEntity<OaPublicPrivateCars> {
	
	private static final long serialVersionUID = 1L;
	private String officename;		// 申请人部门
	private String usescope;		// 用车范围
	private String usereason;		// 事由
	private Date starttime;		// 起始时间
	private Date endtime;		// 结束时间
	private String gokilometer;		// 起始公里数
	private String backkilometer;		// 返回公里数
	private String destination;		// 目的地
	private String picture;		// 上传照片
	private String examname;		// 行政人事签名
	private String examtext;		// 行政人事意见
	private String examname1;		// 财务报销签字
	private String examtext1;		// 财务报销意见
	private String procInsId;		// 流程关联id
	private String fileId;          //编号
	
	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public OaPublicPrivateCars() {
		super();
	}

	public OaPublicPrivateCars(String id){
		super(id);
	}

	@Length(min=0, max=25, message="申请人部门长度必须介于 0 和 25 之间")
	public String getOfficename() {
		return officename;
	}

	public void setOfficename(String officename) {
		this.officename = officename;
	}
	
	@Length(min=0, max=25, message="用车范围长度必须介于 0 和 25 之间")
	public String getUsescope() {
		return usescope;
	}

	public void setUsescope(String usescope) {
		this.usescope = usescope;
	}
	
	@Length(min=0, max=100, message="事由长度必须介于 0 和 100 之间")
	@NotNull(message="请填写事由")
	public String getUsereason() {
		return usereason;
	}

	public void setUsereason(String usereason) {
		this.usereason = usereason;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="请选择起始时间")
	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="请选择结束时间")
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	
	@Length(min=0, max=64, message="起始公里数长度必须介于 0 和 64 之间")
	@NotNull(message="请填写起始公里数")
	public String getGokilometer() {
		return gokilometer;
	}

	public void setGokilometer(String gokilometer) {
		this.gokilometer = gokilometer;
	}
	
	@Length(min=0, max=64, message="返回公里数长度必须介于 0 和 64 之间")
	@NotNull(message="请填写返回公里数")
	public String getBackkilometer() {
		return backkilometer;
	}

	public void setBackkilometer(String backkilometer) {
		this.backkilometer = backkilometer;
	}
	
	@Length(min=0, max=100, message="目的地长度必须介于 0 和 100 之间")
	@NotNull(message="请填写目的地")
	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}
	
	@Length(min=0, max=4000, message="请上传的照片数量低于10张")
	@NotNull(message="请上传图片")
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	@Length(min=0, max=50, message="行政人事签名长度必须介于 0 和 50 之间")
	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}
	
	@Length(min=0, max=1000, message="行政人事意见长度必须介于 0 和 1000 之间")
	public String getExamtext() {
		return examtext;
	}

	public void setExamtext(String examtext) {
		this.examtext = examtext;
	}
	
	@Length(min=0, max=50, message="财务报销签字长度必须介于 0 和 50 之间")
	public String getExamname1() {
		return examname1;
	}

	public void setExamname1(String examname1) {
		this.examname1 = examname1;
	}
	
	@Length(min=0, max=1000, message="财务报销意见长度必须介于 0 和 1000 之间")
	public String getExamtext1() {
		return examtext1;
	}

	public void setExamtext1(String examtext1) {
		this.examtext1 = examtext1;
	}
	
	@Length(min=0, max=64, message="流程关联id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
}