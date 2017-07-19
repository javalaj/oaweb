/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.SysexMessage;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
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
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.actRouting.ActRouting;
import com.thinkgem.jeesite.modules.oa.entity.OaArchives;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.service.OaArchivesService;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.oa.service.OaOvertimeService;
import com.thinkgem.jeesite.modules.oa.service.OaReceiveFileService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.entity.workflow.SysWorkflowVar;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.service.workflow.SysWorkflowVarService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;
import com.thinkgem.jeesite.modules.user.entity.UserFavorite;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;

/**
 * 公文Controller
 * 
 * @author niting
 * @version 2016-11-09
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaArchives")
public class OaArchivesController extends BaseController {
	private static final String PROC_DEF_KEY = "oaArchives_audit";// 流程定义标示
	@Autowired
	private OaArchivesService oaArchivesService;
	@Autowired
	private UserFavoriteService userFavoriteService;
	@Autowired
	private OaProVacateService oaProVacateService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private SysWorkflowVarService sysWorkflowVarService;
	@Autowired
	private OaNotifyService oanotifyservice;
	// 定义流程引擎
	ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
	@Autowired
	ActTaskService actTaskService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OaOvertimeService oaOvertimeService;// 抄送通知的service
	@Autowired
	private OaReceiveFileService oaReceiveFileService;

	@ModelAttribute
	public OaArchives get(@RequestParam(required = false) String id) {
		OaArchives entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaArchivesService.get(id);
		}
		if (entity == null) {
			entity = new OaArchives();
		}
		return entity;
	}

	/**
	 * 公文管理首页/列表
	 * 
	 * @param oaArchives
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaArchives:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaArchives oaArchives, String category, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		oaArchives.setCreateBy(UserUtils.getUser());
		Page<OaArchives> page = oaArchivesService.findPage(new Page<OaArchives>(request, response), oaArchives);

		model.addAttribute("page", page);

		return "modules/oa/archives/oaArchivesList";
	}

	/*
	 * 发文编辑
	 */
	@RequiresPermissions("oa:oaArchives:view")
	@RequestMapping(value = "update")
	@Token(save = true)
	public String update(OaArchives oaArchives, Model model) {
		oaReceiveFileService.addProcDefId("oaArchives_audit", model);//用於顯示流程圖
		model.addAttribute("oaArchives", oaArchives);
		model.addAttribute("createname", UserUtils.get(oaArchives.getCreateBy().getId()).getName());
		// model.addAttribute("createName2",
		// UserUtils.get(oaArchives.getCreateBy().getId()).getName());
		return "modules/oa/archives/oaArchivesUpdate";
	}

	/**
	 * 公司发文表单，查看页面
	 * 
	 * @param oaArchives
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaArchives:view")
	@RequestMapping(value = "view")
	public String view(OaArchives oaArchives, Model model) {
		
		model.addAttribute("oaArchives", oaArchives);
		model.addAttribute("createname", UserUtils.get(oaArchives.getCreateBy().getId()).getName());
//		return "modules/oa/archives/oaArchivesView";
		return "modules/oa/archives/departmentView";
	}

	/**
	 * 公司发文表单，查看页面
	 * 
	 * @param oaArchives
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaArchives:view")
	@RequestMapping(value = "detail")
	public String detail(OaArchives oaArchives, Model model) {
		oaArchives.setCreateBy(systemService.getUser(oaArchives.getCreateBy().getId()));// 为页面查询出申请人姓名
		addTask(model, oaArchives);
		model.addAttribute("oaArchives", oaArchives);
		model.addAttribute("createname", UserUtils.get(oaArchives.getCreateBy().getId()).getName());
		return "modules/oa/archives/departmentView";
	}

	/**
	 * 公司发文表单
	 * 
	 * @param oaArchives
	 * @param model
	 * @return
	 * @throws ParseException
	 */
	@RequiresPermissions("oa:oaArchives:view")
	@RequestMapping(value = "form")
	@Token(save = true)
	public String form(OaArchives oaArchives, Model model) throws ParseException {
		oaReceiveFileService.addProcDefId("oaArchives_audit", model);//用於顯示流程圖
		
		// 获取所有部门
		List<Office> officeList = officeService.findAll();
		List<List<User>> users = new ArrayList<List<User>>();
		model.addAttribute("offices", officeList);

		// 根据部门查询所在部门下所有的人
		for (Office office : officeList) {
			List<User> userList = new ArrayList<User>();
			userList = systemService.findUserByOfficeId(office.getId());
			users.add(userList);
		}
		oaArchives.setCreateBy(UserUtils.getUser());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		oaArchives.setDraftdate(sdf.parse(sdf.format(new Date())));// 获取当前时间为拟稿人核稿时间
		model.addAttribute("users", users);
		model.addAttribute("oaArchives", oaArchives);
		return "modules/oa/archives/oaArchivesForm";
	}

	@RequiresPermissions("oa:oaArchives:edit")
	@RequestMapping(value = "save")
	@Token(remove = true)
	public String save(OaArchives oaArchives, Model model, RedirectAttributes redirectAttributes,
			HttpServletRequest request, OaNotify oanotify) throws ParseException {
		String ofName = oaArchives.getCurrentUser().getOffice().getName();// 拟稿部门
		oaArchives.setExeDate(new Date());
		oaArchives.setOfficeName(ofName);
		oaArchives.setType("0");
		String st = request.getParameter("Fruit");
		String flag = request.getParameter("flag");
		oaArchives.getContent();
		
		/*String oaArchivesRecord = request.getParameter("oaArchivesRecordIds"); // 获取发送人Id
		oaArchives.setOaArchivesRecordIds(oaArchivesRecord);

		try {
			if (oaArchivesRecord != null) {
				String[] osIds = oaArchivesRecord.split(",");
				oaArchives.setOaIds(oaArchivesRecord); // 发送人id
				List<String> nameList = new ArrayList<String>();
				for (int i = 0; i < osIds.length; i++) {
					User user = systemService.getUser(osIds[i]);
					nameList.add(user.getName());
				}
				oaArchives.setOaArchivesNames(StringUtils.join(nameList, ","));
			}
		} catch (Exception e) {

		}*/

		//model.addAttribute("OaArchivesRecordNames", oaArchives.getOaArchivesNames());// 将发送人名字传到页面

		// if(oaArchivesRecord != null){
		// String[] userIds = oaArchivesRecord.split(",");
		// for (int i = 0; i < userIds.length; i++) {
		// User user = systemService.getUser(userIds[i]);
		// OaArchivesRecord oarecord = new OaArchivesRecord();
		// oarecord.setUser(user);
		// oaArchivesRecords.add(oarecord);
		// }
		// oaArchives.setOaArchivesRecordList(oaArchivesRecords);
		// oaArchives.setOaArchivesNames(oaArchives.getOaArchivesRecordNames());

		// }
		// systemService.getUser(oaArchivesRecord);
		if ("0".equals(st)) {
			// 设置编号
			if (oaArchives.getCode().length() < 7) {
				oaArchives.setCode(OrdersUtils.getGenerateOrderNo8(oaArchives.getCode()));
			}
			oaArchives.setIsdraft("1");
			oaArchivesService.save(oaArchives);
			User currentUser = oaArchives.getCurrentUser();
			Map<String, Object> variables = new HashMap<String, Object>(); 
			variables.put("apply", currentUser.getLoginName());
			String use = ActRouting.getDeputyL();
			variables.put("applyUserIds", use);
			variables.put("flag", true);
			if (StringUtils.isBlank(oaArchives.getProcInsId())) {
				// 流程关联id为null所以为第一次创建
				oaArchives.setProcInsId(actTaskService.startProcess("oaArchives_audit", "oa_archives", oaArchives.getId(),
						"发文申请【" + UserUtils.getUser().getName() + " " + DateUtils.getDate() + "】", variables));
				// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				// 执行下一步
				List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
						.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaArchives.getProcInsId())
						.list();
				if (list.size() > 0) {
					actTaskService.complete(list.get(0).getId(), oaArchives.getProcInsId(), "【提交】", null, variables);
				}
			} else {
				// 打回后，以及第一次流程启动成功后的相同步骤
				oaArchives.setLeadText(null);
				oaArchives.setManagerText(null);;
				oaArchives.setSignCwOpinion(null);
				oaArchives.setSignJsOpinion(null);
				oaArchives.setSignRsOpinion(null);
				oaArchives.setSignScOpinion(null);
				oaArchives.setSignSwOpinion(null);
				oaArchives.setSignYfOpinion(null);
				String examtext = "【重新提交】";
//				oaArchives.setIsdraft("1");// 修改状态为提交
				if (flag.equals("0")) {
					variables.put("flag", false);// 流程控制标志位 boolean
					examtext = "【作废】";
//					oaArchives.setIsdraft("4");// 修改状态为废弃
					oaArchives.setIsdraft("2");// 修改状态为废弃（属于流程完结）
					addMessage(redirectAttributes, "发文废弃成功");
				}
				List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
						.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaArchives.getProcInsId())
						.list();
				if (list.size() > 0) {
					actTaskService.complete(list.get(0).getId(), oaArchives.getProcInsId(), examtext, null, variables);
				}
			}
			String upper = officeService.get(officeService.get((UserUtils.get(oaArchives.getCreateBy().getId())).getOffice())).getPrimaryPerson().getId();
			oaArchivesService.save(oaArchives);
			oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaArchives/deplist?id=" + oaArchives.getId(),
					oaArchives.getCreateBy().getName()+"于"+ DateUtils.formatDate(oaArchives.getCreateDate()) +"申请公司发文",upper);
		} else {
			if (!beanValidator(model, oaArchives)) {
				return form(oaArchives, model);
			}
			oaArchives.setIsdraft("0");// 草稿状态
			oaArchivesService.save(oaArchives);
			addMessage(redirectAttributes, "保存成功");
			return "redirect:list";
		}
		return "redirect:" + Global.getAdminPath() + "/oa/oaArchives/?repage";
	}

	// 部门领导审核
	@RequestMapping(value = "depform")
	@Token(remove = true)
	public String depform(OaArchives oaArchives, HttpServletRequest request, HttpServletResponse response, Model model,
			RedirectAttributes redirectAttributes, String departmentsign2) {
		Map<String, Object> vars = new HashMap<String, Object>();
		// String[] subChk = request.getParameterValues("subChk");
		String i = request.getParameter("Fruit");
		String examtext = "";
		if (i.equals("2")) {
			// 驳回
			examtext = "【驳回】";
			vars.put("flag", false);
			vars.put("add", "2");
			oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaArchives/upoaArchives?id=" + oaArchives.getId(),
					"您申请的公司发文【" + DateUtils.formatDate(oaArchives.getCreateDate()) + "】已被【"+UserUtils.getUser().getName()+"】退回",
					oaArchives.getCreateBy().getId());
//			oaArchives.setIsdraft("3");// 修改状态 为驳回
			//oaArchives.setIsdraft("1");// 修改状态 为驳回（属于正在运行的流程）
		} else {
			examtext = "【通过】";
			SysWorkflowVar sysWorkflowVar = new SysWorkflowVar();// 工作流变量实体类
			sysWorkflowVar.setWorkflowIdentification("oaArchives_audit");// 流程标示
			sysWorkflowVar.setVarName("applyUserIds");
			if (oaArchives.getDepartmentsign() == null) {
//				examtext = "【通过】";
				vars.put("flag", true);
				vars.put("add", "0");
				vars.put("applyUserIds", "hutao");
			} else {
				List<String> strList = new ArrayList<String>();
				oaArchives.setDepartmentsign(departmentsign2);
				String depart = oaArchives.getDepartmentsign();
				String[] departments = depart.split(",");
				String[] pname = new String[departments.length];// 会签相关部门

				for (int j = 0; j < departments.length; j++) {
					Office officei = new Office();
					officei = officeService.get(officeService.findOfficeIdByNameL(departments[j]).get(0));
					
					String usei = UserUtils.get(officei.getPrimaryPerson().getId()).getLoginName();
					boolean exist=true;//判断是否存在
					
					
					//如果两个部门的领导是同一个人，只需要添加一个（工作台查询数据会出现查询结果返回2而不是它的最大结果1的错误）
					for (int k = 0; k < strList.size(); k++) {						
						if(strList.get(k).equals(usei)){	
							exist=false;
							break;
						}
					}
					
					if(exist==true){
						strList.add(usei);//获取会签部门领导登录名						
						pname[j] = officei.getName();//会签部门
					}
				}
			
				vars.put("applyUserIdsList", strList);
				vars.put("applyUserIds", "hutao");
				vars.put("add", "1");// 流程走向动态副总
			}
			addTask(model, oaArchives);
		}
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaArchives.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaArchives.getProcInsId(), examtext+oaArchives.getLeadText(), null, vars);
		}
		oaArchivesService.save(oaArchives);// 更新业务表字段
		addMessage(redirectAttributes, "发文提交成功");
		model.addAttribute("createname", UserUtils.get(oaArchives.getCreateBy().getId()).getName());
		return "modules/oa/archives/departmentView";
	}

	// 驳回页面
	@RequestMapping(value = "upoaArchives")
	@Token(save = true)
	public String upoaArchives(OaArchives oaArchives, HttpServletRequest request, HttpServletResponse response,
			Model model, String Fruit) throws ParseException {
		oaArchives = init(oaArchives);
		oaArchives.setCreateBy(systemService.getUser(oaArchives.getCreateBy().getId()));// 为页面查询出申请人的名字
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		oaArchives.setDraftdate(sdf.parse(sdf.format(new Date())));// 获取当前时间为拟稿人核稿时间
		model.addAttribute("oaArchives", oaArchives);
		String view = "modules/oa/archives/departmentView";
		if (oaArchivesService.isDeal(oaArchives)) {			
			view = "modules/oa/archives/upArchives";
		}
		addTitle(model, oaArchives);
		addTask(model, oaArchives);
		return view;
	}

	// 部门领导审核页面
	@RequestMapping(value = "deplist")
	@Token(save = true)
	public String deplist(OaArchives oaArchives, HttpServletRequest request, HttpServletResponse response, Model model)
			throws ParseException {
		oaArchives = init(oaArchives);
		oaArchives.setCreateBy(systemService.getUser(oaArchives.getCreateBy().getId()));// 为页面查询出申请人的名字

		oaArchives.setLeadName(UserUtils.getUser().getCurrentUser().getName());// 设置核稿人
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		oaArchives.setIssuedate(sdf.parse(sdf.format(new Date())));// 获取当前时间为核稿人核稿时间
		String view = "modules/oa/archives/departmentView";
		if (oaArchivesService.isDeal(oaArchives)) {
			view = "modules/oa/archives/departmentForm";
		}
		model.addAttribute("oaArchives", oaArchives);
		addTitle(model, oaArchives);
		addTask(model, oaArchives);
		return view;
	}

	// 公司领导审核页面
	@RequestMapping(value = "cmform")
	@Token(save = true)
	public String cmform(OaArchives oaArchives, HttpServletRequest request, HttpServletResponse response, Model model,
			String Fruit) throws ParseException {
		oaArchives = init(oaArchives);
		oaArchives.setCreateBy(systemService.getUser(oaArchives.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaArchives", oaArchives);
		String view = "modules/oa/archives/departmentView";
		if (oaArchivesService.isDeal(oaArchives)) {
			view = "modules/oa/archives/companyManagerForm";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		oaArchives.setQianfadate(sdf.parse(sdf.format(new Date())));// 获取当前时间为拟稿人核稿时间
		addTitle(model, oaArchives);
		addTask(model, oaArchives);
		return view;
	}

	@Autowired
	TaskService taskService;

	// 动态副总页面
	@RequestMapping(value = "dmform")
	@Token(save = true)
	public String dmform(OaArchives oaArchives, HttpServletRequest request, HttpServletResponse response, Model model,
			String Fruit) {
		oaArchives = init(oaArchives);
		//oaArchives.setCreateBy(systemService.getUser(oaArchives.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaArchives", oaArchives);
		String view = "modules/oa/archives/departmentView";
		if (oaArchivesService.isDeal(oaArchives)) {
			view = "modules/oa/archives/dynamicForm";
		}
		model.addAttribute("createname", UserUtils.get(oaArchives.getCreateBy().getId()).getName());
		addTitle(model, oaArchives);
		addTask(model, oaArchives);
		return view;
	}

	// 回到发起人页面
	@RequestMapping(value = "mysingform")
	@Token(save = true)
	public String mysingform(OaArchives oaArchives, HttpServletRequest request, HttpServletResponse response,
			Model model, String Fruit) throws ParseException {
		oaArchives = init(oaArchives);
		oaArchives.setCreateBy(systemService.getUser(oaArchives.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaArchives", oaArchives);
		String view = "modules/oa/archives/departmentView";
		if (oaArchivesService.isDeal(oaArchives)) {
			String cor = OrdersUtils.getGenerateOrderNo8("QB");
			model.addAttribute("cor", cor);
			view = "modules/oa/archives/myArchivesForm";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		oaArchives.setIssuingtime(sdf.parse(sdf.format(new Date())));// 获取当前时间为核稿人核稿时间
		addTitle(model, oaArchives);
		addTask(model, oaArchives);

		return view;
	}

	// 发起人分发
	@RequestMapping(value = "mysingsave")
	@Token(remove = true)
	public String mysingsave(OaArchives oaArchives, HttpServletRequest request, HttpServletResponse response,
			Model model, RedirectAttributes redirectAttributes) {
		oaArchives.setIsdraft("2");// 修改最终状态审核完成
		// String cor = request.getParameter("cor");
		// oaArchives.setCode(cor);
		Map<String, Object> vars = new HashMap<String, Object>();
		// String examtext="";

		vars.put("flag", true);

		// 更新发送接受人记录
		String nameid = request.getParameter("oaArchivesRecordIds");
		String[] i = nameid.split(",");
		OaNotify oanotify = new OaNotify();
		oanotify.setTitle("45645");// 标题
		oanotify.setContent("654564");
		oanotify.setOaNotifyRecordIds(StringUtils.join(i, ","));// 通知上级
		oanotify.setStatus("1");
		oanotify.setFiles("1");
		oanotify.setType("3");
		oanotifyservice.save(oanotify);
		oaArchivesService.save(oaArchives);

		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaArchives.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaArchives.getProcInsId(), null, null, vars);
		}
		oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaArchives/detail?id=" + oaArchives.getId(),
				"您申请的公司发文【" + DateUtils.formatDate(oaArchives.getCreateDate()) + "】已被【"+UserUtils.getUser().getName()+"】办结",
				oaArchives.getCreateBy().getId());
		oaArchivesService.save(oaArchives);// 更新业务表字段
		addMessage(redirectAttributes, "发文分发成功");
		addTask(model, oaArchives);
		return "modules/oa/archives/departmentView";
	}

	// 公司总经理审核
	@RequestMapping(value = "cmsave")
	@Token(remove = true)
	public String cmsave(OaArchives oaArchives, HttpServletRequest request, HttpServletResponse response, Model model,
			RedirectAttributes redirectAttributes, String Fruit) {
		Map<String, Object> vars = new HashMap<String, Object>();
		String examtext = "";
		if (Fruit.equals("2")) {
			// 驳回
			examtext = "【驳回】";
			vars.put("flag", false);
			oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaArchives/upoaArchives?id=" + oaArchives.getId(),
					"您申请的公司发文【" + DateUtils.formatDate(oaArchives.getCreateDate()) + "】已被【"+UserUtils.getUser().getName()+"】退回",
					oaArchives.getCreateBy().getId());
//			oaArchives.setIsdraft("3");// 修改状态 为驳回
//			oaArchives.setIsdraft("1");// 修改状态 为驳回（属于正在运行的流程）
		} else if (Fruit.equals("1")) {
			examtext = "【通过】";
//			oaArchives.setIsdraft("2");// 修改最终状态审核完成
			oaArchives.setCompleteDate(new Date());
			vars.put("flag", true);
		}
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaArchives.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaArchives.getProcInsId(), examtext+oaArchives.getManagerText(), null, vars);
		}
		
		oaArchivesService.save(oaArchives);// 更新业务表字段
		addMessage(redirectAttributes, "发文审核完成");
		addTask(model, oaArchives);
		return "modules/oa/archives/departmentView";
	}

	// 动态副总审核
	@RequestMapping(value = "departmensave")
	@Token(remove = true)
	public String departmensave(OaArchives oaArchives, HttpServletRequest request, HttpServletResponse response,
			Model model, RedirectAttributes redirectAttributes) {
		String pinion = request.getParameter("pinion");
		Map<String, Object> vars = new HashMap<String, Object>();
		String examtext = "【通过】";		
//		vars.put("flag", true);
		Task task = taskService.createTaskQuery().processInstanceId(oaArchives.getProcInsId())
				.taskAssignee(UserUtils.getUser().getLoginName()).singleResult();
//		if (task != null) {
//			actTaskService.complete(task.getId(), oaArchives.getProcInsId(), examtext, null, vars);
//		}
		
		oaArchives.getDepartmentsign();
		if (UserUtils.getUser().getLoginName().equals(WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY,"DevelopLeader", Global.getDefaultUser()))) {//研发部
			oaArchives.setSignYfOpinion(pinion);
			if (task != null) {
				actTaskService.complete(task.getId(), oaArchives.getProcInsId(), examtext+oaArchives.getSignYfOpinion(), null, vars);
			}
		} else if (UserUtils.getUser().getLoginName().equals(WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY,"TechLeader", Global.getDefaultUser()))) {//技术部
			oaArchives.setSignJsOpinion(pinion);
			if (task != null) {
				actTaskService.complete(task.getId(), oaArchives.getProcInsId(), examtext+oaArchives.getSignJsOpinion(), null, vars);
			}
		} else if (UserUtils.getUser().getLoginName().equals(WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY,"CommerceLeader", Global.getDefaultUser()))){//市场拓展部
			oaArchives.setSignSwOpinion(pinion);
			if (task != null) {
				actTaskService.complete(task.getId(), oaArchives.getProcInsId(), examtext+oaArchives.getSignSwOpinion(), null, vars);
			}
		} else if (UserUtils.getUser().getLoginName().equals(WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY,"MarketLeader", Global.getDefaultUser()))) {//市场部
			oaArchives.setSignScOpinion(pinion);
			if (task != null) {
				actTaskService.complete(task.getId(), oaArchives.getProcInsId(), examtext+oaArchives.getSignScOpinion(), null, vars);
			}
		} else if (UserUtils.getUser().getLoginName().equals(WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY,"PersonalLeader", Global.getDefaultUser()))) {//人事部
			oaArchives.setSignRsOpinion(pinion);
			if (task != null) {
				actTaskService.complete(task.getId(), oaArchives.getProcInsId(), examtext+oaArchives.getSignRsOpinion(), null, vars);
			}
		} else if (UserUtils.getUser().getLoginName().equals(WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY,"FinanceLeader", Global.getDefaultUser()))) {//财务部
			oaArchives.setSignCwOpinion(pinion);
			if (task != null) {
				actTaskService.complete(task.getId(), oaArchives.getProcInsId(), examtext+oaArchives.getSignCwOpinion(), null, vars);
			}
		}
		
		oaArchivesService.save(oaArchives);// 更新业务表字段
		addMessage(redirectAttributes, "收文审核成功");
		addTask(model, oaArchives);
		return "modules/oa/archives/departmentView";
	}

	// 打印页面
	@RequestMapping(value = "seeprint")
	public String seeprint(OaArchives oaArchives, HttpServletRequest request, HttpServletResponse response, Model model,
			String Fruit) throws ParseException {
		// oaArchives = init(oaArchives);
		oaArchives.setCreateBy(systemService.getUser(oaArchives.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaArchives", oaArchives);
		// String view = "modules/oa/archives/departmentView";
		return "modules/oa/archives/printPreview";
	}

	// 最终审核完成进入页面
	@RequiresPermissions("oa:sign:oaArchives:view")
	@RequestMapping(value = "completelist")
	public String completelist(OaArchives oaArchives, Model model) {
		model.addAttribute("oaArchives", oaArchives);
		model.addAttribute("ofName", UserUtils.get(oaArchives.getCreateBy().getId()).getOffice().getName());
		model.addAttribute("crName", UserUtils.get(oaArchives.getCreateBy().getId()).getName());
		return "modules/oa/archives/completeList";
	}

	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	private OaArchives init(OaArchives oaArchives) {
		if (oaArchives.getAct() != null && StringUtils.isNotBlank(oaArchives.getAct().getProcInsId())) {
			oaArchives = oaArchivesService.getByProcInsId(oaArchives.getAct().getProcInsId());
		}
		return oaArchives;
	}

	/** 加入流程标题 */
	private void addTitle(Model model, OaArchives oaArchives) {
		String name = null;
		String date = null;
		if (StringUtils.isNotBlank(oaArchives.getId())) {
			name = UserUtils.get(oaArchives.getCreateBy().getId()).getName();
			date = DateUtils.formatDate(oaArchives.getCreateDate());
		} else {
			name = UserUtils.getUser().getName();
			date = DateUtils.getDate();
		}
		model.addAttribute("title", "公司发文流程【" + name + " " + date + "】");
	}

	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model, OaArchives oaArchives) {
		// 如果流程已启动，给出流程图
		if (oaArchives.getProcInsId() != null
				&& oaProVacateService.getTaskByProcInsId(oaArchives.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaArchives.getProcInsId()));
		}
	}

	/**
	 * 公司收文表单
	 * 
	 * @param oaArchives
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaArchives:view")
	@RequestMapping(value = "receive")
	public String receive(OaArchives oaArchives, Model model) {
		String view = "";

		return "modules/oa/" + view;
	}

	/**
	 * 签报
	 * 
	 * @param oaArchives
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaArchives:view")
	@RequestMapping(value = "report")
	public String report(OaArchives oaArchives, Model model) {
		String view = "";

		return "modules/oa/" + view;
	}

	/**
	 * 公文查询
	 * 
	 * @param oaArchives
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaArchives:view")
	@RequestMapping(value = "query")
	public String query(OaArchives oaArchives, Model model, HttpServletRequest request, HttpServletResponse response) {
		oaArchives.setStatus("1");
		Page<OaArchives> page = oaArchivesService.findPage2(new Page<OaArchives>(request, response), oaArchives);
		model.addAttribute("page", page);
		model.addAttribute("oaArchives", oaArchives);
		HashMap<String, String> queryStateMap = new HashMap<String, String>();
		queryStateMap.put("0", "审核中");
		queryStateMap.put("1", "已完结");
		model.addAttribute("queryStateMap", queryStateMap);
		List<Dict> typeList = DictUtils.getDictList("oa_archives_type");
		if (!typeList.get(0).getValue().equals("")) {
			typeList.add(0, new Dict("", "全部"));
		}
		model.addAttribute("typeList", typeList);
		return "modules/oa/oaArchivesQuery";
	}

	/**
	 * 删除
	 * 
	 * @param oaArchives
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("oa:oaArchives:edit")
	@RequestMapping(value = "delete")
	public String delete(OaArchives oaArchives, RedirectAttributes redirectAttributes) {
		oaArchivesService.delete(oaArchives);
		addMessage(redirectAttributes, "删除公文成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaArchives/?repage";
	}

	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			// return "redirect:" + adminPath + "/sys/oaArchives/";
			return "redirect:" + Global.getAdminPath() + "/oa/oaArchives/?repage";
		}
		String idArray[] = ids.split(",");
		for (String id : idArray) {
			OaArchives menu = oaArchivesService.get(id);
			if (menu != null) {
				oaArchivesService.delete(oaArchivesService.get(id));
			}
		}

		addMessage(redirectAttributes, "删除公司发文成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaArchives/?repage";
	}
	/*	*//**
			 * 批量删除
			 * 
			 * @param request
			 * @param response
			 * @param redirectAttributes
			 * @return
			 *//*
			 * @RequiresPermissions("oa:oaArchives:edit")
			 * 
			 * @RequestMapping(value = "/deletemore", method =
			 * RequestMethod.POST) public String deleteMore(HttpServletRequest
			 * request, HttpServletResponse response, RedirectAttributes
			 * redirectAttributes) { String items =
			 * request.getParameter("delitems"); String[] item =
			 * items.split(","); for (int i = 0; i < item.length; i++) {
			 * OaArchives oaArchives = new OaArchives();
			 * oaArchives.setId(item[i]); oaArchivesService.delete(oaArchives);
			 * } addMessage(redirectAttributes, "删除公文成功"); return
			 * "redirect:list"; }
			 */

	/**
	 * 批量收藏 2016-11-16
	 * 
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("oa:oaArchives:edit")
	@RequestMapping(value = "store")
	public String store(HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		String items = request.getParameter("ids");
		System.err.println(items);
		String[] item = items.split(",");
		for (int i = 0; i < item.length; i++) {
			OaArchives oaArchives = oaArchivesService.get(item[i]);
			String title = oaArchives.getTitle();
			String type = "公文";
			String url = "/oa/oaArchives/form?id=" + item[i];
			String sign = item[i];
			UserFavorite userFavorite = new UserFavorite();
			userFavorite.setTitle(title);// 设置收藏标题
			userFavorite.setType(type);// 设置收藏类型
			userFavorite.setUrl(url);// 设置收藏url
			userFavorite.setSign(sign);
			userFavoriteService.save(userFavorite);
		}
		addMessage(redirectAttributes, "收藏公文成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaArchives/?repage";
	}

}