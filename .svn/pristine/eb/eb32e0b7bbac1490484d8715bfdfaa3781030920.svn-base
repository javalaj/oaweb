/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.annotation.Token;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.entity.CarManagement;
import com.thinkgem.jeesite.modules.oa.entity.OaUsecar;
import com.thinkgem.jeesite.modules.oa.service.CarManagementService;
import com.thinkgem.jeesite.modules.oa.service.OaUsecarService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;

/**
 * 车辆管理流程Controller
 * 
 * @author niting
 * @version 2016-11-21
 */
@Controller("moaUsecarController")
@RequestMapping(value = "${adminPath}${mobilePath}/oa/oaUsecar")
public class OaUsecarController extends BaseController {

	@Autowired
	private OaUsecarService oaUsecarService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private CarManagementService carService;
	@Autowired
	private OaProVacateService oaProVacateService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回交接操作service

	@ModelAttribute
	public OaUsecar get(@RequestParam(required = false) String id) {
		OaUsecar entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaUsecarService.get(id);
		}
		if (entity == null) {
			entity = new OaUsecar();
		}
		return entity;
	}

	@RequiresPermissions("oa:oaUsecar:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaUsecar oaUsecar, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaUsecar> page = oaUsecarService.findPage(new Page<OaUsecar>(request, response), oaUsecar);
		model.addAttribute("page", page);
		return "mobile/modules/oa/oaUsecarList";
	}


	@RequiresPermissions("oa:oaUsecar:edit")
	@RequestMapping(value = "delete")
	public String delete(OaUsecar oaUsecar, RedirectAttributes redirectAttributes) {
		oaUsecarService.delete(oaUsecar);
		addMessage(redirectAttributes, "删除申请用车成功!");
		return "redirect:" + Global.getAdminPath()  + Global.getMobilePath()+ "/act/task/historic/";
	}

	@RequiresPermissions("oa:oaArchives:view")
	@RequestMapping(value = "view")
	public String view(OaUsecar oaUsecar, Model model) {
		oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId()));// 为页面查询出申请人姓名
		addTask(model, oaUsecar);
		model.addAttribute("oaUsecar", oaUsecar);
