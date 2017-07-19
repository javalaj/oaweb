/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.computersubsidy;

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
import com.thinkgem.jeesite.modules.oa.entity.computersubsidy.ComputerSubsidy;
import com.thinkgem.jeesite.modules.oa.service.computersubsidy.ComputerSubsidyService;

/**
 * 电脑补贴申请Controller
 * @author zf
 * @version 2016-12-01
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/computersubsidy/computerSubsidy")
public class ComputerSubsidyController extends BaseController {

	@Autowired
	private ComputerSubsidyService computerSubsidyService;
	
	@ModelAttribute
	public ComputerSubsidy get(@RequestParam(required=false) String id) {
		ComputerSubsidy entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = computerSubsidyService.get(id);
		}
		if (entity == null){
			entity = new ComputerSubsidy();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:computersubsidy:computerSubsidy:view")
	@RequestMapping(value = {"list", ""})
	public String list(ComputerSubsidy computerSubsidy, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ComputerSubsidy> page = computerSubsidyService.findPage(new Page<ComputerSubsidy>(request, response), computerSubsidy); 
		model.addAttribute("page", page);
		return "modules/oa/computersubsidy/computerSubsidyList";
	}

	@RequiresPermissions("oa:computersubsidy:computerSubsidy:view")
	@RequestMapping(value = "form")
	public String form(ComputerSubsidy computerSubsidy, Model model) {
		model.addAttribute("computerSubsidy", computerSubsidy);
		return "modules/oa/computersubsidy/computerSubsidyForm";
	}

	@RequiresPermissions("oa:computersubsidy:computerSubsidy:edit")
	@RequestMapping(value = "save")
	public String save(ComputerSubsidy computerSubsidy, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, computerSubsidy)){
			return form(computerSubsidy, model);
		}
		computerSubsidyService.save(computerSubsidy);
		addMessage(redirectAttributes, "保存电脑补贴申请成功");
		return "redirect:"+Global.getAdminPath()+"/oa/computersubsidy/computerSubsidy/?repage";
	}
	
	@RequiresPermissions("oa:computersubsidy:computerSubsidy:edit")
	@RequestMapping(value = "delete")
	public String delete(ComputerSubsidy computerSubsidy, RedirectAttributes redirectAttributes) {
		computerSubsidyService.delete(computerSubsidy);
		addMessage(redirectAttributes, "删除电脑补贴申请成功");
		return "redirect:"+Global.getAdminPath()+"/oa/computersubsidy/computerSubsidy/?repage";
	}

}