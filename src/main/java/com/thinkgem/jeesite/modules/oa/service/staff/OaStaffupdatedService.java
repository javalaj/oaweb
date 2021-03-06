/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.staff;

import java.util.List;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaUsecar;
import com.thinkgem.jeesite.modules.oa.entity.sign.OaSign;
import com.thinkgem.jeesite.modules.oa.entity.staff.OaStaffupdated;
import com.thinkgem.jeesite.modules.oa.service.OaOvertimeService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.dao.staff.OaStaffupdatedDao;

/**
 * 人员增补Service
 * @author cz
 * @version 2017-01-12
 */
@Service
@Transactional(readOnly = true)
public class OaStaffupdatedService extends CrudService<OaStaffupdatedDao, OaStaffupdated> {
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private	OaStaffupdatedDao dao;
	public OaStaffupdated get(String id) {
		return super.get(id);
	}
	
	public List<OaStaffupdated> findList(OaStaffupdated oaStaffupdated) {
		return super.findList(oaStaffupdated);
	}
	
	public Page<OaStaffupdated> findPage(Page<OaStaffupdated> page, OaStaffupdated oaStaffupdated) {
		return super.findPage(page, oaStaffupdated);
	}
	
	@Transactional(readOnly = false)
	public void save(OaStaffupdated oaStaffupdated) {
		super.save(oaStaffupdated);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaStaffupdated oaStaffupdated) {
		super.delete(oaStaffupdated);
	}
	public OaStaffupdated getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}
	
	@Transactional(readOnly = false)
	public void Deemandupdate(OaStaffupdated oaStaffupdated) {
		dao.Deemandupdate(oaStaffupdated);
	}
	
	@Transactional(readOnly = false)
	public void Personnelmattersupdate(OaStaffupdated oaStaffupdated) {
		dao.	Personnelmattersupdate(oaStaffupdated);
	}	@Transactional(readOnly = false)
	public void Bossupdate(OaStaffupdated oaStaffupdated) {
		dao.Bossupdate(oaStaffupdated);
	}
	
	public boolean isDeal(OaStaffupdated oaStaffupdated) {
		if (StringUtils.isBlank(oaStaffupdated.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaStaffupdated.getProcInsId()).list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}
	
	public Task getTaskByProcInsId(String procInsId) {

		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.processInstanceId(procInsId).list();
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	@Autowired
	private OaOvertimeService oaOvertimeService;// 抄送通知的service
	/**
	 * dealFilling业务逻辑方法
	 * 
	 */
	@Transactional(readOnly = false)
	public void dealFilling(OaStaffupdated oaStaffupdated) {
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaStaffupdated.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaStaffupdated.getProcInsId(), "【归档】", null, null);
		}
		oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/staff/oaStaffupdated/view?id=" + oaStaffupdated.getId(),
				"您申请的用车申请【" + DateUtils.formatDate(oaStaffupdated.getCreateDate()) + "】已被【"+UserUtils.getUser().getName()+"】办结",
				oaStaffupdated.getCreateBy().getId());
	}
}