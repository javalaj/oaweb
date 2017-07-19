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
import com.thinkgem.jeesite.modules.oa.entity.OaLoan;
import com.thinkgem.jeesite.modules.oa.service.OaLoanService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 借支Controller
 * @author liaijun
 * @version 2016-11-21
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaLoan")
public class OaLoanController extends BaseController {

	@Autowired
	private OaLoanService oaLoanService;
	
	@ModelAttribute
	public OaLoan get(@RequestParam(required=false) String id) {
		OaLoan entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaLoanService.get(id);
		}
		if (entity == null){
			entity = new OaLoan();
		}
		return entity;
	}
/**
 * 借支 列表
 * @param oaLoan
 * @param request
 * @param response
 * @param model
 * @return
 */
	@RequiresPermissions("oa:oaLoan:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaLoan oaLoan, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaLoan> page = oaLoanService.findPage(new Page<OaLoan>(request, response), oaLoan); 
		model.addAttribute("page", page);
		return "modules/oa/oaLoanList";
	}
/**
 * 借支流程审核
 * @param oaLoan
 * @param model
 * @return
 */
	@RequiresPermissions("oa:oaLoan:view")
	@RequestMapping(value = "form")
	public String form(OaLoan oaLoan, Model model) {
		String view = "oaLoanForm";
		// 查看审批申请单
		if (StringUtils.isNotBlank(oaLoan.getId())) {
			// 环节编号
			String taskDefKey = oaLoan.getAct().getTaskDefKey();

			// 查看工单
			if (oaLoan.getAct().isFinishTask()) {

				view = "oaLoanView";
			}
			// 修改环节
			else if ("start".equals(taskDefKey)) {
				view = "oaLoanForm";
			}
			// 审核环节
			else if ("exam1".equals(taskDefKey)) {

				view = "oaLoanAudit";
			}
			// 审核环节2
			else if ("exam2".equals(taskDefKey)) {
				view = "oaLoanAudit";

			}
			// 审核环节3
			else if ("exam3".equals(taskDefKey)) {
				view = "oaLoanAudit";
			}
			// 审核环节4
			else if ("exam4".equals(taskDefKey)) {
				view = "oaLoanAudit";
			}// 审核环节5
			else if ("exam5".equals(taskDefKey)) {
				view = "oaLoanAudit";
			}// 审核环节6
			else if ("exam6".equals(taskDefKey)) {
				view = "oaLoanAudit";
			}
		}
		if (oaLoan.getCreateBy() != null) {// 获取发文人姓名和部门
			User createBy = UserUtils.get(oaLoan.getCreateBy().getId());
			oaLoan.setCreateBy(createBy);
		}

		model.addAttribute("oaLoan", oaLoan);
		return "modules/oa/" + view;
	}

	@RequiresPermissions("oa:oaLoan:edit")
	@RequestMapping(value = "save")
	public String save(OaLoan oaLoan, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaLoan)){
			return form(oaLoan, model);
		}
		oaLoanService.save(oaLoan);
		addMessage(redirectAttributes, "保存借支成功");
		return "redirect:"+Global.getAdminPath()+"/act/task/todo/";
	}
	
	@RequiresPermissions("oa:oaLoan:edit")
	@RequestMapping(value = "delete")
	public String delete(OaLoan oaLoan, RedirectAttributes redirectAttributes) {
		oaLoanService.delete(oaLoan);
		addMessage(redirectAttributes, "删除借支成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaLoan/?repage";
	}

}