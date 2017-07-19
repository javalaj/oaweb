/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.sign;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.task.Task;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.annotation.Token;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.actRouting.ActRouting;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.entity.sign.OaSign;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.oa.service.OaReceiveFileService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.oa.service.sign.OaSignService;
import com.thinkgem.jeesite.modules.oa.web.util.TaskUtil;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.entity.UserFavorite;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;

/**
 * 签报Controller
 * 
 * @author cz
 * @version 2016-12-20
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/sign/oaSign")
public class OaSignController extends BaseController {
	@Autowired
	private OaSignService oaSignService;
	@Autowired
	private OaReceiveFileService oaReceiveFileService;
	@ModelAttribute
	public OaSign get(@RequestParam(required = false) String id) {
		OaSign entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaSignService.get(id);
		}
		if (entity == null) {
			entity = new OaSign();
		}
		return entity;
	}

	@RequiresPermissions("oa:sign:oaSign:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaSign oaSign, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaSign.setCreateBy(UserUtils.getUser());
		Page<OaSign> pagei = oaSignService.findPage(new Page<OaSign>(request, response), oaSign);
		Page<OaSign> page = oaSignService.findPage(new Page<OaSign>(request, response), oaSign);
		List<OaSign> list = page.getList();
		for (int i = 0; i < list.size(); i++) {
			String uid = list.get(i).getCreateBy().getId();
			User createBy = UserUtils.get(uid);// 通过用户id获取用户信息
			list.get(i).setCreateBy(createBy);
		}
		pagei.setList(list);
		model.addAttribute("page", pagei);
		return "modules/oa/sign/oaSignList";
	}

	@RequiresPermissions("oa:sign:oaSign:view")
	@RequestMapping(value = "form")
	public String form(OaSign oaSign, Model model) {
		oaReceiveFileService.addProcDefId("signProcess", model);
		String ofName = oaSign.getCurrentUser().getOffice().getName();// 拟稿部门

		String crName = UserUtils.get(oaSign.getCurrentUser().getId()).getName();// 拟稿人
		model.addAttribute("oaSign", oaSign);
		model.addAttribute("crName", crName);
		model.addAttribute("ofName", ofName);

		return "modules/oa/sign/oaSignForm";
	}

	// 定义流程引擎
	ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
	@Autowired
	ActTaskService actTaskService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OaProVacateService oaProVacateService;

	@RequiresPermissions("oa:sign:oaSign:edit")
	@RequestMapping(value = "save")
	public String save(OaSign oaSign, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request,
			OaNotify oanotify) {
		String ofName = oaSign.getCurrentUser().getOffice().getName();// 拟稿部门
		oaSign.setDate(new Date());
		oaSign.setOfficeName(ofName);
		oaSign.setType("2");
		String st = request.getParameter("Fruit");
		String flag = request.getParameter("flag");
		if (st.equals("0")) {
			oaSign.setSignState("1");
			oaSignService.save(oaSign);
			User currentUser = oaSign.getCurrentUser();
			String processDefinitionKey = "signProcess";// 流程key
			Map<String, Object> variables = new HashMap<String, Object>();
			variables.put("apply", currentUser.getLoginName());
//			String use = UserUtils.get(currentUser.getOffice().getPrimaryPerson().getId()).getLoginName();
			variables.put("applyUserIds",ActRouting.getUpper(UserUtils.getUser().getId()));
			variables.put("flag", true);
			if (StringUtils.isBlank(oaSign.getProcInsId())) {
				// 流程关联id为null所以为第一次创建
				oaSign.setProcInsId(actTaskService.startProcess(processDefinitionKey, "oa_sign", oaSign.getId(),
						"签报申请【" + oaSign.getSignTitile() + " " + DateUtils.getDate() + "】", variables));
				// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				// 执行下一步
				List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
						.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaSign.getProcInsId())
						.list();
				if (list.size() > 0) {
					actTaskService.complete(list.get(0).getId(), oaSign.getProcInsId(), "【申请】", null, variables);
				}
			} else {
				// 打回后，以及第一次流程启动成功后的相同步骤
				String examtext = "【重新提交】";
				if (flag.equals("1")) {
					variables.put("flag", false);// 流程控制标志位 boolean
					examtext = "【作废】";
//					oaSign.setSignState("4");// 修改状态为废弃
					oaSign.setSignState("4");// 修改状态为废弃
					addMessage(redirectAttributes, "签报废弃成功");
				}
				List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
						.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaSign.getProcInsId())
						.list();
				if (list.size() > 0) {
					actTaskService.complete(list.get(0).getId(), oaSign.getProcInsId(), examtext, null, variables);
				}
			}
			addMessage(redirectAttributes, "提交签报成功");
			oaSignService.save(oaSign);

		} else {
			if (!beanValidator(model, oaSign)) {
				return form(oaSign, model);
			}
			oaSign.setSignState("0");// 草稿状态
			if(oaSign.getId().equals("")){
				addMessage(redirectAttributes, "保存签报成功");
			}else{
				addMessage(redirectAttributes, "修改签报成功");
			}
			oaSignService.save(oaSign);
			
		}
		return "redirect:" + Global.getAdminPath() + "/oa/sign/oaSign/?repage";
	}

	// 部门领导审核
	@RequestMapping(value = "depform")
	@Token(remove = true)
	public String depform(OaSign oaSign, HttpServletRequest request, HttpServletResponse response, Model model,
			RedirectAttributes redirectAttributes) {
		Map<String, Object> vars = new HashMap<String, Object>();
		String[] subChk = request.getParameterValues("subChk");
		String i = request.getParameter("Fruit");
		String examtext = "";
		if (i.equals("2")) {
			// 驳回
			String getSignHeadOpinion=oaSign.getSignHeadOpinion();
			examtext = "【驳回】"+"-【"+getSignHeadOpinion+"】";
			vars.put("cz", "0");
			vars.put("flag", false);
			oaSign.setSignState("1");// 修改状态 为驳回
		} else {
			if (subChk == null) {
				String getSignHeadOpinion=oaSign.getSignHeadOpinion();
				examtext = "【通过】"+"-【"+getSignHeadOpinion+"】";
				vars.put("flag", true);
				vars.put("cz", "0");
				vars.put("applyUserIds", UserUtils.get(oaSign.getCreateBy().getId()).getLoginName());
			} else {
				List<String> strList = new ArrayList<String>();
				String[] pname = new String[subChk.length];// 会签相关部门
				for (int j = 0; j < subChk.length; j++) {
					Office officei = new Office();
					String offnamei = subChk[j];
					officei = officeService.get(offnamei);
					String usei = UserUtils.get(officei.getPrimaryPerson().getId()).getLoginName();
					strList.add(usei);
					pname[j] = officei.getName();
				}
				String pnamee = StringUtils.join(pname, ",");
				oaSign.setpName(pnamee);
				String getSignHeadOpinion=oaSign.getSignHeadOpinion();
				examtext = "【通过】"+"-【"+getSignHeadOpinion+"】";
				vars.put("applyUserIdsList", strList);
				vars.put("applyUserIds", UserUtils.get(oaSign.getCreateBy().getId()).getLoginName());
				vars.put("cz", "1");// 流程走向动态副总

			}
		}
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaSign.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaSign.getProcInsId(), examtext, null, vars);
		}
		
			if(i.equals("2")){
				 Task ta=TaskUtil.task(oaSign.getProcInsId());
				OaNotify oanotify = new OaNotify();
				oanotify.setTitle("您提交的签报流程 【"+DateUtils.getDate()+"】已被【"+UserUtils.getUser().getUsername()+"】驳回");// 标题
				oanotify.setType("4");// 设置成协同通知
				oanotify.setStatus("1");
				oanotify.setOaNotifyRecordIds(oaSign.getCreateBy().getId());// 通知
				oanotify.setContent("@@proNotify@@/oa/a/act/task/form?taskId="+ta.getId()+"&taskDefKey="+ta.getTaskDefinitionKey()+"&commid="+ta.getDescription()+"&procInsId="+ta.getProcessInstanceId()+"&procDefId="+ta.getProcessDefinitionId());
				oanotifyservice.save(oanotify);
			}
		oaSignService.save(oaSign);// 更新业务表字段
		addMessage(redirectAttributes, "签报审核成功");
		return "modules/oa/sign/departmentView";
	}

	// 驳回页面
	@RequestMapping(value = "upSign")
	@Token(save = true)
	public String upsign(OaSign oaSign, HttpServletRequest request, HttpServletResponse response, Model model,
			String Fruit) {
		oaSign = init(oaSign);
		oaSign.setCreateBy(systemService.getUser(oaSign.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaSign", oaSign);
		String view = "modules/oa/sign/departmentView";
		if (oaSignService.isDeal(oaSign)) {
			view = "modules/oa/sign/upSign";
		}
		addTitle(model, oaSign);
		addTask(model, oaSign);
		return view;
	}

	// 公司领导审核页面
	@RequestMapping(value = "cmform")
	@Token(save = true)
	public String cmform(OaSign oaSign, HttpServletRequest request, HttpServletResponse response, Model model,
			String Fruit) {
		oaSign = init(oaSign);
		oaSign.setCreateBy(systemService.getUser(oaSign.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaSign", oaSign);
		model.addAttribute("text", 	StringEscapeUtils.unescapeHtml(oaSign.getSignText()));
		String view = "modules/oa/sign/departmentView";
		if (oaSignService.isDeal(oaSign)) {
			view = "modules/oa/sign/companyManagerForm";
		}
		addTitle(model, oaSign);
		addTask(model, oaSign);
		return view;
	}

	@Autowired
	TaskService taskService;

	// 动态副总页面
	@RequestMapping(value = "dmform")
	@Token(save = true)
	public String dmform(OaSign oaSign, HttpServletRequest request, HttpServletResponse response, Model model,
			String Fruit) {
		oaSign = init(oaSign);
		oaSign.setCreateBy(systemService.getUser(oaSign.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("text", 	StringEscapeUtils.unescapeHtml(oaSign.getSignText()));
		model.addAttribute("oaSign", oaSign);
		String view = "modules/oa/sign/departmentView";
		if (oaSignService.isDeal(oaSign)) {
			view = "modules/oa/sign/dynamicForm";
		}
		addTitle(model, oaSign);
		addTask(model, oaSign);
		return view;
	}

	// 回到发起人页面
	@RequestMapping(value = "mysingform")
	@Token(save = true)
	public String mysingform(OaSign oaSign, HttpServletRequest request, HttpServletResponse response, Model model,
			String Fruit) {
		oaSign = init(oaSign);
		
		oaSign.setCreateBy(systemService.getUser(oaSign.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaSign", oaSign);
		model.addAttribute("text", 	StringEscapeUtils.unescapeHtml(oaSign.getSignText()));
		String view = "modules/oa/sign/departmentView";
		if (oaSignService.isDeal(oaSign)) {
			String cor = OrdersUtils.getGenerateOrderNo8("QB");
			model.addAttribute("cor", cor);
			view = "modules/oa/sign/mySignForm";
		}

		addTitle(model, oaSign);
		addTask(model, oaSign);

		return view;
	}

	// 部门领导审核页面
	@RequestMapping(value = "deplist")
	@Token(save = true)
	public String deplist(OaSign oaSign, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaSign = init(oaSign);
		oaSign.setCreateBy(systemService.getUser(oaSign.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("text", 	StringEscapeUtils.unescapeHtml(oaSign.getSignText()));
		model.addAttribute("oaSign", oaSign);
		String view = "modules/oa/sign/departmentView";
		if (oaSignService.isDeal(oaSign)) {
			view = "modules/oa/sign/departmentForm";
		}
		addTitle(model, oaSign);
		addTask(model, oaSign);
		return view;
	}

	// 发起人审核
	@RequestMapping(value = "mysingsave")
	@Token(remove = true)
	public String mysingsave(OaSign oaSign, HttpServletRequest request, HttpServletResponse response, Model model,
			RedirectAttributes redirectAttributes) {
		String st = request.getParameter("Fruit");
		String cor = request.getParameter("cor");
		oaSign.setCode(cor);
		Map<String, Object> vars = new HashMap<String, Object>();
		String examtext = "";
		if (st.equals("1")) {
			examtext = "【通过】";
			vars.put("flag", true);
			vars.put("applyUserIds", "hutao");// 添加总经理审核 胡涛
		} else {

			examtext = "【驳回】";
			vars.put("flag", false);
		}
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaSign.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaSign.getProcInsId(), examtext, null, vars);
		}
		oaSignService.save(oaSign);// 更新业务表字段
		addMessage(redirectAttributes, "签报审核成功");
		return "modules/oa/sign/departmentView";
	}

	@Autowired
	private OaNotifyService oanotifyservice;// 通告service

	// 公司领导审核
	@RequestMapping(value = "cmsave")
	@Token(remove = true)
	public String cmsave(OaNotify oanotify, OaSign oaSign, HttpServletRequest request, HttpServletResponse response,
			Model model, RedirectAttributes redirectAttributes, String Fruit) {
		Map<String, Object> vars = new HashMap<String, Object>();
		String examtext = "";

		if (Fruit.equals("2")) {
			// 驳回
           String getSignLdOpinion=oaSign.getSignLdOpinion();
			examtext = "【驳回】"+"-【"+getSignLdOpinion+"】";
			vars.put("flag", false);
			oaSign.setSignState("1");// 修改状态 为驳回
		} else if (Fruit.equals("1")) {
			 String getSignLdOpinion=oaSign.getSignLdOpinion();
			examtext = "【通过】"+"-【"+getSignLdOpinion+"】";
			oaSign.setSignState("2");// 修改最终状态审核完成
			oaSign.setCompleteDate(new Date());
			vars.put("flag", true);
		}
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaSign.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaSign.getProcInsId(), examtext, null, vars);
		}
		 Task ta=TaskUtil.task(oaSign.getProcInsId());
			if(Fruit.equals("2")){
				oanotify = new OaNotify();
				oanotify.setTitle("您提交的签报流程 【"+DateUtils.getDate()+"】已被【"+UserUtils.getUser().getUsername()+"】驳回");// 标题
				oanotify.setType("4");// 设置成协同通知
				oanotify.setStatus("1");
				oanotify.setOaNotifyRecordIds(oaSign.getCreateBy().getId());// 通知
				oanotify.setContent("@@proNotify@@/oa/a/act/task/form?taskId="+ta.getId()+"&taskDefKey="+ta.getTaskDefinitionKey()+"&commid="+ta.getDescription()+"&procInsId="+ta.getProcessInstanceId()+"&procDefId="+ta.getProcessDefinitionId());
				oanotifyservice.save(oanotify);
		}
			else{
				oanotify = new OaNotify();
				oanotify.setTitle("您提交的签报流程 【"+DateUtils.getDate()+"】已被【"+UserUtils.get(oaSign.getCreateBy().getId()).getName()+"】通过");// 标题
				oanotify.setType("4");// 设置成协同通知
				oanotify.setStatus("1");
				oanotify.setOaNotifyRecordIds(oaSign.getCreateBy().getId());// 通知
				oanotifyservice.save(oanotify);
			}
		oaSignService.save(oaSign);// 更新业务表字段
		addMessage(redirectAttributes, "签报审核成功");
		return "modules/oa/sign/departmentView";
	}

	// 动态副总审核
	@RequestMapping(value = "departmensave")
	@Token(remove = true)
	public String departmensave(OaSign oaSign, HttpServletRequest request, HttpServletResponse response, Model model,
			RedirectAttributes redirectAttributes) {
		String pinion = request.getParameter("pinion");
		Task task1 = taskService.createTaskQuery().processInstanceId(oaSign.getProcInsId())
				.taskAssignee(UserUtils.getUser().getLoginName()).singleResult();
		if (task1 != null) {
			taskService.complete(task1.getId());
		}
		String offname = oaSign.getCurrentUser().getOffice().getName();
		List<Office> offices = officeService.findByParentIdsplan(oaSign.getCurrentUser().getId());
	  for(int i=0;i<offices.size();i++){
		  if (offices.get(i).getName().equals("研发部")) {
				oaSign.setSignYfOpinion(pinion);
//			} else if (offices.get(i).getName().equals("技术部")) {
//				oaSign.setSignJsOpinion(pinion);
			} else if (offices.get(i).getName().equals("市场拓展部")) {
				oaSign.setSignSwOpinion(pinion);
			} else if (offices.get(i).getName().equals("市场部")) {
				oaSign.setSignScOpinion(pinion);
			} else if (offices.get(i).getName().equals("人事行政部")) {
				oaSign.setSignRsOpinion(pinion);
			} else if (offices.get(i).getName().equals("财务部")) {
				oaSign.setSignCwOpinion(pinion);
			}
	  }
		
		oaSignService.save(oaSign);// 更新业务表字段
		addMessage(redirectAttributes, "签报审核成功");
		return "modules/oa/sign/departmentView";
	}

	// 最终审核完成进入页面
	@RequiresPermissions("oa:sign:oaSign:view")
	@RequestMapping(value = "completelist")
	public String completelist(OaSign oaSign, Model model) {
		addTitle(model, oaSign);
		addTask(model, oaSign);
		model.addAttribute("oaSign", oaSign);
		model.addAttribute("text", 	StringEscapeUtils.unescapeHtml(oaSign.getSignText()));
		model.addAttribute("ofName", UserUtils.get(oaSign.getCreateBy().getId()).getOffice().getName());
		model.addAttribute("crName", UserUtils.get(oaSign.getCreateBy().getId()).getName());
		return "modules/oa/sign/completeList";
	}
	
	
	//审核完返回页面
	@RequestMapping(value = "ProcInsIdcompletelist")
	public String ProcInsIdcompletelist(OaSign oaSign, Model model,String procInsId ) {
		oaSign=oaSignService.getByProcInsId(procInsId);
		String view = "modules/oa/sign/departmentView";
		addTitle(model, oaSign);
		addTask(model, oaSign);
		model.addAttribute("oaSign", oaSign);
		return view;
	}
	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	private OaSign init(OaSign oaSign) {
		if (oaSign.getAct() != null && StringUtils.isNotBlank(oaSign.getAct().getProcInsId())) {
			oaSign = oaSignService.getByProcInsId(oaSign.getAct().getProcInsId());
		}
		return oaSign;
	}

	/** 加入流程标题 */
	private void addTitle(Model model, OaSign oaSign) {
		String name = null;
		String date = null;
		if (StringUtils.isNotBlank(oaSign.getId())) {
			name = UserUtils.get(oaSign.getCreateBy().getId()).getName();
			date = DateUtils.formatDate(oaSign.getCreateDate());
		} else {
			name = UserUtils.getUser().getName();
			date = DateUtils.getDate();
		}
		model.addAttribute("title", "签报申请流程【" + name + " " + date + "】");
	}

	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model, OaSign oaSign) {
		// 如果流程已启动，给出流程图
		if (oaSign.getProcInsId() != null && oaProVacateService.getTaskByProcInsId(oaSign.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaSign.getProcInsId()));
		}
	}

	// 删除
	@RequiresPermissions("oa:sign:oaSign:edit")
	@RequestMapping(value = "delete")
	public String delete(OaSign oaSign, RedirectAttributes redirectAttributes, HttpServletRequest request,Model model) {
		String items = request.getParameter("delitem");
		String[] item = items.split(",");
		for (int i = 0; i < item.length; i++) {
			oaSign.setId(item[i]);
			oaSignService.delete(oaSign);
		}
		addMessage(redirectAttributes, "删除签报成功");
		return "redirect:list";
	}

	@Autowired
	private UserFavoriteService userFavoriteService;

	// 收藏
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public String store(HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {

		String items = request.getParameter("delitem");
		String[] item = items.split(",");
		for (int i = 0; i < item.length; i++) {
			OaSign oaSign = oaSignService.get(item[i]);
			String title = oaSign.getSignTitile();
			String type = "签报";
			String sign = item[i];
			String url = "/oa/sign/oaSign/completelist?id=" + item[i];
			UserFavorite userFavorite = new UserFavorite();
			userFavorite.setTitle(title);// 设置收藏标题
			userFavorite.setType(type);// 设置收藏类型
			userFavorite.setUrl(url);// 设置收藏url
			userFavorite.setSign(sign);
			userFavoriteService.save(userFavorite);

		}
		return "redirect:list";
	}

	@Autowired
	private OfficeService officeService;

}