/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.Date;
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
import com.thinkgem.jeesite.modules.oa.dao.OaForgetclockDao;
import com.thinkgem.jeesite.modules.oa.entity.OaForgetclock;
import com.thinkgem.jeesite.modules.oa.entity.filling.OaFilling;
import com.thinkgem.jeesite.modules.oa.service.filling.OaFillingService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 忘记打卡申请流程Service
 * 
 * @author liuxin
 * @version 2016-11-21
 */
@Service
@Transactional(readOnly = true)
public class OaForgetclockService extends CrudService<OaForgetclockDao, OaForgetclock> {
	private static final String PROC_DEF_KEY = "oa_forgetclock";// 流程定义标示
	@Autowired
	private ActTaskService actTaskService;// 工作流业务类
	@Autowired
	private OaFillingService oaFillingService;// 归档表
	@Autowired
	private OaOvertimeService oaOvertimeService;// 抄送通知的service
												// OaOvertimeService
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回业务service

	public OaForgetclock get(String id) {
		return super.get(id);
	}

	public List<OaForgetclock> findList(OaForgetclock oaForgetclock) {
		return super.findList(oaForgetclock);
	}

	public Page<OaForgetclock> findPage(Page<OaForgetclock> page, OaForgetclock oaForgetclock) {
		return super.findPage(page, oaForgetclock);
	}

	@Transactional(readOnly = false)
	public void delete(OaForgetclock oaForgetclock) {
		super.delete(oaForgetclock);
	}

