/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.BaseEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.user.dao.UserWorklogDao;
import com.thinkgem.jeesite.modules.user.entity.NeedEmailUser;
import com.thinkgem.jeesite.modules.user.entity.UserWorklog;

/**
 * 我的日志整体外部，不包含工作记录细节Service
 * 
 * @author liuxin
 * @version 2016-11-02
 */
@Service
@Transactional(readOnly = true)
public class UserWorklogService extends CrudService<UserWorklogDao, UserWorklog> {
	@Autowired
	private UserWorklogDao dao;

	public UserWorklog get(String id) {
		return super.get(id);
	}

	public List<UserWorklog> findList(UserWorklog userWorklog) {
		return super.findList(userWorklog);
	}

	public Page<UserWorklog> findPage(Page<UserWorklog> page, UserWorklog userWorklog) {
		return super.findPage(page, userWorklog);
	}

	@Transactional(readOnly = false)
	public void save(UserWorklog entity) {
		Date dateu = entity.getUpdateDate();
		if (entity.getIsNewRecord()) {
			entity.preInsert();
			if (dateu != null) {
				entity.setUpdateDate(dateu);
			}
			dao.insert(entity);
		} else {
			entity.preUpdate();
			if (dateu != null) {
				entity.setUpdateDate(dateu);
			}
			dao.update(entity);
		}
	}

	public boolean findUserState(User user) {
		if (dao.findUserState(user).equals("l")) {
			return false;
		} else {
			return true;
		}
	}

	@Transactional(readOnly = false)
	public void delete(UserWorklog userWorklog) {
		super.delete(userWorklog);
	}

	/**
	 * 通过日期查询该用户是否已经写了该日期的日志
	 * 
	 */
	public String findByWorkdate(UserWorklog userWorklog) {
		return dao.findByWorkdate(userWorklog);
	}

	/**
	 * 条件查询分页数据
	 * 
	 * liuxin
	 * 
	 * @param page
	 *            分页对象
	 * @param entity
	 * @return
	 */
	public Page<UserWorklog> findPageByDate(Page<UserWorklog> page, Date begindate, Date enddate, String userId,
			Date end) {
		page.setList(dao.findPageByDate(page, begindate, enddate, userId, BaseEntity.DEL_FLAG_NORMAL, end));
		return page;
	}

	public Integer findUserWorklogSubmit(String createBy, Date workdate, String isdraft, Date begin, Date end) {
		return dao.findUserWorklogSubmit(createBy, workdate, BaseEntity.DEL_FLAG_NORMAL, isdraft, begin, end);
	}

	/**
	 * 查询未交人员的名单
	 */
	public List<NeedEmailUser> findNotSubmitUserEmail(NeedEmailUser needEmailUser) {
		return dao.findNotSubmitUserEmail(needEmailUser);
	}

	/** 查询他人昨天日志（星期一，不同），手机端， */
	public Page<UserWorklog> getOtherLogList(Page<UserWorklog> page, UserWorklog userWorklog) {
		userWorklog.setPage(page);
		page.setList(dao.getOtherLogList(userWorklog));
		return page;
	}
}