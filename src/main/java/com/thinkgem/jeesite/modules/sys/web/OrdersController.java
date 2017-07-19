/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;

/**
 * 标签Controller
 * @author 李廷龙
 * @version 2017-1-4
 */
@Controller
@RequestMapping(value = "${adminPath}/orders")
public class OrdersController extends BaseController {
	
	@RequestMapping(value = "getGenerateOrderNo8")
	public @ResponseBody Map<String, Object> getGenerateOrderNo8(@RequestParam(required=false) String orderNamePre) {
		if (StringUtils.isBlank(orderNamePre)) {
			orderNamePre="DEFAULT";
		}else if ( orderNamePre.length()>8) {
			orderNamePre=orderNamePre.substring(0, 8);
		}
		String orders=OrdersUtils.getGenerateOrderNo8(orderNamePre);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("orders", orders);
		return map;
	}
	
	@RequestMapping(value = "getGenerateOrderNo12")
	public @ResponseBody Map<String, Object> getGenerateOrderNo12(@RequestParam(required=false) String orderNamePre) {
		if (StringUtils.isBlank(orderNamePre)) {
			orderNamePre="DEFAULT";
		}else if ( orderNamePre.length()>8) {
			orderNamePre=orderNamePre.substring(0, 8);
		}
		String orders=OrdersUtils.getGenerateOrderNo12(orderNamePre);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("orders", orders);
		return map;
	}
	
	@RequestMapping(value = "getGenerateOrderNo14")
	public @ResponseBody Map<String, Object> getGenerateOrderNo14(@RequestParam(required=false) String orderNamePre) {
		if (StringUtils.isBlank(orderNamePre)) {
			orderNamePre="DEFAULT";
		}else if ( orderNamePre.length()>8) {
			orderNamePre=orderNamePre.substring(0, 8);
		}
		String orders=OrdersUtils.getGenerateOrderNo14(orderNamePre);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("orders", orders);
		return map;
	}
	
}
