/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.fixedassets;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.ApplyVo;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsSerial;

/**
 * 资产序列DAO接口
 * @author zf
 * @version 2016-11-20
 */
@MyBatisDao
public interface AssetsSerialDao extends CrudDao<AssetsSerial> 
{
	public List<ApplyVo> findApply(String id);
	
	public AssetsSerial getByProcInsId(String procInsId);
	
	public void updateApply(Integer account, String id);
	
	public void updateRemarks(String remarks, String id);
}