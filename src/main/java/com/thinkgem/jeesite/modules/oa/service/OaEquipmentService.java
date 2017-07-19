/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.OaEquipment;
import com.thinkgem.jeesite.modules.oa.dao.OaEquipmentDao;

/**
 * 固定资产管理Service
 * 
 * @author liaijun
 * @version 2016-10-20
 */
@Service
@Transactional(readOnly = true)
public class OaEquipmentService extends
		CrudService<OaEquipmentDao, OaEquipment> {

	public OaEquipment get(String id) {
		return super.get(id);
	}

	/**
	 * 加载固定资产列表
	 */
	public List<OaEquipment> findList(OaEquipment oaEquipment) {
		return super.findList(oaEquipment);
	}

	/**
	 * 分页列表显示
	 */
	public Page<OaEquipment> findPage(Page<OaEquipment> page,
			OaEquipment oaEquipment) {
		return super.findPage(page, oaEquipment);
	}

	/**
	 * 保存
	 */
	@Transactional(readOnly = false)
	public void save(OaEquipment oaEquipment) {
		super.save(oaEquipment);
	}

	/**
	 * 删除
	 */
	@Transactional(readOnly = false)
	public void delete(OaEquipment oaEquipment) {
		super.delete(oaEquipment);
	}

}