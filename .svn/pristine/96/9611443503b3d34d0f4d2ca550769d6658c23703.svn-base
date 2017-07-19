/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.mail;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.mail.OaMailRecord;
import com.thinkgem.jeesite.modules.oa.dao.mail.OaMailRecordDao;

/**
 * 站内邮件（意见从表）Service
 * @author liuxin
 * @version 2017-04-27
 */
@Service
@Transactional(readOnly = true)
public class OaMailRecordService extends CrudService<OaMailRecordDao, OaMailRecord> {

	public OaMailRecord get(String id) {
		return super.get(id);
	}
	
	public List<OaMailRecord> findList(OaMailRecord oaMailRecord) {
		return super.findList(oaMailRecord);
	}
	
	public Page<OaMailRecord> findPage(Page<OaMailRecord> page, OaMailRecord oaMailRecord) {
		return super.findPage(page, oaMailRecord);
	}
	
	@Transactional(readOnly = false)
	public void save(OaMailRecord oaMailRecord) {
		super.save(oaMailRecord);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaMailRecord oaMailRecord) {
		super.delete(oaMailRecord);
	}
	
}