/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web.publicprivatecar;

import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.annotation.Token;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.entity.OaUsecar;
import com.thinkgem.jeesite.modules.oa.entity.publicprivatecar.OaPublicPrivateCars;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.oa.service.publicprivatecar.OaPublicPrivateCarsService;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;

/**
 * 私车公用Controller
 * @author niting
 * @version 2017-01-10
 */
@Controller("moaPublicPrivateCarsController")
@RequestMapping(value = "${adminPath}${mobilePath}/oa/publicprivatecar/oaPublicPrivateCars")
public class OaPublicPrivateCarsController extends BaseController {

	@Autowired
	private OaPublicPrivateCarsService oaPublicPrivateCarsService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private OaProVacateService oaProVacateService;
	@Autowired
	private ActTaskService actTaskService;	
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回交接操作service
	
	
	@ModelAttribute
	public OaPublicPrivateCars get(@RequestParam(required=false) String id) {
		OaPublicPrivateCars entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaPublicPrivateCarsService.get(id);
		}
		if (entity == null){
			entity = new OaPublicPrivateCars();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:publicprivatecar:oaPublicPrivateCars:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaPublicPrivateCars oaPublicPrivateCars, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaPublicPrivateCars> page = oaPublicPrivateCarsService.findPage(new Page<OaPublicPrivateCars>(request, response), oaPublicPrivateCars); 
		model.addAttribute("page", page);
		return "mobile/modules/oa/publicprivatecar/oaPublicPrivateCarsList";
	}

	@RequiresPermissions("oa:publicprivatecar:oaPublicPrivateCars:edit")
	@RequestMapping(value = "delete")
	public String delete(OaPublicPrivateCars oaPublicPrivateCars, RedirectAttributes redirectAttributes) {
		oaPublicPrivateCarsService.delete(oaPublicPrivateCars);
		addMessage(redirectAttributes, "删除私车公用成功");
		return "redirect:"+Global.getAdminPath() + Global.getMobilePath()+"/oa/publicprivatecar/oaPublicPrivateCars/?repage";
	}
	
	@RequiresPermissions("oa:oaArchives:view")
	@RequestMapping(value = "view")
	public String detail(OaPublicPrivateCars oaPublicPrivateCars, Model model) {
		oaPublicPrivateCars.setCreateBy(systemService.getUser(oaPublicPrivateCars.getCreateBy().getId()));// 为页面查询出申请人姓名
		addTask(model, oaPublicPrivateCars);
		addt(model,oaPublicPrivateCars);
		model.addAttribute("oaPublicPrivateCars", oaPublicPrivateCars);
//		model.addAttribute("createname", UserUtils.get(oaPublicPrivateCars.getCreateBy().getId()).getName());
		return "mobile/modules/oa/publicprivatecar/oaPublicPrivateCarsView";
	}
	
