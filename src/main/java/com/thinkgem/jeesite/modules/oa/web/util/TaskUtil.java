package com.thinkgem.jeesite.modules.oa.web.util;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.task.Task;
/**
 *    通过流程实例获取任务id
 *    2017-3-10
 *     cz
 * */
public class TaskUtil {
	// 定义流程引擎
	 static	ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
	public static Task task(String id){
		Task ta=	processEngine.getTaskService()// 与正在执行的任务管理相关的service  
	            .createTaskQuery()// 创建任务查询对象  
	            .processInstanceId(id)//使用流程实例ID查询  
	            .singleResult();
		return ta;
	}

}
