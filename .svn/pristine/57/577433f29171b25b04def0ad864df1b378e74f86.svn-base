/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.fixedassets;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetVo;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.FixedAssets;

/**
 * 固定资产管理DAO接口
 * @author zf
 * @version 2016-11-15
 */
@MyBatisDao
public interface FixedAssetsDao extends CrudDao<FixedAssets> 
{
	public List<AssetVo> findAssetList(String condition);
	
	public List<FixedAssets> findApplyList(List<String> ids);
	
	public String findBrand(String value);
	
	public String findCategory(String value);
}