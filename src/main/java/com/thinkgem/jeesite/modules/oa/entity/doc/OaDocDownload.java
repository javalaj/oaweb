/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.doc;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 文档管理Entity
 * @author 李廷龙
 * @version 2017-02-28
 */
public class OaDocDownload extends DataEntity<OaDocDownload> {
	
	private static final long serialVersionUID = 1L;
	private User downloadUser;		// 
	private OaDoc downloadDoc;		// 
	
	public OaDocDownload() {
		super();
	}

	public OaDocDownload(String id){
		super(id);
	}

	public User getDownloadUser() {
		return downloadUser;
	}

	public void setDownloadUser(User downloadUser) {
		this.downloadUser = downloadUser;
	}

	public OaDoc getDownloadDoc() {
		return downloadDoc;
	}

	public void setDownloadDoc(OaDoc downloadDoc) {
		this.downloadDoc = downloadDoc;
	}

	
}