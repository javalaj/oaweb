/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.coding;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaViewCoding;

/**
 * 从打卡机导出的数据统计DAO
 * 
 * @author 李廷龙
 * @version 2016-11-04
 */
@MyBatisDao
public interface OaViewCodingDao extends CrudDao<OaViewCoding> {

	public List<OaViewCoding> getViewByDeptAndTime(OaViewCoding oaViewCoding);

	public List<OaViewCoding> getDetailViewByUserAndTime(@Param("userNo")String userNo,
			@Param("timerec")String timerec);

}