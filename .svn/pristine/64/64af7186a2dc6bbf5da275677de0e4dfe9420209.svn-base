package com.thinkgem.jeesite.modules.oa.web.mytask.utis;

import java.io.File;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.sun.mail.util.MailSSLSocketFactory;
import com.thinkgem.jeesite.common.utils.SendMailUtil;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class SendEmail {

	private MimeMessage mimeMsg; // MIME邮件对象
	private Session session; // 邮件会话对象
	private Properties props; // 系统属性
	@SuppressWarnings("unused")
	private boolean needAuth = false; // smtp是否需要认证
	// smtp认证用户名和密码
	private String username;
	private String password;
	private Multipart mp; // Multipart对象,邮件内容,标题,附件等内容均添加到其中后再生成MimeMessage对象
 
	/**
	 * Constructor
	 * 
	 * @param smtp
	 *            邮件发送服务器 
	 */
	public SendEmail(String smtp) {
		setSmtpHost(smtp);
		createMimeMessage();
		
	}

	/**
	 * 设置邮件发送服务器
	 * 
	 * @param hostName
	 *            String
	 */
	public void setSmtpHost(String hostName) {
		System.out.println("设置系统属性：mail.smtp.host = " + hostName);
		if (props == null)
			props = System.getProperties(); // 获得系统属性对象
		props.put("mail.smtp.host", hostName); // 设置SMTP主机
		props.put("mail.smtp.port", 465); 
	}

	/**
	 * 创建MIME邮件对象
	 * 
	 * @return
	 */
	public boolean createMimeMessage() {
		try {
			System.out.println("准备获取邮件会话对象！");
			session = Session.getDefaultInstance(props, null); // 获得邮件会话对象
		} catch (Exception e) {
			System.err.println("获取邮件会话对象时发生错误！" + e);
			return false;
		}

		System.out.println("准备创建MIME邮件对象！");
		try {
			mimeMsg = new MimeMessage(session); // 创建MIME邮件对象
			mp = new MimeMultipart();
			
			return true;
		} catch (Exception e) {
			System.err.println("创建MIME邮件对象失败！" + e);
			return false;
		}
	}

	/**
	 * 设置SMTP是否需要验证
	 * 
	 * @param need
	 */
	public void setNeedAuth(boolean need) {
		System.out.println("设置smtp身份认证：mail.smtp.auth = " + need);
		
		if (props == null)
			props = System.getProperties();
		if (need) {
			props.put("mail.smtp.auth", "true");
		} else {
			props.put("mail.smtp.auth", "false");
		}
		MailSSLSocketFactory sf;
		try {
			sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.socketFactory", sf);
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * 设置用户名和密码
	 * 
	 * @param name
	 * @param pass
	 */
	public void setNamePass(String name, String pass) {
		username = name;
		password = pass;
	}

	/**
	 * 设置邮件主题
	 * 
	 * @param mailSubject
	 * @return
	 */
	public boolean setSubject(String mailSubject) {
		System.out.println("设置邮件主题！");
		try {
			mimeMsg.setSubject(mailSubject);
			return true;
		} catch (Exception e) {
			System.err.println("设置邮件主题发生错误！");
			return false;
		}
	}
	
	private static String getFilePath() {
		String path = getAppPath(SendMailUtil.class);
		path = path + File.separator + "mailtemplate" + File.separator;
		path = path.replace("\\", "/");
		System.out.println(path);
		return path;
	}

	private static String getFileName(String path) {
		path = path.replace("\\", "/");
		System.out.println(path);
		return path.substring(path.lastIndexOf("/") + 1);
	}

	// @SuppressWarnings("unchecked")
	public static String getAppPath(Class<?> cls) {
		// 检查用户传入的参数是否为空
		if (cls == null)
			throw new java.lang.IllegalArgumentException("参数不能为空！");
		ClassLoader loader = cls.getClassLoader();
		// 获得类的全名，包括包名
		String clsName = cls.getName() + ".class";
		// 获得传入参数所在的包
		Package pack = cls.getPackage();
		String path = "";
		// 如果不是匿名包，将包名转化为路径
		if (pack != null) {
			String packName = pack.getName();
			// 此处简单判定是否是Java基础类库，防止用户传入JDK内置的类库
			if (packName.startsWith("java.") || packName.startsWith("javax."))
				throw new java.lang.IllegalArgumentException("不要传送系统类！");
			// 在类的名称中，去掉包名的部分，获得类的文件名
			clsName = clsName.substring(packName.length() + 1);
			// 判定包名是否是简单包名，如果是，则直接将包名转换为路径，
			if (packName.indexOf(".") < 0)
				path = packName + "/";
			else {// 否则按照包名的组成部分，将包名转换为路径
				int start = 0, end = 0;
				end = packName.indexOf(".");
				while (end != -1) {
					path = path + packName.substring(start, end) + "/";
					start = end + 1;
					end = packName.indexOf(".", start);
				}
				path = path + packName.substring(start) + "/";
			}
		}
		// 调用ClassLoader的getResource方法，传入包含路径信息的类文件名
		java.net.URL url = loader.getResource(path + clsName);
		// 从URL对象中获取路径信息
		String realPath = url.getPath();
		// 去掉路径信息中的协议名"file:"
		int pos = realPath.indexOf("file:");
		if (pos > -1)
			realPath = realPath.substring(pos + 5);
		// 去掉路径信息最后包含类文件信息的部分，得到类所在的路径
		pos = realPath.indexOf(path + clsName);
		realPath = realPath.substring(0, pos - 1);
		// 如果类文件被打包到JAR等文件中时，去掉对应的JAR等打包文件名
		if (realPath.endsWith("!"))
			realPath = realPath.substring(0, realPath.lastIndexOf("/"));
		/*------------------------------------------------------------ 
		 ClassLoader的getResource方法使用了utf-8对路径信息进行了编码，当路径 
		  中存在中文和空格时，他会对这些字符进行转换，这样，得到的往往不是我们想要 
		  的真实路径，在此，调用了URLDecoder的decode方法进行解码，以便得到原始的 
		  中文及空格路径 
		-------------------------------------------------------------*/
		try {
			realPath = java.net.URLDecoder.decode(realPath, "utf-8");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		System.out.println("realPath----->" + realPath);
		return realPath;
	}
	/**
	 * 设置邮件正文
	 * 
	 * @param mailBody
	 *            String
	 */
	public boolean setBody(HashMap<String, Object> map,String templatePath) {
		Configuration freeMarkerConfig = null;
		try {
			
		
			Template template = null;
			BodyPart bp = new MimeBodyPart();
			freeMarkerConfig = new Configuration();
			freeMarkerConfig.setDirectoryForTemplateLoading(
					new File(getFilePath()));
			// 获取模板
			template = freeMarkerConfig.getTemplate(getFileName(templatePath),
					new Locale("Zh_cn"), "UTF-8");
			// 模板内容转换为string
			String htmlText = FreeMarkerTemplateUtils
					.processTemplateIntoString(template, map);
			System.out.println(htmlText);
			bp.setContent(htmlText, "text/html;charset=GBK");
			mp.addBodyPart(bp);
			return true;
		} catch (Exception e) {
			System.err.println("设置邮件正文时发生错误！" + e);
			return false;
		}
	}

	/**
	 * 添加附件
	 * 
	 * @param filename
	 *            String
	 */
	public boolean addFileAffix(String[] filename) {

		System.out.println("增加邮件附件：" + filename);
		try {
			if (filename.length > 0) {
				for (int i = 0; i < filename.length; i++) {
					BodyPart bp = new MimeBodyPart();
					StringBuffer sb = new StringBuffer();
					
					String name = filename[i].split(",")[0];
					name = sb.append(name).toString();
					name = java.net.URLDecoder.decode(name, "utf-8");
					FileDataSource fileds = new FileDataSource(name);
					bp.setDataHandler(new DataHandler(fileds));
					bp.setFileName(fileds.getName());
					bp.setFileName(MimeUtility.encodeWord(fileds.getName()));
					mp.addBodyPart(bp);
				}
			}

			return true;
		} catch (Exception e) {
			System.err.println("增加邮件附件：" + filename + "发生错误！" + e);
			return false;
		}
	}

	/**
	 * 设置发信人
	 * 
	 * @param from
	 *            String
	 */
	public boolean setFrom(String from) {
		System.out.println("设置发信人！");
		try {
			mimeMsg.setFrom(new InternetAddress(from)); // 设置发信人
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 设置收信人
	 * 
	 * @param to
	 *            String
	 */
	public boolean setTo(String[] to) {
		if (to == null)
			return false;
		try {
			InternetAddress[] sendTo = new InternetAddress[to.length];
			if (to.length > 0) {
				for (int i = 0; i < to.length; i++) {
					System.out.println("发送到：" + to[i]);
					sendTo[i] = new InternetAddress(to[i]);

				}
				mimeMsg.setRecipients(Message.RecipientType.TO, sendTo);
			}
			// mimeMsg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 设置抄送人
	 * 
	 * @param copyto
	 *            String
	 */
	public boolean setCopyTo(String[] copyto) {
		if (copyto == null)
			return false;
		try {
			InternetAddress[] sendCopyTo = new InternetAddress[copyto.length];
			if (copyto.length > 0) {
				for (int i = 0; i < copyto.length; i++) {
					System.out.println("抄送到：" + copyto[i]);
					sendCopyTo[i] = new InternetAddress(copyto[i]);

				}
				mimeMsg.setRecipients(Message.RecipientType.CC, sendCopyTo);
			}
			// mimeMsg.setRecipients(Message.RecipientType.CC,(Address[])InternetAddress.parse(copyto));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 发送邮件
	 */
	public boolean sendOut1() {
		try {
			mimeMsg.setContent(mp);
			mimeMsg.saveChanges();
			System.out.println("正在发送邮件....");

			Session mailSession = Session.getInstance(props, null);
			Transport transport = mailSession.getTransport("smtp");
			transport.connect((String) props.get("mail.smtp.host"), username,
					password);
			transport.sendMessage(mimeMsg,
					mimeMsg.getRecipients(Message.RecipientType.TO));
			transport.sendMessage(mimeMsg,
					mimeMsg.getRecipients(Message.RecipientType.CC));
			// transport.send(mimeMsg);

			System.out.println("发送邮件成功！");
			transport.close();

			return true;
		} catch (Exception e) {
			System.err.println("邮件发送失败！" + e);
			return false;
		}
	}

	public boolean sendOut() {
		try {
			mimeMsg.setContent(mp);
			mimeMsg.saveChanges();
			System.out.println("正在发送邮件....");

			Session mailSession = Session.getInstance(props, null);
			Transport transport = mailSession.getTransport("smtp");
			transport.connect((String) props.get("mail.smtp.host"), username,
					password);
			transport.sendMessage(mimeMsg,
					mimeMsg.getRecipients(Message.RecipientType.TO));
			/*transport.sendMessage(mimeMsg,
					mimeMsg.getRecipients(Message.RecipientType.CC));*/
			// transport.send(mimeMsg);

			System.out.println("发送邮件成功！");
			transport.close();

			return true;
		} catch (Exception e) {
			System.err.println("邮件发送失败！" + e);
			return false;
		}
	}

	/**
	 * 调用sendOut方法完成邮件发送
	 * 
	 * @param smtp
	 * @param from
	 * @param to
	 * @param subject
	 * @param content
	 * @param username
	 * @param password
	 * @return boolean
	 */
	/*
	 * public static boolean send(String smtp,String from,String to,String
	 * subject,String content,String username,String password) { MailTest
	 * theMail = new MailTest(smtp); theMail.setNeedAuth(true); //需要验证
	 * 
	 * if(!theMail.setSubject(subject)) return false;
	 * if(!theMail.setBody(content)) return false; if(!theMail.setTo(to)) return
	 * false; if(!theMail.setFrom(from)) return false;
	 * theMail.setNamePass(username,password);
	 * 
	 * if(!theMail.sendOut()) return false; return true; }
	 */

	/**
	 * 调用sendOut方法完成邮件发送,带抄送
	 * 
	 * @param smtp
	 * @param from
	 * @param to
	 * @param copyto
	 * @param subject
	 * @param content
	 * @param username
	 * @param password
	 * @return boolean
	 */
	/*
	 * public static boolean sendAndCc(String smtp,String from,String to,String
	 * copyto,String subject,String content,String username,String password) {
	 * MailTest theMail = new MailTest(smtp); theMail.setNeedAuth(true); //需要验证
	 * 
	 * if(!theMail.setSubject(subject)) return false;
	 * if(!theMail.setBody(content)) return false; if(!theMail.setTo(to)) return
	 * false; if(!theMail.setCopyTo(copyto)) return false;
	 * if(!theMail.setFrom(from)) return false;
	 * theMail.setNamePass(username,password);
	 * 
	 * if(!theMail.sendOut()) return false; return true; }
	 */
	/**
	 * 调用sendOut方法完成邮件发送,带附件
	 * 
	 * @param smtp
	 * @param from
	 * @param to
	 * @param subject
	 * @param content
	 * @param username
	 * @param password
	 * @param filename
	 *            附件路径
	 * @return
	 */
	/*
	 * public static boolean send(String smtp,String from,String to,String
	 * subject,String content,String username,String password,String filename) {
	 * MailTest theMail = new MailTest(smtp); theMail.setNeedAuth(true); //需要验证
	 * 
	 * if(!theMail.setSubject(subject)) return false;
	 * if(!theMail.setBody(content)) return false;
	 * if(!theMail.addFileAffix(filename)) return false; if(!theMail.setTo(to))
	 * return false; if(!theMail.setFrom(from)) return false;
	 * theMail.setNamePass(username,password);
	 * 
	 * if(!theMail.sendOut()) return false; return true; }
	 */
	/**
	 * 调用sendOut方法完成邮件发送,带附件和抄送
	 * 
	 * @param smtp
	 * @param from
	 * @param to
	 * @param copyto
	 * @param subject
	 * @param content
	 * @param username
	 * @param password
	 * @param filename
	 * @return
	 */
	public static boolean sendAndCc(String smtp, String from, String[] to,
			String[] copyto, String subject, HashMap<String, Object> map, String username,
			String password, String[] filename,String templatePath) {
		SendEmail theMail = new SendEmail(smtp);
		theMail.setNeedAuth(true); // 需要验证

		if (!theMail.setSubject(subject))
			return false;
		if (!theMail.setBody(map,templatePath))
			return false;
		if (!theMail.addFileAffix(filename))
			return false;
		if (!theMail.setTo(to))
			return false;
		if (!theMail.setCopyTo(copyto))
			return false;
		if (!theMail.setFrom(from))
			return false;
		theMail.setNamePass(username, password);

		if (!theMail.sendOut1())
			return false;
		return true;
	}
	public static boolean sendAndCc(String smtp, String from, String[] to,
			 String subject, HashMap<String, Object> map, String username,
			String password, String[] filename,String templatePath) {
		SendEmail theMail = new SendEmail(smtp);
		theMail.setNeedAuth(true); // 需要验证
		

		if (!theMail.setSubject(subject))
			return false;
		if (!theMail.setBody(map,templatePath))
			return false;
		if (!theMail.addFileAffix(filename))
			return false;
		if (!theMail.setTo(to))
			return false;
		if (!theMail.setFrom(from))
			return false;
		theMail.setNamePass(username, password);

		if (!theMail.sendOut())
			return false;
		return true;
	}
	
//	 public static void main(String[] args) { String smtp =
//	  "smtp.163.com"; String from = "cz_asd19940729@163.com"; String[] to = {
//	 "365878517@qq.com" };  String subject = "楚誉科技工作会议";
//	  String username = "cz_asd19940729@163.com"; String
//	  password = "chenzhang."; String[] filename = { };
//	  HashMap<String, String> map=new HashMap();
//	  String templatePath="mailtemplate/test.ftl";
//	  map.put("title", "SDSD");
//	
//	 SendEmail.sendAndCc(smtp, from, to, subject, map, username,
//			 password,filename,templatePath); }
	

}