/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.contract;

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
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSalesStage;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractSalesStageService;

/**
 * 销售合同阶段信息管理Controller
 * @author 李廷龙
 * @version 2016-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/contract/oaContractSalesStage")
public class OaContractSalesStageController extends BaseController {

	@Autowired
	private OaContractSalesStageService oaContractSalesStageService;
	
	@ModelAttribute
	public OaContractSalesStage get(@RequestParam(required=false) String id) {
		OaContractSalesStage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaContractSalesStageService.get(id);
		}
		if (entity == null){
			entity = new OaContractSalesStage();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:contract:oaContractSalesStage:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaContractSalesStage oaContractSalesStage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaContractSalesStage> page = oaContractSalesStageService.findPage(new Page<OaContractSalesStage>(request, response), oaContractSalesStage); 
		model.addAttribute("page", page);
		return "modules/oa/contract/oaContractSalesStageList";
	}

	@RequiresPermissions("oa:contract:oaContractSalesStage:view")
	@RequestMapping(value = "form")
	public String form(OaContractSalesStage oaContractSalesStage, Model model) {
		model.addAttribute("oaContractSalesStage", oaContractSalesStage);
		return "modules/oa/contract/oaContractSalesStageForm";
	}

	@RequiresPermissions("oa:contract:oaContractSalesStage:edit")
	@RequestMapping(value = "save")
	public String save(OaContractSalesStage oaContractSalesStage, Model model, RedirectAttributes redirectAttributes) {
		if (StringUtils.isBlank(oaContractSalesStage.getPayStage())){
			addMessage(model, "合同阶段不能为空");
			return form(oaContractSalesStage, model);
		}
		oaContractSalesStageService.save(oaContractSalesStage);
		addMessage(redirectAttributes, "保存销售合同阶段信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractSales/?repage";
	}
	
	@RequiresPermissions("oa:contract:oaContractSalesStage:edit")
	@RequestMapping(value = "delete")
	public String delete(OaContractSalesStage oaContractSalesStage, RedirectAttributes redirectAttributes) {
		oaContractSalesStageService.delete(oaContractSalesStage);
		addMessage(redirectAttributes, "删除销售合同阶段信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractSalesStage/?repage";
	}

}