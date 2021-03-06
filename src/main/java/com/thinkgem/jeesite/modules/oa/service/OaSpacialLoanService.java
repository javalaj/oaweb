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
import com.thinkgem.jeesite.modules.oa.dao.OaSpacialLoanDao;
import com.thinkgem.jeesite.modules.oa.entity.OaSpacialLoan;
import com.thinkgem.jeesite.modules.oa.entity.loan.OaLoanMain;
import com.thinkgem.jeesite.modules.oa.oaUtils.MoneyUtils;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.oa.service.loan.OaLoanMainService;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 专项借支流程业务表Service
 * 
 * @author liuxin
 * @version 2016-12-08
 */
@Service
@Transactional(readOnly = true)
public class OaSpacialLoanService extends CrudService<OaSpacialLoanDao, OaSpacialLoan> {
	private static final String PROC_DEF_KEY = "oa_spacial_loan";// 流程定义标示
	@Autowired
	private ActTaskService actTaskService;// 工作流相关联service
	@Autowired
	private OaLoanMainService oaLoanMainService;// 借支单的归档
	@Autowired
	private OaOvertimeService oaOvertimeService;
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回业务service

	public OaSpacialLoan get(String id) {
		return super.get(id);
	}

	public List<OaSpacialLoan> findList(OaSpacialLoan oaSpacialLoan) {
		return super.findList(oaSpacialLoan);
	}

	public Page<OaSpacialLoan> findPage(Page<OaSpacialLoan> page, OaSpacialLoan oaSpacialLoan) {
		return super.findPage(page, oaSpacialLoan);
	}

	public OaSpacialLoan getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}

	@Transactional(readOnly = false)
	public void delete(OaSpacialLoan oaSpacialLoan) {
		super.delete(oaSpacialLoan);
	}

	/**
	 * save业务逻辑方法
	 */
	@Transactional(readOnly = false)
	public void save(OaSpacialLoan oaOvertime, String flag) {
		// 查询文件编号，并设置？？
		if (StringUtils.isBlank(oaOvertime.getFileId())) {
			oaOvertime.setFileId(OrdersUtils.getGenerateOrderNo8("CY"));
		}
		//
		if (StringUtils.isBlank(oaOvertime.getOfficeName())) {
			// 查询出部门名称，并设置
			oaOvertime.setOfficeName(UserUtils.getUser().getOffice().getName());
		}
		if (StringUtils.isBlank(oaOvertime.getJob())) {
			// 查询出职务，并设置
			oaOvertime.setJob(UserUtils.getUser().getDuty());
		}
		if (StringUtils.isBlank(oaOvertime.getMoneyString())) {
			// 人民币小写转换成大写
			oaOvertime.setMoneyString(MoneyUtils.convertMoney(Double.parseDouble(oaOvertime.getMoneyDouble())));
		}
		super.save(oaOvertime);// 该步骤为默认继承步骤，直接保存该记录。
		Map<String, Object> vars = new HashMap<String, Object>();
		// 这里put 流程图上所有的需要值，以便于activiti流插件，的控制

		vars.put("apply", UserUtils.getUser().getLoginName());// 发起人登陆名字
		vars.put("upper", ActRouting.getUpper(UserUtils.getUser().getId()));// 上级登陆名字
		vars.put("boss", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "boss", Global.getDefaultUser()));// 总经理登陆名字
		vars.put("deputyBoss", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "deputyBoss", Global.getDefaultUser()));// 主管副总登陆名字
		vars.put("accountant", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "accountant", Global.getDefaultUser()));// 会计登陆名字
		vars.put("cashier", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "cashier", Global.getDefaultUser()));// 出纳登陆名字
		vars.put("flag", true);// 流程控制标志位 boolean
		vars.put("next", true);// 流程控制标志位 boolean
		if (StringUtils.isBlank(oaOvertime.getProcInsId())) {
			// 流程关联id为null所以为第一次创建
			oaOvertime
					.setProcInsId(actTaskService.startProcess("oa_spacial_loan", "oa_spacial_loan", oaOvertime.getId(),
							"专项借支申请流程【" + UserUtils.getUser().getName() + " " + DateUtils.getDate() + "】", vars));// 关键步骤，获取procInsId，否则推送失败
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
						"/oa/oaSpacialLoan/form?flag=view&id=" + oaOvertime.getId());
			}
		} else {
			// 打回后，以及第一次流程启动成功后的相同步骤
			oaOvertime.setExamname(null);
			oaOvertime.setExamtext(null);
			oaOvertime.setExamname2(null);
			oaOvertime.setExamtext2(null);
			oaOvertime.setExamname3(null);
			oaOvertime.setExamtext3(null);
			oaOvertime.setExamname4(null);
			oaOvertime.setExamtext4(null);
			oaOvertime.setExamname5(null);
			oaOvertime.setExamtext5(null);
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
	public void dealExam(OaSpacialLoan oaOvertime, String exam, int sign, String next) {
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
			oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaSpacialLoan/form?id=" + oaOvertime.getId(),
					"您提交的专项借支申请流程【" + DateUtils.formatDate(oaOvertime.getCreateDate()) + "】已被【"
							+ UserUtils.getUser().getName() + "】退回",
					oaOvertime.getCreateBy().getId());
		} // 审批人签名??
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
			if (next.equals("0")) {
				vars.put("next", false);
			} else {
				vars.put("next", true);
			}
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
		case 5:
			oaOvertime.setExamname5(UserUtils.getUser().getName());
			examStr += oaOvertime.getExamtext5();
			oaOvertime.setExamtext5(examStr);
			if (exam.equals("0")) {
				// 已完结
				OaLoanMain oaLoanMain = new OaLoanMain();
				oaLoanMain.setApprovalTime(oaOvertime.getCreateDate());
				oaLoanMain.setLoanMoney(Double.parseDouble(oaOvertime.getMoneyDouble()));
				oaLoanMain.setLoanNo(oaOvertime.getFileId());
				oaLoanMain.setLoanStatus(OaLoanMain.loanStatus_0);
				oaLoanMain.setLoanType(OaLoanMain.loanType_1);
				oaLoanMain.setLoanTime(new Date());
				oaLoanMain.setLoanUser(oaOvertime.getCreateBy());
				oaLoanMainService.save(oaLoanMain);
				// 发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaSpacialLoan/form?flag=view&id=" + oaOvertime.getId(),
						"您提交的专项借支申请流程【" + DateUtils.formatDate(oaOvertime.getCreateDate()) + "】已被【"
								+ UserUtils.getUser().getName() + "】办结",
						oaOvertime.getCreateBy().getId());
			}
			break;
		}
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaOvertime.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaOvertime.getProcInsId(), examStr, null, vars);
			if (sign == 5 && exam.equals("0")) {
				// 流程撤回操作数据设置
				oaFlowBackService.saveNULL(oaOvertime.getProcInsId());
			} else {
				// 流程撤回操作数据设置
				oaFlowBackService.saveNOW(oaOvertime.getProcInsId(), list.get(0));
			}
		}
		super.save(oaOvertime);// 更新业务表字段
	}

	/**
	 * 判断当前用户是否需要去form页面创建，审批，修改这个流程
	 */
	public boolean isDeal(OaSpacialLoan oaPcSubsidy) {
		if (StringUtils.isBlank(oaPcSubsidy.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaPcSubsidy.getProcInsId())
					.list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}
}