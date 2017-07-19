/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.doc;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.Office;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 文档管理Entity
 * @author 李廷龙
 * @version 2017-02-28
 */
public class OaDoc extends DataEntity<OaDoc> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String keyword;		// 关键词
	private Office office;		// 文档归属部门
	private String isNeedLend;		// 是否需要借阅（0：否；1：是）
	private String isPublic;		// 是否为公共文档（0：否；1：是）
	private String file;		// 附件
	private String currentUserId;
	private String docType;		// 附件类别
	private OaDocReadApply oaDocReadApply; //借阅申请信息
	private String loanUserId;
	private Integer applyCount;
	private Integer downloadCount;
	
	/**
	 * 共享文档
	 */
	public static final String DOC_TYPE_PUBLIC="1";
	/**
	 * 部门文档
	 */
	public static final String DOC_TYPE_OFFICE="0";
	
	/**
	 * 需要借阅
	 */
	public static final String DOC_NEED_LEND="1";
	/**
	 * 无需借阅
	 */
	public static final String DOC_NOT_NEED_LEND="0";
	
	public OaDoc() {
		super();
	}

	public OaDoc(String id){
		super(id);
	}

	@Length(min=1, max=64, message="标题长度必须介于 1 和 64 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=1, max=200, message="关键词长度必须介于 1 和 200 之间")
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	@Length(min=0, max=1, message="是否需要借阅（0：否；1：是）长度必须介于 0 和 1 之间")
	public String getIsNeedLend() {
		return isNeedLend;
	}

	public void setIsNeedLend(String isNeedLend) {
		this.isNeedLend = isNeedLend;
	}
	
	@Length(min=0, max=1, message="是否为公共文档（0：否；1：是）长度必须介于 0 和 1 之间")
	public String getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(String isPublic) {
		this.isPublic = isPublic;
	}
	
	@Length(min=0, max=1000, message="附件长度必须介于 0 和 1000 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getCurrentUserId() {
		return currentUserId;
	}

	public void setCurrentUserId(String currentUserId) {
		this.currentUserId = currentUserId;
	}

	public String getDocType() {
		return docType;
	}

	public void setDocType(String docType) {
		this.docType = docType;
	}

	public OaDocReadApply getOaDocReadApply() {
		return oaDocReadApply;
	}

	public void setOaDocReadApply(OaDocReadApply oaDocReadApply) {
		this.oaDocReadApply = oaDocReadApply;
	}

	public String getLoanUserId() {
		return loanUserId;
	}

	public void setLoanUserId(String loanUserId) {
		this.loanUserId = loanUserId;
	}

	public Integer getApplyCount() {
		return applyCount;
	}

	public void setApplyCount(Integer applyCount) {
		this.applyCount = applyCount;
	}

	public Integer getDownloadCount() {
		return downloadCount;
	}

	public void setDownloadCount(Integer downloadCount) {
		this.downloadCount = downloadCount;
	}
	
}