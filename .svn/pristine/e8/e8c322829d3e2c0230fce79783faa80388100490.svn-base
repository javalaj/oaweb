/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.websocket.onchat;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.java_websocket.WebSocket;
import org.java_websocket.WebSocketImpl;
import org.java_websocket.framing.Framedata;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;
import org.springframework.beans.factory.annotation.Autowired;

import com.thinkgem.jeesite.common.json.AjaxJson;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.websocket.utils.Constant;
import com.thinkgem.jeesite.modules.iim.dao.IimChatGroupUserDao;
import com.thinkgem.jeesite.modules.iim.entity.ChatHistory;
import com.thinkgem.jeesite.modules.iim.entity.IimChatGroupUser;
import com.thinkgem.jeesite.modules.iim.service.ChatHistoryService;
import com.thinkgem.jeesite.modules.iim.service.IimChatGroupUserService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

import java.util.List;

public class ChatServer extends WebSocketServer {
	
	

	public ChatServer(int port) throws UnknownHostException {
		super(new InetSocketAddress(port));
	}

	public ChatServer(InetSocketAddress address) {
		super(address);
	}

	/**
	 * 触发连接事件
	 */
	@Override
	public void onOpen(WebSocket conn, ClientHandshake handshake) {
		// Collection<String> onlineUsers = MsgServerPool.getOnlineUser();
		// AjaxJson j = new AjaxJson();
		// j.put("data", onlineUsers);
		// MsgServerPool.sendMessageToUser(conn,
		// "_online_all_status_"+j.getJsonStr());//首次登陆系统时，获取用户的在线状态
	}

	/**
	 * 触发关闭事件
	 */
	@Override
	public void onClose(WebSocket conn, int code, String reason, boolean remote) {
		userLeave(conn);
		Collection<String> onlineUsers = ChatServerPool.getOnlineUser();
		AjaxJson j = new AjaxJson();
		j.put("data", onlineUsers);
		ChatServerPool.sendMessage("_online_all_status_" + j.getJsonStr());// 通知所有用户更新在线信息
	}

