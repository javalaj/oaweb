/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.enreimb;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.enreimb.OaEnreimbDao;
import com.thinkgem.jeesite.modules.oa.entity.OaUsecar;
import com.thinkgem.jeesite.modules.oa.entity.enreimb.OaEnreimb;

/**
 * 招待费报销申请Service
 * @author niting
 * @version 2017-04-28
 */
@Service
@Transactional(readOnly = true)
public class OaEnreimbService extends CrudService<OaEnreimbDao, OaEnreimb> {

	public OaEnreimb get(String id) {
		return super.get(id);
	}
	
	public List<OaEnreimb> findList(OaEnreimb oaEnreimb) {
		return super.findList(oaEnreimb);
	}
	
	public Page<OaEnreimb> findPage(Page<OaEnreimb> page, OaEnreimb oaEnreimb) {
		return super.findPage(page, oaEnreimb);
	}
	
	@Transactional(readOnly = false)
	public void save(OaEnreimb oaEnreimb) {
		super.save(oaEnreimb);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaEnreimb oaEnreimb) {
		super.delete(oaEnreimb);
	}
	
	public OaEnreimb getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}
}