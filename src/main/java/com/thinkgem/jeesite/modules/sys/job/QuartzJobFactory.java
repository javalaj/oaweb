package com.thinkgem.jeesite.modules.sys.job;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.thinkgem.jeesite.modules.sys.entity.job.SysScheduleJob;
import com.thinkgem.jeesite.modules.sys.utils.job.JobUtils;


/**
 * 
 * @Description: 计划任务执行处 无状态
 * @author chenjianlin
 * @date 2014年4月24日 下午5:05:47
 */
public class QuartzJobFactory implements Job {
	public final Logger log = Logger.getLogger(this.getClass());

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		SysScheduleJob scheduleJob = (SysScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
		JobUtils.invokMethod(scheduleJob);
	}
}