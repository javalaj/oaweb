/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.fixedassets;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsInventory;

/**
 * 固定资产物品栏DAO接口
 * @author zf
 * @version 2016-11-28
 */
@MyBatisDao
public interface AssetsInventoryDao extends CrudDao<AssetsInventory> 
{
	/**
	 * 根据用户编号查询物品栏表中资产编号
	 * @param userId
	 * @return
	 */
	public List<String> findAssetsId (String userId);
	
	/**
	 * 根据用户Id删除物品栏
	 * @param userId
	 */
	public void deleteByUserId(String userId);
	
	/**
	 * 根据设备id查询记录
	 * @param id
	 * @return
	 */
	public Integer findCount(String userId, String id);
	
	/**
	 * 根据用户id查询记录条数
	 * @param userId
	 * @return
	 */
	public Integer findCountUserId(String userId);
	
	/**
	 * 根据用户id和设备id查询记录条数
	 * @param userId
	 * @param equId
	 * @return
	 */
	public Integer findEquId(String userId, String equId);
}