/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaTaskRecord;
import com.thinkgem.jeesite.modules.oa.entity.mytask.OaPlan;

/**
 * 记录DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface OaTaskRecordDao extends CrudDao<OaTaskRecord> {

	/**
	 * 插入通知记录
	 * @param oaNotifyRecordList
	 * @return
	 */
	public int insertAll(List<OaTaskRecord> oaTaskRecordList);
	
	/**
	 * 根据通知ID删除通知记录
	 * @param oaNotifyId 通知ID
	 * @return
	 */
	public int deleteByOaTaskId(String oaTaskId);
	Map<String, String> 	unfinishedCount(@Param("userid")String  userid);

	//统计我布置的任务
		Map<String, String> recnmylist(@Param("userid")String  userid);
		
		public void	insertAll(OaTaskRecord oaTaskRecord);
		List<OaTaskRecord> geti(OaTaskRecord oaTaskRecord);
		
		public void	updateuser(@Param("userId")String  userId,@Param("oaTaskId")String  oaTaskId);
}