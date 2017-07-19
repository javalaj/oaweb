/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.fixedassets;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsClaim;

/**
 * 资产认领DAO接口
 * @author zf
 * @version 2016-11-24
 */
@MyBatisDao
public interface AssetsClaimDao extends CrudDao<AssetsClaim> 
{
	/**
	 * 根据资产设备编号查询设备的使用记录
	 * @param id
	 * @return
	 */
	public List<AssetsClaim> findHistoryBydevice(String id);
	
	public List<Map<String,Object>> getAll(HashMap<String,String> paramMap);
}