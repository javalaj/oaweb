<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="decorator" content="default"/>
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		<title>修改密码</title>
	<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.js"></script>	
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/frame_css/mui.min.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
	<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
	
		<style type="text/css">
			body {
				background: #55A6F6;
			}
			/*垂直居中*/
			   
			
			
			.login-input-row {
				padding: 10px;
				width: 100%;
				box-sizing: border-box;
				padding: 10px;
				overflow: hidden;
			}
			
			.login-input-row input {
				outline: none;
				font-size: 14px;
				width: 90%;
				color: #fff;
				padding: 10px;
				text-align: center;
				background-color: rgba(18,183,245,0.4);
				border: 1px solid #fff;
				border-radius: 20px;
			}
			.btn-div{
				float: left;
				outline: none;
				width: 50%;
				box-sizing: border-box;
				padding: 10px;
				overflow: hidden;
			}
			.btn-login {
				width: 100%;
				font-size: 14px;
				color: #fff;
				background-color: rgba(18,183,245,1);
				padding: 10px;
				border: 1px solid #12b7f5;
				border-top-left-radius: 20px;
				border-top-right-radius: 20px;
				border-bottom-right-radius: 20px;
				border-bottom-left-radius: 20px;
			}
			/*登录点击效果*/
			
			.btn-login:active {
				/*background: #8C0000;*/
				border-top: 1px solid #9cc;
				background: #9cc;
				box-shadow: 0px 1px 1px #9cc inset, 1px 0px 1px #9cc inset;
			}
			
			.link-area a {
				font-size: 13px;
				color: #fff;
			}
			
			.link-area {
				margin: 10px;
			}
			
			::-webkit-input-placeholder {
				/* WebKit browsers */
				color: #fff;
			}
			
			:-moz-placeholder {
				/* Mozilla Firefox 4 to 18 */
				color: #fff;
			}
			
			::-moz-placeholder {
				/* Mozilla Firefox 19+ */
				color: #fff;
			}
			
			:-ms-input-placeholder {
				/* Internet Explorer 10+ */
				color: #fff;
			}
			
			.mui-content-padded {
			    margin: 0;
                padding: 0 5%;
				width: 100%;
				box-sizing: border-box;
				overflow: hidden;
				
			}
		</style>
		<title>修改密码</title>
		
	</head>

	<body>
	<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">修改密码</h1>
		</header>
		<div class="mui-content" style="background: none;padding-top:0">
	<form id="inputForm" action="${ctx}/m/sys/user/modifyPwd" method="post" style="padding-top: 100px;">
		<input type="hidden" name="id"/>
		<input type="hidden" value="${message}" id="message"/>
<%-- 		<sys:message content=""/>${message} --%>
	
		<div >
			<div id="div1" class="oa-input-login">
				<!--<form id='login-form' class="mui-input-group">-->
				<div class="login-input-row" align="center">
					<input id='oldpwd' name="oldPassword" type="password" class="login-name" placeholder="请输入原来的密码">
				</div>
				<div class="login-input-row" align="center">
					<input id='password' name="newPassword" type="password" class="login_pwd" placeholder="请输入新密码">
				</div>
				<div class="login-input-row" align="center">
					<input id='updatepwd' name="confirmNewPassword" type="password" class="login_pwd" placeholder="请再次输入密码">
				</div>
				<!--</form>-->

			</div>
			<div id="div2" class="mui-content-padded" align="center">
				<div class="btn-div">
				<button id='confirm' class="btn-login" type="submit">确定</button>
				</div>
				<div class="btn-div">
				<button id='cancel' class="btn-login mui-action-back">取消</button>
				</div>
			</div>
		</div>
		</form>	
		</div>
		<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
		<script type="text/javascript" charset="utf-8">
			mui.init()

			$("#confirm").click(function(){				
				var oldpwd = $("#oldpwd").val();
				var newpassword = $("#password").val();
				var confirmNewPassword = $("#updatepwd").val();
				
				if(oldpwd==""){
					mui.alert('旧密码不能为空！');
					return false;
				}
				if(newpassword==""){
					mui.alert('新密码不能为空！');
					return false;
				}
				if(confirmNewPassword==""){
					mui.alert('请再次输入新密码！');
					return false;
				}
				if(newpassword != confirmNewPassword){
					mui.alert('两次输入的新密码不一样，请核对！');
					return false;
				}			
				return true;
			})
		</script>
		<script type="text/javascript">
		$(function(){
			var message = $("#message").val();
			if(message=="yes"){
				mui.alert('修改密码成功！');
			}
			if(message=="no"){
				mui.alert('修改密码失败，旧密码错误！');
			}
		})
		</script>
	</body>

</html>