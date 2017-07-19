<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')}登录页面</title>
	<meta name="decorator" content="blank"/>
	<style type="text/css">
	
      html,body{background:url("${ctxStatic}/images/login-bg.jpg") 0 0 no-repeat;background-size:100%;text-align:center;}
      a{text-decoration:none;}
      .dl{
	background:url(${ctxStatic}/images/login-dl.png) repeat-x;
	resize:none;
	width:345px;
	height:360px;
	position: absolute;
	top:15.2%;
	right:15%;
	font-size:18px;
	font-family:微软雅黑;
	text-align:center;
}	
.form-signin .input-label {
    padding-top: 7px;
    font-size: 16px;
    line-height: 30px;
    height: 30px;
    color: #999;
}
/* #validateCode{font-weight: bold;
width: 50px;
height:18px;
margin-bottom: 0;} */
       #logintitle{ margin-top:25px;}
	   label{font-size:13px;}
      .form-signin-heading{font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:36px;margin-bottom:20px;color:#0663a2;}
      .form-signin{border-width:0;border:none; outline:none; word-wrap:break-word;text-overflow:ellipsis;position:relative;text-align:left;width:340px;padding:25px 29px 29px;margin-left:29px;
        	-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.00);-moz-box-shadow:0 1px 2px rgba(0,0,0,.00);box-shadow:0 1px 2px rgba(0,0,0,.00);}
      .form-signin .checkbox{margin-bottom:10px;color:#0663a2;} 
      .form-signin .input-block-level{font-size:14px;height:36px;margin-bottom:15px;padding:8px;width:220px;border:none; zoom:1;outline: medium; *padding-bottom:0;_padding:7px 7px 9px 7px;}
      .form-signin .btn.btn-large{font-size:16px;} 
      .form-signin div.validateCode {padding-bottom:15px;} .mid{vertical-align:middle;}
		#validateCode{height: 20px;}
      .header{height:80px;padding-top:20px;} .alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
      label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
      .loginput{ width: 255px; border-radius:4px;height:36px; border:1px solid gray;}
      #logbtn{width:250px;height:40px; background:#379bd9;letter-spacing:6px;font-size:16px;font-family:微软雅黑;	
	border-radius:5px;border:0;color:white;}
    </style>
	<script type="text/javascript">
		$(document).ready(function() {
			 $("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		}); 
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
	</script>
</head>
<body>
	<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
	 <div class="header">
		<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}"><button data-dismiss="alert" class="close">×</button>
			<label id="loginError" class="error">${message}</label>
		</div>
	</div> 
	<div class="dl">
	<p id="logintitle">用户登录</p>
	<form id="loginForm" class="form-signin" action="${ctx}/login" method="post">
		<label class="input-label" for="username"><img alt="登录名" class="icon" src="${ctxStatic}/images/user.png"></label>
		<input type="text" id="username" name="username"   placeholder="请输入登录名" class="input-block-level required" value="${username}"></br>
		<label class="input-label" for="password"><img alt="密码" class="icon" src="${ctxStatic}/images/key.png"></label>
		<input type="password" id="password" name="password" placeholder="请输入密码" class="input-block-level required">
		<c:if test="${isValidateCodeLogin}"> 
			<div class="validateCode">
				<span >验证码</span>
				<sys:validateCode name="validateCode"  /> 
			</div>
		</c:if>
		 <%-- <label for="mobile" title="手机登录"><input type="checkbox" id="mobileLogin" name="mobileLogin" ${mobileLogin ? 'checked' : ''}/></label> 
		 --%><label for="rememberMe" title="下次不需要再登录"><input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''} class="i-checks"/>&nbsp;保持登录</label>	</br></br>	
		<input id="logbtn" type="submit" value="登 录"/>&nbsp;&nbsp;
		
	</form>
	</div>
	<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>