//		model.addAttribute("createname", UserUtils.get(oaPublicPrivateCars.getCreateBy().getId()).getName());
		return "mobile/modules/oa/oaUsecarView";
	}
	
	// 申请用车流程发起时进入,打回页面
	@RequiresPermissions("oa:oaUsecar:view")
	@RequestMapping(value = "form")
	@Token(save = true)
	public String form(OaUsecar oaUsecar, Model model,String backsign) {
		oaUsecar = init(oaUsecar);
		//如果创建人为空则获取当前登录的用户名

		oaUsecar.setCreateBy(UserUtils.getUser());

		String view = "mobile/modules/oa/oaUsecarView";
		
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaUsecar.getProcInsId()));
		model.addAttribute("backsign", backsign);
		
		if (oaUsecarService.isDeal(oaUsecar)) {
			view = "mobile/modules/oa/oaUsecarForm"; // 有权限的人去修改页面
			
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaUsecar.getProcInsId());
		} else {
			oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId())); // 为页面查询出申请人的名字
		}
		
		//如果申请时，部门显示的是小组名字，则显示小组名字的上级名字。如显示的是oa组，则显示研发部	
		oaUsecar.setDepartment(officeService.get(UserUtils.getUser().getOffice().getId()).getName());
		String officeid = officeService.get(officeService.findOfficeIdByName(oaUsecar.getDepartment())).getParentId();
		if(!officeid.equals("0") && !officeid.equals("1")){
			oaUsecar.setDepartment(officeService.get(UserUtils.getUser().getOffice().getParentId()).getName());
		}
		model.addAttribute("oaUsecar", oaUsecar);
		addShoucang(oaUsecar.getId(), model);
		addTitle(model, oaUsecar);
		addTask(model, oaUsecar);
		addt(model, oaUsecar);
		return view;
	}

	/**
	 * 新建提交，打回修改提交
	 */
	@RequiresPermissions("oa:oaUsecar:edit")
	@RequestMapping(value = "save")
	@Token(remove = true)
	public String save(OaUsecar oaUsecar, Model model, RedirectAttributes redirectAttributes, String flag) {
		if (!beanValidator(model, oaUsecar)) {
			return form(oaUsecar, model,null);
		}
		//oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId()));// 为页面查询出申请人的名字
		oaUsecar.setFileId(OrdersUtils.getGenerateOrderNo8("CY_YCSQ"));//自动生成编号
		oaUsecarService.save(oaUsecar,flag);	
		addMessage(redirectAttributes, "保存申请用车成功!");
		addTitle(model, oaUsecar);
		addTask(model, oaUsecar);
		addt(model, oaUsecar);
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath()+  "/oa/oaUsecar/form?id=" + oaUsecar.getId();
		//return "mobile/modules/oa/oaUsecarView";
	}

	/**
	 * 行政审核页面
	 */
	@RequiresPermissions("oa:oaUsecar:view")
	@RequestMapping(value = "exam")
	@Token(save = true)
	public String exam(OaUsecar oaUsecar, Model model) {
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaUsecar.getProcInsId()));
		
		oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaUsecar", oaUsecar);
		String view = "mobile/modules/oa/oaUsecarView"; //默认去查看页面
		if (oaUsecarService.isDeal(oaUsecar)) {
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaUsecar.getProcInsId());
			view = "mobile/modules/oa/oaUsecarExam"; //有权限的人去审核页面
		}
		addTitle(model, oaUsecar);
		addTask(model, oaUsecar);
		addt(model, oaUsecar);
		return view;
	}

	/**
	 * 行政审核是否通过 0：不同意 1：同意
	 */
	@RequiresPermissions("oa:oaUsecar:edit")
	@RequestMapping(value = "dealExam")
	@Token(remove = true)
	public String dealExam(OaUsecar oaUsecar, Model model, RedirectAttributes redirectAttributes, String exam) {		
		if (!beanValidator(model, oaUsecar)) {
			return exam(oaUsecar, model);
		}
		oaUsecarService.dealExam(oaUsecar, exam, 1,"0");
		addMessage(redirectAttributes, "审核用车申请成功");
		oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaUsecar", oaUsecar);		
		addt(model,oaUsecar);
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath()+"/oa/oaUsecar/form?backsign=1&id=" + oaUsecar.getId();
		//return "mobile/modules/oa/oaUsecarView";
	}

	/**
	 * 行政审核后，重回发起人（是否变更目的地）
	 */
	@RequiresPermissions("oa:OaUsecar:view")
	@RequestMapping(value = "exam2")
	@Token(save = true)
	public String exam2(OaUsecar oaUsecar, Model model) {
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaUsecar.getProcInsId()));
		
		oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaUsecar", oaUsecar);
		String view = "mobile/modules/oa/oaUsecarView";
		if (oaUsecarService.isDeal(oaUsecar)) {
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaUsecar.getProcInsId());
			view = "mobile/modules/oa/oaUsecarExam2";
		}
		addTitle(model, oaUsecar);
		addTask(model, oaUsecar);
		addt(model, oaUsecar);
		return view;
	}

	/**
	 * 发起人是否更改目的地： 0：更改 1：不更改
	 */
	@RequiresPermissions("oa:oaUsecar:edit")
	@RequestMapping(value = "dealExam2")
	@Token(remove = true)
	public String dealExam2(OaUsecar oaUsecar, Model model, RedirectAttributes redirectAttributes, String exam,String next) {
		if (!beanValidator(model, oaUsecar)) {
			return exam(oaUsecar, model);
		}
		oaUsecarService.dealExam(oaUsecar, exam, 2,next);
		oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId()));// 为页面查询出申请人的名字
		addMessage(redirectAttributes, "审核用车申请成功");
		model.addAttribute("oaUsecar", oaUsecar);
		addt(model,oaUsecar);
		//return "mobile/modules/oa/oaUsecarView";
		return "redirect:" + Global.getAdminPath()  + Global.getMobilePath()+"/oa/oaUsecar/form?id=" + oaUsecar.getId();
	}
	
	
	/**
	 * 发起人同意后给司机
	 */
	@RequiresPermissions("oa:oaUsecar:view")
	@RequestMapping(value = "exam3")
	@Token(save = true)
	public String exam3(OaUsecar oaUsecar, Model model) {
		oaUsecar = init(oaUsecar);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaUsecar.getProcInsId()));
		//获取所有车牌号
		List<String> carNos = new ArrayList<String>();
		List<CarManagement> listcar = carService.getByState();
		for (int i = 0; i <listcar.size() ; i++) {
			carNos.add(listcar.get(i).getPlatenum());
		}
		model.addAttribute("carno", carNos);
		
		//获取司机的名字
		oaUsecar.setDriver(UserUtils.getUser().getName());
		oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaUsecar", oaUsecar);
		
		String view = "mobile/modules/oa/oaUsecarView";
		if (oaUsecarService.isDeal(oaUsecar)) {
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaUsecar.getProcInsId());
			view = "mobile/modules/oa/oaUsecarExam3";
		}
		addTitle(model, oaUsecar);
		addTask(model, oaUsecar);
		addt(model, oaUsecar);
		return view;
	}

	
	/**
	 * 司机填写用车信息
	 */
	@RequiresPermissions("oa:oaUsecar:edit")
	@RequestMapping(value = "dealExam3")
	@Token(remove = true)
	public String dealExam3(OaUsecar oaUsecar, Model model, RedirectAttributes redirectAttributes, String exam) {
		if (!beanValidator(model, oaUsecar)) {
			return exam(oaUsecar, model);
		}
		oaUsecarService.dealExam(oaUsecar, "0", 3,"0");
		
		oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId()));// 为页面查询出申请人的名字
		addMessage(redirectAttributes, "司机填写用车信息完成！");
		model.addAttribute("oaUsecar", oaUsecar);
		addt(model,oaUsecar);
		//return "mobile/modules/oa/oaUsecarView";
