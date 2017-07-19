package com.thinkgem.jeesite.modules.oa.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.CyTspOaAddressDao;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaAddress;
import com.thinkgem.jeesite.modules.oa.entity.doc.OaDoc;
@Service
@Transactional(readOnly = true)
public class CyTspOaAddressService extends CrudService<CyTspOaAddressDao, CyTspOaAddress> {
	@Autowired
	CyTspOaAddressDao dao;
	public Page<CyTspOaAddress> findList_Oadress(Page<CyTspOaAddress> page,CyTspOaAddress cytspoaaddress){
		cytspoaaddress.setPage(page);
		page.setList(dao.findList_Oadress(cytspoaaddress));
		return page;
		
	}
	
	public CyTspOaAddress getcytspoaaddress(String id){
		return dao.getcytspoaaddress(id);
	}
	
	public List<CyTspOaAddress> findAllOaAdressByGroupId(String groupId){
		return dao.findAllOaAdressByGroupId(groupId);
		
	}
	public List<CyTspOaAddress> findAllShareOaAdress(CyTspOaAddress cytspoaaddress){
		return dao.findList_ShareContactsList(cytspoaaddress);
		
	}
	@Transactional(readOnly = false)
	public void ShareContacts(Integer flag,String id,String shareFlagUserId){
		dao.ShareContacts(flag, id,shareFlagUserId);
	}
	
	public Page<CyTspOaAddress> findList_ShareContactsList(Page<CyTspOaAddress> page,CyTspOaAddress cytspoaaddress){
		cytspoaaddress.setPage(page);
		page.setList(dao.findList_ShareContactsList(cytspoaaddress));
		return page;
		
	}
	@Transactional(readOnly = false)
	public boolean offShare(Integer flag,String id,String shareFlagUserId){
		return dao.offShare(flag, id, shareFlagUserId);
	}
	
	public Page<CyTspOaAddress> findoaAdress(Page<CyTspOaAddress> page, CyTspOaAddress cytspoaaddress) {
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		cytspoaaddress.getSqlMap().put("dsf", dataScopeFilter(cytspoaaddress.getCurrentUser(), "o", "a"));
		// 设置分页参数
		cytspoaaddress.setPage(page);
		// 执行分页查询
		page.setList(dao.findList(cytspoaaddress));
		return page;
	}
	
	public Page<CyTspOaAddress> findoaAdressShaer(Page<CyTspOaAddress> page, CyTspOaAddress cytspoaaddress) {
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		cytspoaaddress.getSqlMap().put("dsf", dataScopeFilter(cytspoaaddress.getCurrentUser(), "o", "a"));
		// 设置分页参数
		cytspoaaddress.setPage(page);
		// 执行分页查询
		page.setList(dao.findList_ShareContactsList(cytspoaaddress));
		return page;
	}
	
	@Transactional(readOnly = false)
	public int insert(CyTspOaAddress cytspoaaddress) {
        return dao.insert(cytspoaaddress);
}
	
	
	@Transactional(readOnly = false)
	public void  upaddress(CyTspOaAddress cytspoaaddress) {
      dao.upaddress(cytspoaaddress);
}
	@Transactional(readOnly = false)
	public int insertContacts(CyTspOaAddress cytspoaaddress) {
        return dao.insertContacts(cytspoaaddress);
}
	
	@Transactional(readOnly = false)
   public void delete(CyTspOaAddress cytspoaaddress){
	   dao.delete(cytspoaaddress);
   }
	
	 public List<CyTspOaAddress> findList_Oadress(CyTspOaAddress cytspoaaddress){
		 return dao.findList_Oadress(cytspoaaddress);
	 }

	  
}
