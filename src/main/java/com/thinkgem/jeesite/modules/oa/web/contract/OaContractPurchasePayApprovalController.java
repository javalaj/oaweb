/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.contract;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchase;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchasePayApproval;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchaseStage;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSales;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractPurchasePayApprovalService;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractPurchaseService;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractPurchaseStageService;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractSalesService;
import com.thinkgem.jeesite.modules.oa.service.project.OaProjectService;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 采购合同付款申请审批管理Controller
 * @author 李廷龙
 * @version 2016-12-12
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/contract/oaContractPurchasePayApproval")
public class OaContractPurchasePayApprovalController extends BaseController {

	@Autowired
	private OaContractPurchasePayApprovalService oaContractPurchasePayApprovalService;
	
	@Autowired
	private OaContractPurchaseService oaContractPurchaseService;
	
	@Autowired
	private OaContractPurchaseStageService oaContractPurchaseStageService;
	
	@Autowired
	private OaProjectService oaProjectService;
	
	@Autowired
	private OaContractSalesService oaContractSalesService;
	
	@ModelAttribute
	public OaContractPurchasePayApproval get(@RequestParam(required=false) String id,@RequestParam(required=false) String oaContractPurchaseStageId) {
		OaContractPurchasePayApproval entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaContractPurchasePayApprovalService.get(id);
		}
		if (entity == null&&StringUtils.isNotBlank(oaContractPurchaseStageId)){
			entity =oaContractPurchasePayApprovalService.getByOaContractPurchaseStageId(oaContractPurchaseStageId);
		}
		if (entity == null){
			entity = new OaContractPurchasePayApproval();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:contract:oaContractPurchasePayApproval:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaContractPurchasePayApproval oaContractPurchasePayApproval, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaContractPurchasePayApproval> page = oaContractPurchasePayApprovalService.findPage(new Page<OaContractPurchasePayApproval>(request, response), oaContractPurchasePayApproval); 
		model.addAttribute("page", page);
		return "modules/oa/contract/oaContractPurchasePayApprovalList";
	}

	@RequiresPermissions("oa:contract:oaContractPurchasePayApproval:view")
	@RequestMapping(value = "form")
	public String form(OaContractPurchasePayApproval oaContractPurchasePayApproval, Model model) {
		List<OaProject> oaProjectList =oaContractPurchasePayApprovalService.findOaProjectsBeenLinkedToOaContractPurchase(); 
		model.addAttribute("oaProjectList", oaProjectList);
		String url="modules/oa/contract/oaContractPurchasePayApprovalFormView";
		if ((!StringUtils.equals("1", oaContractPurchasePayApproval.getIsStart()))) {
			url="modules/oa/contract/oaContractPurchasePayApprovalForm";
		}
		if (WorkflowUtils.isDeal(oaContractPurchasePayApproval.getId(), oaContractPurchasePayApproval.getProcInsId())) {
			url="modules/oa/contract/oaContractPurchasePayApprovalForm";
		}
		if (StringUtils.equals(oaContractPurchasePayApproval.getAct().getStatus(), "todo")) {
			url="modules/oa/contract/oaContractPurchasePayApprovalForm";
		}
		if(StringUtils.equals(oaContractPurchasePayApproval.getAct().getStatus(), "finish")){
			oaContractPurchasePayApproval=oaContractPurchasePayApprovalService.getByProcInsId(oaContractPurchasePayApproval.getAct().getProcInsId());
		}
		model.addAttribute("oaContractPurchasePayApproval", oaContractPurchasePayApproval);
		return url;
	}
	
	@RequiresPermissions("oa:contract:oaContractPurchasePayApproval:view")
	@RequestMapping(value = "print")
	public String print(OaContractPurchasePayApproval oaContractPurchasePayApproval, Model model) {
		model.addAttribute("oaContractPurchasePayApproval", oaContractPurchasePayApproval);
		return "modules/oa/contract/oaContractPurchasePayApprovalFormPrint";
	}

	@RequiresPermissions("oa:contract:oaContractPurchasePayApproval:edit")
	@RequestMapping(value = "save")
	public String save(OaContractPurchasePayApproval oaContractPurchasePayApproval, Model model, RedirectAttributes redirectAttributes) {
		if (oaContractPurchasePayApproval.getPayMoney()==null||oaContractPurchasePayApproval.getPayMoney()<0){
			addMessage(model, "付款金额不能为空");
			return form(oaContractPurchasePayApproval, model);
		}
		String message="default";
		message=oaContractPurchasePayApprovalService.saveApproval(oaContractPurchasePayApproval);
		addMessage(redirectAttributes, message);
		if (StringUtils.equals("save", oaContractPurchasePayApproval.getAct().getFlag())) {
			model.addAttribute("oaContractPurchasePayApproval", oaContractPurchasePayApproval);
			//return "redirect:"+adminPath+"/oa/contract/oaContractPurchase/?repage";
			return "redirect:" + adminPath + "/act/task/todo/";
		}else{
			return "redirect:" + adminPath + "/act/task/todo/";
		}
	
	}
	
	@RequiresPermissions("oa:contract:oaContractPurchasePayApproval:edit")
	@RequestMapping(value = "delete")
	public String delete(OaContractPurchasePayApproval oaContractPurchasePayApproval, RedirectAttributes redirectAttributes) {
		oaContractPurchasePayApprovalService.delete(oaContractPurchasePayApproval);
		addMessage(redirectAttributes, "删除采购合同付款申请信息成功");
		//return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractPurchase/?repage";
		return "redirect:" + adminPath + "/act/task/todo/";
	}
	
	@RequestMapping(value="loadAddInfoBy")
	public @ResponseBody Map<String,Object> loadAddInfoBy(String oaContractPurchaseStageId){
		//通过阶段id找到到阶段实体
		OaContractPurchaseStage oaContractPurchaseStage=oaContractPurchaseStageService.get(oaContractPurchaseStageId);
		//通过阶段实体中的合同id找到合同实体
		OaContractPurchase oaContractPurchase=oaContractPurchaseService.get(oaContractPurchaseStage.getContractPurchase().getId());
		//通过合同实体中的项目id找到项目
		OaProject oaProject=oaProjectService.get(oaContractPurchase.getProject().getId());
		//通过合同实体中的销售合同id找到销售合同
		OaContractSales oaContractSales=oaContractSalesService.get(oaContractPurchase.getContractSales().getId());
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("oaContractPurchaseStage", oaContractPurchaseStage);
		map.put("oaContractPurchase", oaContractPurchase);
		map.put("oaProject", oaProject);
		map.put("oaContractSales", oaContractSales);
		return map;
	}

}