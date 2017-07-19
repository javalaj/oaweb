/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web.loan;

import java.util.Date;
import java.util.HashMap;
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
import com.thinkgem.jeesite.modules.oa.entity.loan.OaLoanMain;
import com.thinkgem.jeesite.modules.oa.entity.loan.OaLoanRepayment;
import com.thinkgem.jeesite.modules.oa.service.loan.OaLoanMainService;
import com.thinkgem.jeesite.modules.oa.service.loan.OaLoanRepaymentService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 借支还款管理Controller
 * @author 李廷龙
 * @version 2017-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/loan/oaLoanRepayment")
public class OaLoanRepaymentMController extends BaseController {

	@Autowired
	private OaLoanRepaymentService oaLoanRepaymentService;
	
	@Autowired
	private OaLoanMainService oaLoanMainService;
	
	@ModelAttribute
	public OaLoanRepayment get(@RequestParam(required=false) String id) {
		OaLoanRepayment entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaLoanRepaymentService.get(id);
		}
		if (entity == null){
			entity = new OaLoanRepayment();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:loan:oaLoanRepayment:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaLoanRepayment oaLoanRepayment, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaLoanRepayment.setCurrentUserId(UserUtils.getUser().getId());
		Page<OaLoanRepayment> page = oaLoanRepaymentService.findPage(new Page<OaLoanRepayment>(request, response), oaLoanRepayment); 
		model.addAttribute("page", page);
		return "mobile/modules/oa/loan/oaLoanRepaymentList";
	}
	
	@RequiresPermissions("oa:loan:oaLoanRepayment:view")
	@RequestMapping(value = {"conditionList"})
	public String conditionList(OaLoanRepayment oaLoanRepayment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaLoanRepayment> page = oaLoanRepaymentService.findPage(new Page<OaLoanRepayment>(request, response), oaLoanRepayment); 
		model.addAttribute("page", page);
		return "modules/oa/loan/oaLoanRepaymentConditionList";
	}

	@RequiresPermissions("oa:loan:oaLoanRepayment:view")
	@RequestMapping(value = "form")
	public String form(OaLoanRepayment oaLoanRepayment, Model model) {
		String loanMainId=oaLoanRepayment.getLoanMain().getId();
		OaLoanMain oaLoanMain=oaLoanMainService.get(oaLoanRepayment.getLoanMain().getId());
		Double hasRepaymentMoney=oaLoanRepaymentService.getSumRepaymentMoneyByLoanMainId(loanMainId);
		Double notRepaymentMoney=oaLoanMain.getLoanMoney()- hasRepaymentMoney;
		oaLoanRepayment.setLoanMain(oaLoanMain);
		oaLoanRepayment.setHasRepaymentMoney(hasRepaymentMoney);
		oaLoanRepayment.setNotRepaymentMoney(notRepaymentMoney);
		model.addAttribute("oaLoanRepayment", oaLoanRepayment);
		return "modules/oa/loan/oaLoanRepaymentForm";
	}

	@RequiresPermissions("oa:loan:oaLoanRepayment:edit")
	@RequestMapping(value = "save")
	public String save(OaLoanRepayment oaLoanRepayment, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaLoanRepayment)){
			return form(oaLoanRepayment, model);
		}
		oaLoanRepayment.setDealUser(UserUtils.getUser());
		oaLoanRepayment.setLoanUser(oaLoanRepayment.getLoanMain().getLoanUser());
		oaLoanRepaymentService.save(oaLoanRepayment);
		String loanMainId=oaLoanRepayment.getLoanMain().getId();
		OaLoanMain oaLoanMain =oaLoanMainService.get(loanMainId);
		Double hasRepaymentMoney=oaLoanRepaymentService.getSumRepaymentMoneyByLoanMainId(loanMainId);
		Double notRepaymentMoney=oaLoanMain.getLoanMoney()- hasRepaymentMoney;
		if (notRepaymentMoney<=0) {
			oaLoanMain.setLoanStatus(OaLoanMain.loanStatus_1);
			oaLoanMain.setWriteOffTime(new Date());
			oaLoanMainService.save(oaLoanMain);
		}
		addMessage(redirectAttributes, "保存借支还款信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/loan/oaLoanMain/?repage";
	}
	
	@RequiresPermissions("oa:loan:oaLoanRepayment:edit")
	@RequestMapping(value = "delete")
	public String delete(OaLoanRepayment oaLoanRepayment, RedirectAttributes redirectAttributes) {
		oaLoanRepaymentService.delete(oaLoanRepayment);
		addMessage(redirectAttributes, "删除借支还款信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/loan/oaLoanRepayment/?repage";
	}
	
	/**
	 * 验证登录名是否有效
	 * 
	 * @param oldLoginName
	 * @param loginName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "checkLeftMoney")
	public Map<String,Object> checkLeftMoney(String inputMoney, String loanMainId) {
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			OaLoanMain oaLoanMain=oaLoanMainService.get(loanMainId);
			Double hasRepaymentMoney=oaLoanRepaymentService.getSumRepaymentMoneyByLoanMainId(loanMainId);
			Double notRepaymentMoney=oaLoanMain.getLoanMoney()- hasRepaymentMoney;
			map.put("status", "ok");
			map.put("hasRepaymentMoney", hasRepaymentMoney);
			map.put("notRepaymentMoney", notRepaymentMoney);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("status", "wrong");
		}
		
		return map;
	}

}