//		addMessage(redirectAttributes, "审核出差申请成功");
		return "redirect:" + Global.getAdminPath()  + Global.getMobilePath()+ "/oa/oaUsecar/form?id=" + oaUsecar.getId();
	}
	
	/**
	 * 归档审核页面
	 */
	@RequiresPermissions("oa:oaUsecar:view")
	@RequestMapping(value = "filling")
	@Token(save = true)
	public String filling(OaUsecar oaUsecar, Model model) {
		oaUsecar = init(oaUsecar);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaUsecar.getProcInsId()));
		oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId()));// 为页面查询出申请人的名字
		String fillingName=UserUtils.getUser().getName();
		model.addAttribute("oaUsecar", oaUsecar);
		String view = "mobile/modules/oa/oaUsecarView";
		if (oaUsecarService.isDeal(oaUsecar)) {
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaUsecar.getProcInsId());
			view = "mobile/modules/oa/oaUsecarFilling";
		}
		Date updateDate = new Date();
		model.addAttribute("updateDate", updateDate);
		model.addAttribute("fillingName", fillingName);
		addTitle(model, oaUsecar);
		addTask(model, oaUsecar);
		addt(model, oaUsecar);
		return view;
	}

	
	/**
	 * 人事归档审核意见提交
	 */
	@RequiresPermissions("oa:oaUsecar:view")
	@RequestMapping(value = "dealfilling")
	@Token(remove = true)
	public String dealFilling(OaUsecar oaUsecar, Model model, RedirectAttributes redirectAttributes, String exam) {
		if (!beanValidator(model, oaUsecar)) {
			return filling(oaUsecar, model);
		}
		//归档操作代码
		oaUsecarService.dealFilling(oaUsecar);
		CarManagement car = new CarManagement();
		car = carService.getByPlateNum(oaUsecar.getPlatenum());
		car.setKilometers(oaUsecar.getBackkilometer());
		car.setLastlending(oaUsecar.getCreateBy().getName());
		carService.save(car);
		oaUsecar.setCreateBy(systemService.getUser(oaUsecar.getCreateBy().getId()));// 为页面查询出申请人的名字
		addMessage(redirectAttributes, "人事归档用车申请成功！");
		model.addAttribute("oaUsecar", oaUsecar);
		addt(model,oaUsecar);
		//return "mobile/modules/oa/oaUsecarView";
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath()+"/oa/oaUsecar/form?id=" + oaUsecar.getId();
	}
	
	
	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	public OaUsecar init(OaUsecar oaUsecar) {
		if (oaUsecar.getAct() != null && StringUtils.isNotBlank(oaUsecar.getAct().getProcInsId())) {
			oaUsecar = oaUsecarService.getByProcInsId(oaUsecar.getAct().getProcInsId());
		}
		return oaUsecar;
	}
	
	/**
	 * 加入流程标题
	 */
	public void addTitle(Model model,OaUsecar oaUsecar){
		String name = null;
		String date = null;
		if(StringUtils.isNotBlank(oaUsecar.getId())){  //如果不为空获取创建人和创建时间
			name = oaUsecar.getCreateBy().getName();
			date = DateUtils.formatDate(oaUsecar.getCreateDate());
		}else{
			name = UserUtils.getUser().getName(); //获取当前用户
			date = DateUtils.getDate(); //获取当前时间
		}
		model.addAttribute("title", "用车申请流程【" + name + " " + date + "】");
	}
	
	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model,OaUsecar oaUsecar) {
		// 如果流程已启动，给出流程图
		if (oaUsecar.getProcInsId() != null
				&& oaProVacateService.getTaskByProcInsId(oaUsecar.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaUsecar.getProcInsId()));
		}
	}
	
	/** 微信端流程流转信息的显示 */
	private void addt(Model model,OaUsecar oaUsecar){
		if(StringUtils.isNotBlank(oaUsecar.getProcInsId())){
			List<Act> listact = actTaskService.histoicFlowList(oaUsecar.getProcInsId(), null, null);
			model.addAttribute("listact",listact);
		}
	}
	
	@Autowired
	private UserFavoriteService UserFavoriteService;// 获取当前流程信息是否已经被收藏

	/** 获取当前物质收藏状态 */
	public void addShoucang(String id, Model model) {
		if (StringUtils.isNotBlank(id)) {
			model.addAttribute("shoucang", UserFavoriteService.getShoucangState(id));
		}
	}
}