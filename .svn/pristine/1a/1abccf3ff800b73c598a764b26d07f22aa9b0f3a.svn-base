/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.project;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectDocument;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectMember;
import com.thinkgem.jeesite.modules.oa.dao.project.OaProjectDao;
import com.thinkgem.jeesite.modules.oa.dao.project.OaProjectDocumentDao;
import com.thinkgem.jeesite.modules.oa.dao.project.OaProjectMemberDao;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectOperation;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectWeekreport;
import com.thinkgem.jeesite.modules.oa.web.project.utils.CompareUtil;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.oa.dao.project.OaProjectOperationDao;
import com.thinkgem.jeesite.modules.oa.dao.project.OaProjectWeekreportDao;

/**
 * 项目表的管理Service
 * @author 李廷龙
 * @version 2016-11-17
 */
@Service
@Transactional(readOnly = true)
public class OaProjectService extends CrudService<OaProjectDao, OaProject> {

	@Autowired
	private OaProjectWeekreportDao oaProjectWeekreportDao;
	@Autowired
	private OaProjectDocumentDao oaProjectDocumentDao;
	@Autowired
	private OaProjectOperationDao oaProjectOperationDao;
	@Autowired
	private OaProjectMemberDao oaProjectMemberDao;
	
	public OaProject get(String id) {
 		OaProject oaProject = super.get(id);
		oaProject.setOaProjectDocumentList(oaProjectDocumentDao.findList(new OaProjectDocument(oaProject)));
		oaProject.setOaProjectOperationList(oaProjectOperationDao.findList(new OaProjectOperation(oaProject)));
		oaProject.setOaProjectWeekreportList(oaProjectWeekreportDao.findList(new OaProjectWeekreport(oaProject)));
		List<OaProjectMember> oaProjectMemberList=oaProjectMemberDao.findList(new OaProjectMember(oaProject));
		if(oaProject.getCreateBy()!=null){
			OaProjectMember opm=new OaProjectMember();
			opm.setUser(oaProject.getCreateBy());
			opm.setType(OaProjectMember.TYPE_SUPER_ADMIN);
			opm.setSourceType(OaProjectMember.SOURCE_TYPE_HISTORY);
			opm.setDuty("项目创建者");
			opm.setCreateDate(oaProject.getCreateDate());
			if(oaProjectMemberList.size()>0){
				oaProjectMemberList.add(1, opm);
			}else{
				oaProjectMemberList.add(opm);
			}
		}
		if(oaProject.getBusinessManager()!=null){
			OaProjectMember opm=new OaProjectMember();
			opm.setUser(oaProject.getBusinessManager());
			opm.setType(OaProjectMember.TYPE_COMMON);
			opm.setSourceType(OaProjectMember.SOURCE_TYPE_HISTORY);
			opm.setDuty("商务支持");
			opm.setCreateDate(oaProject.getCreateDate());
			if(oaProjectMemberList.size()>0){
				oaProjectMemberList.add(1, opm);
			}else{
				oaProjectMemberList.add(opm);
			}
			
		}
		if(oaProject.getTechnicalManager()!=null){
			OaProjectMember opm=new OaProjectMember();
			opm.setUser(oaProject.getTechnicalManager());
			opm.setType(OaProjectMember.TYPE_COMMON);
			opm.setSourceType(OaProjectMember.SOURCE_TYPE_HISTORY);
			opm.setDuty("技术支持");
			opm.setCreateDate(oaProject.getCreateDate());
			if(oaProjectMemberList.size()>0){
				oaProjectMemberList.add(1, opm);
			}else{
				oaProjectMemberList.add(opm);
			}
		}
		if(oaProject.getProjectManager()!=null){
			OaProjectMember opm=new OaProjectMember();
			opm.setUser(oaProject.getProjectManager());
			opm.setType(OaProjectMember.TYPE_COMMON);
			opm.setSourceType(OaProjectMember.SOURCE_TYPE_HISTORY);
			opm.setDuty("工程经理");
			opm.setCreateDate(oaProject.getCreateDate());
			if(oaProjectMemberList.size()>0){
				oaProjectMemberList.add(1, opm);
			}else{
				oaProjectMemberList.add(opm);
			}
		}
		oaProject.setOaProjectMemberList(oaProjectMemberList);
		return oaProject;
	}
	
	public List<OaProject> findList(OaProject oaProject) {
		return super.findList(oaProject);
	}
	
	public List<OaProject> findListAdd(OaProject oaProject){
		return dao.findListAdd(oaProject);
	}
	
	public List<OaProject> findListBySearchUserId(OaProject oaProject) {
		oaProject.setSearchUserId(UserUtils.getUser().getId());
		return dao.findListBySearchUserId(oaProject);
	}
	public Page<OaProject> findPageBySearchUserId(Page<OaProject> page, OaProject oaProject) {
		oaProject.setSearchUserId(UserUtils.getUser().getId());
		oaProject.setPage(page);
		page.setList(dao.findListBySearchUserId(oaProject));
		return page;
	}
	public Page<OaProject>  indexfindPageBySearchUserId(Page<OaProject> page, OaProject oaProject) {
		oaProject.setPage(page);
		page.setList(dao.findListBySearchUserId(oaProject));
		return page;
	}
	public Page<OaProject> findPage(Page<OaProject> page, OaProject oaProject) {
//		oaProject.getSqlMap().put("dsf", dataScopeFilter(oaProject.getCurrentUser(), "o", "a"));
		oaProject.setPage(page);
		return page.setList(dao.findListAdd(oaProject));
	}
	
