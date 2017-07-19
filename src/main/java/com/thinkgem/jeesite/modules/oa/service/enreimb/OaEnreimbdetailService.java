/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.enreimb;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.enreimb.OaEnreimbdetailDao;
import com.thinkgem.jeesite.modules.oa.entity.enreimb.OaEnreimbdetail;

/**
 * 招待费报销申请从表Service
 * @author niting
 * @version 2017-04-28
 */
@Service
@Transactional(readOnly = true)
public class OaEnreimbdetailService extends CrudService<OaEnreimbdetailDao, OaEnreimbdetail> {

	public OaEnreimbdetail get(String id) {
		return super.get(id);
	}
	
	public List<OaEnreimbdetail> findList(OaEnreimbdetail oaEnreimbdetail) {
		return super.findList(oaEnreimbdetail);
	}
	
	public Page<OaEnreimbdetail> findPage(Page<OaEnreimbdetail> page, OaEnreimbdetail oaEnreimbdetail) {
		return super.findPage(page, oaEnreimbdetail);
	}
	
	@Transactional(readOnly = false)
	public void save(OaEnreimbdetail oaEnreimbdetail) {
		super.save(oaEnreimbdetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaEnreimbdetail oaEnreimbdetail) {
		super.delete(oaEnreimbdetail);
	}
	
}