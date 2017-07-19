/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;

import java.math.BigInteger;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonBackReference;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;

/**
 * 合同Entity
 * @author liaijun
 * @version 2016-11-26
 */
public class OaContract extends DataEntity<OaContract> {
	
	private static final long serialVersionUID = 1L;
	private String cname;		// 合同名称
	private String pname;		// 项目名称(旧)
	private String ctype;		// 合同类别
	private String content;		// 服务内容
	private String utype;		// 客户类别
	private String owner;		// 合同甲方
	private String ownerinfo;		// 甲方开票信息
	private BigInteger money;		// 金额
	private Date cdate;		// 合同签订日期
	private String warrantytime;		// 合同保修期
	private String warrantymoney;		// 质保金金额
	private Date indate;		// indate
	private String cstate;		// 合同阶段
	private String isback;		// 是否返点
	private String isover;		// 是否经过招投标
	private String contractDegital;		// 合同电子版
	private String contractScanner;		// 合同扫描版
	private String punish;		// 惩罚
	private String norecive;		// 未收款
	private Supmanagement providerid;		// 供应商id
	private OaProject projectid;		// 项目id
	private Date beginCdate;		// 开始 合同签订日期
	private Date endCdate;		// 结束 合同签订日期
	
	public OaContract() {
		super();
	}

	public OaContract(String id){
		super(id);
	}

	@Length(min=1, max=64, message="合同名称长度必须介于 1 和 64 之间")
	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
	
	@Length(min=0, max=64, message="项目名称(旧)长度必须介于 0 和 64 之间")
	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
	
	@Length(min=1, max=1, message="合同类别长度必须介于 1 和 1 之间")
	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	
	@Length(min=1, max=64, message="服务内容长度必须介于 1 和 64 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=1, max=64, message="客户类别长度必须介于 1 和 64 之间")
	public String getUtype() {
		return utype;
	}

	public void setUtype(String utype) {
		this.utype = utype;
	}
	
	@Length(min=1, max=64, message="合同甲方长度必须介于 1 和 64 之间")
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	@Length(min=1, max=64, message="甲方开票信息长度必须介于 1 和 64 之间")
	public String getOwnerinfo() {
		return ownerinfo;
	}

	public void setOwnerinfo(String ownerinfo) {
		this.ownerinfo = ownerinfo;
	}
	

	public BigInteger getMoney() {
		return money;
	}

	public void setMoney(BigInteger money) {
		this.money = money;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="合同签订日期不能为空")
	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	
	@Length(min=0, max=64, message="合同保修期长度必须介于 0 和 64 之间")
	public String getWarrantytime() {
		return warrantytime;
	}

	public void setWarrantytime(String warrantytime) {
		this.warrantytime = warrantytime;
	}
	
	@Length(min=1, max=64, message="质保金金额长度必须介于 1 和 64 之间")
	public String getWarrantymoney() {
		return warrantymoney;
	}

	public void setWarrantymoney(String warrantymoney) {
		this.warrantymoney = warrantymoney;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="indate不能为空")
	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}
	
	@Length(min=1, max=1, message="合同阶段长度必须介于 1 和 1 之间")
	public String getCstate() {
		return cstate;
	}

	public void setCstate(String cstate) {
		this.cstate = cstate;
	}
	
	@Length(min=1, max=1, message="是否返点长度必须介于 1 和 1 之间")
	public String getIsback() {
		return isback;
	}

	public void setIsback(String isback) {
		this.isback = isback;
	}
	
	@Length(min=1, max=1, message="是否经过招投标长度必须介于 1 和 1 之间")
	public String getIsover() {
		return isover;
	}

	public void setIsover(String isover) {
		this.isover = isover;
	}
	
	@Length(min=0, max=1000, message="合同电子版长度必须介于 0 和 64之间")
	public String getContractDegital() {
		return contractDegital;
	}

	public void setContractDegital(String contractDegital) {
		this.contractDegital = contractDegital;
	}
	
	@Length(min=0, max=1000, message="合同扫描版长度必须介于 0 和 64 之间")
	public String getContractScanner() {
		return contractScanner;
	}

	public void setContractScanner(String contractScanner) {
		this.contractScanner = contractScanner;
	}
	
	@Length(min=0, max=64, message="惩罚长度必须介于 0 和 64 之间")
	public String getPunish() {
		return punish;
	}

	public void setPunish(String punish) {
		this.punish = punish;
	}
	
	@Length(min=0, max=64, message="未收款长度必须介于 0 和 64 之间")
	public String getNorecive() {
		return norecive;
	}

	public void setNorecive(String norecive) {
		this.norecive = norecive;
	}
	
	@JsonBackReference
	public Supmanagement getProviderid() {
		return providerid;
	}

	public void setProviderid(Supmanagement providerid) {
		this.providerid = providerid;
	}
	
	@JsonBackReference
	public OaProject getProjectid() {
		return projectid;
	}

	public void setProjectid(OaProject projectid) {
		this.projectid = projectid;
	}
	
	public Date getBeginCdate() {
		return beginCdate;
	}

	public void setBeginCdate(Date beginCdate) {
		this.beginCdate = beginCdate;
	}
	
	public Date getEndCdate() {
		return endCdate;
	}

	public void setEndCdate(Date endCdate) {
		this.endCdate = endCdate;
	}
		
}