package com.thinkgem.jeesite.modules.oa.oaUtils;

import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.oa.dao.SupmanagementDao;
import com.thinkgem.jeesite.modules.oa.dao.project.OaProjectDao;
import com.thinkgem.jeesite.modules.oa.entity.Supmanagement;

public class ContractUtils {
	
	private static OaProjectDao oaProjectDao = SpringContextHolder.getBean(OaProjectDao.class);
	private static SupmanagementDao supmanagementDao = SpringContextHolder.getBean(SupmanagementDao.class);

	public static final String CACHE_PROVIDER_MAP = "providerMap";
	public static final String CACHE_PROJECT_MAP = "projectMap";
	
	/*public static String getProviderId(String value, String type, String defaultValue){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)){
			for (supmanagement supmanagement : getsupmanagementList(type)){
				if (type.equals(supmanagement.getType()) && value.equals(supmanagement.getValue())){
					return supmanagement.getLabel();
				}
			}
		}
		return defaultValue;
	}
	*/
	/*public static String getsupmanagementLabels(String values, String type, String defaultValue){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(values)){
			List<String> valueList = Lists.newArrayList();
			for (String value : StringUtils.split(values, ",")){
				valueList.add(getsupmanagementLabel(value, type, defaultValue));
			}
			return StringUtils.join(valueList, ",");
		}
		return defaultValue;
	}*/

	/*public static String getsupmanagementValue(String label, String type, String defaultLabel){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(label)){
			for (supmanagement supmanagement : getsupmanagementList(type)){
				if (type.equals(supmanagement.getType()) && label.equals(supmanagement.getLabel())){
					return supmanagement.getValue();
				}
			}
		}
		return defaultLabel;
	}
	*/
	/**
	 * 获取供应商数据
	 * @return
	 */
	public static List<Supmanagement> getSupmanagementList(){
		//@SuppressWarnings("unchecked")
		//Map<String, List<Supmanagement>> supManagerMap = (Map<String, List<Supmanagement>>)CacheUtils.get(CACHE_PROVIDER_MAP);
//		if (supManagerMap==null){
//			supManagerMap = Maps.newHashMap();
		List<Supmanagement> supmanagementList = null;
			for (Supmanagement supmanagement  :supmanagementDao.findAllList(new Supmanagement()) ){
				//List<Supmanagement> supmanagementList = supManagerMap.get(supmanagement);
				if (supmanagementList != null){
					supmanagementList.add(supmanagement);
				}/*else{
					supManagerMap.put(supmanagement.getId(), Lists.newArrayList(supmanagement));
				}*/
			}
			//CacheUtils.put(CACHE_PROVIDER_MAP, supManagerMap);
		
	
		if (supmanagementList == null){
			supmanagementList = Lists.newArrayList();
		}
		return supmanagementList;
	}
	
	/**
	 * 返回字典列表（JSON）
	 * @param type
	 * @return
	 */
	public static String getsupmanagementListJson(){
		return JsonMapper.toJsonString(getSupmanagementList());
	}

}
