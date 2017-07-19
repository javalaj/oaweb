package com.thinkgem.jeesite.modules.oa.actRouting;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

public class ActRouting {
	private static OfficeService officeService = SpringContextHolder.getBean(OfficeService.class);

	/**
	 * 
	 * 个人信息页面。直接上级获取方式。
	 * 
	 */
	public static String getUpperX() {
		User user = UserUtils.getUser();
		Office office = officeService.get(user.getOffice().getId());
		User upper = UserUtils.get(office.getPrimaryPerson().getId());
		if (user.getId().equals(upper.getId())) {
			Office upperOffice = officeService.get(office.getParentId());
			upper = UserUtils.get(upperOffice.getPrimaryPerson().getId());
		}
		return upper.getName();
	}

	/**
	 * 
	 * 出差流程定制，获取上级方法。
	 * 
	 */
	public static String getUpperL() {
		User user = UserUtils.getUser();
		Office office = officeService.get(user.getOffice().getId());
		User upper = office.getPrimaryPerson();
		if (user.getId().equals(upper.getId())) {
			// 自己就是小组负责人
			upper = officeService.get(office.getParentId()).getPrimaryPerson();
		}
		return UserUtils.get(upper.getId()).getLoginName();
	}

	/**
	 * 
	 * 出差流程定制，获取部门副总。
	 * 
	 */
	public static String getDeputyL() {
		User user = UserUtils.getUser();
		Office office = officeService.get(user.getOffice().getId());
		String[] office2 = office.getParentIds().split(",");
		String deputyOfficeId = "";
		if (office2.length >= 3) {
			deputyOfficeId = office2[2];
		} else {
			deputyOfficeId = office.getId();
		}
		return UserUtils.get(officeService.get(deputyOfficeId).getPrimaryPerson().getId()).getLoginName();
	}

	/**
	 * 返回直属上级的ID
	 * 
	 * @param userId
	 *            申请用户ID
	 * @return 返回直属上级的loginName
	 */
	public static String getUpper(String userId) {
		User user = UserUtils.get(userId);
		String upperName = null;
		if (user != null) {
			Office office = user.getOffice();
			upperName = UserUtils.get(office.getPrimaryPerson().getId()).getLoginName();
			// 如果申请人的直属领导是自己，则获取上一级直属领导
			if (user.getLoginName().equals(upperName)) {
				upperName = UserUtils.get(officeService.get(office.getParentId()).getPrimaryPerson().getId())
						.getLoginName();
			}
		}

		return upperName;
	}

	/**
	 * 返回直属上级的ID
	 * 
	 * 请假，调休流程专用
	 * 
	 * @param userId
	 *            申请用户ID
	 * @return 返回直属上级的loginName
	 */
	public static String getUpper2(String userId) {
		User user = UserUtils.get(userId);
		String upperName = null;
		if (user != null) {
			Office office = user.getOffice();
			upperName = UserUtils.get(office.getPrimaryPerson().getId()).getLoginName();
		}
		return upperName;
	}

	/**
	 * 返回副负责人的ID
	 * 
	 * @param userId
	 *            申请用户ID
	 * @return 返回副负责人的ID
	 */
	public static String getDeputy(String userId) {
		User user = UserUtils.get(userId);
		String str = null;
		if (user != null) {
			Office office = user.getOffice();
			str = UserUtils.get(office.getDeputyPerson().getId()).getLoginName();
			System.out.println("primaryPerson:=" + str);
		}

		return str;
	}

	/**
	 * 返回父部门的ID，该部门下的主负责人即副总
	 * 
	 * @param userId
	 *            申请用户ID
	 * @return 返回父部门的ID
	 */
	public static String getManager(String userId) {
		User user = UserUtils.get(userId);
		String str = null;
		if (user != null) {
			Office office = user.getOffice();
			System.out.println(office.getParent().getId());
			str = office.getParent().getId();
		}
		return str;
	}

	/**
	 * 返回人事部签字人的ID
	 * 
	 * @return 返回人事部签字人的ID
	 */
	public static String getPersonnel() {

		return "liliang";
	}

	/**
	 * 返回人事部归档审阅人
	 * 
	 * @return 返回人事部签字人的ID
	 */
	public static String getFilling() {

		return "wangying";
	}

	/**
	 * 返回总经理的ID
	 * 
	 * @return 返回总经理的ID
	 */
	public static String getBoss() {
		// TODO Auto-generated method stub
		return "hutao";
	}

	/**
	 * 返回副总经理的ID（主管副总）
	 * 
	 * @return 返回副总经理的ID（主管副总）
	 */
	public static String getDeputyBoss() {
		// TODO Auto-generated method stub
		return "hutao";
	}

	/**
	 * 返回固定资产管理员ID
	 * 
	 * @return 返回固定资产管理员ID
	 */
	public static String getFixedAssetManager() {
		// TODO Auto-generated method stub
		return "liliang";
	}

	/**
	 * 返回人事行政部副总ID
	 * 
	 * @return 返回人事行政部副总ID
	 */
	public static String getDeputyPersonnel() {
		// TODO Auto-generated method stub
		return "liliang";
	}

	/**
	 * 返回会计ID
	 * 
	 * @return 返回会计ID
	 */
	public static String getAccountant() {
		// TODO Auto-generated method stub
		return "liliang";
	}

	/**
	 * 返回出纳ID
	 * 
	 * @return 返回出纳ID
	 */
	public static String getCashier() {
		// TODO Auto-generated method stub
		return "liliang";
	}
}
