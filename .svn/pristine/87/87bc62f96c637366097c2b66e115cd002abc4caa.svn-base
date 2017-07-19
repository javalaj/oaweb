package com.thinkgem.jeesite.modules.oa.web.newscenter.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.newscenter.OaNews;
import com.thinkgem.jeesite.modules.oa.entity.newscenter.OaNewsColumn;
import com.thinkgem.jeesite.modules.oa.service.newscenter.OaNewsColumnService;

public class NewsUtils {
	
	private static OaNewsColumnService oaNewsColumnService = SpringContextHolder.getBean(OaNewsColumnService.class);
	
	/**
	 * 获取新闻中心栏目列表
	 * @return
	 */
	public static List<OaNewsColumn> getNewsColumnList()
	{
		return oaNewsColumnService.findList(new OaNewsColumn());
	}
	
	/**
	 * 获取栏目对象
	 * @param id
	 * @return
	 */
	public static OaNewsColumn getOaNewsColumn(String id)
	{
		return oaNewsColumnService.get(id);
	}
	
	/**
	 * 获取选项卡
	 * @param oaNews
	 * @return
	 */
	public static String getTabs(OaNews oaNews,HttpServletRequest request)
	{
		List<OaNewsColumn> list = getNewsColumnList();
		
		String projectName = request.getContextPath();
		
		String tabs = ""; 
		
		String url = projectName + Global.getAdminPath() + "/oa/newscenter/oaNews/newsList?oaNews.type=";
		
		for (OaNewsColumn oaNewsColumn : list) 
		{
			if (StringUtils.equals(oaNews.getType(), oaNewsColumn.getId()))
				tabs += "<li class=\"active\"><a href=\"" + url + oaNewsColumn.getId() +"\">" + oaNewsColumn.getColumnName() + "</a></li>";
			else
				tabs += "<li><a href=\"" + url + oaNewsColumn.getId() +"\">" + oaNewsColumn.getColumnName() + "</a></li>";
		}
		
		return tabs;
	}
	
	/**
	 * 获取移动端选项卡
	 * @param oaNews
	 * @return
	 */
	public static String getMobileTabs(OaNews oaNews,HttpServletRequest request)
	{
		List<OaNewsColumn> list = getNewsColumnList();
		
		String projectName = request.getContextPath();
		
		String tabs = ""; 
		
		String url = projectName + Global.getAdminPath() + Global.getMobilePath() + "/oa/newscenter/oaNews/newsList?oaNews.type=";
		
		for (OaNewsColumn oaNewsColumn : list) 
		{
			if (StringUtils.equals(oaNews.getType(), oaNewsColumn.getId()))
				tabs += "<li><a href=\"#\" class=\"active\" onclick=\"javascript:void(0);location.href='" + url + oaNewsColumn.getId() + "'\">" + oaNewsColumn.getColumnName() + "</a></li>";
			else
				tabs += "<li><a href=\"#\" onclick=\"javascript:void(0);location.href='" + url + oaNewsColumn.getId() + "'\">" + oaNewsColumn.getColumnName() + "</a></li>";
		}
		
		return tabs;
	}	
}
