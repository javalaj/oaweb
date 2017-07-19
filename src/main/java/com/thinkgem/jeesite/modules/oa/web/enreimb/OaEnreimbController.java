/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.enreimb;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.actRouting.ActRouting;
import com.thinkgem.jeesite.modules.oa.entity.EnreimbJson;
import com.thinkgem.jeesite.modules.oa.entity.enreimb.OaEnreimb;
import com.thinkgem.jeesite.modules.oa.entity.enreimb.OaEnreimbdetail;
import com.thinkgem.jeesite.modules.oa.oaUtils.MoneyUtils;
import com.thinkgem.jeesite.modules.oa.service.OaOvertimeService;
import com.thinkgem.jeesite.modules.oa.service.OaReceiveFileService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.oa.service.enreimb.OaEnreimbService;
import com.thinkgem.jeesite.modules.oa.service.enreimb.OaEnreimbdetailService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.service.workflow.SysWorkflowVarService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 招待费报销申请Controller
 * @author niting
 * @version 2017-04-28
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/enreimb/oaEnreimb")
public class OaEnreimbController extends BaseController{
	/** OaEnreimb业务层 */
	@Autowired
	private OaEnreimbService oaEnreimbService;
	@Autowired
	private OaEnreimbdetailService oaEnreimbdetailService;
	@Autowired
	private OaProVacateService oaProVacateService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private SysWorkflowVarService sysWorkflowVarService;// 工作流变量service
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private OaOvertimeService oaOvertimeService;// 抄送通知的service
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回交接操作service
	@Autowired
	private SystemService systemService;
	@Autowired
	private OaReceiveFileService oaReceiveFileService;
	/**
	 * 获取对象
	 */
	@ModelAttribute
	public OaEnreimb get(@RequestParam(required=false) String id) {
		OaEnreimb entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaEnreimbService.get(id);
		}
		if (entity == null){
			entity = new OaEnreimb();
		}
		return entity;
	}
	
	/**
	 * 保存列表页面
	 */
	@RequiresPermissions("oa:enreimb:oaEnreimb:list")
	@RequestMapping(value = {"list", ""})
	public String list(OaEnreimb oaEnreimb, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaEnreimb> page = oaEnreimbService.findPage(new Page<OaEnreimb>(request, response), oaEnreimb); 
		model.addAttribute("page", page);
		return "modules/oa/enreimb/oaEnreimbList";
	}

	@RequestMapping(value = "view")
	public String detail(OaEnreimb oaEnreimb, Model model) {
		oaEnreimb.setCreateBy(systemService.getUser(oaEnreimb.getCreateBy().getId()));// 为页面查询出申请人姓名
		List<OaEnreimbdetail> oaEnList = null;
		OaEnreimbdetail oaEnreimbdetail = new OaEnreimbdetail();
		oaEnreimbdetail.setOaEnrId(oaEnreimb.getId());
		oaEnList = oaEnreimbdetailService.findList(oaEnreimbdetail);
		addTask(model, oaEnreimb);
		model.addAttribute("oaEnreimb", oaEnreimb);
		model.addAttribute("listOaEnter", oaEnList);
//		model.addAttribute("createname", UserUtils.get(oaPublicPrivateCars.getCreateBy().getId()).getName());
		return "modules/oa/enreimb/oaEnreimbView";
	}
	
	/**
	 * 查看，增加，编辑成功表单页面
	 */
	@RequiresPermissions(value={"oa:enreimb:oaEnreimb:view","oa:enreimb:oaEnreimb:add","oa:enreimb:oaEnreimb:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(OaEnreimb oaEnreimb, Model model,String node) {
		oaReceiveFileService.addProcDefId("oa_enreimb", model);
		String view = "modules/oa/enreimb/oaEnreimbView";
		
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaEnreimb.getProcInsId()));
				
		List<OaEnreimbdetail> oaEnList = null;
		
		/* 流程结束获取流程信息 */
		if (StringUtils.isNotBlank(oaEnreimb.getAct().getProcInsId()) && StringUtils.isBlank(oaEnreimb.getProcInsId())) {
			oaEnreimb = oaEnreimbService.getByProcInsId(oaEnreimb.getAct().getProcInsId());
		}
	
		if(StringUtils.isBlank(oaEnreimb.getProcInsId())){
			view= "modules/oa/enreimb/oaEnreimbForm";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaEnreimb.getProcInsId());
		}else{
			OaEnreimbdetail oaEnreimbdetail = new OaEnreimbdetail();
			//oaEnreimb.setCreateBy(UserUtils.get(oaEnreimb.getCreateBy().getId()));// 为页面查询出申请人的名字
			oaEnreimbdetail.setOaEnrId(oaEnreimb.getId());
			oaEnList = oaEnreimbdetailService.findList(oaEnreimbdetail);
		}
		
		addTitle(model,oaEnreimb);
		addTask(model,oaEnreimb);
		model.addAttribute("node", node);
		model.addAttribute("oaEnreimb", oaEnreimb);
		model.addAttribute("listOaEnter", oaEnList);
		
		//task工作台是否为空，如果为空说明没有你这个流程的记录需要处理
		Task task =null;		
		try {
			if(StringUtils.isNotBlank(oaEnreimb.getProcInsId())){
				task = taskService.createTaskQuery().taskAssignee(UserUtils.getUser().getLoginName())
						.processInstanceId(oaEnreimb.getProcInsId()).active().singleResult();
			}			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if (task != null) {
			view= "modules/oa/enreimb/oaEnreimbForm";
		}
		return view;
//		return "modules/oa/enreimb/oaEnreimbForm";
	}

	/**
	 * 保存成功
	 * node:当前节点    fruit：页面选择是否    examtext：意见
	 */
	@RequiresPermissions(value={"oa:enreimb:oaEnreimb:add","oa:enreimb:oaEnreimb:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")	
	@ResponseBody	
	public String save(@RequestBody EnreimbJson enreimbjson, Model model, RedirectAttributes redirectAttributes) throws Exception{
				
		if(StringUtils.isNotBlank(enreimbjson.getLog().getProcInsId())){
			//enreimbjson.getLog().setCreateBy(UserUtils.get(enreimbjson.getLog().getCreateBy().getId()));// 为页面查询出申请人的名字
			enreimbjson.getLog().setCreateBy(UserUtils.get(enreimbjson.getEnutil().getCreatename()));
			enreimbjson.getLog().setCreateDate(enreimbjson.getEnutil().getCdate());
		}
						
		double moneyDouble = 0;
		for (int i = 0; i < enreimbjson.getList().size(); i++) {
			moneyDouble =moneyDouble+ Double.parseDouble(enreimbjson.getList().get(i).getMeals())+Double.parseDouble(enreimbjson.getList().get(i).getAlcoholtobacco());
		}
		enreimbjson.getLog().setMoneyDouble(String.valueOf(moneyDouble));
		if (StringUtils.isNotBlank(enreimbjson.getLog().getMoneyDouble())) {
			// 人民币小写转换成大写
			enreimbjson.getLog().setMoneyString(MoneyUtils.convertMoney(Double.parseDouble(enreimbjson.getLog().getMoneyDouble())));
		}
		oaEnreimbService.save(enreimbjson.getLog());// 该步骤为默认继承步骤，直接保存该记录。
		
		
		Map<String, Object> vars = new HashMap<String, Object>();
		String flag = "";
		
		//判断是否同意
		if(("1").equals(enreimbjson.getEnutil().getFruit())){
			vars.put("flag", false);
			flag="【不同意】";
			oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/enreimb/oaEnreimb/form?node=0&id=" + enreimbjson.getLog().getId(),
					"您提交的招待费报销申请【" + DateUtils.formatDate(enreimbjson.getLog().getCreateDate()) + "】已被【"+UserUtils.getUser().getName()+"】退回",
					enreimbjson.getLog().getCreateBy().getId());
		}else if(("0").equals(enreimbjson.getEnutil().getFruit())){
			vars.put("flag", true);
			flag="【同意】";
		}else{
			vars.put("flag", true);//第一次申请时，fruit为空
		}
						
		//判断流程是否在申请人节点，申请人申请状态
		if(("0").equals(enreimbjson.getEnutil().getNode())){
			if(StringUtils.isBlank(enreimbjson.getLog().getProcInsId())){
				enreimbjson.getEnutil().setExamtext("【提交申请】");
				enreimbjson.getEnutil().setCreatename(UserUtils.getUser().getName());
			}else{
				if(("1".equals(enreimbjson.getEnutil().getIscancel()))){
					vars.put("flag", false);
					enreimbjson.getEnutil().setExamtext("【作废】");
				}else{
					enreimbjson.getEnutil().setExamtext("【重新提交】");
					Date date = new Date();
					enreimbjson.getLog().setCreateDate(date);
					enreimbjson.getLog().setCwtext(null);
					enreimbjson.getLog().setCwname(null);
				}
			}			
		}else if(("3").equals(enreimbjson.getEnutil().getNode())){
			enreimbjson.getLog().setCwname(UserUtils.getUser().getName());
			enreimbjson.getLog().setCwtext(flag + enreimbjson.getEnutil().getExamtext());
			enreimbjson.getEnutil().setExamtext(flag + enreimbjson.getEnutil().getExamtext());
			if(("0").equals(enreimbjson.getEnutil().getFruit())){
				flag="【同意】";
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/enreimb/oaEnreimb/form?id=" + enreimbjson.getLog().getId(),
						"您提交的招待费报销申请【" + DateUtils.formatDate(enreimbjson.getLog().getCreateDate()) + "】已被【"+UserUtils.getUser().getName()+"】办结",
						enreimbjson.getLog().getCreateBy().getId());
			}
		}else{
			enreimbjson.getEnutil().setExamtext(flag + enreimbjson.getEnutil().getExamtext());
		}
		
		if(StringUtils.isBlank(enreimbjson.getLog().getProcInsId())){
			vars.put("apply", UserUtils.getUser().getLoginName());//获取申请人
			if(UserUtils.getUser().getOffice().getParentId().equals("1") || UserUtils.getUser().getOffice().getParentId().equals("0")){
				vars.put("next", false);
				vars.put("manager",WorkflowUtils.getWorkflowVarValue("oa_enreimb", "manager", Global.getDefaultUser()));// 总经理
			}else{
				vars.put("next", true);			
				vars.put("upper",ActRouting.getUpper(UserUtils.getUser().getId()));// 获取上级领导登录名
			}
			vars.put("finance", WorkflowUtils.getWorkflowVarValue("oa_enreimb", "finance", Global.getDefaultUser()));// 财务审核
			
			enreimbjson.getLog().setProcInsId(actTaskService.startProcess("oa_enreimb", "oa_enreimb", enreimbjson.getLog().getId(),
				"招待费报销申请流程【" + UserUtils.getUser().getName() +   DateUtils.formatDate(new Date()) + "】", vars));
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(enreimbjson.getLog().getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), enreimbjson.getLog().getProcInsId(), enreimbjson.getEnutil().getExamtext(), null, vars);
			if(("0").equals(enreimbjson.getEnutil().getNode())){
				if(StringUtils.isBlank(enreimbjson.getList().get(0).getId())){
					// 流程撤回操作数据设置
					oaFlowBackService.saveINIT(enreimbjson.getLog().getProcInsId(), list.get(0),
					"/oa/enreimb/oaEnreimb/view?id=" + enreimbjson.getLog().getId());
				}else if(("1".equals(enreimbjson.getEnutil().getIscancel()))){
					// 流程撤回操作数据设置(作废)
					oaFlowBackService.saveNULL(enreimbjson.getLog().getProcInsId());
				}else if(("0".equals(enreimbjson.getEnutil().getIscancel()))){
					// 流程撤回操作数据设置(重新提交)
					oaFlowBackService.saveNOW(enreimbjson.getLog().getProcInsId(),list.get(0));
				}
			}else if(("3").equals(enreimbjson.getEnutil().getNode())){
				if(("0").equals(enreimbjson.getEnutil().getFruit())){
					// 流程撤回操作数据设置(办结)
					oaFlowBackService.saveNULL(enreimbjson.getLog().getProcInsId());
				}else{
					// 流程撤回操作数据设置(打回)
					oaFlowBackService.saveNOW(enreimbjson.getLog().getProcInsId(),list.get(0));
				}
			}else{
				// 流程撤回操作数据设置
				oaFlowBackService.saveNOW(enreimbjson.getLog().getProcInsId(),list.get(0));
			}
		}
		
		addTitle(model,enreimbjson.getLog());
		addTask(model,enreimbjson.getLog());
		oaEnreimbService.save(enreimbjson.getLog());//保存	
		Iterator<OaEnreimbdetail> it = enreimbjson.getList().iterator();
		while(it.hasNext()){
			OaEnreimbdetail oaEnDetail = it.next();
			oaEnDetail.setOaEnrId(enreimbjson.getLog().getId());
			oaEnreimbdetailService.save(oaEnDetail);
		}
		//model.addAttribute("listOaEnter", enreimbjson.getList());
		model.addAttribute("id", enreimbjson.getLog().getId());
		String id=enreimbjson.getLog().getId();
		return id;
	}
	
	/**
	 * 删除成功
	 */
	@RequiresPermissions("oa:enreimb:oaEnreimb:del")
	@RequestMapping(value = "delete")
	public String delete(OaEnreimb oaEnreimb, RedirectAttributes redirectAttributes) {
		oaEnreimbService.delete(oaEnreimb);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:"+Global.getAdminPath()+"/oa/enreimb/oaEnreimb/?repage";
	}
	
	/**
	 * 批量删除成功
	 */
	@RequiresPermissions("oa:enreimb:oaEnreimb:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			oaEnreimbService.delete(oaEnreimbService.get(id));
		}
		addMessage(redirectAttributes, "删除保存成功成功");
		return "redirect:"+Global.getAdminPath()+"/oa/enreimb/oaEnreimb/?repage";
	}
	
	/**
	 * 导出excel文件
	 */
	@RequiresPermissions("oa:enreimb:oaEnreimb:export")
    @RequestMapping(value = "export", method=RequestMethod.POST)
    public String exportFile(OaEnreimb oaEnreimb, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "保存成功"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<OaEnreimb> page = oaEnreimbService.findPage(new Page<OaEnreimb>(request, response, -1), oaEnreimb);
    		new ExportExcel("保存成功", OaEnreimb.class).setDataList(page.getList()).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出记录失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/oa/enreimb/oaEnreimb/?repage";
    }

	/**
	 * 导入Excel数据
	 */
	@RequiresPermissions("oa:enreimb:oaEnreimb:import")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<OaEnreimb> list = ei.getDataList(OaEnreimb.class);
			for (OaEnreimb oaEnreimb : list){
				try{
					oaEnreimbService.save(oaEnreimb);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条保存成功记录。");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条保存成功记录"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入保存成功失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/oa/enreimb/oaEnreimb/?repage";
    }
	
	/**
	 * 下载导入保存成功数据模板
	 */
	@RequiresPermissions("oa:enreimb:oaEnreimb:import")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "保存成功数据导入模板.xlsx";
    		List<OaEnreimb> list = Lists.newArrayList(); 
    		new ExportExcel("保存成功数据", OaEnreimb.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/oa/enreimb/oaEnreimb/?repage";
    }
 
 	/*-------------------------------------参数--------------------------------------------*/
	

    
	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	public OaEnreimb init(OaEnreimb oaEnreimb) {
		if (oaEnreimb.getAct() != null && StringUtils.isNotBlank(oaEnreimb.getAct().getProcInsId())) {
			oaEnreimb = oaEnreimbService.getByProcInsId(oaEnreimb.getAct().getProcInsId());
		}
		return oaEnreimb;
	}
	
	/**
	 * 加入流程标题
	 */
	public void addTitle(Model model,OaEnreimb oaEnreimb){
		String name = null;
		String date = null;
		if(StringUtils.isNotBlank(oaEnreimb.getId())){  //如果不为空获取创建人和创建时间
			name = UserUtils.get(oaEnreimb.getCreateBy().getId()).getName();
			date = DateUtils.formatDate( oaEnreimb.getCreateDate());
		}else{
			name = UserUtils.getUser().getName(); //获取当前用户
			date = DateUtils.getDate(); //获取当前时间
		}
		model.addAttribute("title", "招待费报销申请流程【" + name + " " + date + "】");
	}
	
	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model,OaEnreimb oaEnreimb) {
		// 如果流程已启动，给出流程图
		if (oaEnreimb.getProcInsId() != null
				&& oaProVacateService.getTaskByProcInsId(oaEnreimb.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaEnreimb.getProcInsId()));
		}
	}
}