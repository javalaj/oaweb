/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.computerpurchase;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 电脑采购Entity
 * @author zf
 * @version 2016-12-01
 */
public class ComputerPurchase extends ActEntity<ComputerPurchase> {
	
	private static final long serialVersionUID = 1L;
	private String applyDept;		// 申请部门
	private Date applyTime;		// 申请时间
	private User userName;		// 使用人
	private String configure;		// 配置
	private String demandModel;		// 要求型号
	private String cpu;		// cpu
	private String memory;		// 内存
	private String hardDisk;		// 硬盘容量
	private String videoCard;		// 显卡
	private String other;		// 其他要求
	private String deptDirectorSuggestion;		// 申请部门主管意见
	private String deputyManagerSuggestion;		// 申请部门副总意见
	private String adminDeptManagerSuggestion;		// 人事行政副总意见
	private String generalManagerSuggestion;		// 总经理审批
	private String purchaser;		// 采购执行
	private String admin;		// 固定资产管理员
	/*private String procInsId;		// 流程相关id
	private String title;		// 标题
*/
	private String status;		// 审批状态（0：未送审；1：部门主管审批；2：部门副总审批；3：人事部审批；4：总经理审批；5：商务部审批；6：管理员入库；y：已结案；x:已销毁;z:修改）
	private String isStart;		// 是否已进入流程（0：未开启；1：已开启）
	
	private Date beginApplyTime;		// 开始 申请时间
	private Date endApplyTime;		// 结束 申请时间
	
	private String deptId;			//	申请人部门ID
	
	/**流程查看路径*/
	public static final String WORKFLOW_URL = "@@proNotify@@/oa/a/oa/computerpurchase/computerPurchase/form?id=";
			
	/**流程撤回路径*/
	public static final String WORKFLOW_URL_BACK = "/oa/computerpurchase/computerPurchase/form?returnFlag=1&id=";	
	
	/**流程名称*/
	public static final String WORKFLOW_NAME = "办公电脑采购";
	
	/**流程id*/
	public static final String PROC_DEF_KEY = "computer_purchase";
	
	/**物业表名称*/
	public static final String BUSINESS_TABLE = "computer_purchase";
	
	/**撤回标记*/
	public static final String RETURNFLAG = "1";
	
	/**部门主管审批*/
	public static final String DEPTDIRECTOR_EXAM = "1";
	
	/**部门副总审批*/
	public static final String DEPUTYMANAGER_EXAM = "2";
	
	/**人事部审批*/
	public static final String ADMINDEPTMANAGER_EXAM = "3";
	
	/**总经理审批*/
	public static final String GENERALMANAGER_EXAM = "4";
	
	/**商务部审批*/
	public static final String PURCHASER_EXAM = "5";
	
	/**管理员入库*/
	public static final String ADMIN_EXAM = "6";
	
	/**修改*/
	public static final String MODIFY = "z";
	
	public ComputerPurchase() {
		super();
	}

	public ComputerPurchase(String id){
		super(id);
	}

	@Length(min=0, max=64, message="申请部门长度必须介于 0 和 64之间")
	public String getApplyDept() {
		return applyDept;
	}

	public void setApplyDept(String applyDept) {
		this.applyDept = applyDept;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	
	@Length(min=0, max=30, message="配置长度必须介于 0 和 30 之间")
	public String getConfigure() {
		return configure;
	}

	public void setConfigure(String configure) {
		this.configure = configure;
	}
	
	@Length(min=0, max=50, message="要求型号长度必须介于 0 和 50 之间")
	public String getDemandModel() {
		return demandModel;
	}

	public void setDemandModel(String demandModel) {
		this.demandModel = demandModel;
	}
	
	@Length(min=0, max=30, message="cpu长度必须介于 0 和 30 之间")
	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	
	@Length(min=0, max=30, message="内存长度必须介于 0 和 30 之间")
	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}
	
	@Length(min=0, max=30, message="硬盘容量长度必须介于 0 和 30 之间")
	public String getHardDisk() {
		return hardDisk;
	}

	public void setHardDisk(String hardDisk) {
		this.hardDisk = hardDisk;
	}
	
	@Length(min=0, max=30, message="显卡长度必须介于 0 和 30 之间")
	public String getVideoCard() {
		return videoCard;
	}

