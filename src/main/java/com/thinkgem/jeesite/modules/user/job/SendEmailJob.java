package com.thinkgem.jeesite.modules.user.job;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.web.mytask.utis.SendEmail;
import com.thinkgem.jeesite.modules.sys.utils.RegexUtil;
import com.thinkgem.jeesite.modules.user.entity.NeedEmailUser;
import com.thinkgem.jeesite.modules.user.service.UserWorklogService;

@Component
public class SendEmailJob {
	private UserWorklogService userWorklogService = SpringContextHolder.getBean(UserWorklogService.class);
	public final Logger log = Logger.getLogger(this.getClass());

	public void run() {
		System.out.println("com.thinkgem.jeesite.modules.user.job.SendEmailJob >>> ------ send----E-mail------"
				+ new Date().toString());
		NeedEmailUser needEmailUser = new NeedEmailUser();
		Calendar c = Calendar.getInstance();
		long endTime = 0;
		switch (c.get(Calendar.DAY_OF_WEEK)) {
		case 7:
			// 7 , 星期六
			c.setTimeInMillis(c.getTimeInMillis() - 86400000l);
			endTime = 86400000l * 2;
			break;
		case 1:
			// 1 ，星期天
			c.setTimeInMillis(c.getTimeInMillis() - 86400000l * 2);
			endTime = 86400000l * 2;
			break;
		case 6:
			// 1 ，星期五
			endTime = 86400000l * 2;
			break;
		default:
			break;
		}
		c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		c.set(Calendar.MILLISECOND, 0);
		needEmailUser.setQueryDate(c.getTime());

		needEmailUser.setEndDate(new Date(c.getTimeInMillis() + 117000000 + endTime));
		List<NeedEmailUser> list = userWorklogService.findNotSubmitUserEmail(needEmailUser);
		List<String> toMailAddrList = new ArrayList<String>();
		for (NeedEmailUser n : list) {
			if (StringUtils.isNotBlank(n.getEmail())) {
				String email=n.getEmail();
				if (RegexUtil.checkEmail(email)){
					toMailAddrList.add(email);
				}
			}
		}
		if (toMailAddrList.size()>0) {
			for (String string : toMailAddrList) {
				String dateTime=DateUtils.formatDate(c.getTime(), "yyyy年MM月dd日	E") ;
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("time",dateTime);
				String subject = "提醒：您【"+dateTime+"】的日结尚未提交！请及时登陆系统提交！";
				String templatePath = "mailtemplate/userWorkDayCheckTemplate.ftl";
				String username = Global.getConfig("mail.smtp.username");
				String password = Global.getConfig("mail.smtp.password");
				String smtp = Global.getConfig("mail.smtp.host"); 
				String from = Global.getConfig("mail.smtp.from");
				String[] to = new String[1];
				to[0]=string; 
				toMailAddrList.toArray(to);
				String[] filename = {};
				SendEmail.sendAndCc(smtp, from, to, subject, map, username, password, filename, templatePath);
			}
			
		}
//		String dateTime=DateUtils.formatDate(c.getTime(), "yyyy年MM月dd日	E") ;
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("time",dateTime);
//		String subject = "提醒：您【"+dateTime+"】的日结尚未提交！请及时登陆系统提交！";
//		String templatePath = "mailtemplate/test2.ftl";
//		String username = "cz_asd19940729@163.com";
//		String password = "chenzhang.";
//		String smtp = "smtp.163.com";
//		String from = "cz_asd19940729@163.com";
//		String[] copyto = new String[toMailAddrList.size()];
//		toMailAddrList.toArray(copyto);
//		String[] to = new String[1];
//		to[0]="cz_asd19940729@163.com";
//		String[] filename = {};
//		SendEmail.sendAndCc(smtp, from, to, copyto, subject, map, username, password, filename, templatePath);
		
		
	}


	public static void main(String[] args) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");    
		 String str1 = sdf1.format(new Date()); 
		map.put("time", str1);
		//收件人地址
/*		String[] toMailAddr=new String[1];
		toMailAddr[0]="328172957@qq.com";
		String subject="楚誉科技工作会议";
		String templatePath="mailtemplate/test3.ftl";
		String username = "cz_asd19940729@163.com"; 
		String password = "chenzhang.";
		String smtp ="smtp.163.com"; 
		String from = "cz_asd19940729@163.com";
		//vrgtxzpwjtrdbjgb
		
		String[] toMailAddr=new String[1];
		toMailAddr[0]="863397598@qq.com";
		String subject="楚誉科技工作会议";
		String templatePath="mailtemplate/test3.ftl";
		String username = "328172957@qq.com"; 
		String password = "vrgtxzpwjtrdbjgb";
		String smtp ="smtp.qq.com"; 
		String from = "328172957@qq.com";
		String[] to = toMailAddr;
		String[] filename={};
		SendEmail.sendAndCc(smtp, from, to, subject, map, username, password, filename,templatePath);
		
		String email="328172957@163.com";
		if (RegexUtil.checkEmail(email)){
			System.out.println("email:"+email);
		}*/
	}

}
