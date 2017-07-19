package com.thinkgem.jeesite.modules.sys.dao.job;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.job.SysScheduleJob;

@MyBatisDao
public interface SysScheduleJobDao {
	int deleteByPrimaryKey(Long jobId);

	int insert(SysScheduleJob record);

	int insertSelective(SysScheduleJob record);

	SysScheduleJob selectByPrimaryKey(Long jobId);

	int updateByPrimaryKeySelective(SysScheduleJob record);

	int updateByPrimaryKey(SysScheduleJob record);

	List<SysScheduleJob> getAll();
}