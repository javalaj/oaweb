package com.thinkgem.jeesite.modules.oa.job.coding;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.oa.dao.OaNotifyDao;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

public class OaProfileJob {
	
	private UserDao userDao = SpringContextHolder.getBean(UserDao.class);
			
	private OaNotifyDao oaNotifyDao = SpringContextHolder.getBean(OaNotifyDao.class);
	
	private OaNotifyService oaNotifyService = SpringContextHolder.getBean(OaNotifyService.class);
	
	public void run()
	{
		try {
			String userIds=UserUtils.getByLoginName(DictUtils.getDictValue("wangying", "tipMan", "")).getId();
			OaNotify oaNotify1 = new OaNotify();
			oaNotify1.setSelf(true);
			User currentUser=new User();
			currentUser.setId(userIds);
			oaNotify1.setCurrentUser(currentUser);
			List<OaNotify> oaList=oaNotifyDao.findList(oaNotify1);//获取员工转正，合同到期提醒接收人收到的消息列表

		for(User u:userDao.getProfile(new User())){
			
			 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			 
			 Date tempPdate = u.getPdate();
			 
			 Date tempContractEnd = u.getContractEnd();
			 
			 if (tempPdate == null)
				 tempPdate = new Date();
			 
			 if (tempContractEnd == null)
				 tempContractEnd = new Date();
			 
			   String pdate = format.format(tempPdate);//转正时间
			   String enddate = format.format(tempContractEnd);//合同结束时间
			String today= format.format(new Date());//当前日期
			String predate = format.format(com.thinkgem.jeesite.modules.sys.utils.DateUtils.getDate(pdate, 7));//转正前七天
			String precdate=format.format(com.thinkgem.jeesite.modules.sys.utils.DateUtils.getDate(enddate, 7));//合同到期时间前7天
			
			
			//员工转正提醒
			if(today.equals(predate)){
				String ptitle=u.getName()+"转正日期为"+pdate+",请注意提前办理转正手续。";
				Boolean pflag=true;
				for(OaNotify a:oaList){
					if(a.getTitle().equals(ptitle)){//从列表中通过消息名称判断消息提醒是否已发送，避免消息重复发送
						//System.out.println("转正标题：============================"+a.getTitle());
						 pflag=false;
						 break;
					}else{
						continue;
					}
				}
				//System.out.println("转正提醒标识：============================"+pflag);
				if(pflag==true){
				OaNotify oaNotify = new OaNotify();
				oaNotify.setContent(u.getName()+"转正日期为"+pdate+",请注意提前办理转正手续。");//转正提醒
				oaNotify.setType("4");// 协同通知配置为4
				oaNotify.setStatus("1");// 发布状态
				oaNotify.setTitle(ptitle);
				oaNotify.setOaNotifyRecordIds(userIds);
				oaNotify.setCreateBy(new User("1"));
				oaNotify.setUpdateBy(new User("1"));
				oaNotifyService.save(oaNotify);
				}
				
			}
			//合同到期提醒
			if(today.equals(precdate)){
				String ctitle=u.getName()+"劳动合同即将于"+enddate+"到期,请注意提前办理续签手续。";
				Boolean cflag=true;
				for(OaNotify a:oaList){
					if(a.getTitle().equals(ctitle)){	//从列表中通过消息名称判断消息提醒是否已发送，避免消息重复发送				
						 cflag=false;
						 break;
					}else{
						continue;
					}
				}
				if(cflag==true){
				OaNotify oaNotify = new OaNotify();
				oaNotify.setContent(u.getName()+"劳动合同即将于"+enddate+"到期,请注意提前办理续签手续。");//转正提醒
				oaNotify.setType("4");// 协同通知配置为4
				oaNotify.setStatus("1");// 发布状态
				oaNotify.setTitle(ctitle);
				oaNotify.setOaNotifyRecordIds(userIds);
				
				oaNotify.setCreateBy(new User("1"));
				
				oaNotify.setUpdateBy(new User("1"));
				
				oaNotifyService.save(oaNotify);
				}
				
			}
		}
			} catch (NullPointerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (ParseException e) {
				// TODO: handle exception
			}
	}
	
	
}
