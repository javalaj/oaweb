/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.fixedassets;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.fixedassets.AssetsInventoryDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsInventory;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.FixedAssets;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 固定资产物品栏Service
 * @author zf
 * @version 2016-11-28
 */
@Service
@Transactional(readOnly = true)
public class AssetsInventoryService extends CrudService<AssetsInventoryDao, AssetsInventory> {

	public AssetsInventory get(String id) {
		return super.get(id);
	}
	
	public List<AssetsInventory> findList(AssetsInventory assetsInventory) {
		return super.findList(assetsInventory);
	}
	
	public Page<AssetsInventory> findPage(Page<AssetsInventory> page, AssetsInventory assetsInventory) {
		return super.findPage(page, assetsInventory);
	}
	
	@Transactional(readOnly = false)
	public void save(AssetsInventory assetsInventory) {
		super.save(assetsInventory);
	}
	
	@Transactional(readOnly = false)
	public void delete(AssetsInventory assetsInventory) {
		super.delete(assetsInventory);
	}
	
	@Transactional(readOnly = false)
	public void add(String id, String equ_id)
	{
		AssetsInventory obj = new AssetsInventory();
		
		FixedAssets fixedAssets = new FixedAssets();
		
		fixedAssets.setId(id);
		
		obj.setFixedAssets(fixedAssets);
		
		obj.setUserid(UserUtils.getUser().getId());
		
		obj.setEquId(equ_id);
		
		obj.setRemarks("");
		
		save(obj);
	}
	
	/**
	 * 根据用户编号查询物品栏表中资产编号
	 * @param userId
	 * @return
	 */
	public List<String> findAssetsId (String userId)
	{
		return dao.findAssetsId(userId);
	}
	
	/**
	 * 根据用户Id删除物品栏
	 * @param userId
	 */
	@Transactional(readOnly = false)
	public void deleteByUserId(String userId)
	{
		dao.deleteByUserId(userId);
	}
	
	/**
	 * 根据设备id查询记录
	 * @param id
	 * @return
	 */
	public Integer findCount(String id)
	{
		return dao.findCount(UserUtils.getUser().getId(),id);
	}
	
	/**
	 * 根据用户id查询记录条数
	 * @param userId
	 * @return
	 */
	public Integer findCountUserId()
	{
		return dao.findCountUserId(UserUtils.getUser().getId());
	}
	
	/**
	 * 根据用户id和设备id查询记录条数
	 * @param userId
	 * @param equId
	 * @return
	 */
	public Integer findEquId(String equId)
	{
		return dao.findEquId(UserUtils.getUser().getId(), equId);
	}
}