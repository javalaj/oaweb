/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.computerpurchase;

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
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.computerpurchase.ComputerPurchase;
import com.thinkgem.jeesite.modules.oa.service.computerpurchase.ComputerPurchaseService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 电脑采购Controller
 * @author zf
 * @version 2016-12-01
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/computerpurchase/computerPurchase")
public class ComputerPurchaseController extends BaseController {

	@Autowired
	private ComputerPurchaseService computerPurchaseService;
	
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回交接操作service
	
	@ModelAttribute
	public ComputerPurchase get(@RequestParam(required=false) String id) {
		ComputerPurchase entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = computerPurchaseService.get(id);
		}
		if (entity == null){
			entity = new ComputerPurchase();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:computerpurchase:computerPurchase:view")
	@RequestMapping(value = {"list", ""})
	public String list(ComputerPurchase computerPurchase, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ComputerPurchase> page = computerPurchaseService.findPage(new Page<ComputerPurchase>(request, response), computerPurchase); 
		model.addAttribute("page", page);
		return "modules/oa/computerpurchase/computerPurchaseList";
	}

	@RequiresPermissions("oa:computerpurchase:computerPurchase:view")
	@RequestMapping(value = "form")
	public String form(ComputerPurchase computerPurchase, Model model, String returnFlag) {
		model.addAttribute("computerPurchase", computerPurchase);
		
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(computerPurchase.getProcInsId()));
		//测回状态处理
		if (StringUtils.equals(returnFlag, ComputerPurchase.RETURNFLAG))
		{
			if (StringUtils.equals(computerPurchase.getStatus(), ComputerPurchase.DEPTDIRECTOR_EXAM))
				computerPurchase.setStatus(ComputerPurchase.MODIFY);
			else if (StringUtils.equals(computerPurchase.getStatus(), ComputerPurchase.DEPUTYMANAGER_EXAM))
						computerPurchase.setStatus(ComputerPurchase.DEPTDIRECTOR_EXAM);
			else if (StringUtils.equals(computerPurchase.getStatus(), ComputerPurchase.ADMINDEPTMANAGER_EXAM))
						computerPurchase.setStatus(ComputerPurchase.DEPUTYMANAGER_EXAM);
			else if (StringUtils.equals(computerPurchase.getStatus(), ComputerPurchase.GENERALMANAGER_EXAM))
						computerPurchase.setStatus(ComputerPurchase.ADMINDEPTMANAGER_EXAM);
			else if (StringUtils.equals(computerPurchase.getStatus(), ComputerPurchase.PURCHASER_EXAM))
						computerPurchase.setStatus(ComputerPurchase.GENERALMANAGER_EXAM);
			else if (StringUtils.equals(computerPurchase.getStatus(), ComputerPurchase.ADMIN_EXAM))
						computerPurchase.setStatus(ComputerPurchase.ADMIN_EXAM);
			else if (StringUtils.equals(computerPurchase.getStatus(), ActEntity.ACT_STATUS_COMPLETDD))
				computerPurchase.setStatus(ComputerPurchase.ADMIN_EXAM);
			
			computerPurchase.preUpdate();
			
			computerPurchaseService.update(computerPurchase);
		}
		
		if (!StringUtils.equals(ActEntity.ACT_IS_START,computerPurchase.getIsStart()))
			return "modules/oa/computerpurchase/computerPurchaseForm";
		
		if (StringUtils.equals(computerPurchase.getAct().getStatus(), "finish"))
		{
			computerPurchase = computerPurchaseService.getByProcInsId(computerPurchase.getAct().getProcInsId());
			
			model.addAttribute("computerPurchase", computerPurchase);
			
			return "modules/oa/computerpurchase/computerPurchaseFormView";
		}
		
		if (StringUtils.equals(ActEntity.ACT_STATUS_NOT_START, computerPurchase.getIsStart()) && 
				!StringUtils.equals(computerPurchase.getUserName().getId(),UserUtils.getUser().getId()))
			return "modules/oa/computerpurchase/computerPurchaseFormView";
		
		
		if (StringUtils.equals(ActEntity.ACT_STATUS_NOT_START, computerPurchase.getIsStart())
				||WorkflowUtils.isDeal(computerPurchase.getId(), computerPurchase.getProcInsId())) 
		{
			model.addAttribute("computerPurchase", computerPurchase);
			
			return "modules/oa/computerpurchase/computerPurchaseForm";
		}
		
		if (StringUtils.equals(computerPurchase.getStatus(), ComputerPurchase.MODIFY) && computerPurchase.getAct().getTaskDefKey() == null
				&& WorkflowUtils.isDeal(computerPurchase.getId(), computerPurchase.getProcInsId()))
		{
			computerPurchase.getAct().setTaskDefKey(ActEntity.FIRST_AUDIT_PHASE);

			return "modules/oa/computerpurchase/computerPurchaseForm";
		}
		return "modules/oa/computerpurchase/computerPurchaseFormView";
	}

	@RequiresPermissions("oa:computerpurchase:computerPurchase:edit")
	@RequestMapping(value = "save")
	public String save(ComputerPurchase computerPurchase, Model model, RedirectAttributes redirectAttributes,String returnFlag) {
		if (!beanValidator(model, computerPurchase)){
			return form(computerPurchase, model, returnFlag);
		}
		String message="default";
		
		message = computerPurchaseService.savePurchase(computerPurchase);
		
		addMessage(redirectAttributes, message);
		
		if (StringUtils.equals("save", computerPurchase.getAct().getFlag())) 
		{
			model.addAttribute("computerPurchase", computerPurchase);
			
			return "redirect:"+Global.getAdminPath()+"/oa/computerpurchase/computerPurchase/?repage";
		}
		else
		{
//			return "redirect:" + adminPath + "/act/task/todo/";
			return "redirect:"+Global.getAdminPath()+"/oa/computerpurchase/computerPurchase/?repage";
		}
	}
	
	@RequiresPermissions("oa:computerpurchase:computerPurchase:view")
	@RequestMapping(value = "print")
	public String print(ComputerPurchase computerPurchase, Model model) {
		model.addAttribute("computerPurchase", computerPurchase);
		return "modules/oa/computerpurchase/computerPurchaseFormPrint";
	}
	
	@RequiresPermissions("oa:computerpurchase:computerPurchase:edit")
	@RequestMapping(value = "delete")
	public String delete(ComputerPurchase computerPurchase, RedirectAttributes redirectAttributes) {
		computerPurchaseService.delete(computerPurchase);
		addMessage(redirectAttributes, "删除电脑采购成功");
		return "redirect:"+Global.getAdminPath()+"/oa/computerpurchase/computerPurchase/?repage";
	}

}