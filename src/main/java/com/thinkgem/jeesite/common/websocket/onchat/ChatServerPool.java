package com.thinkgem.jeesite.common.websocket.onchat;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import net.sf.json.JSONObject;
import org.java_websocket.WebSocket;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.websocket.utils.Constant;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

public class ChatServerPool {

	private static final Map<WebSocket, String> userconnections = new HashMap<WebSocket, String>();

	/**
	 * 获取用户名
	 * 
	 * @param session
	 */
	public static String getUserByKey(WebSocket conn) {
		return userconnections.get(conn);
	}

	/**
	 * 获取WebSocket
	 * 
	 * @param user
	 */
	public static WebSocket getWebSocketByUser(String user) {
		Set<WebSocket> keySet = userconnections.keySet();
		synchronized (keySet) {
			for (WebSocket conn : keySet) {
				String cuser = userconnections.get(conn);
				if (cuser.equals(user)) {
					return conn;
				}
			}
		}
		return null;
	}

	/**
	 * 向连接池中添加连接
	 * 
	 * @param inbound
	 */
	public static void addUser(String user, WebSocket conn) {
		userconnections.put(conn, user); // 添加连接
	}

	/**
	 * 获取所有的在线用户
	 * 
	 * @return
	 */
	public static Collection<String> getOnlineUser() {
		// List<String> setUsers = new ArrayList<String>();
		Collection<String> setUsers = userconnections.values();
		// for(String u:setUser){
		// setUsers.add("<a onclick=\"toUserMsg('"+u+"');\">"+u+"</a>");
		// }
		return setUsers;
	}