	/**
	 * 客户端发送消息到服务器时触发事件
	 */
	@Override
	public void onMessage(WebSocket conn, String message) {
		message = message.toString();
		ChatHistoryService chatHistoryService = SpringContextHolder.getBean("chatHistoryService");
		SystemService systemService = SpringContextHolder.getBean("systemService");
		if (null != message && message.startsWith(Constant._online_user_)) {// 用户上线
			String userId = message.replaceFirst(Constant._online_user_, "");
			this.userjoin(userId, conn);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// 通知所有用户更新在线信息
			Collection<String> onlineUsers = ChatServerPool.getOnlineUser();
			AjaxJson j = new AjaxJson();
			j.put("data", onlineUsers);
			// ChatServerPool.sendMessage("_online_user_"+j.getJsonStr());//通知所有用户更新在线信息

			// 读取离线信息
			ChatHistory chat = new ChatHistory();
			chat.setUserid2(userId);
			chat.setStatus("0");
			List<ChatHistory> list = chatHistoryService.findList(chat);
			Map<String, String> m = null;
			for (ChatHistory c : list) {
				m = new HashMap<String, String>();
				m.put("userid1", c.getUserid1());
				m.put("type", c.getType());
				m.put("msg", c.getMsg());
				m.put("create_Date", sdf.format(c.getCreateDate()));
				try {
					ChatServerPool.sendHisMessageToUser(conn, Constant._msg_ + JSONObject.fromObject(m).toString());
				} catch (Exception e) {
					e.printStackTrace();
				} // 向所某用户发送消息
				c.setStatus("1");// 标记为已读
				chatHistoryService.save(c);
			}
			
			// 读取群离线信息
			/**
			 *根据当前用户获取最后退出系统时间
			 */
			
			User user = systemService.getUserByLoginName(userId);
			Date date =user.getLogoutDate();
			ChatHistory chat2 = new ChatHistory();
			chat2.setUserid2(userId);
			chat2.setStatus("0");
			chat2.setCreateDate(date);
			List<ChatHistory> grouplist = chatHistoryService.findList(chat2);
			
			Map<String, String> mm = null;
			System.out.println(grouplist.size());
			for (ChatHistory c : grouplist) {
				mm= new HashMap<String, String>();
				mm.put("userid1", c.getUserid1());
				mm.put("type", c.getType());
				mm.put("msg", c.getMsg());
				mm.put("create_Date", sdf.format(c.getCreateDate()));
				try {
					ChatServerPool.sendHisMessageToUser(conn, Constant._msg_ + JSONObject.fromObject(mm).toString());
				} catch (Exception e) {
					e.printStackTrace();
				} // 向所某用户发送消息
				c.setStatus("1");// 标记为已读
				chatHistoryService.save(c);
			}
			

		}
		if (null != message && message.startsWith(Constant._leave_user_)) {// 用户离线
			this.userLeave(conn);
			Collection<String> onlineUsers = ChatServerPool.getOnlineUser();
			AjaxJson j = new AjaxJson();
			j.put("data", onlineUsers);
			// ChatServerPool.sendMessage("_leave_user_"+j.getJsonStr());//通知所有用户更新在线信息

		}
		if (null != message && message.startsWith(Constant._msg_)) {//
			String messageJSON = message.substring(5);
			System.out.println(messageJSON);
			JSONObject jsonObject = JSONObject.fromObject(messageJSON);
			JSONObject mine = (JSONObject) jsonObject.get("mine");
			JSONObject to = (JSONObject) jsonObject.get("to");
			// 保存聊天记录
			ChatHistory chat = new ChatHistory();
			chat.setUserid1(systemService.getUser(mine.getString("id")).getLoginName());
			chat.setUserid2(to.getString("loginName"));
			chat.setMsg(mine.getString("content").replaceAll("\\{", "&#123;").replaceAll("\\}", "&#125;"));
			chat.setType(to.getString("type"));
			chat.setCreateDate(new Date());

			WebSocket toUserConn = ChatServerPool.getWebSocketByUser(to.getString("loginName"));
			if (toUserConn != null) {
				try {
					ChatServerPool.sendMessageToUser(toUserConn, message, chat.getCreateDate());
				} catch (Exception e) {
					e.printStackTrace();
				} // 向所某用户发送消息
				chat.setStatus("1");// 设置为已读
			} else {
				try {
					ChatServerPool.sendMessageToUser(conn, Constant._sys_ + to.getString("id"), chat.getCreateDate());
				} catch (Exception e) {
					e.printStackTrace();
				} // 同时向本人发送消息
				chat.setStatus("0");// 设置为未读
			}

			chatHistoryService.save(chat);

		} else if (null != message && message.startsWith(Constant._groupmsg_)) {
			String messageJSON = message.substring(10);
			JSONObject jsonObject = JSONObject.fromObject(messageJSON);
			JSONObject mine = (JSONObject) jsonObject.get("mine");
			JSONObject to = (JSONObject) jsonObject.get("to");
            
         // 保存聊天记录
            ChatHistory chat = new ChatHistory();
			chat.setUserid1(systemService.getUser(mine.getString("id")).getLoginName());
			chat.setUserid2(to.getString("id"));
			chat.setMsg(mine.getString("content").replaceAll("\\{", "&#123;").replaceAll("\\}", "&#125;"));
			chat.setType(to.getString("type"));
			chat.setCreateDate(new Date());
			chat.setStatus("1");// 设置为已读
			//获取除自己外群成员
			IimChatGroupUserService iimChatGroupUserService = SpringContextHolder.getBean("iimChatGroupUserService");
			IimChatGroupUser groupUser = iimChatGroupUserService.get(to.getString("id"));
			List<Map<String, Object>> gulist  = iimChatGroupUserService.getUserBygroupID(groupUser.getId());
		
			if(gulist.size()>0)
			{
				for (Map<String, Object> iimChatGroupUser : gulist) {
					if(!iimChatGroupUser.get("user_id").toString().equals(mine.getString("id"))){
						WebSocket toUserConn = ChatServerPool.getWebSocketByUser(systemService.getUser(iimChatGroupUser.get("user_id").toString()).getLoginName());
						if (toUserConn != null) {
							try {
								 // 向所某用户发送消息
								ChatServerPool.sendMessageToGroup(toUserConn, message, chat.getCreateDate());
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					}
					
				}
			}
			chatHistoryService.save(chat);	

		}
	}

	@Override
	public void onMessage(WebSocket conn, ByteBuffer buffer) {
		Charset charset = null;
		CharsetDecoder decoder = null;
		CharBuffer charBuffer = null;
		try {
			charset = Charset.forName("UTF-8");
			decoder = charset.newDecoder();
			// charBuffer = decoder.decode(buffer);//用这个的话，只能输出来一次结果，第二次显示为空
			charBuffer = decoder.decode(buffer.asReadOnlyBuffer());
			// return charBuffer.toString();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void onFragment(WebSocket conn, Framedata fragment) {
	}

	/**
	 * 触发异常事件
	 */
	@Override
	public void onError(WebSocket conn, Exception ex) {
		ex.printStackTrace();
		if (conn != null) {
			// some errors like port binding failed may not be assignable to a
			// specific websocket
		}
	}

	/**
	 * 用户加入处理
	 * 
	 * @param user
	 */
	public void userjoin(String user, WebSocket conn) {
		SystemService systemService = SpringContextHolder.getBean("systemService");
		ChatServerPool.addUser(user, conn); // 向连接池添加当前的连接对象

		User u = systemService.getUserByLoginName(user);
		u.setStatus("online");// online在线，offline离线
		systemService.updateUserInfo(u);

		ChatServerPool.sendMessage("_online_user_" + user);// 通知所有用户更新在线信息
	}

	/**
	 * 用户下线处理
	 * 
	 * @param user
	 */
	public void userLeave(WebSocket conn) {
		SystemService systemService = SpringContextHolder.getBean("systemService");
		String user = ChatServerPool.getUserByKey(conn);
		boolean b = ChatServerPool.removeUser(conn); // 在连接池中移除连接
		User u = systemService.getUserByLoginName(user);
		u.setStatus("offline");// online在线，offline离线
		u.setLogoutDate(new Date());
		systemService.updateUserInfo(u);
		ChatServerPool.sendMessage("_leave_user_" + user);// 通知所有用户更新在线信息
	}

	public static void main(String[] args) throws InterruptedException, IOException {
		WebSocketImpl.DEBUG = false;
		int port = 8667; // 端口
		ChatServer s = new ChatServer(port);
		s.start();
		// System.out.println( "服务器的端口" + s.getPort() );
	}

}
