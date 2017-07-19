/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.newscenter;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
/**
 * 新闻中心Entity
 * @author zf
 * @version 2017-05-24
 */
public class OaNews extends DataEntity<OaNews> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 新闻标题
	private String photo;		// 新闻图片
	private String type;		// 新闻类型
	private String content;		// 新闻内容
	private Integer pageView = 0;		// 浏览量
	private String status;		// 状态(0.草稿1.发布)
	
	public OaNews() {
		super();
	}

	public OaNews(String id){
		super(id);
	}

	@Length(min=0, max=255, message="新闻标题长度必须介于 0 和 255 之间")
			
	@ExcelField(title="新闻标题", align=2, sort=1)
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=255, message="新闻图片长度必须介于 0 和 255 之间")
			
	@ExcelField(title="新闻图片", align=2, sort=2)
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@Length(min=0, max=255, message="新闻类型长度必须介于 0 和 255 之间")
			
	@ExcelField(title="新闻类型", align=2, sort=3)
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
			
	@ExcelField(title="新闻内容", align=2, sort=4)
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
			
	@ExcelField(title="浏览量", align=2, sort=5)
	
	public Integer getPageView() {
		return pageView;
	}

	public void setPageView(Integer pageView) {
		this.pageView = pageView;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}