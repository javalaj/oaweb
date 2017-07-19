/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web.emp;

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
import com.thinkgem.jeesite.modules.oa.entity.emp.OaEmpJoinApproval;
import com.thinkgem.jeesite.modules.oa.service.emp.OaEmpJoinApprovalService;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 人员入职审批Controller
 * @author 李廷龙
 * @version 2016-11-28
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/emp/oaEmpJoinApproval")
public class OaEmpJoinApprovalMController extends BaseController {

	@Autowired
	private OaEmpJoinApprovalService oaEmpJoinApprovalService;
	
	@ModelAttribute
	public OaEmpJoinApproval get(@RequestParam(required=false) String id) {
		OaEmpJoinApproval entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaEmpJoinApprovalService.get(id);
		}
		if (entity == null){
			entity = new OaEmpJoinApproval();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:emp:oaEmpJoinApproval:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaEmpJoinApproval oaEmpJoinApproval, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaEmpJoinApproval> page = oaEmpJoinApprovalService.findPage(new Page<OaEmpJoinApproval>(request, response), oaEmpJoinApproval); 
		model.addAttribute("page", page);
		return "modules/oa/emp/oaEmpJoinApprovalList";
	}

	@RequiresPermissions("oa:emp:oaEmpJoinApproval:view")
	@RequestMapping(value = "form")
	public String form(OaEmpJoinApproval oaEmpJoinApproval, Model model) {
		String url="modules/oa/emp/oaEmpJoinApprovalFormView";
		if ((!StringUtils.equals("1", oaEmpJoinApproval.getIsStart()))) {
			url="modules/oa/emp/oaEmpJoinApprovalForm";
		}
		if (WorkflowUtils.isDeal(oaEmpJoinApproval.getId(), oaEmpJoinApproval.getProcInsId())) {
			url="modules/oa/emp/oaEmpJoinApprovalForm";
		}
		if (StringUtils.equals(oaEmpJoinApproval.getAct().getStatus(), "todo")) {
			url="modules/oa/emp/oaEmpJoinApprovalForm";
		}
		if(StringUtils.equals(oaEmpJoinApproval.getAct().getStatus(), "finish")){
			oaEmpJoinApproval=oaEmpJoinApprovalService.getByProcInsId(oaEmpJoinApproval.getAct().getProcInsId());
		}
		model.addAttribute("oaEmpJoinApproval", oaEmpJoinApproval);
		url="mobile/"+url;
		return url;
	}
	@RequiresPermissions("oa:emp:oaEmpJoinApproval:view")
	@RequestMapping(value = "print")
	public String print(OaEmpJoinApproval oaEmpJoinApproval, Model model) {
		model.addAttribute("oaEmpJoinApproval", oaEmpJoinApproval);
		return "modules/oa/emp/oaEmpJoinApprovalFormPrint";
	}

	@RequiresPermissions("oa:emp:oaEmpJoinApproval:edit")
	@RequestMapping(value = "save",produces = "text/html; charset=UTF-8")
	public String save(OaEmpJoinApproval oaEmpJoinApproval, Model model, RedirectAttributes redirectAttributes) {
		if (StringUtils.isBlank(oaEmpJoinApproval.getEmpName())){
			addMessage(model, "姓名不能为空");
			return form(oaEmpJoinApproval, model);
		}
		String message="default";
		try {
			message=oaEmpJoinApprovalService.saveApproval(oaEmpJoinApproval);
		} catch (Exception e) {
			e.printStackTrace();
			message=e.getMessage();
			addMessage(redirectAttributes, message);
			return "redirect:"+adminPath+"/oa/emp/oaEmpJoinApproval/?repage";
		}
		addMessage(redirectAttributes, message);
		if (StringUtils.equals("save", oaEmpJoinApproval.getAct().getFlag())) {
			model.addAttribute("oaEmpJoinApproval", oaEmpJoinApproval);
			return "redirect:"+adminPath+"/oa/emp/oaEmpJoinApproval/?repage";
		}else{
			String taskDefKey = oaEmpJoinApproval.getAct().getTaskDefKey();
			if ("exam4".equals(taskDefKey)) {
				if (StringUtils.equals(oaEmpJoinApproval.getAct().getFlag(), "true")) {
					return "redirect:" + Global.getAdminPath()+Global.getMobilePath() + "/act/task/historic/";
				}
			}
			return "redirect:"+Global.getAdminPath()+Global.getMobilePath()+"/act/task/todo/";
		}
	}
	
	@RequiresPermissions("oa:emp:oaEmpJoinApproval:edit")
	@RequestMapping(value = "delete")
	public String delete(OaEmpJoinApproval oaEmpJoinApproval, RedirectAttributes redirectAttributes) {
		oaEmpJoinApprovalService.delete(oaEmpJoinApproval);
		addMessage(redirectAttributes, "删除人员入职信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/emp/oaEmpJoinApproval/?repage";
	}

}