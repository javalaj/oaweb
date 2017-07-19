/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.utils;

import java.util.HashMap;
import java.util.Map;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.dao.OrdersDao;

/**
 * 流水号工具类
 * @author 李廷龙
 * @version 2016-12-21
 */
public class OrdersUtils {
	
	private static OrdersDao ordersDao = SpringContextHolder.getBean(OrdersDao.class);
	
	/**
	 * 年流水
	 * @param orderNamePre.length() [1,8]
	 * @return
	 */
	public static String getGenerateOrderNo4(String orderNamePre){
		if (orderNamePre.length()>8||orderNamePre.length()<1) {
			throw new IllegalArgumentException("流水号前缀长度不符合要求，请设置一个长度为1到8之间的前缀名称！");
		}
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("orderNamePre",orderNamePre);
		param.put("num", 4);
		return ordersDao.generateOrderNo(param);
	}
	
	/**
	 * 月流水
	 * @param orderNamePre.length() [1,8]
	 * @return
	 */
	public static String getGenerateOrderNo6(String orderNamePre){
		if (orderNamePre.length()>8||orderNamePre.length()<1) {
			throw new IllegalArgumentException("流水号前缀长度不符合要求，请设置一个长度为1到8之间的前缀名称！");
		}
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("orderNamePre",orderNamePre);
		param.put("num", 6);
		return ordersDao.generateOrderNo(param);
	}
	
	/**
	 * 日流水
	 * @param orderNamePre.length() [1,8]
	 * @return
	 */
	public static String getGenerateOrderNo8(String orderNamePre){
		if (orderNamePre.length()>8||orderNamePre.length()<1) {
			throw new IllegalArgumentException("流水号前缀长度不符合要求，请设置一个长度为1到8之间的前缀名称！");
		}
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("orderNamePre",orderNamePre);
		param.put("num", 8);
		return ordersDao.generateOrderNo(param);
	}
	
	/**
	 * 时流水
	 * @param orderNamePre.length() [1,8]
	 * @return
	 */
	public static String getGenerateOrderNo10(String orderNamePre){
		if (orderNamePre.length()>8||orderNamePre.length()<1) {
			throw new IllegalArgumentException("流水号前缀长度不符合要求，请设置一个长度为1到8之间的前缀名称！");
		}
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("orderNamePre",orderNamePre);
		param.put("num", 10);
		return ordersDao.generateOrderNo(param);
	}
	
	/**
	 * 分流水
	 * @param orderNamePre.length() [1,8]
	 * @return
	 */
	public static String getGenerateOrderNo12(String orderNamePre){
		if (orderNamePre.length()>8||orderNamePre.length()<1) {
			throw new IllegalArgumentException("流水号前缀长度不符合要求，请设置一个长度为1到8之间的前缀名称！");
		}
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("orderNamePre",orderNamePre);
		param.put("num", 12);
		return ordersDao.generateOrderNo(param);
	}
	
	/**
	 * 秒流水
	 * @param orderNamePre.length() [1,8]
	 * @return
	 */
	public static String getGenerateOrderNo14(String orderNamePre){
		if (orderNamePre.length()>8||orderNamePre.length()<1) {
			throw new IllegalArgumentException("流水号前缀长度不符合要求，请设置一个长度为1到8之间的前缀名称！");
		}
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("orderNamePre",orderNamePre);
		param.put("num", 14);
		return ordersDao.generateOrderNo(param);
	}
	
}