	/**
	 * 移除连接池中的连接
	 * 
	 * @param inbound
	 */
	public static boolean removeUser(WebSocket conn) {
		if (userconnections.containsKey(conn)) {
			userconnections.remove(conn); // 移除连接
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 向所有的用户发送消息
	 * 
	 * @param message
	 */
	public static void sendMessage(String message) {
		SystemService systemService = SpringContextHolder
				.getBean("systemService");
		User u = new User();
		if (null != message && message.startsWith(Constant._online_user_)) {// 用户上线
			u = systemService.getUserByLoginName(message.replaceFirst(
					Constant._online_user_, ""));
		} else if (null != message && message.startsWith(Constant._leave_user_)) {// 用户离线
			u = systemService.getUserByLoginName(message.replaceFirst(
					Constant._leave_user_, ""));
		}
		Set<WebSocket> keySet = userconnections.keySet();
		synchronized (keySet) {
			for (WebSocket conn : keySet) {
				String user2 = userconnections.get(conn);
				if (user2 != null) {
					if (null != message
							&& message.startsWith(Constant._online_user_)) {// 用户上线
						conn.send("_online_user_" + u.getId());
					} else if (null != message
							&& message.startsWith(Constant._leave_user_)) {// 用户离线
						conn.send("_leave_user_" + u.getId());
					}
				}
			}
		}
	}

	/**
	 * 向特定的用户发送数据
	 * 
	 * @param user
	 * @param message
	 * @throws Exception
	 */
	public static void sendMessageToUser(WebSocket conn, String message,
			Date sendDate) throws Exception {
		// 暂停半秒等前台页面的展现
		Thread.sleep(500);
		SystemService systemService = SpringContextHolder
				.getBean("systemService");
		if (null != conn && null != ChatServerPool.getUserByKey(conn)) {// 发送人在线
			if (null != message && message.startsWith(Constant._msg_)) {
				String messageJSON = message.substring(5);
				JSONObject jsonObject = JSONObject.fromObject(messageJSON);
				JSONObject mine = (JSONObject) jsonObject.get("mine");
				User user = systemService.getUser(mine.getString("id"));
				JSONObject to = (JSONObject) jsonObject.get("to");
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("username", user.getUsername());
				map.put("avatar", user.getPhoto());
				map.put("id", mine.getString("id"));
				map.put("type", to.getString("type"));
				map.put("content", mine.getString("content"));
				map.put("mine", false);
				map.put("timestamp", sendDate.getTime());
				map.put("temporary", false);

				JSONObject jo = new JSONObject();
				jo.put("emit", "chatMessage");
				jo.put("data", map);
				conn.send(jo.toString());
			} else if (null != message && message.startsWith(Constant._sys_)) {

				Map<String, Object> map = new HashMap<String, Object>();

				map.put("system", true);
				map.put("id", message.substring(5));
				map.put("type", "friend");
				map.put("content", "对方已离线");

				JSONObject jo = new JSONObject();
				jo.put("emit", "sysMessage");
				jo.put("data", map);
				conn.send(jo.toString());
			}
		} else if (null != conn && null == ChatServerPool.getUserByKey(conn)) {// 发送人隐身，暂不开放隐身功能
			// if (null != message && message.startsWith(Constant._msg_)) {
			//
			// } else if (null != message && message.startsWith(Constant._sys_))
			// {
			// String[] arr = message.split(Constant._sys_);
			// String fromUser = arr[1];
			// String toUser = arr[2];
			// String msg = arr[3];
			// String time = arr[4];
			// SimpleDateFormat sdf = new SimpleDateFormat(
			// "yyyy-MM-dd HH:mm:ss");
			//
			// User user = systemService.getUserByLoginName(toUser);
			// Map<String, Object> map = new HashMap<String, Object>();
			// map.put("system", true);
			// map.put("id", user.getId());
			// map.put("type", "friend");
			// map.put("content", "对方已离线");
			//
			// JSONObject jo = new JSONObject();
			// jo.put("emit", "sysMessage");
			// jo.put("data", map);
			// conn.send(jo.toString());
			// }
		}
	}
	
	
	
	/**
	 * 向群发送数据
	 * 
	 * @param user
	 * @param message
	 * @throws Exception
	 */
	public static void sendMessageToGroup(WebSocket conn, String message,
			Date sendDate) throws Exception {
		// 暂停半秒等前台页面的展现
		Thread.sleep(500);
		SystemService systemService = SpringContextHolder
				.getBean("systemService");
		if (null != conn && null != ChatServerPool.getUserByKey(conn)) {// 发送人在线
			if (null != message && message.startsWith(Constant._groupmsg_)) {
				String messageJSON = message.substring(10);
				
				JSONObject jsonObject = JSONObject.fromObject(messageJSON);
				JSONObject mine = (JSONObject) jsonObject.get("mine");
				User user = systemService.getUser(mine.getString("id"));
				JSONObject to = (JSONObject) jsonObject.get("to");
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("username", user.getUsername());
				map.put("avatar", user.getPhoto());
				map.put("type", to.getString("type"));
				map.put("content", mine.getString("content"));
				map.put("id", to.getString("id"));
				map.put("mine", false);
				map.put("timestamp", sendDate.getTime());
				map.put("temporary", false);
				JSONObject jo = new JSONObject();
				jo.put("emit", "chatMessage");
				jo.put("data", map);
				conn.send(jo.toString());
			} 
		}
	}

	/**
	 * 向特定的用户发送离线数据
	 * 
	 * @param user
	 * @param message
	 * @throws Exception
	 */
	public static void sendHisMessageToUser(WebSocket conn, String message)
			throws Exception {
		SystemService systemService = SpringContextHolder
				.getBean("systemService");
		// 暂停半秒等前台页面的展现
		Thread.sleep(500);
		System.out.println(message);
		if (null != message && message.startsWith(Constant._msg_)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String messageJSON = message.substring(5);
			JSONObject jsonObject = JSONObject.fromObject(messageJSON);
			User user = systemService.getUserByLoginName(jsonObject
					.getString("userid1"));
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("username", user.getUsername());
			map.put("avatar", user.getPhoto());
			map.put("id", user.getId());
			map.put("type", jsonObject.getString("type"));
			map.put("content", jsonObject.getString("msg"));
			map.put("mine", false);
			map.put("timestamp", sdf.parse(jsonObject.getString("create_Date"))
					.getTime());
			map.put("temporary", false);

			JSONObject jo = new JSONObject();
			jo.put("emit", "chatMessage");
			jo.put("data", map);
			conn.send(jo.toString());
		}
	}

}
