/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.coding;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaCoding;

/**
 * 从打卡机导出的数据存储DAO接口
 * @author 李廷龙
 * @version 2016-11-04
 */
@MyBatisDao
public interface OaCodingDao extends CrudDao<OaCoding> {
	
	public List<OaCoding> findMaxAndMinListBySearchDate(OaCoding oaCoding);
	
}