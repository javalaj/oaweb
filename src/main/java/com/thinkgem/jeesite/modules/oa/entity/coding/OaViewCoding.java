package com.thinkgem.jeesite.modules.oa.entity.coding;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class OaViewCoding extends DataEntity<OaViewCoding> {

	private static final long serialVersionUID = 1L;

	private String userName;// 姓名
	private String userNo;// 用户编号
	private String deptName;// 部门
	private int workingDays;// 出勤天数
	private int workingLessDays;// 时长不足天数
	private int workingLaterDays;// 迟到天数
	private int workingBeforeDays;// 早退天数
	private int goOutDays;// 外出天数
	private int businessTripDays;// 出差天数
	private int forgetCodingDays;// 忘打卡天数
	private int vocateDays;// 请假天数
	private int takeOffDays;// 调休天数
	private int overtimeDays;// 加班天数
	private OaCollectCoding[] OaCollectCodings;// 每日上班情况
	private String date;// 天
	private String workingType;// 上班状态
	private Date codingBegindate;// 上班时间
	private Date codingEnddate;// 下班时间
	/**
	 * 月平均工作时长
	 */
	private Long averageWorktime;
	private int workingMoutDays;//上班未打卡
	private int workingAoutDays;//下班未打卡
	
	/**有效出勤天数**/
	private Long workingValidDays;
	
	/**工作总时长**/
	private Long  workingHours;
	
	private double applyTypeLitShijiaCount;//事假
	private double applyTypeLitBingjiaCount;//病假
	private double applyTypeLitNianjiaCount;//年假
	private double applyTypeLitTiaoxiuCount;//调休
	
	private double applyTypeLitSangjiaCount;//丧假
	private double applyTypeLitHunjiaCount;//婚假
	private double applyTypeLitTanqinjiaCount;//探亲假
	private double applyTypeLitChanjiaCount;//产假
	
	private double applyTypeJiabanCount;//加班
	
	private int applyTypeShangwuCount;//上午未打卡
	private int applyTypeXiawuCount;//下午未打卡
	
	private double applyTypeChuchaiCount;//出差
	private double applyTypeWaichuCount;//外出
	
	private long timeOffset;// 上班时长

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWorkingType() {
		return workingType;
	}

	public void setWorkingType(String workingType) {
		this.workingType = workingType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getWorkingDays() {
		return workingDays;
	}

	public void setWorkingDays(int workingDays) {
		this.workingDays = workingDays;
	}

	public int getWorkingLessDays() {
		return workingLessDays;
	}

	public void setWorkingLessDays(int workingLessDays) {
		this.workingLessDays = workingLessDays;
	}

	public int getWorkingLaterDays() {
		return workingLaterDays;
	}

	public void setWorkingLaterDays(int workingLaterDays) {
		this.workingLaterDays = workingLaterDays;
	}

	public int getWorkingBeforeDays() {
		return workingBeforeDays;
	}

	public void setWorkingBeforeDays(int workingBeforeDays) {
		this.workingBeforeDays = workingBeforeDays;
	}

	public int getGoOutDays() {
		return goOutDays;
	}

	public void setGoOutDays(int goOutDays) {
		this.goOutDays = goOutDays;
	}

	public int getBusinessTripDays() {
		return businessTripDays;
	}

	public void setBusinessTripDays(int businessTripDays) {
		this.businessTripDays = businessTripDays;
	}

	public int getForgetCodingDays() {
		return forgetCodingDays;
	}

	public void setForgetCodingDays(int forgetCodingDays) {
		this.forgetCodingDays = forgetCodingDays;
	}

	public int getVocateDays() {
		return vocateDays;
	}

	public void setVocateDays(int vocateDays) {
		this.vocateDays = vocateDays;
	}

	public int getTakeOffDays() {
		return takeOffDays;
	}

	public void setTakeOffDays(int takeOffDays) {
		this.takeOffDays = takeOffDays;
	}

	public int getOvertimeDays() {
		return overtimeDays;
	}

	public void setOvertimeDays(int overtimeDays) {
		this.overtimeDays = overtimeDays;
	}


	public int getWorkingMoutDays() {
		return workingMoutDays;
	}

	public void setWorkingMoutDays(int workingMoutDays) {
		this.workingMoutDays = workingMoutDays;
	}

	public int getWorkingAoutDays() {
		return workingAoutDays;
	}

	public void setWorkingAoutDays(int workingAoutDays) {
		this.workingAoutDays = workingAoutDays;
	}

	public double getApplyTypeLitShijiaCount() {
		return applyTypeLitShijiaCount;
	}

	public void setApplyTypeLitShijiaCount(double applyTypeLitShijiaCount) {
		this.applyTypeLitShijiaCount = applyTypeLitShijiaCount;
	}

	public double getApplyTypeLitBingjiaCount() {
		return applyTypeLitBingjiaCount;
	}

	public void setApplyTypeLitBingjiaCount(double applyTypeLitBingjiaCount) {
		this.applyTypeLitBingjiaCount = applyTypeLitBingjiaCount;
	}

	public double getApplyTypeLitNianjiaCount() {
		return applyTypeLitNianjiaCount;
	}

	public void setApplyTypeLitNianjiaCount(double applyTypeLitNianjiaCount) {
		this.applyTypeLitNianjiaCount = applyTypeLitNianjiaCount;
	}

	public double getApplyTypeLitTiaoxiuCount() {
		return applyTypeLitTiaoxiuCount;
	}

	public void setApplyTypeLitTiaoxiuCount(double applyTypeLitTiaoxiuCount) {
		this.applyTypeLitTiaoxiuCount = applyTypeLitTiaoxiuCount;
	}

	public double getApplyTypeLitSangjiaCount() {
		return applyTypeLitSangjiaCount;
	}

	public void setApplyTypeLitSangjiaCount(double applyTypeLitSangjiaCount) {
		this.applyTypeLitSangjiaCount = applyTypeLitSangjiaCount;
	}

	public double getApplyTypeLitHunjiaCount() {
		return applyTypeLitHunjiaCount;
	}

	public void setApplyTypeLitHunjiaCount(double applyTypeLitHunjiaCount) {
		this.applyTypeLitHunjiaCount = applyTypeLitHunjiaCount;
	}

	public double getApplyTypeLitTanqinjiaCount() {
		return applyTypeLitTanqinjiaCount;
	}

	public void setApplyTypeLitTanqinjiaCount(double applyTypeLitTanqinjiaCount) {
		this.applyTypeLitTanqinjiaCount = applyTypeLitTanqinjiaCount;
	}

	public double getApplyTypeLitChanjiaCount() {
		return applyTypeLitChanjiaCount;
	}

	public void setApplyTypeLitChanjiaCount(double applyTypeLitChanjiaCount) {
		this.applyTypeLitChanjiaCount = applyTypeLitChanjiaCount;
	}

	public double getApplyTypeJiabanCount() {
		return applyTypeJiabanCount;
	}

	public void setApplyTypeJiabanCount(double applyTypeJiabanCount) {
		this.applyTypeJiabanCount = applyTypeJiabanCount;
	}

	public double getApplyTypeShangwuCount() {
		return applyTypeShangwuCount;
	}

	public void setApplyTypeShangwuCount(int applyTypeShangwuCount) {
		this.applyTypeShangwuCount = applyTypeShangwuCount;
	}

	public int getApplyTypeXiawuCount() {
		return applyTypeXiawuCount;
	}

	public void setApplyTypeXiawuCount(int applyTypeXiawuCount) {
		this.applyTypeXiawuCount = applyTypeXiawuCount;
	}

	public double getApplyTypeChuchaiCount() {
		return applyTypeChuchaiCount;
	}

	public void setApplyTypeChuchaiCount(double applyTypeChuchaiCount) {
		this.applyTypeChuchaiCount = applyTypeChuchaiCount;
	}

	public double getApplyTypeWaichuCount() {
		return applyTypeWaichuCount;
	}

	public void setApplyTypeWaichuCount(double applyTypeWaichuCount) {
		this.applyTypeWaichuCount = applyTypeWaichuCount;
	}

	public long getTimeOffset() {
		return timeOffset;
	}

	public void setTimeOffset(long timeOffset) {
		this.timeOffset = timeOffset;
	}


	public OaCollectCoding[] getOaCollectCodings() {
		return OaCollectCodings;
	}

	public void setOaCollectCodings(OaCollectCoding[] oaCollectCodings) {
		OaCollectCodings = oaCollectCodings;
	}

	public Date getCodingBegindate() {
		return codingBegindate;
	}

	public void setCodingBegindate(Date codingBegindate) {
		this.codingBegindate = codingBegindate;
	}

	public Date getCodingEnddate() {
		return codingEnddate;
	}

	public void setCodingEnddate(Date codingEnddate) {
		this.codingEnddate = codingEnddate;
	}

	public Long getAverageWorktime() {
		return averageWorktime;
	}

	public void setAverageWorktime(Long averageWorktime) {
		this.averageWorktime = averageWorktime;
	}

	public Long getWorkingValidDays() {
		return workingValidDays;
	}

	public void setWorkingValidDays(Long workingValidDays) {
		this.workingValidDays = workingValidDays;
	}

	public Long getWorkingHours() {
		return workingHours;
	}

	public void setWorkingHours(Long workingHours) {
		this.workingHours = workingHours;
	}
	
	

}
