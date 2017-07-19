/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.contract;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractProtocol;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractProtocolDao;

/**
 * 协议框架合同管理Service
 * @author 李廷龙
 * @version 2017-01-04
 */
@Service
@Transactional(readOnly = true)
public class OaContractProtocolService extends CrudService<OaContractProtocolDao, OaContractProtocol> {

	public OaContractProtocol get(String id) {
		return super.get(id);
	}
	
	public List<OaContractProtocol> findList(OaContractProtocol oaContractProtocol) {
		return super.findList(oaContractProtocol);
	}
	
	public Page<OaContractProtocol> findPage(Page<OaContractProtocol> page, OaContractProtocol oaContractProtocol) {
		return super.findPage(page, oaContractProtocol);
	}
	
	@Transactional(readOnly = false)
	public void save(OaContractProtocol oaContractProtocol) {
		if (oaContractProtocol.getIsNewRecord()){
			oaContractProtocol.preInsert();
			if (StringUtils.isBlank(oaContractProtocol.getContractNo())) {
				oaContractProtocol.setContractNo(OrdersUtils.getGenerateOrderNo4("XY-"));
			}
			dao.insert(oaContractProtocol);
		}else{
			oaContractProtocol.preUpdate();
			dao.update(oaContractProtocol);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(OaContractProtocol oaContractProtocol) {
		super.delete(oaContractProtocol);
	}
	
	public List<OaContractProtocol> findListByProjectId(OaContractProtocol oaContractProtocol){
		return dao.findListByProjectId(oaContractProtocol);
	}
	
}