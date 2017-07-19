package com.thinkgem.jeesite.modules.oa.utils.project;

import java.util.Date;

import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;

public class OaProjectUtils {
	
	public static String getRealState(OaProject oaProject){
		String state=oaProject.getState();
		if(!StringUtils.equals(state, OaProject.STATE_UNCOMPLETED)){
			return state;
		}else{
			Date current=new Date();
			Date startDate=oaProject.getStartDate();
			current=DateUtils.getCutDateByPattern(current, "yyyy/MM/dd");
			startDate=DateUtils.getCutDateByPattern(startDate, "yyyy/MM/dd");
			if(DateUtils.compareDate(startDate, current)>0){
				//新
				return OaProject.STATE_UNCOMPLETED_NEW;
			}else{
				//进行中
				return OaProject.STATE_UNCOMPLETED_RUNNING;
			}
		}
	}
	public static String getRealEndDate(OaProject oaProject,String pattern){
		Date stateDate=oaProject.getStartDate();
		Integer planDay=1;
		if(oaProject.getPlanDay()!=null){
			planDay=oaProject.getPlanDay();
		}
		Integer totalChangeDay=0;
		if(oaProject.getTotalChangeDay()!=null){
			totalChangeDay=oaProject.getTotalChangeDay();
		}
		Date dateEnd=DateUtils.getDateEnd(stateDate, null, planDay+totalChangeDay-1, true);
		return DateUtils.formatDate(dateEnd, pattern);
	}
	
	public static String getRealProjectTimeProgress(OaProject oaProject){
		String state=getRealState(oaProject);
		double result=0;
		if(StringUtils.equals(state, OaProject.STATE_UNCOMPLETED_NEW)){
			result= 0;
		}else if(StringUtils.equals(state, OaProject.STATE_COMPLETED)){
			result= 1*100;
		}else{ 
			Date caculateDate=new Date();
			if(StringUtils.equals(state, OaProject.STATE_PAUSE)){
				caculateDate=oaProject.getPauseDate();
			}else if(StringUtils.equals(state, OaProject.STATE_CANCEL)){
				caculateDate=oaProject.getCancelDate();
			}else if(StringUtils.equals(state, OaProject.STATE_UNCOMPLETED_RUNNING)){
				caculateDate=new Date();
			}
			Integer planDay=oaProject.getPlanDay();
			Date startDate=oaProject.getStartDate();
			Integer totalChangeDay=0;
			if(oaProject.getTotalChangeDay()!=null){
				totalChangeDay=oaProject.getTotalChangeDay();
			}
			Integer step=DateUtils.getUserfulStep(startDate, caculateDate, 0, null, true);
			result=((double)step+(double)totalChangeDay)*100/(double)planDay;
		}
		return (int)result+"%";
	}

	
	public static String getRealStateStyle(String realState){
		String result="myoa-pro-cancel";
		if(StringUtils.equals(realState, "01")){
			result="myoa-pro-new";
		}else if(StringUtils.equals(realState, "02")){
			result="";
		}else if(StringUtils.equals(realState, "1")){
			result="myoa-pro-done";
		}else if(StringUtils.equals(realState, "2")){
			result="myoa-pro-pause";
		}else if(StringUtils.equals(realState, "3")){
			result="myoa-pro-cancel";
		}
		return result;
	}
}
