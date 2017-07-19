/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaArchivesRecord;
import com.thinkgem.jeesite.modules.oa.entity.OaNotifyRecord;

/**
 * 公司发文记录DAO接口
 * @author niting
 * @version 2016-12-22
 */
@MyBatisDao
public interface OaArchivesRecordDao extends CrudDao<OaArchivesRecord> {
	/**
	 * 插入通知记录
	 * @param oaArchivesRecordList
	 * @return
	 */
	public int insertAll(List<OaArchivesRecord> oaArchivesRecordList);
	
	/**
	 * 根据通知ID删除通知记录
	 * @param oaArchivesId 通知ID
	 * @return
	 */
	public int deleteByOaArchivesId(String oaArchivesId);
}