/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.user.entity.UserFavorite;
import com.thinkgem.jeesite.modules.user.util.FavoriteMapUtil;

/**
 * 用户收藏夹DAO接口
 * 
 * @author liuxin
 * @version 2016-11-15
 */
@MyBatisDao
public interface UserFavoriteDao extends CrudDao<UserFavorite> {
	/** 查找所有收藏类别，以及数目 */
	public List<FavoriteMapUtil> findTypeList(@Param("createBy") User createBy,
			@Param("DEL_FLAG_NORMAL") String DEL_FLAG_NORMAL);

	/** 查找给定的 类型 和 唯一标示的 收藏品数量 */
	public Integer findCountByTypeSign(UserFavorite userFavorite);

	/** 通过sign删除 当前的 收藏物品 */
	public void deleteBySign(UserFavorite userFavorite);
}