package com.thinkgem.jeesite.modules.sys.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class MyDateUtils 
{
	/**
	 * 获取当前时间的周一的日期
	 * @return
	 */
	public static Date getBeginDate()
	{
		Calendar c=Calendar.getInstance(Locale.CHINA);
		//当前时间，貌似多余，其实是为了所有可能的系统一致
		c.setTimeInMillis(getDayBegin().getTime());
		
		c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		
		return c.getTime();
	}
	
	/**
	 * 获取当前时间的周日的日期
	 * @return
	 */
	public static Date getEndDate()
	{
		Calendar c=Calendar.getInstance(Locale.CHINA);
		//当前时间，貌似多余，其实是为了所有可能的系统一致
		c.setTimeInMillis(getDayBegin().getTime());
		
		c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		
		return c.getTime();
	}
	
	/**
	 * 获取凌晨时间
	 * @return
	 */
	public static Date getDayBegin() 
	{
	  Calendar cal = Calendar.getInstance();
	  
	  cal.set(Calendar.HOUR_OF_DAY, 0);
	  
	  cal.set(Calendar.SECOND, 0);
	  
	  cal.set(Calendar.MINUTE, 0);
	  
	  cal.set(Calendar.MILLISECOND, 001);
	  
	  return cal.getTime();
	 }
}
