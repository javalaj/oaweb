/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.BaseEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.dao.UserFavoriteDao;
import com.thinkgem.jeesite.modules.user.entity.UserFavorite;
import com.thinkgem.jeesite.modules.user.util.FavoriteMapUtil;

/**
 * 用户收藏夹Service
 * 
 * @author liuxin
 * @version 2016-11-15
 */
@Service
@Transactional(readOnly = true)
public class UserFavoriteService extends CrudService<UserFavoriteDao, UserFavorite> {

	public UserFavorite get(String id) {
		return super.get(id);
	}

	/**
	 * 页面查找当前收藏品是否被收藏状态
	 */
	public boolean getShoucangState(String sign) {
		UserFavorite userFavorite = new UserFavorite();
		userFavorite.setSign(sign);
		userFavorite.setCreateBy(UserUtils.getUser());
		if (dao.findCountByTypeSign(userFavorite) == 0) {
			return false;
		}
		return true;
	}

	/** 查找给定的 类型 和 唯一标示的 收藏品数量 */
	public Integer findCountByTypeSign(UserFavorite userFavorite) {
		return dao.findCountByTypeSign(userFavorite);
	}

	public List<UserFavorite> findList(UserFavorite userFavorite) {
		return super.findList(userFavorite);
	}

	public Page<UserFavorite> findPage(Page<UserFavorite> page, UserFavorite userFavorite) {
		return super.findPage(page, userFavorite);
	}

	@Transactional(readOnly = false)
	public void save(UserFavorite userFavorite) {
		userFavorite.setCreateBy(UserUtils.getUser());
		if ((int) findCountByTypeSign(userFavorite) == 0) {
			super.save(userFavorite);
		}
	}

	@Transactional(readOnly = false)
	public void delete(UserFavorite userFavorite) {
		super.delete(userFavorite);
	}

	public List<FavoriteMapUtil> findTypeList(User createBy) {
		return dao.findTypeList(createBy, BaseEntity.DEL_FLAG_NORMAL);
	}

	/**
	 * 通过sign值 删除收藏物品
	 */
	@Transactional(readOnly = false)
	public void deleteBySign(UserFavorite userFavorite) {
		dao.deleteBySign(userFavorite);
	}
}