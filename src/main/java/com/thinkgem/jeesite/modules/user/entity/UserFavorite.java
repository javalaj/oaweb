/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户收藏夹Entity
 * 
 * @author liuxin
 * @version 2016-11-15
 */
public class UserFavorite extends DataEntity<UserFavorite> {

	private static final long serialVersionUID = 1L;
	private String title; // 收藏品的描述
	private String url; // 收藏品访问路径
	private String type; // 收藏的类别（用表名来区别分类）
	private String sign;//收藏的唯一标示防止重复

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public UserFavorite() {
		super();
	}

	public UserFavorite(String id) {
		super(id);
	}

	@Length(min = 1, max = 255, message = "收藏品的描述长度必须介于 1 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Length(min = 0, max = 255, message = "收藏品访问路径长度必须介于 0 和 255 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Length(min = 1, max = 64, message = "收藏的类别（用表名来区别分类）长度必须介于 1 和 64 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}