	public OaForgetclock getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}

	/**
	 * save业务逻辑方法
	 */
	@Transactional(readOnly = false)
	public void save(OaForgetclock oaForgetclock, String flag) {
		// 查询文件编号，并设置？？
		//
		if (StringUtils.isBlank(oaForgetclock.getOfficeName())) {
			// 查询出部门名称，并设置
			oaForgetclock.setOfficeName(UserUtils.getUser().getOffice().getName());
		}
		super.save(oaForgetclock);// 该步骤为默认继承步骤，直接保存该记录。
		Map<String, Object> vars = new HashMap<String, Object>();
		// 这里put 流程图上所有的需要值，以便于activiti流插件，的控制
		vars.put("apply", UserUtils.getUser().getLoginName());// 发起人登陆名字
		// vars.put("witness", UserUtils.get(witnessId).getLoginName());//
		// 证明人登陆名字
		vars.put("witness", ActRouting.getUpper(UserUtils.getUser().getId()));// 证明人登陆名字
		vars.put("flag", true);// 流程控制标志位 boolea
		vars.put("filling", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "filling", Global.getDefaultUser()));// 人力资源登陆名字
		if (StringUtils.isBlank(oaForgetclock.getProcInsId())) {
			// 流程关联id为null所以为第一次创建
			oaForgetclock
					.setProcInsId(actTaskService.startProcess("oa_forgetclock", "oa_forgetclock", oaForgetclock.getId(),
							"忘记打卡申请流程【" + UserUtils.getUser().getName() + " " + DateUtils.getDate() + "】", vars));// 关键步骤，获取procInsId，否则推送失败
			// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			// 执行下一步
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaForgetclock.getProcInsId())
					.list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaForgetclock.getProcInsId(), "【提交】", null, vars);
				// 流程撤回操作数据设置
				oaFlowBackService.saveINIT(oaForgetclock.getProcInsId(), list.get(0),
						"/oa/oaForgetclock/form?flag=view&id=" + oaForgetclock.getId());
			}
		} else {
			oaForgetclock.setExamname("");
			oaForgetclock.setExamtext("");
			oaForgetclock.setExamname2("");
			oaForgetclock.setExamtext2("");
			String examtext = "【重新提交】";
			if (flag.equals("1")) {
				vars.put("flag", false);// 流程控制标志位 boolean
				examtext = "【作废】";
			}
			// 打回后，以及第一次流程启动成功后的相同步骤
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaForgetclock.getProcInsId())
					.list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaForgetclock.getProcInsId(), examtext, null, vars);
				if (flag.equals("1")) {
					// 流程撤回操作数据设置
					oaFlowBackService.saveNULL(oaForgetclock.getProcInsId());
				} else {
					// 流程撤回操作数据设置
					oaFlowBackService.saveNOW(oaForgetclock.getProcInsId(), list.get(0));
				}
			}
			super.save(oaForgetclock);
		}

	}

	/**
	 * dealExam业务逻辑方法
	 * 
	 * exam 1不同意 ，0同意
	 */
	@Transactional(readOnly = false)
	public void dealExam(OaForgetclock oaForgetclock, String exam) {
		Map<String, Object> vars = new HashMap<String, Object>();
		String examStr = "";
		if (exam.equals("0")) {// 上级审核同意
			// 定制vars
			vars.put("flag", true);// 流程控制标志位 boolean
			examStr = "【同意】";
			// oaForgetclock.setWitnessName((UserUtils.getUser().getName()));//
			// 证明人名称
			// oaForgetclock.setWitnessOfficeName(UserUtils.getUser().getOffice().getName());//
			// 证明人所在部门名称
		} else {
			// 上级审核不同意
			vars.put("flag", false);// 流程控制标志位 boolean
			examStr = "【不同意】";// 发送通知
			oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaForgetclock/form?id=" + oaForgetclock.getId(),
					"您提交的忘记打卡申请流程【" + DateUtils.formatDate(oaForgetclock.getCreateDate()) + "】已被【"
							+ UserUtils.getUser().getName() + "】退回",
					oaForgetclock.getCreateBy().getId());
		}

		oaForgetclock.setExamname(UserUtils.getUser().getName());
		oaForgetclock.setExamtext(examStr + oaForgetclock.getExamtext());

		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaForgetclock.getProcInsId())
				.list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaForgetclock.getProcInsId(), oaForgetclock.getExamtext(),
					null, vars);
			// 流程撤回操作数据设置
			oaFlowBackService.saveNOW(oaForgetclock.getProcInsId(), list.get(0));
		}
		super.save(oaForgetclock);
	}

	/**
	 * dealFilling业务逻辑方法
	 * 
	 */
	@Transactional(readOnly = false)
	public void dealFilling(OaForgetclock oaForgetclock, String exam) {

		Map<String, Object> vars = new HashMap<String, Object>();
		String examStr = "";
		if (exam.equals("0")) {// 上级审核同意
			// 定制vars
			vars.put("flag", true);// 流程控制标志位 boolean
			examStr = "【同意】【归档】";
			// oaForgetclock.setWitnessName((UserUtils.getUser().getName()));//
			// 证明人名称
			// oaForgetclock.setWitnessOfficeName(UserUtils.getUser().getOffice().getName());//
			// 证明人所在部门名称
		} else {
			// 上级审核不同意
			vars.put("flag", false);// 流程控制标志位 boolean
			examStr = "【不同意】【归档】";// 发送通知
			oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaForgetclock/form?id=" + oaForgetclock.getId(),
					"您提交的忘记打卡申请流程【" + DateUtils.formatDate(oaForgetclock.getCreateDate()) + "】已被【"
							+ UserUtils.getUser().getName() + "】退回",
					oaForgetclock.getCreateBy().getId());
		}

		oaForgetclock.setExamname2(UserUtils.getUser().getName());
		oaForgetclock.setExamtext2(examStr + oaForgetclock.getExamtext2());

		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaForgetclock.getProcInsId())
				.list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaForgetclock.getProcInsId(), oaForgetclock.getExamtext2(),
					null, vars);
			if (exam.equals("0")) {
				// 流程撤回操作数据设置
				oaFlowBackService.saveNULL(oaForgetclock.getProcInsId());
			} else {
				// 流程撤回操作数据设置
				oaFlowBackService.saveNOW(oaForgetclock.getProcInsId(), list.get(0));
			}
		}
		if (exam.equals("0")) {
			super.save(oaForgetclock);
			// 归档表数据录入
			OaFilling oaFilling = new OaFilling();
			oaFilling.setApplyDate(oaForgetclock.getCreateDate());
			// oaFilling.setApplyReason(oaForgetclock.getReason());
			oaFilling.setApplyType("忘记打卡");
			oaFilling.setApplyTypeLit(oaForgetclock.getTimesign());// 打卡时间节点存入
			// "pro_vacate_type", ""));// 通过数据字典去取得然后存中文
			oaFilling.setApplyUser(oaForgetclock.getCreateBy());
			oaFilling.setFillingDate(new Date());
			// oaFilling.setHours(oaForgetclock.getTime());
			oaFilling.setBeginDate(oaForgetclock.getDate());
			oaFilling.setEndDate(oaForgetclock.getDate());
			oaFillingService.save(oaFilling);
			// 发送通知
			oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaForgetclock/form?flag=view&id=" + oaForgetclock.getId(),
					"您提交的忘记打卡申请流程【" + DateUtils.formatDate(oaForgetclock.getCreateDate()) + "】已被【"
							+ UserUtils.getUser().getName() + "】办结",
					oaForgetclock.getCreateBy().getId());
		}
	}

	/**
	 * 判断当前用户是否需要去form页面创建，审批，修改这个流程
	 */
	public boolean isDeal(OaForgetclock oaForgetclock) {
		if (StringUtils.isBlank(oaForgetclock.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaForgetclock.getProcInsId())
					.list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}

}