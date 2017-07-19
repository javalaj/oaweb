package com.thinkgem.jeesite.modules.oa.web.project.utils;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.Reflections;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectOperation;
import com.thinkgem.jeesite.modules.oa.web.project.utils.annotation.CompareField;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

public class CompareUtil {
	public static List<OaProjectOperation> compareOaProject(OaProject newRecord,OaProject oldRecord,String OperationUserId) {
		List<Object[]> list=Lists.newArrayList();
		Method[] ms = OaProject.class.getDeclaredMethods();
		for (Method method : ms) {
			CompareField compareField=method.getAnnotation(CompareField.class);
			if (compareField!=null) {
				method.getReturnType();
				list.add(new Object[]{method,compareField});
			}
		}
		Collections.sort(list, new Comparator<Object[]>() {
			public int compare(Object[] o1, Object[] o2) {
				return new Integer(((CompareField)o1[1]).sort()).compareTo(
						new Integer(((CompareField)o2[1]).sort()));
			};
		});
		
		List<OaProjectOperation> listOpo=Lists.newArrayList();
		
		for (Object[] os : list) {
			Object newVal = null;
			Object oldVal = null;
			newVal=Reflections.invokeMethod(newRecord, ((Method)os[0]).getName(), new Class[] {}, new Object[] {});
			oldVal=Reflections.invokeMethod(oldRecord, ((Method)os[0]).getName(), new Class[] {}, new Object[] {});
			CompareField compareField=(CompareField)os[1];
			String oldString="<未设置>";
			String newString="<未设置>";
			if (oldVal!=null) {
				oldString=valToString(oldVal,compareField.dateFormate(),compareField.dictType());
			}
			if (newVal!=null) {
				newString=valToString(newVal,compareField.dateFormate(),compareField.dictType());
			}
			if (!StringUtils.equals(oldString, newString)) {
				OaProjectOperation oaProjectOperation=new OaProjectOperation();
				oaProjectOperation.setProject(new OaProject(newRecord.getId()));
				oaProjectOperation.setOperationPerson(new User(OperationUserId));
				oaProjectOperation.setOperationTime(new Date());
				oaProjectOperation.setOperationDescription("<"+compareField.title()+">由"+oldString+"变更为"+newString+"");
				listOpo.add(oaProjectOperation);
			}

		}
		
		return listOpo;
	}
	
	public static String valToString(Object val,String dateFormate,String dictType){
		String string=null;
		if(val == null){
			string="<未设置>";
		}else{
			if(val instanceof String) {
				if (StringUtils.isBlank((String)val)) {
					string="<未设置>";
				}else{
					if (StringUtils.isBlank(dictType)) {
						string="【"+(String) val+"】";
					}else{
						string=DictUtils.getDictLabel((String) val,dictType, (String) val);
						string="【"+string+"】";
					}
				}
			}else if(val instanceof Integer) {
				string="【"+(Integer) val+"】";
			}else if(val instanceof Long) {
				string="【"+(Long) val+"】";
			}else if(val instanceof Double) {
				string="【"+(Double) val+"】";
			}else if(val instanceof Float) {
				string="【"+(Float) val+"】";
			}else if(val instanceof Date) {
				String sdate=(new SimpleDateFormat(dateFormate)).format(val);  
				string="【"+sdate+"】";
			}else if(val instanceof User) {
				String id=((User) val).getId();
				User temp=UserUtils.get(id);
				string="【"+temp.getName()+"("+temp.getLoginName()+")】";
			}
//			else {
//				cell.setCellValue((String)Class.forName(this.getClass().getName().replaceAll(this.getClass().getSimpleName(), 
//					"fieldtype."+val.getClass().getSimpleName()+"Type")).getMethod("setValue", Object.class).invoke(null, val));
//			}
		}
		return string;
		
	}
}
