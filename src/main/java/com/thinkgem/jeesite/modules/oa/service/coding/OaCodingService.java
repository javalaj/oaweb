/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.coding;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.csvreader.CsvReader;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaCoding;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.oa.dao.coding.OaCodingDao;

/**
 * 从打卡机导出的数据存储Service
 * @author 李廷龙
 * @version 2016-11-04
 */
@Service
@Transactional(readOnly = false)
public class OaCodingService extends CrudService<OaCodingDao, OaCoding> {

	public OaCoding get(String id) {
		return super.get(id);
	}
	
	public List<OaCoding> findList(OaCoding oaCoding) {
		return super.findList(oaCoding);
	}
	
	public Page<OaCoding> findPage(Page<OaCoding> page, OaCoding oaCoding) {
		return super.findPage(page, oaCoding);
	}
	
	@Transactional(readOnly = false)
	public void save(OaCoding oaCoding) {
		super.save(oaCoding);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaCoding oaCoding) {
		super.delete(oaCoding);
	}
	
	public List<OaCoding> findMaxAndMinListBySearchDate(OaCoding oaCoding){
		return dao.findMaxAndMinListBySearchDate(oaCoding);
	}
	
	
	/**
	 * 初代打卡机导入模板
	 * @param file
	 * @throws ParseException
	 * @throws IOException
	 */
	public void saveAsPOIByMutiFile(MultipartFile file) throws ParseException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		InputStream is = file.getInputStream();
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
		HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
		int total = hssfSheet.getLastRowNum() - 1;
		HSSFRow hssfRow = null;
		OaCoding oaCoding = null;
		for (int i = 1; i < total; i++) {
			hssfRow = hssfSheet.getRow(i);
			oaCoding = new OaCoding();
			oaCoding.setDeptName(hssfRow.getCell(0).getStringCellValue());
			oaCoding.setUserName(hssfRow.getCell(1).getStringCellValue());
			hssfRow.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			oaCoding.setUserNo(hssfRow.getCell(2).getStringCellValue());
			hssfRow.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
			oaCoding.setEquipNo(hssfRow.getCell(4).getStringCellValue());
			hssfRow.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
			oaCoding.setCodingTime(sdf.parse(hssfRow.getCell(3).getStringCellValue()));
			super.save(oaCoding);
		}
	}

	/**
	 * 浩顺打卡机导入网络月考勤模板
	 * @param file
	 * @return
	 * @throws ParseException 
	 * @throws IOException 
	 */
	public void saveAsPOIByMutiFilex(MultipartFile file) throws ParseException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		InputStream is = file.getInputStream();
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
		HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
		HSSFRow hssfRow = hssfSheet.getRow(1);
		hssfRow.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
		String year=hssfRow.getCell(0).getStringCellValue();
		hssfRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
		String month=hssfRow.getCell(1).getStringCellValue();
		hssfRow.getCell(2).setCellType(Cell.CELL_TYPE_NUMERIC);
		double day=hssfRow.getCell(2).getNumericCellValue();
		//从row 3
		for (int i = 3; i <= hssfSheet.getLastRowNum(); i++) {
			hssfRow =hssfSheet.getRow(i);
			hssfRow.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			String userNo=hssfRow.getCell(0).getStringCellValue();
			hssfRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
			String userName=hssfRow.getCell(1).getStringCellValue();
			for (int j = 0+2; j < day+2; j++) {
				HSSFCell hssFCell=hssfRow.getCell(j);
				if (hssFCell!=null) {
					hssFCell.setCellType(Cell.CELL_TYPE_STRING);
					String time=hssFCell.getStringCellValue();
					String[] timeArray=StringUtils.split(time, "\r\n");
					for (String string : timeArray) {
						OaCoding oaCoding = new OaCoding();
						oaCoding.setDeptName("总公司");
						oaCoding.setUserName(userName);
						oaCoding.setUserNo(userNo);
						oaCoding.setEquipNo("303");
						String timeString=year;
						timeString=timeString+"/"+month;
						timeString=timeString+"/"+(j-1);
						timeString=timeString+" "+string;
						timeString=timeString+":00";
						oaCoding.setCodingTime(sdf.parse(timeString));
						super.save(oaCoding);
					}
				}
			}
		}
	}
	
	/**
	 * 浩顺打卡机导入U盘月考勤模板
	 * @param file
	 * @return
	 * @throws ParseException 
	 * @throws IOException 
	 */
	public void saveAsPOIByMutiFiley(MultipartFile file) throws ParseException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		InputStream is = file.getInputStream();
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
		HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
		HSSFRow hssfRow = hssfSheet.getRow(1);
		hssfRow.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
		String year=hssfRow.getCell(0).getStringCellValue();
		hssfRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
		String month=hssfRow.getCell(1).getStringCellValue();
		hssfRow.getCell(2).setCellType(Cell.CELL_TYPE_NUMERIC);
		double day=hssfRow.getCell(2).getNumericCellValue();
		int rowNum=(hssfSheet.getLastRowNum()+1-3)/2;
		//从row 3
		for (int i = 0; i < rowNum; i++) {
			int currentRowNum=i*2+3;
			int currentRowNumNext=i*2+4;
			hssfRow =hssfSheet.getRow(currentRowNum);
			hssfRow.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			String userNo=hssfRow.getCell(2).getStringCellValue();
			hssfRow.getCell(10).setCellType(Cell.CELL_TYPE_STRING);
			String userName=hssfRow.getCell(10).getStringCellValue();
			hssfRow =hssfSheet.getRow(currentRowNumNext);
			for (int j = 0; j < day; j++) {
				HSSFCell hssFCell=hssfRow.getCell(j);
				if (hssFCell!=null) {
					hssFCell.setCellType(Cell.CELL_TYPE_STRING);
					String time=hssFCell.getStringCellValue();
					String[] timeArray=StringUtils.split(time, "\r\n");
					for (String string : timeArray) {
						OaCoding oaCoding = new OaCoding();
						oaCoding.setDeptName("总公司");
						oaCoding.setUserName(userName);
						oaCoding.setUserNo(userNo);
						oaCoding.setEquipNo("303");
						String timeString=year;
						timeString=timeString+"/"+month;
						timeString=timeString+"/"+(j+1);
						timeString=timeString+" "+string;
						timeString=timeString+":00";
						oaCoding.setCodingTime(sdf.parse(timeString));
						super.save(oaCoding);
					}
				}
			}
		}
	}
	
	
	/**
	 * 浩顺打卡机导入网络日考勤模板
	 * @param file
	 * @return
	 * @throws ParseException 
	 * @throws IOException 
	 */
	public void saveDailyCheckNet(String filePath) throws ParseException, IOException {
        try {
            // 创建CSV读对象
            CsvReader csvReader = new CsvReader(filePath);
            // 读表头
            csvReader.readHeaders();
            while (csvReader.readRecord()){
                String userNo=csvReader.get(0);
                if(StringUtils.isNotEmpty(StringUtils.trim(userNo))){
                	String userName=csvReader.get(1);
                    String dateString=csvReader.get(2);
                    for (int i = 3; i < 3+10; i++) {
                    	String timeString=csvReader.get(i);
                    	if(StringUtils.isNotEmpty(StringUtils.trim(timeString))){
                    		OaCoding oaCoding = new OaCoding();
    						oaCoding.setDeptName("总公司");
    						oaCoding.setUserName(userName);
    						oaCoding.setUserNo(userNo);
    						oaCoding.setEquipNo("302");
    						String checkTime=dateString+" "+timeString;
    						oaCoding.setCodingTime(DateUtils.parseDate(checkTime,"yyyy-MM-dd HH:mm"));
    						oaCoding.setCreateBy(new User("1"));
    						oaCoding.setUpdateBy(new User("1"));
    						super.save(oaCoding);
                    	}
    				}
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
}