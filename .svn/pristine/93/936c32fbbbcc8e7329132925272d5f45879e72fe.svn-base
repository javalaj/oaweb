/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 车辆管理Entity
 * @author niting
 * @version 2016-11-17
 */
public class CarManagement extends DataEntity<CarManagement> {
	
	private static final long serialVersionUID = 1L;
	private String procInsId;		// 流程实例id
	private String platenum;		// 车牌号
	private String brand;		// 品牌
	private String model;		// 型号
	private String seatnum;		// 座位数
	private String kilometers;		// 公里数
	private Date buydate;		// 购买日期
	private String framenum;		// 车架号
	private String price;		// 车辆价格
	private String insurer;		// 保险公司
	private String policynum;		// 保单号
	private String photo;		// 图片
	private String reason;		// 停用原因
	private String driverlicense;		// 行驶证号
	private String state;		// 车辆状态（0.正常  1.已停用）
	private Date dlicensedate;		// 行驶证有效期
	private String usereason;  //车辆启用原因
	private String delreason; //车辆报废原因
	private String otherreason;//其他原因
	private String lastlending;//最后借车的人
	
	
	
	public String getLastlending() {
		return lastlending;
	}

	public void setLastlending(String lastlending) {
		this.lastlending = lastlending;
	}

	public String getOtherreason() {
		return otherreason;
	}

	public void setOtherreason(String otherreason) {
		this.otherreason = otherreason;
	}

	public String getUsereason() {
		return usereason;
	}

	public void setUsereason(String usereason) {
		this.usereason = usereason;
	}

	public String getDelreason() {
		return delreason;
	}

	public void setDelreason(String delreason) {
		this.delreason = delreason;
	}

	public CarManagement() {
		super();
	}

	public CarManagement(String id){
		super(id);
	}

	@Length(min=0, max=255, message="流程实例id长度必须介于 0 和 255 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
	@Length(min=1, max=64, message="车牌号长度必须介于 1 和 64 之间")
	@NotNull(message="车牌号不能为空！")
	public String getPlatenum() {
		return platenum;
	}

	public void setPlatenum(String platenum) {
		this.platenum = platenum;
	}
	
	@Length(min=1, max=64, message="品牌长度必须介于 1 和 64 之间")
	@NotNull(message="品牌不能为空！")
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	@Length(min=0, max=64, message="型号长度必须介于 0 和 64 之间")
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	
	@Length(min=1, max=10, message="座位数长度必须介于 1 和 10 之间")
	@NotNull(message="座位数不能为空")
	public String getSeatnum() {
		return seatnum;
	}

	public void setSeatnum(String seatnum) {
		this.seatnum = seatnum;
	}
	
	public String getKilometers() {
		return kilometers;
	}

	public void setKilometers(String kilometers) {
		this.kilometers = kilometers;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="日期不能为空")
	public Date getBuydate() {
		return buydate;
	}

	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
	
	@Length(min=0, max=64, message="车架号长度必须介于 0 和 64 之间")
	public String getFramenum() {
		return framenum;
	}

	public void setFramenum(String framenum) {
		this.framenum = framenum;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	@Length(min=0, max=64, message="保险公司长度必须介于 0 和 64 之间")
	public String getInsurer() {
		return insurer;
	}

	public void setInsurer(String insurer) {
		this.insurer = insurer;
	}
	
	@Length(min=0, max=64, message="保单号长度必须介于 0 和 64 之间")
	public String getPolicynum() {
		return policynum;
	}

	public void setPolicynum(String policynum) {
		this.policynum = policynum;
	}
	
	@Length(min=0, max=1000, message="图片长度必须介于 0 和 1000 之间")
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@Length(min=0, max=200, message="原因（包括报废，启用，停用原因）长度必须介于 0 和 200 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Length(min=0, max=64, message="行驶证号长度必须介于 0 和 64 之间")
	public String getDriverlicense() {
		return driverlicense;
	}

	public void setDriverlicense(String driverlicense) {
		this.driverlicense = driverlicense;
	}
	
	@Length(min=0, max=64, message="长度必须介于 0 和 1 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDlicensedate() {
		return dlicensedate;
	}

	public void setDlicensedate(Date dlicensedate) {
		this.dlicensedate = dlicensedate;
	}
	
}