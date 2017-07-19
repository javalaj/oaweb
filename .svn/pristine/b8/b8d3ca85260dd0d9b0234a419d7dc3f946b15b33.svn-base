/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.flowback;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.entity.OaUsecar;
import com.thinkgem.jeesite.modules.oa.entity.flowback.OaFlowBack;
import com.thinkgem.jeesite.modules.oa.service.OaUsecarService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 流程撤回操作Controller
 * 
 * @author liuxin
 * @version 2017-05-04
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/flowback/oaFlowBack")
public class OaFlowBackController extends BaseController {

	/**
	 * 获取流程撤回操作对象
	 * 
	 * id是procInsId
	 */
	@ModelAttribute
	public OaFlowBack get(@RequestParam(required = false) String id) {
		OaFlowBack entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaFlowBackService.get(id);
		}
		if (entity == null) {
			entity = new OaFlowBack();
		}
		return entity;
	}

	/**
	 * 保存流程撤回操作
	 * 
	 * 流程撤回操作
	 * 
	 */
	@RequestMapping(value = "save")
	public String save(OaFlowBack oaFlowBack, boolean isMobile, Model model, RedirectAttributes redirectAttributes)
			throws Exception {
		/*
		 * if (oaFlowBack != null &&
		 * StringUtils.isBlank(oaFlowBack.getCanBackNode())) { // 无法退回，参数不全
		 * System.err.println(
		 * "class:com.thinkgem.jeesite.modules.oa.web.flowback.OaFlowBackController   line:58   error:无法撤回，参数不全"
		 * ); return "error/500"; }
		 */
		if (UserUtils.getUser().getId().equals(oaFlowBack.getCanBackId())) {
			actTaskService.jumpTask(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode(), null);
			oaFlowBackService.deleteFlowInfo1(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode());// 删除流程流转信息1
			oaFlowBackService.deleteFlowInfo2(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode());// 删除流程流转信息2
			oaFlowBackService.deleteHaveToDo(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode());// 删除已办记录
			oaFlowBackService.saveNULL(oaFlowBack.getProcInsId());
			addMessage(redirectAttributes, "流程撤回成功");
		} else {
			addMessage(redirectAttributes, "您已经失去撤回权");
		}
		if (isMobile) {
			return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + oaFlowBack.getResultURL();

		} else {
			return "redirect:" + Global.getAdminPath() + oaFlowBack.getResultURL();
		}
	}

	@RequestMapping(value = "saveStaff")
	public String saveStaff(OaFlowBack oaFlowBack, boolean isMobile, Model model, RedirectAttributes redirectAttributes)
			throws Exception {
		System.out.println("!!!!!!!!!!!!!!!!!!!!_-------");
		Map<String, Object> map = new HashMap<String, Object>();
		if (UserUtils.getUser().getId().equals(oaFlowBack.getCanBackId())) {
			map.put("applyUserIds", UserUtils.get(oaFlowBack.getCurrentUser().getId()).getLoginName());
			map.put("apply", UserUtils.get(oaFlowBack.getCurrentUser().getId()).getLoginName());
			actTaskService.jumpTask(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode(), map);
			oaFlowBackService.deleteFlowInfo1(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode());// 删除流程流转信息1
			oaFlowBackService.deleteFlowInfo2(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode());// 删除流程流转信息2
			oaFlowBackService.deleteHaveToDo(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode());// 删除已办记录
			oaFlowBackService.saveNULL(oaFlowBack.getProcInsId());
			addMessage(redirectAttributes, "流程撤回成功");
		} else {
			addMessage(redirectAttributes, "您已经失去撤回权");
		}
		if (isMobile) {
			return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + oaFlowBack.getResultURL();

		} else {
			return "redirect:" + Global.getAdminPath() + oaFlowBack.getResultURL();
		}
	}

	/**
	 * 保存流程撤回操作
	 * 
	 * 流程撤回操作
	 * 
	 * 用车申请定制撤回
	 * 
	 */
	@RequestMapping(value = "usecarSave")
	public String usecarSave(OaFlowBack oaFlowBack, boolean isMobile, Model model, RedirectAttributes redirectAttributes,String oaUseCarId,String xinSign)
			throws Exception {
		/*
		 * if (oaFlowBack != null &&
		 * StringUtils.isBlank(oaFlowBack.getCanBackNode())) { // 无法退回，参数不全
		 * System.err.println(
		 * "class:com.thinkgem.jeesite.modules.oa.web.flowback.OaFlowBackController   line:58   error:无法撤回，参数不全"
		 * ); return "error/500"; }
		 */
		if (UserUtils.getUser().getId().equals(oaFlowBack.getCanBackId())) {
			actTaskService.jumpTask(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode(), null);
			oaFlowBackService.deleteFlowInfo1(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode());// 删除流程流转信息1
			oaFlowBackService.deleteFlowInfo2(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode());// 删除流程流转信息2
			oaFlowBackService.deleteHaveToDo(oaFlowBack.getProcInsId(), oaFlowBack.getCanBackNode());// 删除已办记录
			oaFlowBackService.saveNULL(oaFlowBack.getProcInsId());
			addMessage(redirectAttributes, "流程撤回成功");
			
			//特殊业务
			OaUsecar oaUseCar=oaUsecarService.get(oaUseCarId);
			if(StringUtils.isNotBlank(oaUseCar.getExamtext2())){
				oaUseCar.setExamname2("");
				oaUseCar.setExamtext2("");
				oaUsecarService.save(oaUseCar);
			}else{
				oaUseCar.setExamtext("");
				oaUseCar.setExamname("");
				oaUsecarService.save(oaUseCar);
			}	
			
		} else {
			addMessage(redirectAttributes, "您已经失去撤回权");
		}
		if (isMobile) {
			return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + oaFlowBack.getResultURL();

		} else {
			return "redirect:" + Global.getAdminPath() + oaFlowBack.getResultURL();
		}
	}
	/*-------------------------------------参数--------------------------------------------*/

	/** OaFlowBack业务层 */
	@Autowired
	private OaFlowBackService oaFlowBackService;
	@Autowired
	private ActTaskService actTaskService;// 流程service
	@Autowired
	private OaUsecarService oaUsecarService;//用车申请service

}