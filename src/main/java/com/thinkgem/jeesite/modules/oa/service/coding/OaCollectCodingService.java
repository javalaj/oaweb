/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.coding;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaCoding;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaCollectCoding;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

import freemarker.core.ReturnInstruction.Return;

import com.thinkgem.jeesite.modules.oa.dao.coding.OaCodingDao;
import com.thinkgem.jeesite.modules.oa.dao.coding.OaCollectCodingDao;

/**
 * 整理后每日打卡资料Service
 * 
 * @author 李廷龙
 * @version 2016-11-07
 */
@Service
@Transactional(readOnly = true)
public class OaCollectCodingService extends
		CrudService<OaCollectCodingDao, OaCollectCoding> {
	
	
	@Autowired
	OaCollectCodingDao oaCollectCodingDao;
	
	@Autowired
	OaCodingDao oaCodingDao;
	
	@Autowired
	OaCodingService oaCodingService;
	
	@Autowired
	SystemService systemService;
	public OaCollectCoding get(String id) {
		return super.get(id);
	}

	public List<OaCollectCoding> findList(OaCollectCoding oaCollectCoding) {
		return super.findList(oaCollectCoding);
	}

	public Page<OaCollectCoding> findPage(Page<OaCollectCoding> page,
			OaCollectCoding oaCollectCoding) {
		return super.findPage(page, oaCollectCoding);
	}

	@Transactional(readOnly = false)
	public void save(OaCollectCoding oaCollectCoding) {
		super.save(oaCollectCoding);
	}

	@Transactional(readOnly = false)
	public void delete(OaCollectCoding oaCollectCoding) {
		super.delete(oaCollectCoding);
	}

	public OaCollectCoding getByUserNoAndDate(String userNo, String date) {

		return oaCollectCodingDao.getByUserNoAndDate(userNo, date);
	}
	public List<OaCollectCoding> getListByUserNoAndDate(String userNo,Date searchDate){
		return oaCollectCodingDao.getListByUserNoAndDate(userNo, searchDate);
	}
	public List<OaCollectCoding> getListByUserAndDate(String userId, String date) {
		String pattern="yyyy-MM-dd";
		String beginDate = "";
		String endDate = "";
		Date beginDay = new Date();
		try {
			// 获取第一天的日期与第一个星期的星期一的日期
			beginDay = DateUtils.parseDate(date + "-01", pattern);

			int beginWeek = DateUtils.getWeekOfDate(beginDay);
			int div = beginWeek - 1;
			if (div < 0) {
				div = 6;
			}
			
			beginDate = DateUtils.formatDate(DateUtils.getDateBefore(beginDay, div), pattern);
			endDate = DateUtils.formatDate(DateUtils.getDateAfter(beginDay, 42), pattern);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<OaCollectCoding> listByUserAndDate = oaCollectCodingDao
				.getListByUserAndDate(userId, beginDate, endDate);
		List<OaCollectCoding> ret = new ArrayList<OaCollectCoding>();
		OaCollectCoding obj = null;
		for (int i = 0; i < 42; i++) {
			obj = null;
			;
			for (int j = 0; j < listByUserAndDate.size(); j++) {
				if (beginDate.equals(DateUtils.formatDate(listByUserAndDate.get(j).getCodingBegindate(), pattern))) {
					obj = listByUserAndDate.get(j);
					break;
				}
			}
			if (obj == null) {
				obj = new OaCollectCoding();
			}
			try {
				obj.setCreateDate(DateUtils.parseDate(beginDate, pattern));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ret.add(obj);
			try {
				beginDate = DateUtils.formatDate(DateUtils.getDateAfter(DateUtils.parseDate(beginDate, pattern), 1), pattern);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ret;
	}
	
	public void deleteByYearMonth(String yearMonth){
		dao.deleteByYearMonth(yearMonth);
	}
	
	
	/**
	 * 分析当前月份的打卡情况
	 * @param date
	 * @throws ParseException
	 */
	@Transactional(readOnly = false)
	public void updateAnalysis(Date date) throws ParseException{
//		String beginTime="10:00:00";
//		String beginTimeOthers="08:30:00";
//		String endTime="17:30:00";
		String beginTime1="08:30:00";
		String beginTime2="09:30:00";
		String endTime1="17:30:00";
		String endTime2="18:30:00";
		
		String deptCode="1014";
		long offset=9;
		int month=DateUtils.getDaysOfMonth(date);
		String yearMonth=DateUtils.formatDate(date, "yyyy-MM");
		dao.deleteByYearMonth(yearMonth);
		List<User> users=systemService.findAllList();
		
		List<List<OaCoding>> arrayList=new ArrayList<List<OaCoding>>();
		for (int i = 1; i <= month; i++) {
			String searchDate=yearMonth+"-"+i;
			if(i<10){
				searchDate=yearMonth+"-0"+i;
			}
			OaCoding oaCoding=new OaCoding();
			oaCoding.setSearchDate(searchDate);
			List<OaCoding> list=oaCodingDao.findMaxAndMinListBySearchDate(oaCoding);
			arrayList.add(list);
		}
		for (List<OaCoding> list : arrayList) {
			for (OaCoding oaCoding : list) {
				OaCollectCoding oaCollectCoding=new OaCollectCoding();
				oaCollectCoding.setUserNo(oaCoding.getUserNo());
				
				User user=getUserByNo(users,oaCoding.getUserNo());
//				String beginTimeReal=beginTime;
//				if(!checkIsUserOfDeptCode(deptCode,user)){
//					beginTimeReal=beginTimeOthers;
//				}
				String beginTimeReal1=beginTime1;
				String beginTimeReal2=beginTime2;
				String endTimeReal1=endTime1;
				String endTimeReal2=endTime2;

				if(!checkIsUserOfDeptCode(deptCode,user)){
					beginTimeReal2=beginTime1;
					endTimeReal2=endTime1;
				}
				oaCollectCoding.setCodingBegindate(oaCoding.getMinCodingTime());
				oaCollectCoding.setCodingEnddate(oaCoding.getMaxCodingTime());
//				oaCollectCoding.setWorkingType(getResultType(oaCoding,beginTimeReal,endTime,offset));
				oaCollectCoding.setWorkingType(getResultType(oaCoding,beginTimeReal1,beginTimeReal2,endTimeReal1,endTimeReal2));
				Date minCodingTime=oaCoding.getMinCodingTime();
				Date maxCodingTime=oaCoding.getMaxCodingTime();
				long timeOffset=maxCodingTime.getTime()-minCodingTime.getTime();
				oaCollectCoding.setTimeOffset(timeOffset);
				oaCollectCoding.setRemarks("");
				super.save(oaCollectCoding);
			}
		}
	}
	public boolean checkIsUserOfDeptCode(String deptCode,User user){
		if(user!=null&&user.getOffice()!=null&&user.getOffice().getCode()!=null&&user.getOffice().getCode().length()>4&&StringUtils.equals(StringUtils.substring(user.getOffice().getCode(), 0, 4), deptCode)){
			return true;
		}
		
		return false;
	}
	
	public User getUserByNo(List<User> users,String no){
		for (User user : users) {
			if(StringUtils.equals(user.getNo(), no)){
				return user;
			}
		}
		return null;
	}
	
	
	/**
	 * 分析考勤打卡情况
	 * @param oaCoding
	 * @param beginTime
	 * @param endTime
	 * @param offset
	 * @return
	 * @throws ParseException
	 */
	
	/*
	public String getResultType(OaCoding oaCoding,String beginTime,String endTime,long offset) throws ParseException{
		String result="√";
		//○迟到 ●早退 E时长不足 √正常
		Date minCodingTime=oaCoding.getMinCodingTime();
		Date maxCodingTime=oaCoding.getMaxCodingTime();
		Date beginDate=getDateByTimeAndDate(beginTime, minCodingTime);
		Date endDate=getDateByTimeAndDate(endTime, maxCodingTime);
		long timeOffset=maxCodingTime.getTime()-minCodingTime.getTime();
		if(timeOffset<offset*60*60*1000){
			//时长不达标
			result="E";
		}else{
			//其他情况
			//最早打卡时间晚于规定时间为迟到
			if(DateUtils.compareDate(minCodingTime, beginDate)>0){
				result="○";
				
			}
			//最晚打卡时间早于规定时间为早退
			if(DateUtils.compareDate(maxCodingTime, endDate)<0){
				result="●";
			}
			
		}		
		
		return result;
	}
			*/
	

	public String getResultType(OaCoding oaCoding,String beginTime1,String beginTime2,String endTime1,String endTime2) throws ParseException{
		String result="√";
		//○迟到 ●早退 E迟到+早退 √正常
		Date minCodingTime=oaCoding.getMinCodingTime();
		Date maxCodingTime=oaCoding.getMaxCodingTime();
		Date beginDate1=getDateByTimeAndDate(beginTime1, minCodingTime);
		Date beginDate2=getDateByTimeAndDate(beginTime2, minCodingTime);
		Date endDate1=getDateByTimeAndDate(endTime1, maxCodingTime);
		Date endDate2=getDateByTimeAndDate(endTime2, maxCodingTime);
		if(DateUtils.compareDate(minCodingTime, beginDate2)>0){
			if(DateUtils.compareDate(maxCodingTime, endDate2)<0){
				result="E";
			}else{
				result="○";
			}
		}else if(DateUtils.compareDate(minCodingTime, beginDate1)>0){
			if(DateUtils.compareDate(maxCodingTime, endDate1)<0){
				result="E";
			}else if(DateUtils.compareDate(maxCodingTime, endDate2)<0){
				result="○";
			}
		}else {
			if(DateUtils.compareDate(maxCodingTime, endDate1)<0){
				result="●";
			}
			
		}
		
		return result;
	}

		
	
	public Date getDateByTimeAndDate(String time,Date date) throws ParseException{
		String source=DateUtils.formatDate(date, "yyyy-MM-dd");
		source=source+" "+time;
		Date firstDate=DateUtils.parseDate(source, "yyyy-MM-dd hh:mm:ss");
		return firstDate;
	}
	@Transactional(readOnly = false)
	public void asyncHsqkCloud(Date date) throws ParseException, IOException, Exception{
		BasicCookieStore cookieStore = new BasicCookieStore();
		CloseableHttpClient httpclient = HttpClients.custom().setDefaultCookieStore(cookieStore).build();
		try {
			// 登录
			if (login(cookieStore, httpclient)) {
				downloadDayReport(date, httpclient);
				oaCodingService.saveDailyCheckNet(Global.getConfig(BASE_FILE_DIR)+DAILY_CHECK_FILE);
				updateAnalysis(date);
			}
		} finally {
			httpclient.close();
		}
	}
	public boolean login(BasicCookieStore cookieStore,
			CloseableHttpClient httpclient) throws Exception {

		System.out.println("浩顺考勤正在登录...... ");

		// 1 获取session
		HttpGet httpget = new HttpGet(HSKQ_URL);
		CloseableHttpResponse response = httpclient.execute(httpget);
		try {
			HttpEntity entity = response.getEntity();

			System.out.println("Login form get: " + response.getStatusLine());
			EntityUtils.consume(entity);

			System.out.println("Initial set of cookies:");
			List<Cookie> cookies = cookieStore.getCookies();
			if (cookies.isEmpty()) {
				System.out.println("None");
			} else {
				for (int i = 0; i < cookies.size(); i++) {
					System.out.println("- " + cookies.get(i).toString());
				}
			}
		} finally {
			response.close();
		}

		// 2 登录
		HttpUriRequest login = RequestBuilder.post()
				.setUri(new URI(HSKQ_URL + "/Account/LogOn"))
				.addParameter("ReturnUrl", "/")
				.addParameter("MobileNumber", "15623072994")
				.addParameter("Password", "cykj602")
				.addParameter("RememberMe", "true").build();
		CloseableHttpResponse response2 = httpclient.execute(login);
		try {
			HttpEntity entity = response2.getEntity();

			System.out.println("Login form get: " + response2.getStatusLine());
			EntityUtils.consume(entity);

			System.out.println("Post logon cookies:");
			List<Cookie> cookies = cookieStore.getCookies();
			if (cookies.isEmpty()) {
				System.out.println("None");
			} else {
				for (int i = 0; i < cookies.size(); i++) {
					System.out.println("- " + cookies.get(i).toString());
				}
			}
		} finally {
			response2.close();
		}
		return response2.getStatusLine().getStatusCode()==302;
	}

	public boolean downloadMonthReport(Date workmonth,
			CloseableHttpClient httpclient) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		String workmonthparam = format.format(workmonth);
		String downloadpath = String
				.format("/AttendanceManage/AttRecord/ExportMonthReport?Keyword=&DepartmentID=&WorkMonth=%s",
						workmonthparam);

		return downloadFile(Global.getConfig(BASE_FILE_DIR)+MONTH_CHECK_FILE, downloadpath, httpclient);
	}

	public boolean downloadDayReport(Date workdate,
			CloseableHttpClient httpclient) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String workdateparam = format.format(workdate);
		String downloadpath = String
				.format("/AttendanceManage/AttRecord/ExportReport?Keyword=&startdate=%s&enddate=%s&DepartmentID=",
						workdateparam, workdateparam);

		return downloadFile(Global.getConfig(BASE_FILE_DIR)+DAILY_CHECK_FILE, downloadpath, httpclient);
	}

	public boolean downloadFile(String filename, String downloadpath,
			CloseableHttpClient httpclient) throws Exception {
		System.out.println(String
				.format("正在从 %s 下载 %s", downloadpath, filename));
		HttpGet httpget = new HttpGet(new URI(HSKQ_URL + downloadpath));
		CloseableHttpResponse response = httpclient.execute(httpget);
		try {
			// check response headers.
			String reasonPhrase = response.getStatusLine().getReasonPhrase();
			int statusCode = response.getStatusLine().getStatusCode();

			System.out.println(String.format("statusCode: %d", statusCode));
			System.out.println(String.format("reasonPhrase: %s", reasonPhrase));

			HttpEntity entity = response.getEntity();
			if (entity != null) {
				File outputFile = new File(filename);
				InputStream inputStream = entity.getContent();
				FileOutputStream fileOutputStream = new FileOutputStream(
						outputFile);
				int read = 0;
				byte[] bytes = new byte[1024];
				while ((read = inputStream.read(bytes)) != -1) {
					fileOutputStream.write(bytes, 0, read);
				}
				fileOutputStream.close();
				System.out.println("Downloded " + outputFile.length()
						+ " bytes. " + entity.getContentType());
				System.out.println("outputFile.getAbsolutePath()"+outputFile.getAbsolutePath());
			} else {
				System.out.println("Download failed!");
				return false;
			}

		} finally {
			response.close();
		}

		return true;
	}
	
	public static String HSKQ_URL = "http://www.hsuncloud.com";
	public static String BASE_FILE_DIR = "baseFileDir";
	public static String DAILY_CHECK_FILE = "daily_check_file.csv";
	public static String MONTH_CHECK_FILE = "month_check_file.csv";

}