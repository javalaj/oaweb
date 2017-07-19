package com.thinkgem.jeesite.modules.oa.service.util;

import java.io.IOException;
import java.io.StringWriter;
//import java.util.HashMap;
//import java.util.Iterator;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.thinkgem.jeesite.modules.oa.entity.project.permission.OaProjectViewPermission;

//import net.sf.json.JSONObject;
/**
 * 
 * @author litinglong
 *
 */
public class JacksonUtil {
	private static ObjectMapper mapper;  
	  
    /** 
     *  
     * @param createNew 
     *          是否创建一个新的Mapper 
     * @return 
     */  
    public static synchronized ObjectMapper getMapperInstance(boolean createNew) {  
        if (createNew) {  
            return new ObjectMapper();  
        } else if (mapper == null) {  
            mapper = new ObjectMapper();  
        }  
        return mapper;  
    }
    
    /**
     * Bean----->JSON
     * @param obj
     * @return
     * @throws IOException
     */
    public static String beanToJson(Object obj) throws IOException {  
        // 这里异常都未进行处理，而且流的关闭也不规范。开发中请勿这样写，如果发生异常流关闭不了  
            ObjectMapper mapper = JacksonUtil.getMapperInstance(false);  
            StringWriter writer = new StringWriter();
            JsonFactory factory=new JsonFactory();
            @SuppressWarnings("deprecation")
			JsonGenerator gen = factory.createJsonGenerator(writer);  
            mapper.writeValue(gen, obj);  
            gen.close();  
            String json = writer.toString();  
            writer.close();  
            return json;  
        }
    
    /**
     * JSON------>Bean
     * @param json
     * @param cls
     * @return
     * @throws Exception
     */
    public static Object  jsonToBean(String json, Class<?> cls) throws Exception {   
        Object vo = mapper.readValue(json, cls);   
        return vo;   
    }
    
//    /**
//     * JSON------>Map
//     * @param json
//     * @param cls
//     * @return
//     * @throws Exception
//     */
//    public static HashMap<String, Object> toHashMap(Object object)  
//    {  
//        HashMap<String, Object> data = new HashMap<String, Object>();  
//        // 将json字符串转换成jsonObject  
//        JSONObject jsonObject = JSONObject.fromObject(object);  
//        Iterator it = jsonObject.keys();  
//        // 遍历jsonObject数据，添加到Map对象  
//        while (it.hasNext())  
//        {  
//            String key = String.valueOf(it.next());  
//            Object value =jsonObject.get(key);  
//            data.put(key, value);  
//        }  
//        return data;  
//    }  
    
    public static void main(String[] args) {
		OaProjectViewPermission oaProjectViewPermission=new OaProjectViewPermission();
		oaProjectViewPermission.setStarter("11321");
		String result="";
		try {
			result=beanToJson(oaProjectViewPermission);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("result="+result);
		OaProjectViewPermission opvp=null;
		try {
			opvp=(OaProjectViewPermission)jsonToBean(result, oaProjectViewPermission.getClass());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("opvp"+opvp);
		
		try {
			result=beanToJson(opvp);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("result="+result);
	}
}
