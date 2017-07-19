package com.thinkgem.jeesite.modules.oa.service.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * 存储文件及其路径
 * 
 * @author 李正曦
 * @version 2016-11-07
 */
@Service
@Transactional(readOnly = true)
public class FileUploadUtil {

	public static String fileUpLoad(MultipartFile file, String fileFileName,
			String fileContentType, HttpServletRequest request) {

		String imgpath = request.getRealPath("/images/upload");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String data = sdf.format(new Date());

		// 生成唯一标识
		UUID uuid = UUID.randomUUID();

		String name = uuid.toString();

		// 获取文件后缀
		String prefix = fileFileName.substring(fileFileName.lastIndexOf("."));

		// 文件名替换成uuid
		fileFileName = name + prefix;

		imgpath = imgpath + "/" + data;

		File Filedir = new File(imgpath);

		if (!Filedir.exists()) {
			try {

				Filedir.mkdir();
			} catch (Exception e) {
				// TODO: handle exception
				e.getStackTrace();
			}
		}

		// 直接覆盖已有文件

		File file1 = new File(imgpath + "/" + fileFileName);
		if (file1.exists()) {
			return "/images/upload/" + data + "/" + fileFileName;
		}

		InputStream is = null;
		OutputStream os = null;

		try {
			is = file.getInputStream();
			os = new FileOutputStream(new File(imgpath, fileFileName));

			byte[] by = new byte[1024];
			int len = 0;
			while ((len = is.read(by)) > 0) {
				os.write(by, 0, len);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				is.close();
				os.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "/images/upload/" + data + "/" + fileFileName;
	}

}
