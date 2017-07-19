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
import com.thinkgem.jeesite.modules.oa.entity.loan.OaLoanMain;
import com.thinkgem.jeesite.modules.oa.service.loan.OaLoanMainService;

/**
 * 借支单管理Controller
 * @author 李廷龙
 * @version 2017-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/loan/oaLoanMain")
public class OaLoanMainMController extends BaseController {

	@Autowired
	private OaLoanMainService oaLoanMainService;
	
	@ModelAttribute
	public OaLoanMain get(@RequestParam(required=false) String id) {
		OaLoanMain entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaLoanMainService.get(id);
		}
		if (entity == null){
			entity = new OaLoanMain();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:loan:oaLoanMain:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaLoanMain oaLoanMain, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaLoanMain> page = oaLoanMainService.findPage(new Page<OaLoanMain>(request, response), oaLoanMain); 
		model.addAttribute("page", page);
		return "modules/oa/loan/oaLoanMainList";
	}

	@RequiresPermissions("oa:loan:oaLoanMain:view")
	@RequestMapping(value = "form")
	public String form(OaLoanMain oaLoanMain, Model model) {
		model.addAttribute("oaLoanMain", oaLoanMain);
		return "mobile/modules/oa/loan/oaLoanMainForm";
	}

	@RequiresPermissions("oa:loan:oaLoanMain:edit")
	@RequestMapping(value = "save")
	public String save(OaLoanMain oaLoanMain, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaLoanMain)){
			return form(oaLoanMain, model);
		}
		oaLoanMainService.save(oaLoanMain);
		addMessage(redirectAttributes, "保存借支单信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/loan/oaLoanMain/?repage";
	}
	
	@RequiresPermissions("oa:loan:oaLoanMain:edit")
	@RequestMapping(value = "delete")
	public String delete(OaLoanMain oaLoanMain, RedirectAttributes redirectAttributes) {
		oaLoanMainService.delete(oaLoanMain);
		addMessage(redirectAttributes, "删除借支单信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/loan/oaLoanMain/?repage";
	}

}