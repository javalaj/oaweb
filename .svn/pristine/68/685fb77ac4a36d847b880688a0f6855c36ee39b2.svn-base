/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.assetsturnover;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.assetsturnover.AssetsTurnOver;
import com.thinkgem.jeesite.modules.oa.dao.assetsturnover.AssetsTurnOverDao;

/**
 * 资产交接Service
 * @author zf
 * @version 2017-01-18
 */
@Service
@Transactional(readOnly = true)
public class AssetsTurnOverService extends CrudService<AssetsTurnOverDao, AssetsTurnOver> {

	public AssetsTurnOver get(String id) {
		return super.get(id);
	}
	
	public List<AssetsTurnOver> findList(AssetsTurnOver assetsTurnOver) {
		return super.findList(assetsTurnOver);
	}
	
	public Page<AssetsTurnOver> findPage(Page<AssetsTurnOver> page, AssetsTurnOver assetsTurnOver) {
		return super.findPage(page, assetsTurnOver);
	}
	
	@Transactional(readOnly = false)
	public void save(AssetsTurnOver assetsTurnOver) {
		super.save(assetsTurnOver);
	}
	
	@Transactional(readOnly = false)
	public void delete(AssetsTurnOver assetsTurnOver) {
		super.delete(assetsTurnOver);
	}
	
	/**
	 * 根据人员异动主键删除
	 * @param staffTurnoverId
	 */
	@Transactional(readOnly = false)
	public void deletes(String staffTurnoverId)
	{
		dao.deletes(staffTurnoverId);
	}
}