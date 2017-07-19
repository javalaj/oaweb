/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.mail;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.mail.OaMail;
import com.thinkgem.jeesite.modules.oa.dao.mail.OaMailDao;

/**
 * 站内邮件（主表）Service
 * 
 * @author liuxin
 * @version 2017-04-27
 */
@Service
@Transactional(readOnly = true)
public class OaMailService extends CrudService<OaMailDao, OaMail> {

	public OaMail get(String id) {
		return super.get(id);
	}

	public List<OaMail> findList(OaMail oaMail) {
		return super.findList(oaMail);
	}

	public Page<OaMail> findPage(Page<OaMail> page, OaMail oaMail) {
		return super.findPage(page, oaMail);
	}

	@Transactional(readOnly = false)
	public void save(OaMail oaMail) {
		super.save(oaMail);
	}

	@Transactional(readOnly = false)
	public void delete(OaMail oaMail) {
		super.delete(oaMail);
	}

	/** 是否是当前人处理 */
	public Integer isdeal(String userid, String mailid) {
		return dao.isdeal(userid, mailid);
	}

	/** 修改邮件状态-邮件回复完毕时触发 */
	@Transactional(readOnly = false)
	public void updateIsdraft(OaMail oaMail) {
		dao.updateIsdraft(oaMail);
	}
}