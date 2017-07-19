/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.filling;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.BaseEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.filling.OaFillingDao;
import com.thinkgem.jeesite.modules.oa.entity.filling.OaFilling;

/**
 * 人事部归档Service
 * 
 * @author lzx
 * @version 2016-11-23
 */
@Service
@Transactional(readOnly = true)
public class OaFillingService extends CrudService<OaFillingDao, OaFilling> {

	public OaFilling get(String id) {
		return super.get(id);
	}

	public List<OaFilling> findList(OaFilling oaFilling) {
		return super.findList(oaFilling);
	}

	public Page<OaFilling> findPage(Page<OaFilling> page, OaFilling oaFilling) {
		if (oaFilling.getEnddate2() != null) {
			Date date2 = new Date(oaFilling.getEnddate2().getTime() + 24 * 60 * 60 * 1000l);
			oaFilling.setEnddate2(date2);
		}
		return super.findPage(page, oaFilling);
	}

	public Page<OaFilling> findBySame(Page<OaFilling> page, String type, String updateName, String createName,
			Date begindate, Date enddate, String dbName) {
		page.setList(dao.findBySame(page, type, updateName, createName, begindate, enddate, BaseEntity.DEL_FLAG_NORMAL,
				dbName));
		return page;
	}

	@Transactional(readOnly = false)
	public void save(OaFilling oaFilling) {
		super.save(oaFilling);
	}

	@Transactional(readOnly = false)
	public void delete(OaFilling oaFilling) {
		super.delete(oaFilling);
	}

}