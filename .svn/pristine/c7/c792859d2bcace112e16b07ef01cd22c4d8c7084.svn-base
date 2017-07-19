/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.mytask;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.mytask.OaPlan;

/**
 * 我的日程DAO接口
 * @author chenzhang
 * @version 2016-12-01
 */
@MyBatisDao
public interface OaPlanDao extends CrudDao<OaPlan> {
	
	public List<OaPlan> selectDate(OaPlan oaPlan);
	public List<OaPlan> pagefindList(OaPlan oaPlan);
	
	public  List<OaPlan> findListTask(OaPlan oaPlan);
	public  List<OaPlan> myfindListTask(OaPlan oaPlan);
	
	//统计我布置的任务
	Map<String, String> cnmylist(OaPlan oaPlan);
	//我收到任务的列表
	public  List<OaPlan> relist(OaPlan oaPlan);
	public  List<OaPlan> statelist(OaPlan oaPlan);
	List<OaPlan> listhuiyi(OaPlan oaPlan);
	
	Map<String, String> statea(OaPlan oaPlan);
	Map<String, String> stateb(OaPlan oaPlan);
	Map<String, String> statec(OaPlan oaPlan);
	public  List<OaPlan> ListTask(OaPlan oaPlan);
	
	public  List<OaPlan> mystatelist(OaPlan oaPlan);
	public void upisback(@Param("id")String  id);//修改回执状态
	public  void up(OaPlan oaPlan);//修改成完成
	public  void upi(@Param("id")String  id);//修改过期
	public  void uphuiyi(@Param("id")String  id);//修改会议开始
	
	
	Map<String, String> mystatea(@Param("cruserid")String  cruserid);
	Map<String, String> mystateb(@Param("cruserid")String  cruserid);
	Map<String, String> mystatec(@Param("cruserid")String  cruserid);
	
	public List<OaPlan> getChild(@Param("id")String  id);
	public  List<OaPlan> getparlist(OaPlan oaPlan);
	void UpTaksRemarks(OaPlan oaPlan);
	
	//首页统计所有成员布置的任务
	public List<OaPlan> indexfindListTask();
	
	//手机端
	//修改任务
	void mobileUpTaks(OaPlan oaPlan);
	void	mobileUpChildTaks(OaPlan oaPlan);
	
	
}