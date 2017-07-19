/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.coding;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaProVacate;

/**
 * 请假流程DAO接口
 * @author lzx
 * @version 2016-11-10
 */
@MyBatisDao
public interface OaProVacateDao extends CrudDao<OaProVacate> {

	OaProVacate getByProcInsId(String procInsId);
	
	/**
	 * 通过 用户id  请假/调休开始时间，结束时间，删除状态、查出数据条数
	 * */
	Integer getByTime(OaProVacate oaProVacate);
	
}