	public void setVideoCard(String videoCard) {
		this.videoCard = videoCard;
	}
	
	@Length(min=0, max=30, message="其他要求长度必须介于 0 和 30 之间")
	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
	
	@Length(min=0, max=30, message="申请部门主管意见长度必须介于 0 和 30 之间")
	public String getDeptDirectorSuggestion() {
		return deptDirectorSuggestion;
	}

	public void setDeptDirectorSuggestion(String deptDirectorSuggestion) {
		this.deptDirectorSuggestion = deptDirectorSuggestion;
	}
	
	@Length(min=0, max=30, message="申请部门副总意见长度必须介于 0 和 30 之间")
	public String getDeputyManagerSuggestion() {
		return deputyManagerSuggestion;
	}

	public void setDeputyManagerSuggestion(String deputyManagerSuggestion) {
		this.deputyManagerSuggestion = deputyManagerSuggestion;
	}
	
	@Length(min=0, max=30, message="人事行政副总意见长度必须介于 0 和 30 之间")
	public String getAdminDeptManagerSuggestion() {
		return adminDeptManagerSuggestion;
	}

	public void setAdminDeptManagerSuggestion(String adminDeptManagerSuggestion) {
		this.adminDeptManagerSuggestion = adminDeptManagerSuggestion;
	}
	
	@Length(min=0, max=30, message="总经理审批长度必须介于 0 和 30 之间")
	public String getGeneralManagerSuggestion() {
		return generalManagerSuggestion;
	}

	public void setGeneralManagerSuggestion(String generalManagerSuggestion) {
		this.generalManagerSuggestion = generalManagerSuggestion;
	}
	
	@Length(min=0, max=30, message="采购执行长度必须介于 0 和 30 之间")
	public String getPurchaser() {
		return purchaser;
	}

	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	
	@Length(min=0, max=30, message="固定资产管理员长度必须介于 0 和 30 之间")
	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getIsStart() {
		return isStart;
	}

	public void setIsStart(String isStart) {
		this.isStart = isStart;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUserName() {
		return userName;
	}

	public void setUserName(User userName) {
		this.userName = userName;
	}

	public Date getBeginApplyTime() {
		return beginApplyTime;
	}

	public void setBeginApplyTime(Date beginApplyTime) {
		this.beginApplyTime = beginApplyTime;
	}

	public Date getEndApplyTime() {
		return endApplyTime;
	}

	public void setEndApplyTime(Date endApplyTime) {
		this.endApplyTime = endApplyTime;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	
	/*@Length(min=0, max=30, message="流程相关id长度必须介于 0 和 30 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
	@Length(min=0, max=20, message="标题长度必须介于 0 和 20 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}*/

	//审批状态（0：未送审；1：部门主管审批；2：部门副总审批；3：人事部审批；4：总经理审批；5：商务部审批；6：管理员入库；y：已结案；x:已销毁;z:修改）
	
    public enum ComputerPurchaseStatus 
    {  
    	WITHOUT_APPROVAL("未送审", "0"), DEPTDIRECTOR_EXAM("部门主管审批", "1"), DEPUTYMANAGER_EXAM("部门副总审批", "2"), 
    	ADMINDEPTMANAGER_EXAM("人事部审批", "3"), GENERALMANAGER_EXAM("总经理审批", "4"), STAFF_EXAM("商务部审批", "5"), 
    	ASSETSADMIN_EXAM("管理员入库", "6"), COMPLETED("已结案", "y"), DESTROY("已销毁", "x"), 
    	MODIFY("修改", "z");  
        // 成员变量  
        private String name;
        
        private String index;  
        // 构造方法  
        private ComputerPurchaseStatus(String name, String index) {  
            this.name = name;  
            this.index = index;  
        }  
        //覆盖方法  
        @Override  
        public String toString() {  
            return this.index+"_"+this.name;  
        }
		public String getName() {
			return name;
		}
		public String getIndex() {
			return index;
		}
		public void setName(String name) {
			this.name = name;
		}
		public void setIndex(String index) {
			this.index = index;
		}  
    }  
	
    public static void main(String[] args) {
		System.out.println(ComputerPurchaseStatus.valueOf("DESTROY"));
	}
}