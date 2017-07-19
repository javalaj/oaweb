/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.OaFileQuery;
import com.thinkgem.jeesite.modules.oa.service.OaFileQueryService;

/**
 * 公文查询Controller
 * 
 * @author liuxin
 * @version 2016-12-21
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaFileQuery")
public class OaFileQueryController extends BaseController {

	@Autowired
	private OaFileQueryService oaFileQueryService;

	/**
	 * 公文查询
	 * 
	 * @param oaArchives
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaFileQuery:view")
	@RequestMapping(value = { "list", "" })
	public String query(OaFileQuery oaFileQuery, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		Page<OaFileQuery> page = oaFileQueryService.findPage(new Page<OaFileQuery>(request, response), oaFileQuery);
		model.addAttribute("page", page);
		//
		model.addAttribute("oaFileQuery", oaFileQuery);
		HashMap<String, String> stateMap = new HashMap<String, String>();
		stateMap.put("", "全部");
		stateMap.put("1", "审核中");
		stateMap.put("2", "已完结");
		model.addAttribute("stateMap", stateMap);
		HashMap<String, String> typeMap = new HashMap<String, String>();
		typeMap.put("", "全部");
		typeMap.put("0", "发文");
		typeMap.put("1", "收文");
		typeMap.put("2", "签报");
		model.addAttribute("typeMap", typeMap);
		return "modules/oa/oaFileQueryList";
	}

}