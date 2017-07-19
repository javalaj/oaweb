/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.coding;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaCollectCoding;

/**
 * 整理后每日打卡资料DAO接口
 * 
 * @author 李正曦
 * @version 2016-11-07
 */
@MyBatisDao
public interface OaCollectCodingDao extends CrudDao<OaCollectCoding> {

	public OaCollectCoding getByUserNoAndDate(String userNo, String date);

	public List<OaCollectCoding> getListByUserAndDate(String userId,
			String beginDate, String endDate);
	
	
	public int deleteByYearMonth(@Param("yearMonth") String yearMonth);
	public List<OaCollectCoding> getListByUserNoAndDate(@Param("userNo")String userNo,@Param("searchDate")Date searchDate);
	

}