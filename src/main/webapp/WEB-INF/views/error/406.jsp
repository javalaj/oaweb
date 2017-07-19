<%@page import="com.thinkgem.jeesite.common.web.Servlets"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%--<title>406 - 错误操作，表单重复提交</title> --%>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header">
			<h1>您已经提交过该表单，请勿重复提交。</h1>
		</div>
		<div>
			<button onclick="history.go(-1);" class="btn">返回上一页</button>
		</div>
	</div>
</body>
</html>
