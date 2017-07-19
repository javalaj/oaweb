package com.thinkgem.jeesite.modules.oa.entity;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.supcan.annotation.treelist.cols.SupCol;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;


public class CyTspOaAddress extends DataEntity<CyTspOaAddress> {




	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String urseId; //记录人ID
	private Integer groupId;//分组ID
	private String name;// 姓名
	private String company;//公司

	private String position;//职位
	private String iphone;//电话
	private String shareFlagUserId;//分享人ID

	private String oph; //办公电话
	private String qq; //QQ
	private String email;//邮箱
	private String ofaddress;//办公地点
	private Date deleTiem;//进入回收站时间
	private Integer deleFlag;//进入回收站 0（未进入），1（进入）
	private Integer shareFlag;//共享，0（共享），1（取消共享）
	
	private CyTspOaAddressGroup cytspoaaddressgroup;
	
	
	public CyTspOaAddressGroup getCytspoaaddressgroup() {
		return cytspoaaddressgroup;
	}
	public void setCytspoaaddressgroup(CyTspOaAddressGroup cytspoaaddressgroup) {
		this.cytspoaaddressgroup = cytspoaaddressgroup;
	}

	@SupCol(isUnique="true", isHide="true")
	@ExcelField(title="id", type=2, align=2, sort=1)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@SupCol(isUnique="true", isHide="true")
	@ExcelField(title="urseId", type=2, align=2, sort=1)
	public String getUrseId() {
		return urseId;
	}
	public void setUrseId(String urseId) {
		this.urseId = urseId;
	}
	@SupCol(isUnique="true", isHide="true")
	@ExcelField(title="groupId", type=2, align=2, sort=1)
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	@ExcelField(title="姓名", align=2, sort=20)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@ExcelField(title="部门", align=2, sort=20)
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	@ExcelField(title="职位", align=2, sort=20)
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@ExcelField(title="办公电话", align=2, sort=20)
	public String getOph() {
		return oph;
	}
	public void setOph(String oph) {
		this.oph = oph;
	}
	@ExcelField(title="邮箱", align=2, sort=30)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@ExcelField(title="办公地点", align=2, sort=20)
	public String getOfaddress() {
		return ofaddress;
	}
	public void setOfaddress(String ofaddress) {
		this.ofaddress = ofaddress;
	}
	public Date getDeleTiem() {
		return deleTiem;
	}
	public void setDeleTiem(Date deleTiem) {
		this.deleTiem = deleTiem;
	}
	@SupCol(isUnique="true", isHide="true")
	@ExcelField(title="deleFlag", type=2, align=2, sort=1)
	public Integer getDeleFlag() {
		return deleFlag;
	}
	public void setDeleFlag(Integer deleFlag) {
		this.deleFlag = deleFlag;
	}
	@SupCol(isUnique="true", isHide="absHide")
	@ExcelField(title="shareFlag", type=2, align=2, sort=1)
	public Integer getShareFlag() {
		return shareFlag;
	}
	
	public void setShareFlag(Integer shareFlag) {
		this.shareFlag = shareFlag;
	}
	@ExcelField(title="电话", align=2, sort=30)
	public String getIphone() {
		return iphone;
	}
	public void setIphone(String iphone) {
		this.iphone = iphone;
	}
	@ExcelField(title="QQ", align=2, sort=20)
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getShareFlagUserId() {
		return shareFlagUserId;
	}
	public void setShareFlagUserId(String shareFlagUserId) {
		this.shareFlagUserId = shareFlagUserId;
	}

	
	
	
   

}
