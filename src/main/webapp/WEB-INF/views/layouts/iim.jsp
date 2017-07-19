<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html style="overflow-x: auto; overflow-y: auto;">
<head>
<title><sitemesh:title /></title>
<!-- 引入jquery插件 -->
<script src="${ctxStatic}/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>



<!--  - Powered By JeeSite -->
<!-- 引入layer插件 -->
<script src="${ctxStatic}/layui-v1.0.9_rls/layui/layui.js"></script>

<script src="${ctxStatic}/common/jeeplus.js" type="text/javascript"></script>



<link rel="stylesheet"
	href="${ctxStatic}/layui-v1.0.9_rls/layui/css/layui.css" media="all"></link>

<link rel="stylesheet"
	href="${ctxStatic}/common/css/iim.css" media="all"></link>

<!-- Baidu tongji analytics -->
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?82116c626a8d504a5c0675073362ef6f";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
<sitemesh:head />
</head>
<body>
	<sitemesh:body />
</body>
</html>