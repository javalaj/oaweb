package com.thinkgem.jeesite.modules.oa.job.coding;


import java.util.Date;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.oa.service.coding.OaCollectCodingService;

/**
 * 浩顺考勤云访问示例 2017-4-22
 * 
 * 指南: http://hc.apache.org/httpcomponents-client-4.5.x/tutorial/html/index.html
 * 示例: http://hc.apache.org/httpcomponents-client-4.5.x/examples.html
 */
public class OaCodingAsyncHskqCloudJob {
	private OaCollectCodingService oaCollectCodingService=SpringContextHolder.getBean(OaCollectCodingService.class);

	public void startVisitHsqkCloud() throws Exception {
		long yesterday=new Date().getTime()-24*60*60*1000;
		Date yesterdayDate=new Date(yesterday);
		oaCollectCodingService.asyncHsqkCloud(yesterdayDate);
	}
	

}
