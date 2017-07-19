/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.doc;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.doc.OaDocReadApply;
import com.thinkgem.jeesite.modules.oa.dao.doc.OaDocReadApplyDao;

/**
 * 文档阅读申请管理Service
 * @author 李廷龙
 * @version 2017-02-28
 */
@Service
@Transactional(readOnly = true)
public class OaDocReadApplyService extends CrudService<OaDocReadApplyDao, OaDocReadApply> {

	public OaDocReadApply get(String id) {
		return super.get(id);
	}
	
	public List<OaDocReadApply> findList(OaDocReadApply oaDocReadApply) {
		return super.findList(oaDocReadApply);
	}
	
	public Page<OaDocReadApply> findPage(Page<OaDocReadApply> page, OaDocReadApply oaDocReadApply) {
		return super.findPage(page, oaDocReadApply);
	}
	
	@Transactional(readOnly = false)
	public void save(OaDocReadApply oaDocReadApply) {
		super.save(oaDocReadApply);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaDocReadApply oaDocReadApply) {
		super.delete(oaDocReadApply);
	}
	
	public Integer getTotalReadApplyByDocCreateById(String docCreateById){
		return dao.getTotalReadApplyByDocCreateById(docCreateById);
	}
	
	public Integer getOaDocReadApplyListCount(OaDocReadApply oaDocReadApply){
		return dao.getOaDocReadApplyListCount(oaDocReadApply);
	}
	
}