	@RequiresPermissions("oa:publicprivatecar:oaPublicPrivateCars:view")
	@RequestMapping(value = "form")
	@Token(save = true)
	public String form(OaPublicPrivateCars oaPublicPrivateCars, Model model,String flag) {
		oaPublicPrivateCars = init(oaPublicPrivateCars); //流程结束后获取实体对象
		
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaPublicPrivateCars.getProcInsId()));
		System.err.println(oaFlowBackService.isCanBack(oaPublicPrivateCars.getProcInsId()));
		
		String view = "mobile/modules/oa/publicprivatecar/oaPublicPrivateCarsView";
		if (oaPublicPrivateCarsService.isDeal(oaPublicPrivateCars)) {
			view = "mobile/modules/oa/publicprivatecar/oaPublicPrivateCarsForm";
			
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaPublicPrivateCars.getProcInsId());
		} else {
			oaPublicPrivateCars.setCreateBy(systemService.getUser(oaPublicPrivateCars.getCreateBy().getId()));// 为页面查询出申请人的名字
		}
				
		if (StringUtils.isBlank(oaPublicPrivateCars.getId())) {
			oaPublicPrivateCars.setCreateBy(UserUtils.getUser());
			oaPublicPrivateCars.setCreateDate(new Date());
		}
		
		//审核完成后打回创建人是空值重新赋值
		if(oaPublicPrivateCars.getCreateBy().getName()==null){
			oaPublicPrivateCars.setCreateBy(UserUtils.getUser());
		}
		
		//如果申请时，部门显示的是小组名字，则显示小组名字的上级名字。如显示的是oa组，则显示研发部	
		oaPublicPrivateCars.setOfficename(officeService.get(UserUtils.getUser().getOffice().getId()).getName());
		String officeid = officeService.get(officeService.findOfficeIdByName(oaPublicPrivateCars.getOfficename())).getParentId();
		if(!officeid.equals("0") && !officeid.equals("1")){
			oaPublicPrivateCars.setOfficename(officeService.get(UserUtils.getUser().getOffice().getParentId()).getName());
		}

		
		model.addAttribute("oaPublicPrivateCars", oaPublicPrivateCars);
		addShoucang(oaPublicPrivateCars.getId(), model);
		addTitle(model, oaPublicPrivateCars);
		addTask(model, oaPublicPrivateCars);
		addt(model,oaPublicPrivateCars);
		return view;
	}

	
	
	/**
	 * 新建提交，打回修改提交
	 * 
	 * flag 0 确定申请 1 取消申请
	 */
	@RequiresPermissions("oa:publicprivatecar:oaPublicPrivateCars:edit")
	@RequestMapping("save")
	@Token(remove = true)
	public String save(OaPublicPrivateCars oaPublicPrivateCars, Model model, RedirectAttributes redirectAttributes, String flag) {
		if (!beanValidator(model, oaPublicPrivateCars)) {
			return form(oaPublicPrivateCars, model, "");
		}
		oaPublicPrivateCars.setFileId(OrdersUtils.getGenerateOrderNo8("CY_ZZJY"));//自动生成编号
		oaPublicPrivateCarsService.save(oaPublicPrivateCars, flag);
		if(flag.equals("1")){
			addMessage(redirectAttributes, "私车公用申请取消");
		}else{
			addMessage(redirectAttributes, "私车公用申请成功");
		}
		addt(model,oaPublicPrivateCars);
		model.addAttribute("oaPublicPrivateCars", oaPublicPrivateCars);
		//return "mobile/modules/oa/publicprivatecar/oaPublicPrivateCarsView";
		return "redirect:"+Global.getAdminPath() + Global.getMobilePath()+"/oa/publicprivatecar/oaPublicPrivateCars/form?flag="+"view"+"&id="+oaPublicPrivateCars.getId();
	}

	/**
	 * 上级审核页面
	 */
	@RequiresPermissions("oa:publicprivatecar:oaPublicPrivateCars:view")
	@RequestMapping("exam")
	@Token(save = true)
	public String exam(OaPublicPrivateCars oaPublicPrivateCars, Model model, int num) {
		oaPublicPrivateCars = init(oaPublicPrivateCars);
		
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaPublicPrivateCars.getProcInsId()));
				
		oaPublicPrivateCars.setCreateBy(UserUtils.get(oaPublicPrivateCars.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaPublicPrivateCars", oaPublicPrivateCars);
		String view = "mobile/modules/oa/publicprivatecar/oaPublicPrivateCarsView";// 默认去查看页面
		if (oaPublicPrivateCarsService.isDeal(oaPublicPrivateCars)) {
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaPublicPrivateCars.getProcInsId());
			view = "mobile/modules/oa/publicprivatecar/oaPublicPrivateCarsExam" + num;// 有权限的人去审核页面
		}
		addTitle(model, oaPublicPrivateCars);
		addTask(model, oaPublicPrivateCars);
		addt(model,oaPublicPrivateCars);
		return view;
	}

	/**
	 * 审核是否通过 0：不同意 1：同意
	 */
	@RequiresPermissions("oa:publicprivatecar:oaPublicPrivateCars:edit")
	@RequestMapping("dealExam")
	@Token(remove = true)
	public String dealexam(OaPublicPrivateCars oaPublicPrivateCars, Model model, RedirectAttributes redirectAttributes, String exam,
			int sign) {
		if (!beanValidator(model, oaPublicPrivateCars)) {
			return exam(oaPublicPrivateCars, model, sign);
		}
		oaPublicPrivateCarsService.dealexam(oaPublicPrivateCars, exam, sign);
		if(sign==1){
			addMessage(redirectAttributes, "人事审核完成!!!");
		}else if(sign==2){
			addMessage(redirectAttributes, "财务审核完成!!!");
		}
		oaPublicPrivateCars.setCreateBy(UserUtils.get(oaPublicPrivateCars.getCreateBy().getId()));// 为页面查询出申请人的名字
		addt(model,oaPublicPrivateCars);
		model.addAttribute("oaPublicPrivateCars", oaPublicPrivateCars);
		//return "mobile/modules/oa/publicprivatecar/oaPublicPrivateCarsView";
		return "redirect:" + Global.getAdminPath()  + Global.getMobilePath()+ "/oa/publicprivatecar/oaPublicPrivateCars/form?flag="+"view"+"&id=" + oaPublicPrivateCars.getId();
	}
	
	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	private OaPublicPrivateCars init(OaPublicPrivateCars oaPublicPrivateCars) {
		if (oaPublicPrivateCars.getAct() != null && StringUtils.isNotBlank(oaPublicPrivateCars.getAct().getProcInsId())) {
			oaPublicPrivateCars = oaPublicPrivateCarsService.getByProcInsId(oaPublicPrivateCars.getAct().getProcInsId());
		}
		return oaPublicPrivateCars;
	}

	/** 加入流程标题 */
	private void addTitle(Model model, OaPublicPrivateCars oaPublicPrivateCars) {
		String name = null;
		String date = null;
		if (StringUtils.isNotBlank(oaPublicPrivateCars.getId())) {
			name = UserUtils.get(oaPublicPrivateCars.getCreateBy().getId()).getName();
			date = DateUtils.formatDate(oaPublicPrivateCars.getCreateDate());
		} else {
			name = UserUtils.getUser().getName();
			date = DateUtils.getDate();
		}
		model.addAttribute("title", "私车公用申请流程【" + name + " " + date + "】");
	}

	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model,OaPublicPrivateCars oaPublicPrivateCars) {
		// 如果流程已启动，给出流程图
		if (oaPublicPrivateCars.getProcInsId() != null
				&& oaProVacateService.getTaskByProcInsId(oaPublicPrivateCars.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaPublicPrivateCars.getProcInsId()));
		}
	}
	
	/** 微信端流程流转信息的显示 */
	private void addt(Model model,OaPublicPrivateCars oaPublicPrivateCars){
		if(StringUtils.isNotBlank(oaPublicPrivateCars.getProcInsId())){
			List<Act> listact = actTaskService.histoicFlowList(oaPublicPrivateCars.getProcInsId(), null, null);
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