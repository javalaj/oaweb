/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.project;


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

import com.thinkgem.jeesite.common.annotation.Token;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.loan.OaLoanDailyApproval;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectApproval;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.oa.service.project.OaProjectApprovalService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 售前项目立项审批管理Controller
 * @author 李廷龙
 * @version 2016-11-15
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/project/oaProjectApproval")
public class OaProjectApprovalController extends BaseController {

	@Autowired
	private OaProjectApprovalService oaProjectApprovalService;
	@Autowired
	private OaFlowBackService oaFlowBackService;
	@ModelAttribute
	public OaProjectApproval get(@RequestParam(required=false) String id) {
		OaProjectApproval entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaProjectApprovalService.get(id);
		}
		if (entity == null){
			entity = new OaProjectApproval();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:project:oaProjectApproval:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaProjectApproval oaProjectApproval, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaProjectApproval.setCurrentUserId(UserUtils.getUser().getId());
		Page<OaProjectApproval> page = oaProjectApprovalService.findPage(new Page<OaProjectApproval>(request, response), oaProjectApproval); 
		model.addAttribute("page", page);
		return "modules/oa/project/oaProjectApprovalList";
	}
	
	@RequiresPermissions("oa:project:oaProjectApproval:view")
	@RequestMapping(value = {"conditionList"})
	public String conditionList(OaProjectApproval oaProjectApproval, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaProjectApproval> page = oaProjectApprovalService.findPage(new Page<OaProjectApproval>(request, response), oaProjectApproval); 
		model.addAttribute("page", page);
		return "modules/oa/project/oaProjectApprovalConditionList";
	}

	@RequiresPermissions("oa:project:oaProjectApproval:view")
	@RequestMapping(value = "form")
	public String form(OaProjectApproval oaProjectApproval, Model model) {
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaProjectApproval.getProcInsId()));
//		model.addAttribute("oaProjectApproval", oaProjectApproval);
//		if ((!StringUtils.equals("1", oaProjectApproval.getIsStart()))||WorkflowUtils.isDeal(oaProjectApproval.getId(), oaProjectApproval.getProcInsId())) {
//		//if (((!StringUtils.equals("1", oaProjectApproval.getIsStart()))||WorkflowUtils.isDeal(oaProjectApproval.getId(), oaProjectApproval.getProcInsId()))&&StringUtils.equals(oaProjectApproval.getAct().getStatus(), "todo")) {
//			return "modules/oa/project/oaProjectApprovalForm";
//		}else if(StringUtils.equals(oaProjectApproval.getAct().getStatus(), "finish")){
//			oaProjectApproval=oaProjectApprovalService.getByProcInsId(oaProjectApproval.getAct().getProcInsId());
//			model.addAttribute("oaProjectApproval", oaProjectApproval);
//		}
		String url="modules/oa/project/oaProjectApprovalFormView";
		if ((!StringUtils.equals("1", oaProjectApproval.getIsStart()))) {
			url="modules/oa/project/oaProjectApprovalForm";
		}
		if (WorkflowUtils.isDeal(oaProjectApproval.getId(), oaProjectApproval.getProcInsId())) {
			url="modules/oa/project/oaProjectApprovalForm";
		}
		if (StringUtils.equals(oaProjectApproval.getAct().getStatus(), "todo")) {
			url="modules/oa/project/oaProjectApprovalForm";
		}
		if(StringUtils.equals(oaProjectApproval.getAct().getStatus(), "finish")){
			oaProjectApproval=oaProjectApprovalService.getByProcInsId(oaProjectApproval.getAct().getProcInsId());
		}
		model.addAttribute("oaProjectApproval", oaProjectApproval);
		return url;
	}
	
	@RequiresPermissions("oa:project:oaProjectApproval:view")
	@RequestMapping(value = "print")
	public String print(OaProjectApproval oaProjectApproval, Model model) {
		model.addAttribute("oaProjectApproval", oaProjectApproval);
		return "modules/oa/project/oaProjectApprovalFormPrint";
	}

	@RequiresPermissions("oa:project:oaProjectApproval:edit")
	@RequestMapping(value = "save")
	@Token(save = true)
	public String save(OaProjectApproval oaProjectApproval, Model model, RedirectAttributes redirectAttributes) throws Exception{
		if (StringUtils.isBlank(oaProjectApproval.getProjectName())){
			addMessage(model, "项目名称不能为空");
			return form(oaProjectApproval, model);
		}
		
		String message="default";
		message=oaProjectApprovalService.saveApproval(oaProjectApproval);
		addMessage(redirectAttributes, message);
		if (StringUtils.equals("save", oaProjectApproval.getAct().getFlag())) {
			model.addAttribute("oaProjectApproval", oaProjectApproval);
			return "redirect:"+adminPath+"/oa/project/oaProjectApproval/?repage";
		}else{
			String taskDefKey = oaProjectApproval.getAct().getTaskDefKey();
			if (StringUtils.isBlank(oaProjectApproval.getId())||!StringUtils.equals(ActEntity.ACT_IS_START, oaProjectApproval.getIsStart())||"".equals(taskDefKey)||"exam1".equals(taskDefKey)) {
				model.addAttribute("oaProjectApproval", oaProjectApproval);
				return "redirect:"+Global.getAdminPath()+"/oa/project/oaProjectApproval/?repage";
			}
			return "redirect:" + adminPath + "/act/task/todo/";
		}
	}
	
	@RequiresPermissions("oa:project:oaProjectApproval:edit")
	@RequestMapping(value = "delete")
	public String delete(OaProjectApproval oaProjectApproval, RedirectAttributes redirectAttributes) {
		oaProjectApprovalService.delete(oaProjectApproval);
		addMessage(redirectAttributes, "删除售前项目立项成功");
		return "redirect:"+Global.getAdminPath()+"/oa/project/oaProjectApproval/?repage";
	}

}