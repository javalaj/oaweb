/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.sys.web;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.mobile.modules.oa.web.notify.util.NotifyUtil;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.entity.doc.OaDoc;
import com.thinkgem.jeesite.modules.oa.entity.mytask.OaPlan;
import com.thinkgem.jeesite.modules.oa.service.doc.OaDocService;
import com.thinkgem.jeesite.modules.oa.service.mytask.OaPlanService;
import com.thinkgem.jeesite.modules.oa.service.project.OaProjectService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 首页控制器
 * 
 * @author liuxin
 * @version 2017-1-10
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/mobile/sys/index")
public class IndexControllerMobile extends BaseController {
	@Autowired
	private OaPlanService oaPlanService;
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private OaDocService oaDocService;
	/**
	 * 首页访问
	 */
	@RequiresPermissions("sys:user:userWorklog:view")
	@RequestMapping(value = { "index", "" })
	public String index(Model model,OaPlan oaPlan,Act act) {
		Map<String, String> mapCount = oaPlanService.unfinishedCount(oaPlan.getCurrentUser().getId());
		model.addAttribute("mapCount", mapCount);
		Integer num = NotifyUtil.getMyNotifyNum();
		model.addAttribute("notifyCount", num);
		List<Act> list = actTaskService.todoList(act);
		model.addAttribute("todoCount", list.size());
		OaDoc oaDoc=new OaDoc();
		oaDoc.setIsPublic(OaDoc.DOC_TYPE_PUBLIC);
		oaDoc.setLoanUserId(UserUtils.getUser().getId());
		Integer countPublic=oaDocService.getOaDocListCount(oaDoc);
		model.addAttribute("docCount", countPublic);
		return "mobile/modules/sys/index";
	}
	
}