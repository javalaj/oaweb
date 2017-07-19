<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE >
<html>
<head>
    <meta charset="utf-8">
    <title>${fns:getConfig('productName')}</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${ctxStatic}/jingle/css/Jingle.css">
    <link rel="stylesheet" href="${ctxStatic}/jingle/css/app.css">
   	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<script src="${ctxStatic}/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <style type="text/css">
    	body * {
    		padding: 10px;
    	}
    </style>
</head>
<body style="background-color:#f3f2f7">
        <header id="header" class="mui-bar mui-bar-nav"  style="background-color: #12b7f5;">
			<h1 class="mui-title" style="color: white;margin-top: -11px;">${fns:getConfig('productName')}</h1>
		</header>
		<oam:message content="${message}"></oam:message>
        <div class="mui-content" style="background: none;">
	            <form id="loginForm" action="${ctx}/login" method="post" style="margin: auto; max-width: 300px;">
	            	<div class="mui-card">
						<div class="mui-input-group">
							<div class="mui-input-row">
								<label style="float: none;font-size: 14px;">账号</label>
								<input type="text" name="username" id="username" placeholder="请填写登录账号"style="border-color: white;font-size:14px;font-size: 14px;position: absolute;top: -2px;left: 36%;line-height: 40px;">
							</div>
							<div class="mui-input-row">
								<label style="float:none;line-height: 30px;font-size: 14px;font-size: 14px;">密码</label>
								<input type="password" name="password" id="password" placeholder="请填写登录密码" style="border-color: white;font-size:14px;padding-bottom: 17px;">
							</div>
						</div>
					</div>
					<div class="mui-card" style="padding:5px;">
						<div class="mui-input-group">
							<div class="mui-input-row mui-checkbox">
								<label style="padding:2px 15px;font-size: 14px;">保持登录</label>
								<input style="right: 22%;padding-top: 2px;"id="rememberMe" name="rememberMe" type="checkbox" ${rememberMe ? 'checked' : ''}>
							</div>
						</div>
					</div>
					<c:if test="${isValidateCodeLogin}">
					<div id="validateCodeDiv" class="mui-card" style="padding:5px;">
						<div class="mui-input-group">
								<label style="padding: 2px 25px;font-size: 14px;">验证码</label>
								<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;padding:0px;width:60px"
			                    	imageCssStyle="padding-top:7px;"/>
						</div>
					</div>
	            	</c:if>
		            
	                <button id="btn" class="submit block" data-icon="key" style="background-color:#12b7f5;color:white;border: 1px solid #12b7f5;">登录</button>
	            </form>
	            <span style="text-align: center;width: 100%;font-size: 12px; color: #666;float: left;margin-top: -10px;">Copyright © 2016-2017  武汉楚誉科技股份有限公司</span>
 		</div>	            
<!-- lib -->
<script type="text/javascript" src="${ctxStatic}/jingle/js/lib/zepto.js"></script>
<script type="text/javascript" src="${ctxStatic}/jingle/js/lib/iscroll.js"></script>
<script type="text/javascript" src="${ctxStatic}/jingle/js/lib/Jingle.debug.js"></script>
<script type="text/javascript" src="${ctxStatic}/jingle/js/lib/zepto.touch2mouse.js"></script>
<!--- app --->
<script type="text/javascript"> var ctx = '${ctx}';</script>
<%-- <script type="text/javascript" src="${ctxStatic}/jingle/js/app/app.js"></script> --%>
<script type="text/javascript">
$(document).ready(function() {
	$("#btn").click(function(){
		$("#loginForm").submit(function(){
			if ($('#username').val() == ''){
				mui.toast('请填写账号',{ duration:'short', type:'div' }) ;
			}else if ($('#password').val() == ''){
				mui.toast('请填写密码',{ duration:'short', type:'div' }) ;
			}else if ($('#validateCodeDiv').is(':visible') && $('#validateCode').val() == ''){
				mui.toast('请填写验证码',{ duration:'short', type:'div' }) ;
			}else{
				return true;
			}
			return false;
		});
	});
});
</script>
</body>
</html>