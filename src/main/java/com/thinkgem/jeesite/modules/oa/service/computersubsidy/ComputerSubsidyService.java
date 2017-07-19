/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.computersubsidy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.entity.computersubsidy.ComputerSubsidy;
import com.thinkgem.jeesite.modules.oa.actRouting.ActRouting;
import com.thinkgem.jeesite.modules.oa.dao.computersubsidy.ComputerSubsidyDao;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 电脑补贴申请Service
 * @author zf
 * @version 2016-12-01
 */
@Service
@Transactional(readOnly = true)
public class ComputerSubsidyService extends CrudService<ComputerSubsidyDao, ComputerSubsidy> {

	public ComputerSubsidy get(String id) {
		return super.get(id);
	}
	
	public List<ComputerSubsidy> findList(ComputerSubsidy computerSubsidy) {
		return super.findList(computerSubsidy);
	}
	
	public Page<ComputerSubsidy> findPage(Page<ComputerSubsidy> page, ComputerSubsidy computerSubsidy) {
		return super.findPage(page, computerSubsidy);
	}
	
	@Transactional(readOnly = false)
	public void save(ComputerSubsidy computerSubsidy) {
		super.save(computerSubsidy);
	}
	
	@Transactional(readOnly = false)
	public void saveForAct(ComputerSubsidy obj)
	{
		String userName = UserUtils.getUser().getLoginName();
		
		String title = userName + "的电脑补贴申请";
		
		obj.setTitle(title);
		
		save(obj);
		
		// 初始化工作流中的变量的值，带入vars中放到后面使用
		Map<String, Object> vars = new HashMap<String, Object>();
		
		vars.put("apply", userName);
		
		vars.put("personnel", "laowang");
		
		vars.put("deputyManager", "laoli");
		
		// 第一次申请，启动工作流
		String procInsId = actTaskService.startProcess("computer_subsidy",
				"computer_subsidy", obj.getId(),
				obj.getTitle() , vars);
		// 线程暂停两秒
		try 
		{
			Thread.sleep(2000);
		}
		catch (InterruptedException e) 
		{
			e.printStackTrace();
		}
		// 通过procinsid获取任务的列表，一般只有一条，在出现分支或子流程的情况下会有多条，不建议现在配置那种，即并行网关
		List<Task> list = actTaskService.getProcessEngine()
				.getTaskService().createTaskQuery()
				.processInstanceId(procInsId).list();
		
		if (list.size() > 0) {
			// 任务完成，跟着流程的线继续走到下一个节点
			actTaskService.complete(list.get(0).getId(), procInsId, "【提交】",
					obj.getTitle(), vars);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(ComputerSubsidy computerSubsidy) {
		super.delete(computerSubsidy);
	}
	
	@Autowired
	private ActTaskService actTaskService;
}