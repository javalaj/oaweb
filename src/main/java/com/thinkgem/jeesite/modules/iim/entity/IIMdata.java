package com.thinkgem.jeesite.modules.iim.entity;

import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.User;

public class IIMdata {
	private User mine;
	private List<IIMFriend> friend;
	private List<IimChatGroup> group;
	
	public User getMine() {
		return mine;
	}
	public void setMine(User mine) {
		this.mine = mine;
	}
	public List<IIMFriend> getFriend() {
		return friend;
	}
	public void setFriend(List<IIMFriend> friend) {
		this.friend = friend;
	}
	public List<IimChatGroup> getGroup() {
		return group;
	}
	public void setGroup(List<IimChatGroup> group) {
		this.group = group;
	}
 
}
