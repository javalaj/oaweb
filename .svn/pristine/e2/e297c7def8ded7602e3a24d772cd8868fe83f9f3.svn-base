/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.enreimb;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
/**
 * 招待费报销申请Entity
 * @author niting
 * @version 2017-04-28
 */
public class OaEnreimb extends ActEntity<OaEnreimb> {
	
	private static final long serialVersionUID = 1L;
	private String procInsId;		// 流程关联Id
	private String fileId;		// 文件id
	private String cwname;		// 财务审核人
	private String cwtext;		// 财务意见
	private String officename;		// 申请部门
	private String moneyDouble;		// 合计金额（小写）
	private String moneyString;		// 合计金额（大写）
	
	public OaEnreimb() {
		super();
	}

	public OaEnreimb(String id){
		super(id);
	}

	@Length(min=0, max=64, message="流程关联Id长度必须介于 0 和 64 之间")
			
	@ExcelField(title="流程关联Id", align=2, sort=1)
	
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
	@Length(min=0, max=100, message="文件id长度必须介于 0 和 100 之间")
			
	@ExcelField(title="文件id", align=2, sort=8)
	
	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	
	@Length(min=0, max=64, message="财务审核人长度必须介于 0 和 64 之间")
			
	@ExcelField(title="财务审核人", align=2, sort=9)
	
	public String getCwname() {
		return cwname;
	}

	public void setCwname(String cwname) {
		this.cwname = cwname;
	}
	
	@Length(min=0, max=200, message="财务意见长度必须介于 0 和 200 之间")
			
	@ExcelField(title="财务意见", align=2, sort=10)
	
	public String getCwtext() {
		return cwtext;
	}

	public void setCwtext(String cwtext) {
		this.cwtext = cwtext;
	}
	
	@Length(min=0, max=64, message="申请部门长度必须介于 0 和 64 之间")
			
	@ExcelField(title="申请部门", align=2, sort=11)
	
	public String getOfficename() {
		return officename;
	}

	public void setOfficename(String officename) {
		this.officename = officename;
	}
	
			
	@ExcelField(title="合计金额（小写）", align=2, sort=12)
	
	public String getMoneyDouble() {
		return moneyDouble;
	}

	public void setMoneyDouble(String moneyDouble) {
		this.moneyDouble = moneyDouble;
	}
	
	@Length(min=0, max=100, message="合计金额（大写）长度必须介于 0 和 100 之间")
			
	@ExcelField(title="合计金额（大写）", align=2, sort=13)
	
	public String getMoneyString() {
		return moneyString;
	}

	public void setMoneyString(String moneyString) {
		this.moneyString = moneyString;
	}
	
}