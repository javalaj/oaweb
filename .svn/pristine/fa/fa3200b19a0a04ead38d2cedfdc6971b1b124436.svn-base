package com.thinkgem.jeesite.modules.oa.utils.flow;

import java.util.Calendar;
import java.util.Date;

import org.springframework.ui.Model;

/**
 * 
 * 向model 里面加入指定的值，特定的需求
 * 
 * liuxin
 */
public class ModelUtil {

	/**
	 * 
	 * 加班申请需要在model加入属性 mindate 最早申请时间,用于页面的字段验证
	 * 
	 */
	public static void overtimeAddMinDate(Model model) {
		// 填写申请时间：
		// 星期 3 4 5 6 mindate为两天前
		// 星期 7 mindate为三天前
		// 星期 1 2 mindate为四天前
		// 日一二三四五六
		// 1234567
		Calendar now = Calendar.getInstance();
		switch (now.get(Calendar.DAY_OF_WEEK)) {
		case 2:
		case 3:
			now.setTimeInMillis(now.getTimeInMillis() - 4 * 24 * 60 * 60 * 1000);
			break;
		case 1:
			now.setTimeInMillis(now.getTimeInMillis() - 3 * 24 * 60 * 60 * 1000);
			break;
		default:
			now.setTimeInMillis(now.getTimeInMillis() - 2 * 24 * 60 * 60 * 1000);
			break;
		}
		now.set(Calendar.HOUR_OF_DAY, 0);
		now.set(Calendar.MINUTE, 0);
		now.set(Calendar.SECOND, 0);
		now.set(Calendar.MILLISECOND, 0);
		Date minDate = now.getTime();
		model.addAttribute("minDate", minDate);
	}
}
