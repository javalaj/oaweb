/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaDocmanage;
import com.thinkgem.jeesite.modules.oa.dao.OaDocmanageDao;

/**
 * 栏目管理Service
 * @author liaijun
 * @version 2016-11-03
 */
@Service
@Transactional(readOnly = true)
public class OaDocmanageService extends TreeService<OaDocmanageDao, OaDocmanage> {
	@Autowired
	public OaDocmanageDao oaDocmanageDao;

	public OaDocmanage get(String id) {
		return super.get(id);
	}
	public List<OaDocmanage> getpid(String pid) {
		return oaDocmanageDao.getPid(pid);
	}
	
	public List<OaDocmanage> findList(OaDocmanage oaDocmanage) {
		if (StringUtils.isNotBlank(oaDocmanage.getParentIds())){
			oaDocmanage.setParentIds(","+oaDocmanage.getParentIds()+",");
		}
		return super.findList(oaDocmanage);
	}
	
	@Transactional(readOnly = false)
	public void save(OaDocmanage oaDocmanage) {
		super.save(oaDocmanage);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaDocmanage oaDocmanage) {
		super.delete(oaDocmanage);
	}
	
}