/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.contract;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractStatistics;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractStatisticsService;

/**
 * 销售合同管理Controller
 * @author 李廷龙
 * @version 2016-12-12
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/contract/oaContractStatistics")
public class OaContractStatisticsController extends BaseController {

	@Autowired
	private OaContractStatisticsService oaContractStatisticsService;
	@ModelAttribute
	public OaContractStatistics get(@RequestParam(required=false) String id) {
		OaContractStatistics entity = null;
		if (StringUtils.isNotBlank(id)){
		}
		if (entity == null){
			entity = new OaContractStatistics();
		}
		return entity;
	}

	@RequestMapping(value = "form")
	public String form(OaContractStatistics oaContractSales, Model model) {
		return "modules/oa/contract/oaContractStatisticsForm";
	}

	
	@RequestMapping(value="statistics")
	public String statistics(OaContractStatistics oaContractStatistics, HttpServletRequest request, HttpServletResponse response, Model model){
		String url="modules/oa/contract/oaContractStatisticsList";
		String realContractType=oaContractStatistics.getRealContractType();
		List<OaContractStatistics> oaContractStatisticsList=null;
		String realContractTypeName="";
		if (StringUtils.equals("0", realContractType)) {
			//销售合同统计页面
			oaContractStatisticsList=oaContractStatisticsService.findOaContractSalesStatisticsList(oaContractStatistics);
			realContractTypeName="【销售】合同";
		}
		if (StringUtils.equals("1", realContractType)) {
			//采购合同统计页面
			oaContractStatisticsList=oaContractStatisticsService.findOaContractPurchaseStatisticsList(oaContractStatistics);
			realContractTypeName="【采购】+【分包】合同";
		}
		Double totalContractMoney=0d;
		Double totalCompletedMoney=0d;
		Double totalLeftMoney=0d;
		for (OaContractStatistics oaContractStatistics2 : oaContractStatisticsList) {
			totalContractMoney=totalContractMoney+oaContractStatistics2.getContractMoney();
			totalCompletedMoney=totalCompletedMoney+oaContractStatistics2.getCompletedMoney();
			totalLeftMoney=totalLeftMoney+oaContractStatistics2.getLeftMoney();
		}
		model.addAttribute("list", oaContractStatisticsList);
		model.addAttribute("realContractTypeName", realContractTypeName);
		model.addAttribute("totalContractMoney", totalContractMoney);
		model.addAttribute("totalCompletedMoney", totalCompletedMoney);
		model.addAttribute("totalLeftMoney", totalLeftMoney);
		model.addAttribute("oaContractStatisticsCondition", oaContractStatistics);
		return url;
	}
	
	

}