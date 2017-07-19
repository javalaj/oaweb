/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.fixedassets;

import java.util.List;

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
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsClaim;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.FixedAssets;
import com.thinkgem.jeesite.modules.oa.service.SupmanagementService;
import com.thinkgem.jeesite.modules.oa.service.fixedassets.AssetsClaimService;

/**
 * 资产认领Controller
 * @author zf
 * @version 2016-11-26
 */
@Controller
@RequestMapping(value = "${adminPath}/fixedassets/assetsClaim")
public class AssetsClaimController extends BaseController {

	@Autowired
	private AssetsClaimService assetsClaimService;
	
	@Autowired
	private SupmanagementService supmanagementService;
	
	@ModelAttribute
	public AssetsClaim get(@RequestParam(required=false) String id) {
		AssetsClaim entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = assetsClaimService.get(id);
		}
		if (entity == null){
			entity = new AssetsClaim();
		}
		return entity;
	}
	
	@RequiresPermissions("fixedassetsclaim:assetsClaim:view")
	@RequestMapping(value = {"list", ""})
	public String list(AssetsClaim assetsClaim, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AssetsClaim> page = assetsClaimService.findPage(new Page<AssetsClaim>(request, response), assetsClaim); 
		model.addAttribute("page", page);
		return "modules/oa/fixedassetsclaim/assetsClaimList";
	}

	@RequiresPermissions("fixedassets:fixedAssets:edit")
	@RequestMapping(value = "form")
	public String form(AssetsClaim assetsClaim, Model model) 
	{
		FixedAssets fixedAssets = assetsClaim.getFixedAssets();
		
		fixedAssets.setSupplier(supmanagementService.get(fixedAssets.getSupplier()).getSupName());
		
		assetsClaim.setFixedAssets(fixedAssets);
		
		//查询历史记录
		List<AssetsClaim> list = assetsClaimService.findHistoryBydevice(assetsClaim.getClaimNumber());
		
		model.addAttribute("assetsClaim", assetsClaim);
		
		model.addAttribute("list", list);
		
		return "modules/oa/fixedassets/assetsClaimForm";
	}

	@RequiresPermissions("fixedassetsclaim:assetsClaim:edit")
	@RequestMapping(value = "save")
	public String save(AssetsClaim assetsClaim, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, assetsClaim)){
			return form(assetsClaim, model);
		}
		assetsClaimService.save(assetsClaim);
		addMessage(redirectAttributes, "保存资产认领成功");
		return "redirect:"+Global.getAdminPath()+"/fixedassetsclaim/assetsClaim/?repage";
	}
	
	@RequiresPermissions("fixedassetsclaim:assetsClaim:edit")
	@RequestMapping(value = "delete")
	public String delete(AssetsClaim assetsClaim, RedirectAttributes redirectAttributes) {
		assetsClaimService.delete(assetsClaim);
		addMessage(redirectAttributes, "删除资产认领成功");
		return "redirect:"+Global.getAdminPath()+"/fixedassetsclaim/assetsClaim/?repage";
	}

	/**
	 * 归还设备
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("fixedassets:fixedAssets:edit")
	@RequestMapping(value = "returned")
	@ResponseBody
	public String returned(HttpServletRequest request,
			HttpServletResponse response)
	{
		String id = request.getParameter("id");
		
		assetsClaimService.returned(id);
		
		return JsonMapper.getInstance().toJson(true);
	}
	
	/**
	 * 调拨
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("fixedassets:fixedAssets:edit")
	@RequestMapping(value = "allocation")
	@ResponseBody
	public String allocation(HttpServletRequest request,
			HttpServletResponse response)
	{
		String id = request.getParameter("id");
		
		String userId = request.getParameter("userId");
		
		assetsClaimService.allocation(id, userId);
		
		return JsonMapper.getInstance().toJson(true);
	}
}