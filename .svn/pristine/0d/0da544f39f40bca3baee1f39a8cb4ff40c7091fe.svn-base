/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.entity.OaArchives;
import com.thinkgem.jeesite.modules.oa.dao.OaArchivesDao;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.workflow.SysWorkflowVarService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 公文Service
 * 
 * @author niting
 * @version 2016-11-09
 */
@Service
@Transactional(readOnly = true)
public class OaArchivesService extends CrudService<OaArchivesDao, OaArchives> {
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private SysWorkflowVarService sysWorkflowVarService;// 工作流变量service
	@Autowired
	private OfficeService officeService;

	public OaArchives getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}

	public Page<OaArchives> findPage(Page<OaArchives> page, OaArchives oaArchives) {
		oaArchives.setPage(page);// 分页必备步骤
		page.setList(dao.findList(oaArchives));
		return page;
	}

	public Page<OaArchives> findPage2(Page<OaArchives> page, OaArchives oaArchives) {
		oaArchives.setPage(page);// 分页必备步骤
		page.setList(dao.findList2(oaArchives));
		return page;
	}

	public OaArchives get(String id) {
		return super.get(id);
	}

	public List<OaArchives> findList(OaArchives oaArchives) {
		return super.findList(oaArchives);
	}
	
	@Transactional(readOnly = false)
	public void save(OaArchives oaArchives) {
		super.save(oaArchives);
	}
	
	@Autowired
	 private OaNotifyService oanotifyservice;//通告service
	
	public boolean isDeal(OaArchives oaArchives) {
		if (StringUtils.isBlank(oaArchives.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaArchives.getProcInsId()).list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}
	
	
//	/**
//	 * 审核新增或编辑
//	 * 
//	 * @param oaArchives
//	 */
//	@Transactional(readOnly = false)
//	public void save(OaArchives oaArchives,String isdraft) {
//		//判断是保存还是保存并提交 1：提交  0：存为草稿
//		if(isdraft.equals("0")){
//			super.save(oaArchives);
//			System.err.println("0001");
//		}else{
//			oaArchives.setIsdraft("1");
//			System.err.println("002");
//			// 申请发起
//			if (StringUtils.isBlank(oaArchives.getId())) {
//				System.err.println("aaaaaaaaaaaaaaaaaa");
//				oaArchives.preInsert();
//				dao.insert(oaArchives);
//				Map<String, Object> vars = Maps.newHashMap();// 设置任务变量，提交流程任务
//				vars.put("apply", UserUtils.getUser().getLoginName());// 设置流程发起人
//				vars.put("upper", ActRouting.getUpper(UserUtils.getUser().getId()));// 获取本部门直属领导
//				SysWorkflowVar sysWorkflowVar = new SysWorkflowVar();// 工作流变量实体类
//				sysWorkflowVar.setWorkflowIdentification("oaArchives_audit");// 流程标示
////				sysWorkflowVar.setVarName("TechLeader");;				
////				vars.put("TechLeader", sysWorkflowVarService.findBySignVar(sysWorkflowVar).get(0).getVarValue());// 获取技术部经理
////				sysWorkflowVar.setVarName("DevelopLeader");
////				vars.put("DevelopLeader", sysWorkflowVarService.findBySignVar(sysWorkflowVar).get(0).getVarValue());// 获取研发部经理
////				sysWorkflowVar.setVarName("CommerceLeader");
////				vars.put("CommerceLeader",sysWorkflowVarService.findBySignVar(sysWorkflowVar).get(0).getVarValue());// 获取市场拓展部经理
////				sysWorkflowVar.setVarName("MarketLeader");
////				vars.put("MarketLeader",sysWorkflowVarService.findBySignVar(sysWorkflowVar).get(0).getVarValue());// 获取市场部经理
////				sysWorkflowVar.setVarName("PersonalLeader");
////				vars.put("PersonalLeader",sysWorkflowVarService.findBySignVar(sysWorkflowVar).get(0).getVarValue());// 获取人事行政部经理
////				sysWorkflowVar.setVarName("FinanceLeader");
////				vars.put("FinanceLeader", sysWorkflowVarService.findBySignVar(sysWorkflowVar).get(0).getVarValue());// 获取财务部经理
////				sysWorkflowVar.setVarName("Manager");
//				vars.put("Manager", sysWorkflowVarService.findBySignVar(sysWorkflowVar).get(0).getVarValue());// 获取总经理
//				
//				vars.put("pass", "yes".equals(oaArchives.getAct().getFlag()) ? "1" : "0");// 设置网关条件${pass==1}，通过；${pass==0}，不通过
//				
//				
//				// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
//				try {
//					Thread.sleep(2000);
//				} catch (InterruptedException e) {
//					e.printStackTrace();
//				}
//				
//				System.err.println(789456123);
//				actTaskService.startProcess("oaArchives_audit", "oa_archives", oaArchives.getId(),
//						"公司发文流程【" + UserUtils.getUser().getName() + DateUtils.getDate() + "】", vars);
//			}
//
//			// 重新编辑申请
//			else {
//				oaArchives.preUpdate();
//				dao.update(oaArchives);
//
//				oaArchives.getAct().setComment(("yes".equals(oaArchives.getAct().getFlag()) ? "[重申] " : "[销毁] ")
//						+ oaArchives.getAct().getComment());
//
//				// 完成流程任务
//				Map<String, Object> vars = Maps.newHashMap();
//				vars.put("pass", "yes".equals(oaArchives.getAct().getFlag()) ? "1" : "0");
//				actTaskService.complete(oaArchives.getAct().getTaskId(), oaArchives.getAct().getProcInsId(),
//						oaArchives.getAct().getComment(), oaArchives.getTitle(), vars);
//			}
//		}		
//	}

//	/**
//	 * 审核审批保存
//	 * 
//	 * @param testAudit
//	 */
//	@Transactional(readOnly = false)
//	public void auditSave(OaArchives oaArchives,String[] i) {
//		Map<String, Object> vars = Maps.newHashMap();// 设置任务变量，提交流程任务
//		vars.put("apply", UserUtils.getUser().getLoginName());// 设置流程发起人
//
//		vars.put("upper", ActRouting.getUpper(UserUtils.getUser().getId()));// 获取本部门直属领导
//		vars.put("pass", "yes".equals(oaArchives.getAct().getFlag()) ? "1" : "0");// 设置网关条件${pass==1}，通过；${pass==0}，不通过
//		
//		
//		if(oaArchives.getDepartmentsign()!=null){
//			vars.put("add", "1");
//		}
//		
//		
//		SysWorkflowVar sysWorkflowVar = new SysWorkflowVar();// 工作流变量实体类
//		sysWorkflowVar.setWorkflowIdentification("oaArchives_audit");// 流程标示
//		
//		if(oaArchives.getAct().getFlag().equals("no")){
//			oaArchives.getAct().setComment("[驳回]"+ oaArchives.getAct().getComment());
//			vars.put("flag",false);
//		}else if(oaArchives.getAct().getFlag().equals("yes")){
//			if(oaArchives.getDepartmentsign()==null){
//				oaArchives.getAct().setComment("[同意]"+ oaArchives.getAct().getComment());
//				vars.put("flag", true);
//				vars.put("add", "0");
//				vars.put("Manager", sysWorkflowVarService.findBySignVar(sysWorkflowVar).get(0).getVarValue());// 获取总经理
//			}else{
//				List<String> strList = new ArrayList<String>();
//				String[] pname = oaArchives.getDepartmentsign().split(",");// 会签相关部门
//				for (int j = 0; j < oaArchives.getDepartmentsign().split(",").length; j++) {
//					Office officei = new Office();
//					String offnamei = oaArchives.getDepartmentsign().split(",")[j];
//					officei = officeService.get(offnamei);
//					String usei = UserUtils.get(officei.getPrimaryPerson().getId()).getLoginName();
//					strList.add(usei);
//					pname[j] = officei.getName();
//				}
//				String pnamee = StringUtils.join(pname, ",");
//				oaArchives.setDepartmentsign(pnamee);
//				vars.put("applyUserIdsList", strList);
//				vars.put("applyUserIds", UserUtils.get(oaArchives.getCreateBy().getId()).getLoginName());
//				vars.put("add", "1");// 流程走向动态副总
//			}
//			
//		}
//		
//		// 设置意见
//		oaArchives.getAct().setComment(
//				("yes".equals(oaArchives.getAct().getFlag()) ? "[同意] " : "[驳回] ") + oaArchives.getAct().getComment());
//
//		oaArchives.preUpdate();
//
//		// 对不同环节的业务逻辑进行操作
//		String taskDefKey = oaArchives.getAct().getTaskDefKey();
//
//		// 审核环节
//		if ("audit".equals(taskDefKey)) {// 部门领导会签
//			oaArchives.setLeadText(oaArchives.getAct().getComment());
//			dao.updateLeadText(oaArchives);
//		} 
//		else if ("audit2".equals(taskDefKey)) {// 技术部领导会签
//			oaArchives.setCheckText(oaArchives.getAct().getComment());
//			dao.updateThText(oaArchives);
//		} 
////		else if ("audit3".equals(taskDefKey)) {// 研发部领导会签
////			oaArchives.setCheckText1(oaArchives.getAct().getComment());
////			dao.updateDevelopText(oaArchives);
////		} else if ("audit4".equals(taskDefKey)) {// 商务部领导会签
////			oaArchives.setCheckText2(oaArchives.getAct().getComment());
////			dao.updateCommerceText(oaArchives);
////		} else if ("audit5".equals(taskDefKey)) {// 市场部领导会签
////			oaArchives.setCheckText3(oaArchives.getAct().getComment());
////			dao.updateMarketText(oaArchives);
////		} else if ("audit6".equals(taskDefKey)) {// 人事部领导会签
////			oaArchives.setCheckText4(oaArchives.getAct().getComment());
////			dao.updatePersonalText(oaArchives);
////		} else if ("audit7".equals(taskDefKey)) {// 财务部领导会签
////			oaArchives.setCheckText5(oaArchives.getAct().getComment());
////			dao.updateFinanceText(oaArchives);
////		} 
//		else if ("audit8".equals(taskDefKey)) {// 总经理会签
//			oaArchives.setManagerText(oaArchives.getAct().getComment());								
//			dao.updateManagerText(oaArchives);
//
//		} else if ("apply_end".equals(taskDefKey)) {// 发起人编号，套模板，分发
//			if(oaArchives.getManagerText() !=null){
//				// 更新发送接受人记录
//				OaNotify oanotify=new OaNotify();
//				oanotify.setTitle("45645");//标题
//				oanotify.setContent("654564");
//				oanotify.setOaNotifyRecordIds(StringUtils.join(i, ","));//通知上级
//				oanotify.setStatus("1");
//				oanotify.setFiles("1");
//				oanotify.setType("3");
//				oanotifyservice.save(oanotify);
//				super.save(oaArchives);
////				archivesRecordDao.deleteByOaArchivesId(oaArchives.getId());
////				if (oaArchives.getOaArchivesRecordList().size() > 0) {
////					System.err.println(oaArchives.getOaArchivesRecordList().size());
////					archivesRecordDao.insertAll(oaArchives.getOaArchivesRecordList());
////				}
//			}
//		} else {// 未知环节，直接返回
//			return;
//		}
//
//		
//		actTaskService.complete(oaArchives.getAct().getTaskId(), oaArchives.getAct().getProcInsId(),
//				oaArchives.getAct().getComment(), oaArchives.getTitle(), vars);
//	}
//
//	/**
//	 * 逻辑删除
//	 */
//	@Transactional(readOnly = false)
//	public void delete(OaArchives oaArchives) {
//		super.delete(oaArchives);
//	}

}