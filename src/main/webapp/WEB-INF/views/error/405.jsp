<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
  <meta name="decorator" content="default"/>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<title>手机不支持的流程查看</title>
<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
</head>
<body class="teamwork">
	<div class="xin-main">
		<div class="container-fluid">
		<div class="page-header">
			<h1>此流程不支持手机端，请在电脑端查看</h1>
		</div>
		<div>
			<button onclick="history.go(-1);" class="btn">返回上一页</button>
		</div>
	</div>
	</div>
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<script src="${ctxStatic}/mobile/js/mobile.js"></script>
</body>
</html>