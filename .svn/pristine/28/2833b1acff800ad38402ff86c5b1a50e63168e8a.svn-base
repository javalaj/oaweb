package com.thinkgem.jeesite.modules.oa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaAddress;

@MyBatisDao
public interface CyTspOaAddressDao  extends CrudDao<CyTspOaAddress>{
	//根据当前登入人查询通讯录
	List<CyTspOaAddress> findList_Oadress(CyTspOaAddress cytspoaaddress);
	//是否分享该联系人
	void ShareContacts(@Param("flag")Integer flag,@Param("id")String id,@Param("shareFlagUserId")String shareFlagUserId);
    //查询共享联系人
	List<CyTspOaAddress> findList_ShareContactsList(CyTspOaAddress cytspoaaddress);
	//取消共享
	boolean offShare(@Param("flag")Integer flag,@Param("id")String id,@Param("shareFlagUserId")String shareFlagUserId);
	//新建联系人
	int insertContacts(CyTspOaAddress cytspoaaddress);
	
	public List<CyTspOaAddress> findAllOaAdressByGroupId(@Param("groupId")String groupId);
	
	void upaddress(CyTspOaAddress cytspoaaddress);
	
	CyTspOaAddress getcytspoaaddress(@Param("id")String id);
   
}
