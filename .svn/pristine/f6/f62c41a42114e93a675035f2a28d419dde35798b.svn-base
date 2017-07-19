/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.user.entity.NeedEmailUser;
import com.thinkgem.jeesite.modules.user.entity.UserWorklog;

/**
 * 我的日志整体外部，不包含工作记录细节DAO接口
 * 
 * @author liuxin
 * @version 2016-11-02
 */
@MyBatisDao
public interface UserWorklogDao extends CrudDao<UserWorklog> {

	/**
	 * 通过日期查询该用户是否已经写了该日期的日志 @Param("DEL_FLAG_NORMAL") String
	 * DEL_FLAG_NORMAL, @Param("createBy") String createBy, @Param("workdate")
	 * Date workdate
	 */
	public String findByWorkdate(UserWorklog userWorklog);

	/**
	 * 条件查询数据列表，如果需要分页，请设置分页对象，如：entity.setPage(new Page<T>());
	 * 
	 * liuxin
	 * 
	 * @param entity
	 * @return
	 */
	public List<UserWorklog> findPageByDate(@Param("page") Page<UserWorklog> page, @Param("begindate") Date begindate,
			@Param("enddate") Date enddate, @Param("userId") String userId,
			@Param("DEL_FLAG_NORMAL") String DEL_FLAG_NORMAL, @Param("end") Date end);

	/**
	 * SELECT COUNT(*) FROM user_worklog WHERE create_by=1 AND
	 * workdate="2016-12-15" AND del_flag=1 AND isdraft=1 AND
	 * update_date>"2016-12-15 00:00:00" AND update_date<"2016-12-16 09:30:00"
	 * 查找用户9:30前，是否提交前一天日志
	 */
	public Integer findUserWorklogSubmit(@Param("createBy") String createBy, @Param("workdate") Date workdate,
			@Param("DEL_FLAG_NORMAL") String DEL_FLAG_NORMAL, @Param("isdraft") String isdraft,
			@Param("begin") Date begin, @Param("end") Date end);

	public String findUserState(User user);

	/**
	 * 查询未交人员的名单
	 */
	public List<NeedEmailUser> findNotSubmitUserEmail(NeedEmailUser needEmailUser);

	/** 查询他人昨天日志（星期一，不同），手机端， */
	public List<UserWorklog> getOtherLogList(UserWorklog userWorklog);
}