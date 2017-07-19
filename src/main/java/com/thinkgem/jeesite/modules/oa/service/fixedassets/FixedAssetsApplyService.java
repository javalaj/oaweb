/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.fixedassets;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.FixedAssetsApply;
import com.thinkgem.jeesite.modules.oa.dao.fixedassets.FixedAssetsApplyDao;

/**
 * 固定资产申请Service
 * @author zf
 * @version 2016-11-20
 */
@Service
@Transactional(readOnly = true)
public class FixedAssetsApplyService extends CrudService<FixedAssetsApplyDao, FixedAssetsApply> {

	public FixedAssetsApply get(String id) {
		return super.get(id);
	}
	
	public List<FixedAssetsApply> findList(FixedAssetsApply fixedAssetsApply) {
		return super.findList(fixedAssetsApply);
	}
	
	public Page<FixedAssetsApply> findPage(Page<FixedAssetsApply> page, FixedAssetsApply fixedAssetsApply) {
		return super.findPage(page, fixedAssetsApply);
	}
	
	@Transactional(readOnly = false)
	public void save(FixedAssetsApply fixedAssetsApply) {
		super.save(fixedAssetsApply);
	}
	
	@Transactional(readOnly = false)
	public void delete(FixedAssetsApply fixedAssetsApply) {
		super.delete(fixedAssetsApply);
	}
	
}