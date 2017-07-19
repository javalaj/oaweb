/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.emp;

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
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.entity.emp.OaEmpOpinion;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.oa.service.emp.OaEmpOpinionService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 用户意见管理Controller
 * @author 李廷龙
 * @version 2016-12-05
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/emp/oaEmpOpinion")
public class OaEmpOpinionController extends BaseController {

	@Autowired
	private OaEmpOpinionService oaEmpOpinionService;
	@Autowired
	private  OaNotifyService oaNotifyService;
	
	@ModelAttribute
	public OaEmpOpinion get(@RequestParam(required=false) String id) {
		OaEmpOpinion entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaEmpOpinionService.get(id);
		}
		if (entity == null){
			entity = new OaEmpOpinion();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:emp:oaEmpOpinion:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaEmpOpinion oaEmpOpinion, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaEmpOpinion> page = oaEmpOpinionService.findPage(new Page<OaEmpOpinion>(request, response), oaEmpOpinion); 
		model.addAttribute("page", page);
		return "modules/oa/emp/oaEmpOpinionList";
	}

	@RequiresPermissions("oa:emp:oaEmpOpinion:view")
	@RequestMapping(value = "form")
	public String form(OaEmpOpinion oaEmpOpinion, Model model) {
		model.addAttribute("oaEmpOpinion", oaEmpOpinion);
		return "modules/oa/emp/oaEmpOpinionForm";
	}
	
	@RequiresPermissions("oa:emp:oaEmpOpinion:view")
	@RequestMapping(value = "treateForm")
	public String treateForm(OaEmpOpinion oaEmpOpinion, Model model) {
		model.addAttribute("oaEmpOpinion", oaEmpOpinion);
		return "modules/oa/emp/oaEmpOpinionFormTreate";
	}
	
	@RequiresPermissions("oa:emp:oaEmpOpinion:edit")
	@RequestMapping(value = "save")
	public String save(OaEmpOpinion oaEmpOpinion, Model model, RedirectAttributes redirectAttributes) {
		if (StringUtils.isBlank(oaEmpOpinion.getTitle())){
			addMessage(model, "标题不能为空");
			return form(oaEmpOpinion, model);
		}
		oaEmpOpinion.setIstreated("0");
		oaEmpOpinionService.save(oaEmpOpinion);
		addMessage(redirectAttributes, "您的建议已收到，我们会及时回复处理结果，感谢您的关注！");
		return "redirect:"+Global.getAdminPath()+"/oa/emp/oaEmpOpinion/list?repage";
	}
	
	@RequiresPermissions("oa:emp:oaEmpOpinion:edit")
	@RequestMapping(value = "delete")
	public String delete(OaEmpOpinion oaEmpOpinion, RedirectAttributes redirectAttributes) {
		oaEmpOpinionService.delete(oaEmpOpinion);
		addMessage(redirectAttributes, "删除用户意见成功");
		return "redirect:"+Global.getAdminPath()+"/oa/emp/oaEmpOpinion/?repage";
	}
	/**
	 * 批量删除用户意见
	 */
	@RequiresPermissions("oa:emp:oaEmpOpinion:edit")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			OaEmpOpinion oaEmpOpinion= oaEmpOpinionService.get(id);
			if(Global.isDemoMode()){
				addMessage(redirectAttributes, "演示模式，不允许操作！");
				return "redirect:" + adminPath + "/sys/user/list?repage";
			}		
			oaEmpOpinionService.delete(oaEmpOpinion);
				addMessage(redirectAttributes, "删除用户意见成功");			
		}
		return "redirect:"+Global.getAdminPath()+"/oa/emp/oaEmpOpinion/?repage";
	}	
	@RequiresPermissions("oa:emp:oaEmpOpinion:treate")
	@RequestMapping(value = "treate")
	public String treate(OaEmpOpinion oaEmpOpinion, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaEmpOpinion)){
			return form(oaEmpOpinion, model);
		}
		
		oaEmpOpinion.setTreatedUser(UserUtils.getUser());
		oaEmpOpinion.setIstreated("1");
		oaEmpOpinionService.save(oaEmpOpinion);		
		addMessage(redirectAttributes, "处理用户意见成功");
		OaNotify oaNotify = new OaNotify();
		oaNotify.setContent(oaEmpOpinion.getRemarks());//意见反馈
		oaNotify.setType("4");// 协同通知配置为4
		oaNotify.setStatus("1");// 发布状态
		oaNotify.setTitle("您提交的标题为【"+oaEmpOpinion.getTitle()+"】的意见已经被处理");
		oaNotify.setOaNotifyRecordIds(oaEmpOpinion.getCreateBy().getId());
		oaNotifyService.save(oaNotify);
		return "redirect:"+Global.getAdminPath()+"/oa/emp/oaEmpOpinion/?repage";
	}
}