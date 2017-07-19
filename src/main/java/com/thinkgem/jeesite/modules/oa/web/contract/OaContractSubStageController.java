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
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchase;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchaseStage;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractPurchaseService;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractPurchaseStageService;

/**
 * 采购合同阶段信息管理Controller
 * @author 李廷龙
 * @version 2016-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/contract/oaContractSubStage")
public class OaContractSubStageController extends BaseController {

	@Autowired
	private OaContractPurchaseStageService oaContractPurchaseStageService;
	
	@Autowired
	private OaContractPurchaseService oaContractPurchaseService;
	
	@ModelAttribute
	public OaContractPurchaseStage get(@RequestParam(required=false) String id) {
		OaContractPurchaseStage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaContractPurchaseStageService.get(id);
		}
		if (entity == null){
			entity = new OaContractPurchaseStage();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:contract:oaContractSubStage:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaContractPurchaseStage oaContractPurchaseStage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaContractPurchaseStage> page = oaContractPurchaseStageService.findPage(new Page<OaContractPurchaseStage>(request, response), oaContractPurchaseStage); 
		model.addAttribute("page", page);
		return "modules/oa/contract/oaContractSubStageList";
	}

	@RequiresPermissions("oa:contract:oaContractSubStage:view")
	@RequestMapping(value = "form")
	public String form(OaContractPurchaseStage oaContractPurchaseStage, Model model) {
		model.addAttribute("oaContractPurchaseStage", oaContractPurchaseStage);
		return "modules/oa/contract/oaContractSubStageForm";
	}
	
	@RequiresPermissions("oa:contract:oaContractSubStage:view")
	@RequestMapping(value = "formAdd")
	public String formAdd(OaContractPurchaseStage oaContractPurchaseStage, Model model) {
		model.addAttribute("oaContractPurchaseStage", oaContractPurchaseStage);
		return "modules/oa/contract/oaContractSubStageFormAdd";
	}

	@RequiresPermissions("oa:contract:oaContractSubStage:edit")
	@RequestMapping(value = "save")
	public String save(OaContractPurchaseStage oaContractPurchaseStage, Model model, RedirectAttributes redirectAttributes) {
		if (StringUtils.isBlank(oaContractPurchaseStage.getPayStage())){
			addMessage(model, "阶段类别不能为空");
			return form(oaContractPurchaseStage, model);
		}
		oaContractPurchaseStage.setPayStageStatus("0");
		oaContractPurchaseStageService.save(oaContractPurchaseStage);
		OaContractPurchase oaContractPurchase=oaContractPurchaseService.get(oaContractPurchaseStage.getContractPurchase().getId());
		oaContractPurchase.setIsAddStageAbled("0");
		oaContractPurchaseService.save(oaContractPurchase);
		addMessage(redirectAttributes, "保存采购合同阶段信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractSub/?repage";
	}
	
	@RequiresPermissions("oa:contract:oaContractSubStage:saveAdd")
	@RequestMapping(value = "saveAdd")
	public String saveAdd(OaContractPurchaseStage oaContractPurchaseStage, Model model, RedirectAttributes redirectAttributes) {
		if (oaContractPurchaseStage.getBillingMoney()==null||oaContractPurchaseStage.getBillingMoney()<0){
			addMessage(model, "发票金额不能为空");
			return form(oaContractPurchaseStage, model);
		}
		oaContractPurchaseStage.setPayStageStatus("3");
		oaContractPurchaseStageService.saveAdd(oaContractPurchaseStage);
		OaContractPurchase oaContractPurchase=oaContractPurchaseService.get(oaContractPurchaseStage.getContractPurchase().getId());
		oaContractPurchase.setIsAddStageAbled("1");
		oaContractPurchaseService.save(oaContractPurchase);
		addMessage(redirectAttributes, "采购合同阶段信息补填完成");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractSub/form?id="+oaContractPurchaseStage.getContractPurchase().getId()+"&tabIndex=1";
	}
	
	@RequiresPermissions("oa:contract:oaContractSubStage:edit")
	@RequestMapping(value = "delete")
	public String delete(OaContractPurchaseStage oaContractPurchaseStage, RedirectAttributes redirectAttributes) {
		oaContractPurchaseStageService.delete(oaContractPurchaseStage);
		addMessage(redirectAttributes, "删除采购合同阶段信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractSubStage/?repage";
	}
	

}