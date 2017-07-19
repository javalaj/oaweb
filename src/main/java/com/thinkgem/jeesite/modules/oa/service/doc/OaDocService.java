/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.doc;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.doc.OaDoc;
import com.thinkgem.jeesite.modules.oa.dao.doc.OaDocDao;

/**
 * 文档管理Service
 * @author 李廷龙
 * @version 2017-02-28
 */
@Service
@Transactional(readOnly = true)
public class OaDocService extends CrudService<OaDocDao, OaDoc> {

	public OaDoc get(String id) {
		return super.get(id);
	}
	
	public List<OaDoc> findList(OaDoc oaDoc) {
		return super.findList(oaDoc);
	}
	
	public Page<OaDoc> findPage(Page<OaDoc> page, OaDoc oaDoc) {
		return super.findPage(page, oaDoc);
	}
	
	@Transactional(readOnly = false)
	public void save(OaDoc oaDoc) {
		super.save(oaDoc);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaDoc oaDoc) {
		super.delete(oaDoc);
	}
	@Transactional(readOnly = false)
	public void deleteGroup(String groupId){
		dao.deleteGroup(groupId);
	}
	
	public OaDoc getBy(String id,String loanUserId,String DEL_FLAG_NORMAL){
		return dao.getBy(id, loanUserId, DEL_FLAG_NORMAL);
	}
	
	public int getOaDocListCount(OaDoc oaDoc){
		return dao.getOaDocListCount(oaDoc);
	}
}