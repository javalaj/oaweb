/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;


import java.util.Map;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 用户DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface OrdersDao{
	/**
     * 调用事务过程，防止冒投
     * @return
     */
    public String generateOrderNo(Map<String, Object> param);
}
