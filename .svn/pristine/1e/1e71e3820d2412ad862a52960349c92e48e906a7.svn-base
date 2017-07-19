/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.sign;

import java.util.List;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaGoout;
import com.thinkgem.jeesite.modules.oa.entity.sign.OaSign;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.dao.sign.OaSignDao;

/**
 * 签报Service
 * 
 * @author cz
 * @version 2016-12-20
 */
@Service
@Transactional(readOnly = true)
public class OaSignService extends CrudService<OaSignDao, OaSign> {
	@Autowired
	ActTaskService actTaskService;

	public OaSign get(String id) {
		return super.get(id);
	}

	public List<OaSign> findList(OaSign oaSign) {
		return super.findList(oaSign);
	}

	public Page<OaSign> findPage(Page<OaSign> page, OaSign oaSign) {

		return super.findPage(page, oaSign);
	}

	@Transactional(readOnly = false)
	public void save(OaSign oaSign) {
		super.save(oaSign);
	}

	@Transactional(readOnly = false)
	public void delete(OaSign oaSign) {
		super.delete(oaSign);
	}

	public boolean isDeal(OaSign oaSign) {
		if (StringUtils.isBlank(oaSign.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaSign.getProcInsId()).list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}

	public OaSign getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}

}