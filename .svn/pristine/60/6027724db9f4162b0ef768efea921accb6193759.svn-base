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
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.actRouting.ActRouting;
import com.thinkgem.jeesite.modules.oa.dao.OaEmployeeFormalDao;
import com.thinkgem.jeesite.modules.oa.entity.OaEmployeeFormal;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 员工转正申请流程Service
 * 
 * @author liuxin
 * @version 2016-12-15
 */
@Service
@Transactional(readOnly = true)
public class OaEmployeeFormalService extends CrudService<OaEmployeeFormalDao, OaEmployeeFormal> {
	private static final String PROC_DEF_KEY = "oa_employee_formal";// 流程定义标示
	@Autowired
	private ActTaskService actTaskService;// 工作流业务类
	@Autowired
	private OfficeService officeService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OaOvertimeService oaOvertimeService;// 抄送通知的service
	// OaOvertimeService
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回业务service

	public OaEmployeeFormal get(String id) {
		return super.get(id);
	}

	public List<OaEmployeeFormal> findList(OaEmployeeFormal oaEmployeeFormal) {
		return super.findList(oaEmployeeFormal);
	}

	public Page<OaEmployeeFormal> findPage(Page<OaEmployeeFormal> page, OaEmployeeFormal oaEmployeeFormal) {
		return super.findPage(page, oaEmployeeFormal);
	}

