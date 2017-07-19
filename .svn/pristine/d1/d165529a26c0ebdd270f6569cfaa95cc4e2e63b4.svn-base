/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.staffturnover;

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
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.oa.entity.assetsturnover.AssetsTurnOverMap;
import com.thinkgem.jeesite.modules.oa.entity.staffturnover.StaffTurnover;
import com.thinkgem.jeesite.modules.oa.entity.workturnover.WorkTurnOverMap;
import com.thinkgem.jeesite.modules.oa.service.staffturnover.StaffTurnoverService;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 人员异动Controller
 * @author zf
 * @version 2017-01-12
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/staffturnover/staffTurnover")
public class StaffTurnoverController extends BaseController {

	@Autowired
	private StaffTurnoverService staffTurnoverService;
	
	@ModelAttribute
	public StaffTurnover get(@RequestParam(required=false) String id) {
		StaffTurnover entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = staffTurnoverService.get(id);
		}
		if (entity == null){
			entity = new StaffTurnover();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:staffturnover:staffTurnover:view")
	@RequestMapping(value = {"list", ""})
	public String list(StaffTurnover staffTurnover, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<StaffTurnover> page = staffTurnoverService.findPage(new Page<StaffTurnover>(request, response), staffTurnover); 
		model.addAttribute("page", page);
		return "modules/oa/staffturnover/staffTurnoverList";
	}

	@RequiresPermissions("oa:staffturnover:staffTurnover:view")
	@RequestMapping(value = "form")
	public String form(StaffTurnover staffTurnover, Model model) 
	{
		if (!StringUtils.equals(ActEntity.ACT_IS_START, staffTurnover.getIsStart()))
			return "modules/oa/staffturnover/staffTurnoverForm";
		
		if (WorkflowUtils.isDeal(staffTurnover.getId(), staffTurnover.getProcInsId()))
		{
			Act act = staffTurnover.getAct();
			
			if (StringUtils.isEmpty(act.getTaskDefKey()))
			{
				if (StringUtils.equals(staffTurnover.getStatus(), ActEntity.ACT_STATUS_Edit))
					act.setTaskDefKey("exam1");
				else
					act.setTaskDefKey("exam");
			}
			
			staffTurnover.setAct(act);
			
			return "modules/oa/staffturnover/staffTurnoverForm";
		}
		
		if (StringUtils.equals(staffTurnover.getAct().getStatus(), "todo"))
			return "modules/oa/staffturnover/staffTurnoverForm";
		
		if (StringUtils.equals(staffTurnover.getAct().getStatus(), "finish"))
		{
			staffTurnover = staffTurnoverService.getByProcInsId(staffTurnover.getAct().getProcInsId());
			
			return "modules/oa/staffturnover/staffTurnoverFormView";
		}
		
		if (StringUtils.equals(staffTurnover.getStatus(), ActEntity.ACT_STATUS_COMPLETDD))
		{
			staffTurnover = staffTurnoverService.getByProcInsId(staffTurnover.getAct().getProcInsId());
			
			return "modules/oa/staffturnover/staffTurnoverFormView";
		}
		
		model.addAttribute("staffTurnover", staffTurnover);
		
		return "modules/oa/staffturnover/staffTurnoverFormView";
	}

	@RequiresPermissions("oa:staffturnover:staffTurnover:edit")
	@RequestMapping(value = "save")
	public String save(StaffTurnover staffTurnover,WorkTurnOverMap workTurnOvers,
			AssetsTurnOverMap assetsTurnOvers,Model model, RedirectAttributes redirectAttributes) 
	{
		if (!beanValidator(model, staffTurnover)){
			return form(staffTurnover, model);
		}
		
		String message="default";
		
		message = staffTurnoverService.saveTurnover(staffTurnover, workTurnOvers, assetsTurnOvers);
		
		addMessage(redirectAttributes, message);
		
		if (StringUtils.equals("save", staffTurnover.getAct().getFlag())) 
			model.addAttribute("staffTurnover", staffTurnover);
		
		return "redirect:"+Global.getAdminPath()+"/oa/staffturnover/staffTurnover/?repage";
	}
	
	@RequiresPermissions("oa:staffturnover:staffTurnover:view")
	@RequestMapping(value = "print")
	public String print(StaffTurnover staffTurnover, Model model) {
		model.addAttribute("staffTurnover", staffTurnover);
		return "modules/oa/staffturnover/staffTurnoverFormPrint";
	}
	
	@RequiresPermissions("oa:staffturnover:staffTurnover:edit")
	@RequestMapping(value = "delete")
	public String delete(StaffTurnover staffTurnover, RedirectAttributes redirectAttributes) {
		staffTurnoverService.delete(staffTurnover);
		addMessage(redirectAttributes, "删除人员异动成功");
		return "redirect:"+Global.getAdminPath()+"/oa/staffturnover/staffTurnover/?repage";
	}

}