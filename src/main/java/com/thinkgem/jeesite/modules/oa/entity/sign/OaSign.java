/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.sign;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 签报Entity
 * @author cz
 * @version 2016-12-20
 */
public class OaSign extends ActEntity<OaSign> {
	
	private static final long serialVersionUID = 1L;
	private String signTitile;		// 标题
	private String signType;		// 密级
	private String signNumber;		// 编号
	private String signContent;		// 内容
	private String signText;		// 正文
	private String signFiles;		// 附件
	private String signHeadOpinion;		// 部门负责人意见
	private String signYfOpinion;		// 研发意见
	private String signJsOpinion;		// 技术意见
	private String signSwOpinion;		// 商务意见
	private String signScOpinion;		// 市场意见
	private String signRsOpinion;		// 人事意见
	private String signCwOpinion;		// 财务意见
	private String signLdOpinion;		// 领导意见
	private String signState;		// 状态
	private Date completeDate;		// 完成时间
	private String procInsId;  //流程实例id
	private String pName; //会签相关部门
	private String type;//类型  2
	private String code;//文件字号
	private String officeName;//部门名字
	private Date date;//时间
	private String delFlag;
	


	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public OaSign() {
		super();
	}

	public OaSign(String id){
		super(id);
	}

	
	public String getSignTitile() {
		return signTitile;
	}

	public void setSignTitile(String signTitile) {
		this.signTitile = signTitile;
	}
	
	public String getSignType() {
		return signType;
	}

	public void setSignType(String signType) {
		this.signType = signType;
	}
	
	public String getSignNumber() {
		return signNumber;
	}

	public void setSignNumber(String signNumber) {
		this.signNumber = signNumber;
	}
	
	public String getSignContent() {
		return signContent;
	}

	public void setSignContent(String signContent) {
		this.signContent = signContent;
	}
	
	public String getSignText() {
		return signText;
	}

	public void setSignText(String signText) {
		this.signText = signText;
	}
	
	public String getSignFiles() {
		return signFiles;
	}

	public void setSignFiles(String signFiles) {
		this.signFiles = signFiles;
	}
	
	public String getSignHeadOpinion() {
		return signHeadOpinion;
	}

	public void setSignHeadOpinion(String signHeadOpinion) {
		this.signHeadOpinion = signHeadOpinion;
	}
	
	public String getSignYfOpinion() {
		return signYfOpinion;
	}

	public void setSignYfOpinion(String signYfOpinion) {
		this.signYfOpinion = signYfOpinion;
	}
	
	public String getSignJsOpinion() {
		return signJsOpinion;
	}

	public void setSignJsOpinion(String signJsOpinion) {
		this.signJsOpinion = signJsOpinion;
	}
	
	public String getSignSwOpinion() {
		return signSwOpinion;
	}

	public void setSignSwOpinion(String signSwOpinion) {
		this.signSwOpinion = signSwOpinion;
	}
	
	public String getSignScOpinion() {
		return signScOpinion;
	}

	public void setSignScOpinion(String signScOpinion) {
		this.signScOpinion = signScOpinion;
	}
	
	public String getSignRsOpinion() {
		return signRsOpinion;
	}

	public void setSignRsOpinion(String signRsOpinion) {
		this.signRsOpinion = signRsOpinion;
	}
	
	public String getSignCwOpinion() {
		return signCwOpinion;
	}

	public void setSignCwOpinion(String signCwOpinion) {
		this.signCwOpinion = signCwOpinion;
	}
	
	public String getSignLdOpinion() {
		return signLdOpinion;
	}

	public void setSignLdOpinion(String signLdOpinion) {
		this.signLdOpinion = signLdOpinion;
	}
	
	public String getSignState() {
		return signState;
	}

	public void setSignState(String signState) {
		this.signState = signState;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(Date completeDate) {
		this.completeDate = completeDate;
	}
	
}