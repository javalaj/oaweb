/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.entertainmentr;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.model.ConvertAnchor;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.annotation.Token;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaMonthlyPlan;
import com.thinkgem.jeesite.modules.oa.entity.entertainmentr.OaEntertainmentReimbursement;
import com.thinkgem.jeesite.modules.oa.oaUtils.MoneyUtils;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.oa.service.entertainmentr.OaEntertainmentReimbursementService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 招待费Controller
 * @author niting
 * @version 2017-01-12
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/entertainmentr/oaEntertainmentReimbursement")
public class OaEntertainmentReimbursementController extends BaseController {

	@Autowired
	private OaEntertainmentReimbursementService oaEntertainmentReimbursementService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private OaProVacateService oaProVacateService;
	
	@ModelAttribute
	public OaEntertainmentReimbursement get(@RequestParam(required=false) String id) {
		OaEntertainmentReimbursement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaEntertainmentReimbursementService.get(id);
		}
		if (entity == null){
			entity = new OaEntertainmentReimbursement();
		}
		return entity;
	}
	
//	@RequiresPermissions("oa:entertainmentr:oaEntertainmentReimbursement:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaEntertainmentReimbursement oaEntertainmentReimbursement, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaEntertainmentReimbursement> page = oaEntertainmentReimbursementService.findPage(new Page<OaEntertainmentReimbursement>(request, response), oaEntertainmentReimbursement); 
		model.addAttribute("page", page);
		return "modules/oa/entertainmentr/oaEntertainmentReimbursementList";
	}

	@RequestMapping(value = "view")
	public String view(String sameid, Model model){
		double total = 0;
		List<OaEntertainmentReimbursement> listOaEnter = oaEntertainmentReimbursementService.getOaEnterBySameid(sameid);
		OaEntertainmentReimbursement oaEntertainment = listOaEnter.get(0);
		for (OaEntertainmentReimbursement oaEntertainmentR : listOaEnter) {
			total =total+ Double.parseDouble(oaEntertainmentR.getMeals().toString()) + Double.parseDouble(oaEntertainmentR.getAlcoholtobacco().toString());
		}
		String money_string = MoneyUtils.convertMoney(total);//把总金额转换成大写
		
		String name1=null;
		String name2=null;
		String name3=null;
		String text1 = null;
		String text2 = null;
		String text3 = null;	
		try {
			if(listOaEnter.get(0).getExamtext() != null || listOaEnter.get(0).getExamtext().length()>0){
				name1= listOaEnter.get(0).getExamname();
				text1 = listOaEnter.get(0).getExamtext();
			}
			if(listOaEnter.get(0).getExamname1() !=null || listOaEnter.get(0).getExamname1().length()>0){
				name2= listOaEnter.get(0).getExamname1();
				text2 = listOaEnter.get(0).getExamtext1();
			}
			if(listOaEnter.get(0).getExamname2() !=null || listOaEnter.get(0).getExamname2().length()>0){
				name3= listOaEnter.get(0).getExamname2();
				text3 = listOaEnter.get(0).getExamtext2();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		model.addAttribute("name1", name1);
		model.addAttribute("name2", name2);
		model.addAttribute("name3", name3);
		model.addAttribute("text1", text1);
		model.addAttribute("text2", text2);
		model.addAttribute("text3", text3);
		model.addAttribute("total", total);
		model.addAttribute("money_string", money_string);
		model.addAttribute("listOaEnter", listOaEnter);
		model.addAttribute("oaEntertainmentReimbursement", oaEntertainment);
		addTitle(model, listOaEnter.get(0));
		addTask(model, listOaEnter.get(0));
		return "modules/oa/entertainmentr/oaEntertainmentReimbursementView";
	}
	
//	@RequiresPermissions("oa:entertainmentr:oaEntertainmentReimbursement:edit")
	@RequestMapping(value = "delete")
	public String delete(OaEntertainmentReimbursement oaEntertainmentReimbursement, RedirectAttributes redirectAttributes) {
		oaEntertainmentReimbursementService.delete(oaEntertainmentReimbursement);
		addMessage(redirectAttributes, "删除招待费流程成功");
		return "redirect:"+Global.getAdminPath()+"/oa/entertainmentr/oaEntertainmentReimbursement/?repage";
	}

	
//	@RequiresPermissions("oa:entertainmentr:oaEntertainmentReimbursement:view")
	@RequestMapping(value = "form")
	@Token(save = true)
	public String form(String sameid,OaEntertainmentReimbursement oaEntertainmentReimbursement, Model model,String flag) {
		init(oaEntertainmentReimbursement);
		String view = "modules/oa/entertainmentr/oaEntertainmentReimbursementView";
		if (oaEntertainmentReimbursementService.isDeal(oaEntertainmentReimbursement)) {
			view = "modules/oa/entertainmentr/oaEntertainmentReimbursementForm";
		} else {
			oaEntertainmentReimbursement.setCreateBy(systemService.getUser(oaEntertainmentReimbursement.getCreateBy().getId()));// 为页面查询出申请人的名字
		}
				
		if (StringUtils.isBlank(oaEntertainmentReimbursement.getId())) {
			oaEntertainmentReimbursement.setCreateBy(UserUtils.getUser());
			oaEntertainmentReimbursement.setCreateDate(new Date());
		}
		
		List<OaEntertainmentReimbursement> listOaEnter=null;
		try {
			if(!sameid.equals("")){
				listOaEnter = oaEntertainmentReimbursementService.getOaEnterBySameid(sameid);
				oaEntertainmentReimbursement = listOaEnter.get(0);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		//审核完成后打回创建人是空值重新赋值
		if(oaEntertainmentReimbursement.getCreateBy().getName()==null){
			oaEntertainmentReimbursement.setCreateBy(UserUtils.getUser());
		}
		
		// 如果申请时，部门显示的是小组名字，则显示小组名字的上级名字。如显示的是oa组，则显示研发部
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("name", UserUtils.getUser().getName());
		oaEntertainmentReimbursement.setOfficename(officeService.findOfficeByUser(paramMap).get("offname").toString());
		if (!officeService.findOfficeByUser(paramMap).get("parent").equals("0")
				|| !officeService.findOfficeByUser(paramMap).get("parent").equals("1")) {
			oaEntertainmentReimbursement.setOfficename(officeService.get(UserUtils.getUser().getOffice().getParentId()).getName());
		}
		
		model.addAttribute("listOaEnter", listOaEnter);
		model.addAttribute("oaEntertainmentReimbursement", oaEntertainmentReimbursement);
		addTitle(model, oaEntertainmentReimbursement);
		addTask(model, oaEntertainmentReimbursement);
		return view;
	}

	
	
	/**
	 * 新建提交，打回修改提交
	 * 
	 * flag 0 确定申请 1 取消申请
	 */
	@RequestMapping(value="save",method=RequestMethod.POST)
	@ResponseBody
	public String save(@RequestBody List<OaEntertainmentReimbursement> oaEntertainmentRs,String sameid,OaEntertainmentReimbursement oaEntertainmentR,			
			Model model, RedirectAttributes redirectAttributes, String flag) {
		if (oaEntertainmentRs == null || oaEntertainmentRs.size() <= 0) {
			return null;
		}
		for (int i = 0; i < oaEntertainmentRs.size(); i++) {
//			 SimpleDateFormat sdf  =  new  SimpleDateFormat("yyyy-MM-dd"); 
			oaEntertainmentR = oaEntertainmentRs.get(i);
//				try {
			if(oaEntertainmentR==null||oaEntertainmentR.getDate().equals("")||oaEntertainmentR.getDate()==null ||
				oaEntertainmentR.getCurrentunit()==null||oaEntertainmentR.getCurrentunit().equals("")||
				oaEntertainmentR.getMeals()==null||oaEntertainmentR.getMeals().equals("")||
				oaEntertainmentR.getAlcoholtobacco()==null||oaEntertainmentR.getAlcoholtobacco().equals("")||
				oaEntertainmentR.getNumOur()==null||oaEntertainmentR.getNumOur().equals("")||
				oaEntertainmentR.getNumCustomers()==null||oaEntertainmentR.getNumCustomers().equals("")||
				oaEntertainmentR.getReason()==null||oaEntertainmentR.getReason()==""){
				return "1";
			}
		}
		
		try {
			//如果为空，则为第一次申请，给申请的数据字段sameid赋值（uuid），如果不为空，则为打回后修改，修改时如果添加，则把添加的数据赋值相同的uuid
			if(sameid==null || sameid.length()<=0){
				UUID uuid = UUID.randomUUID(); 
				sameid=uuid.toString();
			}else{
				for (int i = 0; i < oaEntertainmentRs.size(); i++) {
					if(oaEntertainmentRs.get(i).getSameid()==null || oaEntertainmentRs.get(i).getSameid().length()<=0){
						oaEntertainmentRs.get(i).setSameid(sameid);
					}
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
			System.err.println(sameid);
		oaEntertainmentReimbursementService.save(oaEntertainmentR, flag, oaEntertainmentRs,sameid);
		
		model.addAttribute("sameid",oaEntertainmentR.getSameid());
		return "{\"id\": \"1\", \"name\": \""+sameid+"\"}";
	}

	/**
	 * 上级审核页面
	 */
//	@RequiresPermissions("oa:entertainmentr:oaEntertainmentReimbursement:view")
	@RequestMapping("exam")	
	@Token(save = true)
	public String exam(String sameid,OaEntertainmentReimbursement oaEntertainmentReimbursement, Model model) {
		oaEntertainmentReimbursement = init(oaEntertainmentReimbursement);
		List<OaEntertainmentReimbursement> listOaEnter = oaEntertainmentReimbursementService.getOaEnterBySameid(sameid);
		model.addAttribute("oaEntertainmentReimbursement", listOaEnter.get(0));
		String view = "modules/oa/entertainmentr/oaEntertainmentReimbursementView";// 默认去查看页面
		if (oaEntertainmentReimbursementService.isDeal(oaEntertainmentReimbursement)) {
			view = "modules/oa/entertainmentr/oaEntertainmentReimbursementExam1";// 有权限的人去审核页面
		}
		
		double total = 0;
		//取出相同UUID的数据
		
		//计算总单次报销的总金额
		for (OaEntertainmentReimbursement oaEntertainmentR : listOaEnter) {
			total =total+ Double.parseDouble(oaEntertainmentR.getMeals().toString()) + Double.parseDouble(oaEntertainmentR.getAlcoholtobacco().toString());
		}
		String money_string = MoneyUtils.convertMoney(total);//金额转换成大写
		model.addAttribute("total", total);
		model.addAttribute("money_string", money_string);
		model.addAttribute("listOaEnter", listOaEnter);
		model.addAttribute("sameid", sameid);
		addTitle(model, listOaEnter.get(0));
		addTask(model, listOaEnter.get(0));
		return view;
	}

	/**
	 * 总经理审核页面
	 */
	@RequestMapping("exam1")
	@Token(save = true)
	public String exam1(String sameid,OaEntertainmentReimbursement oaEntertainmentReimbursement, Model model,HttpServletRequest re) {
		oaEntertainmentReimbursement = init(oaEntertainmentReimbursement);
		List<OaEntertainmentReimbursement> listOaEnter = oaEntertainmentReimbursementService.getOaEnterBySameid(sameid);
		model.addAttribute("oaEntertainmentReimbursement", listOaEnter.get(0));
		String view = "modules/oa/entertainmentr/oaEntertainmentReimbursementView";// 默认去查看页面
		if (oaEntertainmentReimbursementService.isDeal(oaEntertainmentReimbursement)) {
			view = "modules/oa/entertainmentr/oaEntertainmentReimbursementExam2";// 有权限的人去审核页面
		}
		
		double total = 0;
		for (OaEntertainmentReimbursement oaEntertainmentR : listOaEnter) {
			total =total+ Double.parseDouble(oaEntertainmentR.getMeals().toString()) + Double.parseDouble(oaEntertainmentR.getAlcoholtobacco().toString());
		}
		String money_string = MoneyUtils.convertMoney(total);
		model.addAttribute("total", total);
		model.addAttribute("money_string", money_string);
		model.addAttribute("listOaEnter", listOaEnter);
		model.addAttribute("sameid", sameid);
		addTitle(model, oaEntertainmentReimbursement);
		addTask(model, oaEntertainmentReimbursement);
			return view;
		
		
	}
	
	/**
	 * 财务审核页面
	 */
	@RequestMapping("exam2")
	@Token(save = true)
	public String exam2(String sameid,OaEntertainmentReimbursement oaEntertainmentReimbursement, Model model) {
		oaEntertainmentReimbursement = init(oaEntertainmentReimbursement);
		List<OaEntertainmentReimbursement> listOaEnter = oaEntertainmentReimbursementService.getOaEnterBySameid(sameid);
		model.addAttribute("oaEntertainmentReimbursement", listOaEnter.get(0));
		String view = "modules/oa/entertainmentr/oaEntertainmentReimbursementView";// 默认去查看页面
		if (oaEntertainmentReimbursementService.isDeal(oaEntertainmentReimbursement)) {
			view = "modules/oa/entertainmentr/oaEntertainmentReimbursementExam3";// 有权限的人去审核页面
		}
		
		double total = 0;
		for (OaEntertainmentReimbursement oaEntertainmentR : listOaEnter) {
			total =total+ Double.parseDouble(oaEntertainmentR.getMeals().toString()) + Double.parseDouble(oaEntertainmentR.getAlcoholtobacco().toString());
		}
		String money_string = MoneyUtils.convertMoney(total);
		model.addAttribute("total", total);
		model.addAttribute("money_string", money_string);
		model.addAttribute("listOaEnter", listOaEnter);
		model.addAttribute("sameid", sameid);
		addTitle(model,oaEntertainmentReimbursement);
		addTask(model,listOaEnter.get(0));
		return view;
	}
	
	
	/**
	 * 部门负责人审核是否通过 0：不同意 1：同意
	 */
	@RequestMapping(value="dealExam",method=RequestMethod.POST)
	@ResponseBody
	public String dealexam(@RequestBody List<OaEntertainmentReimbursement> oaEntertainmentRs,String sameid,OaEntertainmentReimbursement entertainmentReimbursement,
			 Model model, RedirectAttributes redirectAttributes,
			HttpServletRequest re) {				
		String exam=oaEntertainmentRs.get(0).getIsagree();
		int sign=1;
		oaEntertainmentReimbursementService.dealexam(entertainmentReimbursement,oaEntertainmentRs, exam, sign);
		sameid=oaEntertainmentRs.get(0).getSameid();
		return "{\"id\": \"1\", \"name\": \""+sameid+"\"}";
	}
	/**
	 * 总经理审核是否通过 0：不同意 1：同意
	 */
	@RequestMapping(value="dealExam1",method=RequestMethod.POST)
	@ResponseBody
	public String dealexam1(@RequestBody List<OaEntertainmentReimbursement> oaEntertainmentRs,String sameid,OaEntertainmentReimbursement entertainmentReimbursement,
			 Model model, RedirectAttributes redirectAttributes, String exam,
			HttpServletRequest re) {				
		exam=oaEntertainmentRs.get(0).getIsagree1();
		int sign=2;
		oaEntertainmentReimbursementService.dealexam(entertainmentReimbursement,oaEntertainmentRs, exam, sign);
		sameid=oaEntertainmentRs.get(0).getSameid();
		
		return "{\"id\": \"1\", \"name\": \""+sameid+"\"}";
	}
	/**
	 * 财务审核是否通过 0：不同意 1：同意
	 */
	@RequestMapping(value="dealExam2",method=RequestMethod.POST)
	@ResponseBody
	public String dealexam2(@RequestBody List<OaEntertainmentReimbursement> oaEntertainmentRs,String sameid,OaEntertainmentReimbursement entertainmentReimbursement,
			 Model model, RedirectAttributes redirectAttributes, String exam,
			HttpServletRequest re) {				
		exam=oaEntertainmentRs.get(0).getIsagree2();
		int sign=3;
		oaEntertainmentReimbursementService.dealexam(entertainmentReimbursement,oaEntertainmentRs, exam, sign);
		sameid=oaEntertainmentRs.get(0).getSameid();
		return "{\"id\": \"1\", \"name\": \""+sameid+"\"}";
	}
	
	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	private OaEntertainmentReimbursement init(OaEntertainmentReimbursement oaEntertainmentReimbursement) {
		if (oaEntertainmentReimbursement.getAct() != null && StringUtils.isNotBlank(oaEntertainmentReimbursement.getAct().getProcInsId())) {
			oaEntertainmentReimbursement = oaEntertainmentReimbursementService.getByProcInsId(oaEntertainmentReimbursement.getAct().getProcInsId());
		}
		return oaEntertainmentReimbursement;
	}

	/** 加入流程标题 */
	private void addTitle(Model model, OaEntertainmentReimbursement oaEntertainmentReimbursement) {
		String name = null;
		String date = null;
		if (StringUtils.isNotBlank(oaEntertainmentReimbursement.getId())) {
			name = UserUtils.get(oaEntertainmentReimbursement.getCreateBy().getId()).getName();
			date = DateUtils.formatDate(oaEntertainmentReimbursement.getCreateDate());
		} else {
			name = UserUtils.getUser().getName();
			date = DateUtils.getDate();
		}
		model.addAttribute("title", "招待费报销申请流程【" + name + " " + date + "】");
	}

	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model,OaEntertainmentReimbursement oaEntertainmentReimbursement) {
		// 如果流程已启动，给出流程图
		if (oaEntertainmentReimbursement.getProcInsId() != null
				&& oaProVacateService.getTaskByProcInsId(oaEntertainmentReimbursement.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaEntertainmentReimbursement.getProcInsId()));
		}
	}
}