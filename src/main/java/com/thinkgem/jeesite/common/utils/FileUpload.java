package com.thinkgem.jeesite.common.utils;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.Servlets;

public class FileUpload {

	public static String filePath = Servlets.getRequest().getContextPath()
			+ Global.USERFILES_BASE_URL;

	public static String fileLocalPath = Global.getUserfilesBaseDir()
			+ Global.USERFILES_BASE_URL;

	/**
	 * 上传即时通讯的图片
	 * 
	 * @param file
	 * @return
	 */
	public static String imageUpload(MultipartFile file) {
		String imgName = file.getOriginalFilename();
		String suffix = imgName.substring(imgName.lastIndexOf(".") + 1,
				imgName.length());
		String name = UUID.randomUUID().toString();
		Date now = new Date();
		String pathDate = (now.getYear() + 1900) + "/" + (now.getMonth()+1);
		String path = fileLocalPath + "iim/"+ pathDate +"/image/"+name + "."
				+ suffix;
		File saveDirFile = new File(path);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
		try {
			file.transferTo(saveDirFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filePath +  "iim/"+ pathDate +"/image/"+name + "."+ suffix;
	}

	/**
	 * 上传即时通讯的图片
	 * 
	 * @param file
	 * @return
	 */
	public static String fileUpload(MultipartFile file) {
		String fileName = file.getOriginalFilename();
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1,
				fileName.length());
		//String name = UUID.randomUUID().toString();
		
		String name = fileName.substring(0,fileName.lastIndexOf("."));
		
		Date now = new Date();
		String pathDate = (now.getYear() + 1900) + "/" + (now.getMonth()+1);
		String path = fileLocalPath + "iim/"+ pathDate +"/file/"+name + "."
				+ suffix;
		File saveDirFile = new File(path);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
		try {
			file.transferTo(saveDirFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filePath + "iim/"+ pathDate +"/file/"+name + "."
				+ suffix;
	}

}
