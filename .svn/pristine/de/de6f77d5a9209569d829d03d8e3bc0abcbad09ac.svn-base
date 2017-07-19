package com.thinkgem.jeesite.common.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.mail.internet.MimeUtility;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.util.UriUtils;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.FileUtils;

/**
 * 文件下载
 * @author ThinkGem
 * @version 2014-06-25
 */
public class UserfilesDownloadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(getClass());

	public void fileOutputStream(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String filepath = req.getRequestURI();
		int index = filepath.indexOf(Global.USERFILES_BASE_URL);
		
		if(index >= 0) {
			filepath = filepath.substring(index + Global.USERFILES_BASE_URL.length());
		}
		try {
			filepath = UriUtils.decode(filepath, "UTF-8");
			
		} catch (UnsupportedEncodingException e1) {
			logger.error(String.format("不支持的文件名：%s", filepath), e1);
		}
		File file = new File(Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL + filepath);
		if (file.exists()) {
			try {
				String fileName = StringUtils.trim(file.getName());
				String formatFileName = encodingFileName(fileName);
 
	      String headerValue = "attachment;";
	      headerValue += " filename=\"" + formatFileName + "\";";
	      headerValue += " filename*=utf-8''" + formatFileName;
	      resp.setHeader("Content-Disposition", headerValue);
	      resp.setHeader("Content-Length", String.valueOf(file.length()));
	      resp.setHeader("Content-Type", FileUtils.getContentType(fileName));	      
				
				FileCopyUtils.copy(new FileInputStream(file), resp.getOutputStream());
				
				return;
			} catch (FileNotFoundException e) {
				req.setAttribute("exception", new FileNotFoundException("文件不存在"));
				req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req, resp);
			}
		}else{
			req.setAttribute("exception", new FileNotFoundException("文件不存在"));
			req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req, resp);
		}
	}
	public String encodingFileName(String fileName) {
        String returnFileName = "";
        try {
            returnFileName = URLEncoder.encode(fileName, "UTF-8");
            returnFileName = StringUtils.replace(returnFileName, "+", "%20");
            if (returnFileName.length() > 150) {
                returnFileName = new String(fileName.getBytes("GB2312"), "ISO8859-1");
                returnFileName = StringUtils.replace(returnFileName, " ", "%20");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            if (logger.isWarnEnabled()) {
            	logger.info("Don't support this encoding ...");
            }
        }
        return returnFileName;
    }
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		fileOutputStream(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		fileOutputStream(req, resp);
	}
}
