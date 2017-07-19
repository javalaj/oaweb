/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.plan.web;

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
import com.thinkgem.jeesite.modules.plan.entity.SysPlan;
import com.thinkgem.jeesite.modules.plan.service.SysPlanService;

/**
 * 日程 管理Controller
 * @author liaijun
 * @version 2016-10-19
 */
@Controller
@RequestMapping(value = "${adminPath}/plan/sysPlan")
public class SysPlanController extends BaseController {

	@Autowired
	private SysPlanService sysPlanService;
	
	@ModelAttribute
	public SysPlan get(@RequestParam(required=false) String id) {
		SysPlan entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysPlanService.get(id);
		}
		if (entity == null){
			entity = new SysPlan();
		}
		return entity;
	}
	
	@RequiresPermissions("plan:sysPlan:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysPlan sysPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysPlan> page = sysPlanService.findPage(new Page<SysPlan>(request, response), sysPlan); 
		model.addAttribute("page", page);
		return "modules/plan/sysPlanList";
	}

	@RequiresPermissions("plan:sysPlan:view")
	@RequestMapping(value = "form")
	public String form(SysPlan sysPlan, Model model) {
		model.addAttribute("sysPlan", sysPlan);
		return "modules/plan/sysPlanForm";
	}

	@RequiresPermissions("plan:sysPlan:edit")
	@RequestMapping(value = "save")
	public String save(SysPlan sysPlan, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysPlan)){
			return form(sysPlan, model);
		}
		sysPlanService.save(sysPlan);
		addMessage(redirectAttributes, "保存日程成功");
		return "redirect:"+Global.getAdminPath()+"/plan/sysPlan/?repage";
	}
	
	@RequiresPermissions("plan:sysPlan:edit")
	@RequestMapping(value = "delete")
	public String delete(SysPlan sysPlan, RedirectAttributes redirectAttributes) {
		sysPlanService.delete(sysPlan);
		addMessage(redirectAttributes, "删除日程成功");
		return "redirect:"+Global.getAdminPath()+"/plan/sysPlan/?repage";
	}

}