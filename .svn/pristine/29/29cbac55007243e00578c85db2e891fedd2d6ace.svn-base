/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.ActUtil;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaLoan;
import com.thinkgem.jeesite.modules.oa.actRouting.ActRouting;
import com.thinkgem.jeesite.modules.oa.dao.OaLoanDao;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 借支Service
 * @author liaijun
 * @version 2016-11-21
 */
@Service
@Transactional(readOnly = true)
public class OaLoanService extends CrudService<OaLoanDao, OaLoan> {
	@Autowired
	private ActTaskService actTaskService;
	public OaLoan get(String id) {
		return super.get(id);
	}
	
	public List<OaLoan> findList(OaLoan oaLoan) {
		return super.findList(oaLoan);
	}
	
	public Page<OaLoan> findPage(Page<OaLoan> page, OaLoan oaLoan) {
		return super.findPage(page, oaLoan);
	}
	
	@Transactional(readOnly = false)
	public void save(OaLoan oaLoan) {
		// 申请发起
				if (StringUtils.isBlank( oaLoan.getId())){
					 oaLoan.preInsert();
					dao.insert( oaLoan);
					Map<String, Object> vars = Maps.newHashMap();// 设置任务变量，提交流程任务
					vars.put("apply", UserUtils.getUser().getLoginName());//设置流程发起人
					vars.put("upper", ActRouting.getUpper(UserUtils.getUser().getId()));//获取本部门直属领导	
					vars.put("projectLeader","chendong");//获取项目经理
					vars.put("fincinaleader","cw");//获取出纳
					vars.put("pay","account");//获取会计
					vars.put("Manager",ActUtil.getLeader(ActUtils.PD_DeptId[5]));//获取总经理	
					vars.put("pay","zhaoliu");//获取出纳
					vars.put("pass", "yes".equals(oaLoan.getAct().getFlag())? "1" : "0");//设置网关条件${pass==1}，通过；${pass==0}，不通过
					// 启动流程
					actTaskService.startProcess(ActUtils.PD_OaLoan[0], ActUtils.PD_OaLoan[1],oaLoan.getId(),"员工日常借支流程",vars);
					
				}
				
				// 重新编辑申请		
				else{
					 oaLoan.preUpdate();
					dao.update( oaLoan);

					 oaLoan.getAct().setComment(("yes".equals( oaLoan.getAct().getFlag())?"[重申] ":"[销毁] ")+ oaLoan.getAct().getComment());
					
					// 完成流程任务
					Map<String, Object> vars = Maps.newHashMap();
					vars.put("flag", "yes".equals( oaLoan.getAct().getFlag())? "1" : "0");
					actTaskService.complete( oaLoan.getAct().getTaskId(),  oaLoan.getAct().getProcInsId(),  oaLoan.getAct().getComment(),"员工日常借支流程", vars);
				}
	}
	/**
	 * 审核审批保存
	 * @param testAudit
	 */
	@Transactional(readOnly = false)
	public void auditSave(OaLoan oaLoan) {
		Map<String, Object> vars = Maps.newHashMap();// 设置任务变量，提交流程任务
		vars.put("apply", UserUtils.getUser().getLoginName());//设置流程发起人		
		vars.put("upper", ActRouting.getUpper(UserUtils.getUser().getId()));//获取本部门直属领导
		vars.put("flag", "yes".equals(oaLoan.getAct().getFlag())? "1" : "0");//设置网关条件${pass==1}，通过；${pass==0}，不通过
		// 设置意见
		oaLoan.getAct().setComment(("yes".equals(oaLoan.getAct().getFlag())?"[同意] ":"[驳回] ")+oaLoan.getAct().getComment());
		
		oaLoan.preUpdate();
		
		// 对不同环节的业务逻辑进行操作
		String taskDefKey = oaLoan.getAct().getTaskDefKey();

		// 审核环节
		if ("exam1".equals(taskDefKey)){//上级核准
			oaLoan.setUppertext(oaLoan.getAct().getComment());
			dao.updateUpperText(oaLoan);
		}
		else if ("exam2".equals(taskDefKey)){//项目经理审批
			oaLoan.setProtext(oaLoan.getAct().getComment());
			dao.updateProText(oaLoan);
		}
		else if ("exam3".equals(taskDefKey)){//总经理审核
		oaLoan.setManagertext(oaLoan.getAct().getComment());
			dao.updatemanagertext(oaLoan);
		}
		else if ("exam4".equals(taskDefKey)){//商务部领导会签
			oaLoan.setFincinaltext(oaLoan.getAct().getComment());
			dao.updateFincinalText(oaLoan);
		}
		else if ("exam5".equals(taskDefKey)){//会计审批
			oaLoan.setAccounttext(oaLoan.getAct().getComment());
			dao.updateAccountText(oaLoan);
		}else if ("exam6".equals(taskDefKey)){//出纳审核
			oaLoan.setPaytext(oaLoan.getAct().getComment());
			dao.updatePayText(oaLoan);
		}	
		else{// 未知环节，直接返回
			return;
		}		
		
		actTaskService.complete(oaLoan.getAct().getTaskId(), oaLoan.getAct().getProcInsId(),oaLoan.getAct().getComment(),"员工日常借支流程", vars);
	}
		
	@Transactional(readOnly = false)
	public void delete(OaLoan oaLoan) {
		super.delete(oaLoan);
	}
	
}