package com.thinkgem.jeesite.modules.oa.entity.project.permission;

import java.io.IOException;

import com.thinkgem.jeesite.modules.oa.service.util.JacksonUtil;

public class OaProjectViewPermission {
	private String starter="";		// 申请人

	private String businessManager="";		// 商务支持
	private String technicalManager="";		// 技术支持
	
	private String marketingDirector="";		// 市场部主管
	private String viceMinister="";		// 商务副总
	private String preSalesManager="";		// 售前经理
	private String projectSpecialist="";		// 项目管理专员
	
	public String getStarter() {
		return starter;
	}

	public void setStarter(String starter) {
		this.starter = starter;
	}
	public String getBusinessManager() {
		return businessManager;
	}

	public void setBusinessManager(String businessManager) {
		this.businessManager = businessManager;
	}

	public String getTechnicalManager() {
		return technicalManager;
	}

	public void setTechnicalManager(String technicalManager) {
		this.technicalManager = technicalManager;
	}

	public String getMarketingDirector() {
		return marketingDirector;
	}

	public void setMarketingDirector(String marketingDirector) {
		this.marketingDirector = marketingDirector;
	}

	public String getViceMinister() {
		return viceMinister;
	}

	public void setViceMinister(String viceMinister) {
		this.viceMinister = viceMinister;
	}

	public String getPreSalesManager() {
		return preSalesManager;
	}

	public void setPreSalesManager(String preSalesManager) {
		this.preSalesManager = preSalesManager;
	}

	public String getProjectSpecialist() {
		return projectSpecialist;
	}

	public void setProjectSpecialist(String projectSpecialist) {
		this.projectSpecialist = projectSpecialist;
	}
	
	@Override
	public String toString() {
		return "OaProjectViewPermission [starter=" + starter + ", businessManager=" + businessManager
				+ ", technicalManager=" + technicalManager + ", marketingDirector=" + marketingDirector
				+ ", viceMinister=" + viceMinister + ", preSalesManager=" + preSalesManager + ", projectSpecialist="
				+ projectSpecialist + "]";
	}

	public String jsonString(){
		String result=null;
		try {
			result=JacksonUtil.beanToJson(this);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static OaProjectViewPermission getOaProjectViewPermissionFromJsonString(String jsonString){
		OaProjectViewPermission opvp=new OaProjectViewPermission();
		try {
			opvp=(OaProjectViewPermission)JacksonUtil.jsonToBean(jsonString, OaProjectViewPermission.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return opvp;
	}
	
}
