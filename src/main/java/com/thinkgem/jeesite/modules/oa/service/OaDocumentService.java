/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaDocument;
import com.thinkgem.jeesite.modules.oa.dao.OaDocumentDao;

/**
 * 管理文档，对文档进行分类Service
 * @author liaijun
 * @version 2016-11-03
 */
@Service
@Transactional(readOnly = true)
public class OaDocumentService extends CrudService<OaDocumentDao, OaDocument> {

	
	public OaDocument get(String id) {
		OaDocument oaDocument = super.get(id);
		return oaDocument;
	}
	
	public List<OaDocument> findList(OaDocument oaDocument) {
		return super.findList(oaDocument);
	}
	
	public Page<OaDocument> findPage(Page<OaDocument> page, OaDocument oaDocument) {
		return super.findPage(page, oaDocument);
	}
	
	@Transactional(readOnly = false)
	public void save(OaDocument oaDocument) {
		super.save(oaDocument);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaDocument oaDocument) {
		super.delete(oaDocument);
	}
	
}