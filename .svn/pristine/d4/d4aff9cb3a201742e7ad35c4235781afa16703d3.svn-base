/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web;

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
import com.thinkgem.jeesite.modules.oa.entity.OaContract;
import com.thinkgem.jeesite.modules.oa.service.OaContractService;

/**
 * 合同Controller
 * @author liaijun
 * @version 2016-11-26
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaContract")
public class OaContractController extends BaseController {

	@Autowired
	private OaContractService oaContractService;
	
	@ModelAttribute
	public OaContract get(@RequestParam(required=false) String id) {
		OaContract entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaContractService.get(id);
		}
		if (entity == null){
			entity = new OaContract();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:oaContract:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaContract oaContract, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaContract> page = oaContractService.findPage(new Page<OaContract>(request, response), oaContract); 
		model.addAttribute("page", page);
		return "modules/oa/oaContractList";
	}
	@RequiresPermissions("oa:oaContract:view")
	@RequestMapping(value ="write")
	public String write(OaContract oaContract, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		
		return "modules/oa/oaContractSelect";
	}

	@RequiresPermissions("oa:oaContract:view")
	@RequestMapping(value = "form")
	public String form(OaContract oaContract, Model model) {
		model.addAttribute("oaContract", oaContract);
		return "modules/oa/oaContractForm";
	}

	@RequiresPermissions("oa:oaContract:edit")
	@RequestMapping(value = "save")
	public String save(OaContract oaContract, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaContract)){
			return form(oaContract, model);
		}
		oaContractService.save(oaContract);
		addMessage(redirectAttributes, "保存合同成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaContract/?repage";
	}
	
	@RequiresPermissions("oa:oaContract:edit")
	@RequestMapping(value = "delete")
	public String delete(OaContract oaContract, RedirectAttributes redirectAttributes) {
		oaContractService.delete(oaContract);
		addMessage(redirectAttributes, "删除合同成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaContract/?repage";
	}

}