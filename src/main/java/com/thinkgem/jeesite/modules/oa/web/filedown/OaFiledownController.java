/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.filedown;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.utils.FileUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 文件下载（ie兼容问题解决办法）Controller
 * 
 * @author liuxin
 * @version 2017-04-17
 */
@Controller
@Scope("prototype")
@RequestMapping(value = "${adminPath}/oa/filedown/oaFiledown")
public class OaFiledownController extends BaseController {

	/**
	 * 
	 * 文件下载控制方法
	 * 
	 */
	@SuppressWarnings("deprecation")
	// @RequiresPermissions("oa:filling:oaFilling:view")
	@RequestMapping(value = "")
	public void download(HttpServletRequest request, HttpServletResponse response, String url) {
		String path = request.getRealPath("");
		try {
			url = java.net.URLDecoder.decode(url, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		url = url.substring(request.getContextPath().length());
		File file = new File(path + url);
		// System.out.println(path + url +" "+file.getPath()+"
		// "+file.getPath().substring(file.getPath().lastIndexOf(("\\")+1)));
		OutputStream os = null;
		if (file.exists()) {
			try {
				String fname = url.substring(url.lastIndexOf("/") + 1);
				os = response.getOutputStream();
				response.reset();
				response.setContentType("application/octet-stream; charset=utf-8");
				response.setHeader("Content-Disposition",
						"attachment; filename=" + java.net.URLEncoder.encode(fname, "UTF-8"));
				os.write(FileUtils.readFileToByteArray(file));
				os.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if (os != null) {
					try {
						os.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	}

}