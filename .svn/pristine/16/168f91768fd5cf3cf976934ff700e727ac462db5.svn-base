/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaGoout;
import com.thinkgem.jeesite.modules.oa.entity.OaOvertime;
import com.thinkgem.jeesite.modules.oa.entity.OaSealUse;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.entity.workflow.SysWorkflowVar;
import com.thinkgem.jeesite.modules.sys.service.workflow.SysWorkflowVarService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.dao.OaSealUseDao;

/**
 * 印章借用流程表Service
 * 
 * @author niting
 * @version 2016-12-13
 */
@Service
@Transactional(readOnly = true)
public class OaSealUseService extends CrudService<OaSealUseDao, OaSealUse> {

	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private SysWorkflowVarService sysWorkflowVarService;// 工作流变量service
	@Autowired
	private OaOvertimeService oaOvertimeService;// 抄送通知的service
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回业务service

	public OaSealUse get(String id) {
		return super.get(id);
	}

	public List<OaSealUse> findList(OaSealUse oaSealUse) {
		return super.findList(oaSealUse);
	}

	public Page<OaSealUse> findPage(Page<OaSealUse> page, OaSealUse oaSealUse) {
		return super.findPage(page, oaSealUse);
	}
	
	public OaSealUse getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}
	
	@Transactional(readOnly = false)
	public void save(OaSealUse oaSealUse, String flag) {
		// 查询出部门名称，并设置
		if (StringUtils.isBlank(oaSealUse.getOfficeName())) {
			oaSealUse.setOfficeName(UserUtils.getUser().getOffice().getName());
		}
		super.save(oaSealUse);// 该步骤为默认继承步骤，直接保存该记录。

		Map<String, Object> vars = new HashMap<String, Object>();
		vars.put("apply", UserUtils.getUser().getLoginName());// 发起人名字
		vars.put("manager", WorkflowUtils.getWorkflowVarValue("oa_seal_use", "manager", Global.getDefaultUser()));// 总经理
		vars.put("flag", true);
		vars.put("administration", WorkflowUtils.getWorkflowVarValue("oa_seal_use", "administration", Global.getDefaultUser()));// 人事行政部审核人

		if (StringUtils.isBlank(oaSealUse.getProcInsId())) {			
			// 流程关联id为null所以为第一次创建
			oaSealUse.setProcInsId(actTaskService.startProcess("oa_seal_use", "oa_seal_use", oaSealUse.getId(),
					"印章使用流程【" + UserUtils.getUser().getName() + DateUtils.getDate() + "】", vars));
			// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			//执行下一步,指定个人任务查询
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaSealUse.getProcInsId()).list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaSealUse.getProcInsId(), "【提交】", null, vars);
				// 流程撤回操作数据设置
				oaFlowBackService.saveINIT(oaSealUse.getProcInsId(), list.get(0),
				"/oa/oaSealUse/view?id=" + oaSealUse.getId());
			}
		}else{
			//打回后，以及流程第一次成功啟動后的相同步驟
			oaSealUse.setExamname(null);
			oaSealUse.setExamtext(null);
			oaSealUse.setExamname2(null);
			oaSealUse.setExamtext2(null);
			String examtext = "【重新提交】";
			if (flag.equals("1")) {
				vars.put("flag", false);// 流程控制标志位 boolean
				examtext = "【作废】";
			}
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaSealUse.getProcInsId())
					.list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaSealUse.getProcInsId(), examtext, null, vars);
				if (flag.equals("1")) {
					// 流程撤回操作数据设置
					oaFlowBackService.saveNULL(oaSealUse.getProcInsId());
				} else {
					// 流程撤回操作数据设置
					oaFlowBackService.saveNOW(oaSealUse.getProcInsId(),list.get(0));
				}
			}
			super.save(oaSealUse);
		}		
	}

	/**
	 * dealExam业务逻辑方法
	 * 
	 * exam 1不同意 ，0同意
	 */
	@Transactional(readOnly = false)
	public void dealexam(OaSealUse oaSealUse,String exam,int sign){
		//审批人签字
		//oaSealUse.setExamname(UserUtils.getUser().getName());
		Map<String, Object> vars = new HashMap<String, Object>();
		String examStr = "";
		//根据审核结果执行不同操作
		if(exam.equals("0")){
			vars.put("flag",true);// 流程控制标志位 boolean
			examStr = "【同意】";
		}
		else{
			vars.put("flag",false);// 流程控制标志位 boolean
			examStr = "【不同意】";
		}
		
		
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaSealUse.getProcInsId()).list();
		//判断是进入第一次审核还是第二次审核
		switch(sign){
		case 1:
			oaSealUse.setExamname(UserUtils.getUser().getName());
			oaSealUse.setExamtext(examStr+oaSealUse.getExamtext());
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaSealUse.getProcInsId(), oaSealUse.getExamtext(), null, vars);
				// 流程撤回操作数据设置
				oaFlowBackService.saveNOW(oaSealUse.getProcInsId(), list.get(0));
			}
			if(exam.equals("1")){
				//发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaSealUse/form?id=" + oaSealUse.getId(),
						"您提交的用印申请【" + DateUtils.formatDate(oaSealUse.getCreateDate()) + "】已被【"+oaSealUse.getExamname()+"】退回",
						oaSealUse.getCreateBy().getId());
			}
			break;
		case 2:
			oaSealUse.setExamname2(UserUtils.getUser().getName());
			oaSealUse.setExamtext2(examStr+oaSealUse.getExamtext2());
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaSealUse.getProcInsId(), oaSealUse.getExamtext2(), null, vars);
				
				if(exam.equals("0")){
					// 流程撤回操作数据设置
					oaFlowBackService.saveNULL(oaSealUse.getProcInsId());
				}else{
					// 流程撤回操作数据设置
					oaFlowBackService.saveNOW(oaSealUse.getProcInsId(), list.get(0));
				}
				
			}
			if(exam.equals("0")){
				//发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaSealUse/form?id=" + oaSealUse.getId(),
						"您提交的用印申请【" + DateUtils.formatDate(oaSealUse.getCreateDate()) + "】已被【"+oaSealUse.getExamname2()+"】办结",
						oaSealUse.getCreateBy().getId());
			}else{
				//发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaSealUse/form?id=" + oaSealUse.getId(),
						"您提交的用印申请【" + DateUtils.formatDate(oaSealUse.getCreateDate()) + "】已被【"+oaSealUse.getExamname2()+"】退回",
						oaSealUse.getCreateBy().getId());
			}			
			break;
		}
		super.save(oaSealUse);
	}
	
	/**
	 * 判断当前用户是否需要去form页面创建，审批，修改这个流程
	 */
	public boolean isDeal(OaSealUse oaSealUse) {
		if (StringUtils.isBlank(oaSealUse.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaSealUse.getProcInsId())
					.list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}
	
	@Transactional(readOnly = false)
	public void delete(OaSealUse oaSealUse) {
		super.delete(oaSealUse);
	}

}