	@Transactional(readOnly = false)
	public void save(OaProject oaProject) {
		Date current=new Date();
		if (oaProject.getIsNewRecord()){
			oaProject.setWriteWay(OaProject.WRITE_WAY_COMMON);
			oaProject.preInsert();
			oaProject.setWriteTime(current);
			Date dateBegin=oaProject.getStartDate();
			Integer planDay=oaProject.getPlanDay();
			String state=analysisState(dateBegin, planDay, current);
			oaProject.setState(state);
			oaProject.setProgramVersion("v2");
			dao.insert(oaProject);
			/*OaProjectMember oaProjectMember=new OaProjectMember();
			oaProjectMember.setProject(oaProject);
			oaProjectMember.setType(OaProjectMember.TYPE_SUPER_ADMIN);
			oaProjectMember.setUser(UserUtils.getUser());
			oaProjectMember.setDuty("项目创建者");
			oaProjectMember.preInsert();
			oaProjectMemberDao.insert(oaProjectMember);*/
		}else{
			OaProject oldRecord=dao.get(oaProject.getId());
			List<OaProjectOperation> listOpo=CompareUtil.compareOaProject(oaProject, oldRecord, UserUtils.getUser().getId());
			if(StringUtils.isEmpty(oldRecord.getState())&&oaProject.getStartDate()!=null&&oaProject.getPlanDay()!=null){
				Date dateBegin=oaProject.getStartDate();
				Integer planDay=oaProject.getPlanDay();
				String state=analysisState(dateBegin, planDay, current);
				oaProject.setState(state);
				oaProject.setProgramVersion("v2");
			}
			oaProject.preUpdate();
			dao.update(oaProject);
			for (OaProjectOperation oaProjectOperation : listOpo) {
				System.out.println(oaProjectOperation.getOperationDescription());
				if (OaProjectOperation.DEL_FLAG_NORMAL.equals(oaProjectOperation.getDelFlag())){
					if (StringUtils.isBlank(oaProjectOperation.getId())){
						oaProjectOperation.setProject(oaProject);
						oaProjectOperation.preInsert();
						oaProjectOperationDao.insert(oaProjectOperation);
					}
				}
			}
			
		}
		for (OaProjectDocument oaProjectDocument : oaProject.getOaProjectDocumentList()){
			if (oaProjectDocument.getId() == null){
				continue;
			}
			if (OaProjectDocument.DEL_FLAG_NORMAL.equals(oaProjectDocument.getDelFlag())){
				if (StringUtils.isBlank(oaProjectDocument.getId())){
					oaProjectDocument.setProject(oaProject);
					oaProjectDocument.setUploadUser(UserUtils.getUser());
					oaProjectDocument.setFileVersion(0+"");
					oaProjectDocument.preInsert();
					oaProjectDocumentDao.insert(oaProjectDocument);
				}else{
					oaProjectDocument.preUpdate();
					oaProjectDocument.setUpdateUser(UserUtils.getUser());
					oaProjectDocumentDao.update(oaProjectDocument);
				}
			}else{
				oaProjectDocumentDao.delete(oaProjectDocument);
			}
		}
		
		for (OaProjectWeekreport oaProjectWeekreport : oaProject.getOaProjectWeekreportList()){
			if (oaProjectWeekreport.getId() == null){
				continue;
			}
			if (OaProjectWeekreport.DEL_FLAG_NORMAL.equals(oaProjectWeekreport.getDelFlag())){
				if (StringUtils.isBlank(oaProjectWeekreport.getId())){
					oaProjectWeekreport.setProject(oaProject);
					oaProjectWeekreport.preInsert();
					oaProjectWeekreport.setWriteUser(UserUtils.getUser());
					oaProjectWeekreport.setReportNo(OrdersUtils.getGenerateOrderNo12("PJWR"));
					oaProjectWeekreportDao.insert(oaProjectWeekreport);
				}else{
					oaProjectWeekreport.preUpdate();
					oaProjectWeekreport.setUpdateUser(UserUtils.getUser());
					oaProjectWeekreportDao.update(oaProjectWeekreport);
				}
			}else{
				oaProjectWeekreportDao.delete(oaProjectWeekreport);
			}
		}
	}
	private String analysisState(Date dateBegin,Integer planDay,Date current){
		String result="";
		Date dateEnd=DateUtils.getDateEnd(dateBegin, null, planDay-1, true);
		String a=DateUtils.formatDate(current, "yyyy-MM-dd");
		String b=DateUtils.formatDate(dateEnd, "yyyy-MM-dd");
		long currentDateTime=0;
		long endDateTime=0;
		try {
			currentDateTime = DateUtils.parseDate(a,"yyyy-MM-dd").getTime();
			endDateTime = DateUtils.parseDate(b,"yyyy-MM-dd").getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(currentDateTime>endDateTime){
			//完成
			result=OaProject.STATE_COMPLETED;
		}else{
			//未完成
			result=OaProject.STATE_UNCOMPLETED;
		}
		return result;
	}
	@Transactional(readOnly = false)
	public void insert(OaProject oaProject) {
		dao.insert(oaProject);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaProject oaProject) {
		super.delete(oaProject);
		oaProjectDocumentDao.delete(new OaProjectDocument(oaProject));
		oaProjectOperationDao.delete(new OaProjectOperation(oaProject));
	}
	
	public Integer getProjectsCountBySearchUserId(String searchUserId){
		return dao.getProjectsCountBySearchUserId(searchUserId);
	}
	
}