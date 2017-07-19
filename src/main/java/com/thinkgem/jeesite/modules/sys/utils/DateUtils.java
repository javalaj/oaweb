package com.thinkgem.jeesite.modules.sys.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
public class DateUtils {
/**
* 请用Java编写一段程序打印输出当前日期减去7天的日期，格式为1-31-1900。
* @param args
* @throws ParseException
*/
public static void main(String[] args) throws ParseException {
DateUtils dateTest = new DateUtils();
DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//假象一个指定时间 1999年1月31日
Date before7Day = dateTest.getDate("1999-1-31", 7);
System.out.println("获得的新的时间是 : "+df.format(before7Day));
}
/**
* 根据输入的日期字符串 和 提前天数 ，
* 获得 指定日期提前几天的日期对象
* @param dateString 日期对象 ，格式如 1-31-1900
* @param lazyDays 倒推的天数
* @return 指定日期倒推指定天数后的日期对象
* @throws ParseException
*/
public static Date getDate(String dateString , int beforeDays) throws ParseException{
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date inputDate = dateFormat.parse(dateString);
Calendar cal = Calendar.getInstance();
cal.setTime(inputDate);
int inputDayOfYear = cal.get(Calendar.DAY_OF_YEAR);
cal.set(Calendar.DAY_OF_YEAR , inputDayOfYear-beforeDays );
return cal.getTime();
}
}