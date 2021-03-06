/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web.loan;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.loan.OaLoanDailyApproval;
import com.thinkgem.jeesite.modules.oa.service.loan.OaLoanDailyApprovalService;
import com.thinkgem.jeesite.modules.oa.service.loan.OaLoanMainService;
import com.thinkgem.jeesite.modules.oa.service.loan.OaLoanRepaymentService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 日常借支审批管理Controller
 * @author 李廷龙
 * @version 2017-01-13
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/loan/oaLoanDailyApproval")
public class OaLoanDailyApprovalMController extends BaseController {

	@Autowired
	private OaLoanDailyApprovalService oaLoanDailyApprovalService;
	
	@Autowired
	private OaLoanRepaymentService oaLoanRepaymentService;
	
	@Autowired
	private OaLoanMainService oaLoanMainService;
	
	@ModelAttribute
	public OaLoanDailyApproval get(@RequestParam(required=false) String id) {
		OaLoanDailyApproval entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaLoanDailyApprovalService.get(id);
		}
		if (entity == null){
			entity = new OaLoanDailyApproval();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:loan:oaLoanDailyApproval:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaLoanDailyApproval oaLoanDailyApproval, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaLoanDailyApproval.setCurrentUserId(UserUtils.getUser().getId());
		Page<OaLoanDailyApproval> page = oaLoanDailyApprovalService.findPage(new Page<OaLoanDailyApproval>(request, response), oaLoanDailyApproval); 
		model.addAttribute("page", page);
		return "modules/oa/loan/oaLoanDailyApprovalList";
	}
	
	@RequiresPermissions("oa:loan:oaLoanDailyApproval:view")
	@RequestMapping(value = {"conditionList"})
	public String conditionList(OaLoanDailyApproval oaLoanDailyApproval, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaLoanDailyApproval> page = oaLoanDailyApprovalService.findPage(new Page<OaLoanDailyApproval>(request, response), oaLoanDailyApproval); 
		model.addAttribute("page", page);
		return "modules/oa/loan/oaLoanDailyApprovalConditionList";
	}

	@RequestMapping(value = "form")
	public String form(OaLoanDailyApproval oaLoanDailyApproval, Model model) {
		
		String url="modules/oa/loan/oaLoanDailyApprovalFormView";
		if ((!StringUtils.equals("1", oaLoanDailyApproval.getIsStart()))) {
			url="modules/oa/loan/oaLoanDailyApprovalForm";
		}
		if (WorkflowUtils.isDeal(oaLoanDailyApproval.getId(), oaLoanDailyApproval.getProcInsId())) {
			url="modules/oa/loan/oaLoanDailyApprovalForm";
		}
		if (StringUtils.equals(oaLoanDailyApproval.getAct().getStatus(), "todo")) {
			url="modules/oa/loan/oaLoanDailyApprovalForm";
		}
		if(StringUtils.equals(oaLoanDailyApproval.getAct().getStatus(), "finish")){
			oaLoanDailyApproval=oaLoanDailyApprovalService.getByProcInsId(oaLoanDailyApproval.getAct().getProcInsId());
		}
		String loanUserId=null;
		if (oaLoanDailyApproval.getLoanUser()==null) {
			loanUserId=UserUtils.getUser().getId();
		}else{
			loanUserId=oaLoanDailyApproval.getLoanUser().getId();
		}
		Double sumLoanMoney=oaLoanMainService.getSumLoanMoney(loanUserId);
		Double sumRepaymentMoney=oaLoanRepaymentService.getSumRepaymentMoney(loanUserId);
		model.addAttribute("arrearsMoney", sumLoanMoney-sumRepaymentMoney);
		model.addAttribute("oaLoanDailyApproval", oaLoanDailyApproval);
		url="mobile/"+url;
		return url;
	}
	
	@RequestMapping(value = "print")
	public String print(OaLoanDailyApproval oaLoanDailyApproval, Model model) {
		String loanUserId=null;
		if (oaLoanDailyApproval.getLoanUser()==null) {
			loanUserId=UserUtils.getUser().getId();
		}else{
			loanUserId=oaLoanDailyApproval.getLoanUser().getId();
		}
		Double sumLoanMoney=oaLoanMainService.getSumLoanMoney(loanUserId);
		Double sumRepaymentMoney=oaLoanRepaymentService.getSumRepaymentMoney(loanUserId);
		model.addAttribute("arrearsMoney", sumLoanMoney-sumRepaymentMoney);
		model.addAttribute("oaLoanDailyApproval", oaLoanDailyApproval);
		return "modules/oa/loan/oaLoanDailyApprovalFormPrint";
	}

	@RequestMapping(value = "save")
	public String save(OaLoanDailyApproval oaLoanDailyApproval, Model model, RedirectAttributes redirectAttributes) {
		
		if (StringUtils.isBlank(oaLoanDailyApproval.getLoanReason())){
			addMessage(model, "借支原因不能为空");
			return form(oaLoanDailyApproval, model);
		}
		String message="default";
		message=oaLoanDailyApprovalService.saveApproval(oaLoanDailyApproval);
		addMessage(redirectAttributes, message);
		
        return form(get(oaLoanDailyApproval.getId()),model);
		//return "redirect:"+Global.getAdminPath()+Global.getMobilePath()+"/oa/loan/oaLoanDailyApproval/form?id="+oaLoanDailyApproval.getId();
	/*	if (StringUtils.equals("save", oaLoanDailyApproval.getAct().getFlag())) {
			model.addAttribute("oaLoanDailyApproval", oaLoanDailyApproval);
			return "redirect:"+Global.getAdminPath()+Global.getMobilePath()+"/act/task/todo/";
		}else{
			if (StringUtils.isBlank(oaLoanDailyApproval.getId())||!StringUtils.equals("1", oaLoanDailyApproval.getIsStart())) {
				model.addAttribute("oaLoanDailyApproval", oaLoanDailyApproval);
				return "redirect:"+Global.getAdminPath()+Global.getMobilePath()+"/act/task/todo/";
			}
			return "redirect:"+Global.getAdminPath()+Global.getMobilePath()+"/act/task/todo/";
		}
		*/
	}

	@RequestMapping(value = "delete")
	public String delete(OaLoanDailyApproval oaLoanDailyApproval, RedirectAttributes redirectAttributes) {
		oaLoanDailyApprovalService.delete(oaLoanDailyApproval);
		addMessage(redirectAttributes, "删除日常借支审批信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/loan/oaLoanDailyApproval/?repage";
	}

}