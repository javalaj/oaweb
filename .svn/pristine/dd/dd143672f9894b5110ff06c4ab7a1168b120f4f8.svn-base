/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.contract;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchaseProduct;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSales;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractPurchaseProductService;
import com.thinkgem.jeesite.modules.oa.service.project.OaProjectService;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 采购合同物品登记信息管理Controller
 * @author 李廷龙
 * @version 2016-12-27
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/contract/oaContractPurchaseProduct")
public class OaContractPurchaseProductController extends BaseController {

	@Autowired
	private OaContractPurchaseProductService oaContractPurchaseProductService;
	
	@ModelAttribute
	public OaContractPurchaseProduct get(@RequestParam(required=false) String id) {
		OaContractPurchaseProduct entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaContractPurchaseProductService.get(id);
		}
		if (entity == null){
			entity = new OaContractPurchaseProduct();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:contract:oaContractPurchaseProduct:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaContractPurchaseProduct oaContractPurchaseProduct, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaContractPurchaseProduct> page = oaContractPurchaseProductService.findPage(new Page<OaContractPurchaseProduct>(request, response), oaContractPurchaseProduct); 
		model.addAttribute("page", page);
		return "modules/oa/contract/oaContractPurchaseProductList";
	}

	@RequiresPermissions("oa:contract:oaContractPurchaseProduct:view")
	@RequestMapping(value = "form")
	public String form(OaContractPurchaseProduct oaContractPurchaseProduct, Model model) {
		model.addAttribute("oaContractPurchaseProduct", oaContractPurchaseProduct);
		return "modules/oa/contract/oaContractPurchaseProductForm";
	}

	@RequiresPermissions("oa:contract:oaContractPurchaseProduct:edit")
	@RequestMapping(value = "save")
	public String save(OaContractPurchaseProduct oaContractPurchaseProduct, Model model, RedirectAttributes redirectAttributes) {
		if (StringUtils.isBlank(oaContractPurchaseProduct.getName())){
			addMessage(model, "物品名称不能为空");
			return form(oaContractPurchaseProduct, model);
		}
		oaContractPurchaseProductService.save(oaContractPurchaseProduct);
		addMessage(redirectAttributes, "保存采购物品信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractPurchase/form?id="+oaContractPurchaseProduct.getContractPurchase().getId()+"&tabIndex=2";
	}
	
	@RequiresPermissions("oa:contract:oaContractPurchaseProduct:edit")
	@RequestMapping(value = "delete")
	public String delete(OaContractPurchaseProduct oaContractPurchaseProduct, RedirectAttributes redirectAttributes) {
		oaContractPurchaseProductService.delete(oaContractPurchaseProduct);
		addMessage(redirectAttributes, "删除采购物品信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractPurchase/form?id="+oaContractPurchaseProduct.getContractPurchase().getId()+"&tabIndex=2";
	}
	
	

}