	public OaEmployeeFormal getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}

	@Transactional(readOnly = false)
	public void delete(OaEmployeeFormal oaEmployeeFormal) {
		super.delete(oaEmployeeFormal);
	}

	/**
	 * save业务逻辑方法
	 */
	@Transactional(readOnly = false)
	public void save(OaEmployeeFormal oaOvertime, String flag) {
		// 查询文件编号，并设置？？
		//
		if (StringUtils.isBlank(oaOvertime.getOfficeName())) {
			// 查询出部门名称，并设置
			oaOvertime.setOfficeName(UserUtils.getUser().getOffice().getName());
		}
		super.save(oaOvertime);// 该步骤为默认继承步骤，直接保存该记录。
		//
		// officePrimary officeDeputy deputyPersonnel filling
		Map<String, Object> vars = new HashMap<String, Object>();
		// 这里put 流程图上所有的需要值，以便于activiti流插件，的控制
		vars.put("apply", UserUtils.getUser().getLoginName());// 发起人登陆名字

		String upper = ActRouting.getUpper(UserUtils.getUser().getId());
		vars.put("upper", upper);// 上级登陆名字
		String deputyPerson = UserUtils
				.get(officeService.get(ActRouting.getManager(UserUtils.getUser().getId())).getPrimaryPerson().getId())
				.getLoginName();
		vars.put("deputyPerson", deputyPerson);// 部门副总的登陆名字（上级领导的上级领导）
		vars.put("next", false);// 流程控制特殊跳转标志位 boolean
		if (deputyPerson.equals(upper)) {// 判断是否还有上级？？？？待修改,假设老板是cz
			vars.put("next", true);// 没有上级
		}
		vars.put("flag", true);// 流程控制标志位 boolean

		vars.put("deputyPersonnel",
				WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "deputyPersonnel", Global.getDefaultUser()));// 人事行政部副总登陆名字
		vars.put("filling", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "filling", Global.getDefaultUser()));// 人力资源登陆名字
		vars.put("manager", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "manager", Global.getDefaultUser()));// 人事经理登陆名字
		//
		//
		if (StringUtils.isBlank(oaOvertime.getProcInsId())) {
			// 流程关联id为null所以为第一次创建
			oaOvertime.setProcInsId(
					actTaskService.startProcess("oa_employee_formal", "oa_employee_formal", oaOvertime.getId(),
							"员工转正申请流程【" + UserUtils.getUser().getName() + " " + DateUtils.getDate() + "】", vars));// 关键步骤，获取procInsId，否则推送失败
			// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			// 执行下一步
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaOvertime.getProcInsId())
					.list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaOvertime.getProcInsId(), "【提交】", null, vars);
				// 流程撤回操作数据设置
				oaFlowBackService.saveINIT(oaOvertime.getProcInsId(), list.get(0),
						"/oa/oaEmployeeFormal/form?flag=view&id=" + oaOvertime.getId());
			}
		} else {
			// 打回后，以及第一次流程启动成功后的相同步骤
			oaOvertime.setExamname(null);
			oaOvertime.setExamtext(null);
			oaOvertime.setExamname2(null);
			oaOvertime.setExamtext2(null);
			oaOvertime.setExamname3(null);
			oaOvertime.setExamtext3(null);
			String examtext = "【重新提交】";
			if (flag.equals("1")) {
				vars.put("flag", false);// 流程控制标志位 boolean
				examtext = "【作废】";
			}
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaOvertime.getProcInsId())
					.list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaOvertime.getProcInsId(), examtext, null, vars);
				if (flag.equals("1")) {
					// 流程撤回操作数据设置
					oaFlowBackService.saveNULL(oaOvertime.getProcInsId());
				} else {
					// 流程撤回操作数据设置
					oaFlowBackService.saveNOW(oaOvertime.getProcInsId(), list.get(0));
				}
			}
			super.save(oaOvertime);
		}

	}

	/**
	 * dealExam业务逻辑方法
	 * 
	 * exam 1不同意 ，0同意
	 */
	@Transactional(readOnly = false)
	public void dealExam(OaEmployeeFormal oaOvertime, String exam, int sign) {
		// 审批人签名??
		Map<String, Object> vars = new HashMap<String, Object>();
		String examStr = "";
		if (exam.equals("0")) {// 上级审核同意
			// 定制vars
			vars.put("flag", true);// 流程控制标志位 boolean
			examStr = "【同意】";
		} else {
			// 上级审核不同意
			vars.put("flag", false);// 流程控制标志位 boolean
			examStr = "【不同意】";
			// 发送通知
			oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaEmployeeFormal/form?id=" + oaOvertime.getId(),
					"您提交的员工转正申请流程【" + DateUtils.formatDate(oaOvertime.getCreateDate()) + "】已被【"
							+ UserUtils.getUser().getName() + "】退回",
					oaOvertime.getCreateBy().getId());
		}
		switch (sign) {
		case 1:
			oaOvertime.setExamname(UserUtils.getUser().getName());
			examStr += oaOvertime.getExamtext();
			oaOvertime.setExamtext(examStr);
			break;
		case 2:
			oaOvertime.setExamname2(UserUtils.getUser().getName());
			examStr += oaOvertime.getExamtext2();
			oaOvertime.setExamtext2(examStr);
			break;
		case 3:
			oaOvertime.setExamname3(UserUtils.getUser().getName());
			examStr += oaOvertime.getExamtext3();
			oaOvertime.setExamtext3(examStr);
			break;
		case 4:
			oaOvertime.setExamname4(UserUtils.getUser().getName());
			examStr += oaOvertime.getExamtext4();
			oaOvertime.setExamtext4(examStr);
			break;
		}
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaOvertime.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaOvertime.getProcInsId(), examStr, null, vars);
			// 流程撤回操作数据设置
			oaFlowBackService.saveNOW(oaOvertime.getProcInsId(), list.get(0));
		}
		super.save(oaOvertime);// 更新业务表字段
	}

	/**
	 * dealFilling业务逻辑方法
	 * 
	 */
	@Transactional(readOnly = false)
	public void dealFilling(OaEmployeeFormal oaOvertime) {
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaOvertime.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaOvertime.getProcInsId(), "【归档】", null, null);
		}
		User user = UserUtils.getUser();
		user.setState("1");// 转正
		systemService.updateStateById(user);
		// 归档表数据录入
		// 发送通知
		oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaEmployeeFormal/form?flag=view&id=" + oaOvertime.getId(),
				"您提交的员工转正申请流程【" + DateUtils.formatDate(oaOvertime.getCreateDate()) + "】已被【"
						+ UserUtils.getUser().getName() + "】办结",
				oaOvertime.getCreateBy().getId());
		// 流程撤回操作数据设置
		oaFlowBackService.saveNULL(oaOvertime.getProcInsId());
	}

	/**
	 * 判断当前用户是否需要去form页面创建，审批，修改这个流程
	 */
	public boolean isDeal(OaEmployeeFormal oaOvertime) {
		if (StringUtils.isBlank(oaOvertime.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaOvertime.getProcInsId())
					.list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}
}