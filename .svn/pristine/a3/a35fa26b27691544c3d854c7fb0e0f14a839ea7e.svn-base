<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>内容管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
<script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
	<style type="text/css">
		.ztree {overflow:auto;margin:0;_margin-top:10px;padding:10px 0 0 10px;}
	</style>
	<script type="text/javascript">
		function refresh(){//刷新
			
			window.location="${ctx}/cms/";
		}
	</script>
</head>
<body class="gray-bg" >
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-content">
<!-- 0:隐藏tip, 1隐藏box,不设置显示全部 -->
<script type="text/javascript">top.$.jBox.closeTip();</script>
	<div id="content" class="row">
		<div id="left"  style="background-color:#e7eaec" class="leftBox col-sm-1">
			<iframe id="cmsMenuFrame" name="cmsMenuFrame" src="${ctx}/cms/tree" style="overflow:visible;"
				scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>			
		</div>
		<div id="right"  class="col-sm-11  animated fadeInRight">
			<iframe id="cmsMainFrame" name="cmsMainFrame" src="${ctx}/cms/none" style="overflow:visible;"
				scrolling="yes" frameborder="no" width="100%"></iframe>
		</div>
	</div>
	</div></div></div>
	<script type="text/javascript"> 
	var leftWidth = 180; // 左侧窗口大小
	var htmlObj = $("html"), mainObj = $("#main");
	var frameObj = $("#left, #openClose, #right, #right iframe");
	function wSize(){
		var strs = getWindowSize().toString().split(",");
		htmlObj.css({"overflow-x":"hidden", "overflow-y":"hidden"});
		mainObj.css("width","auto");
		frameObj.height(strs[0] - 120);
		var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
		$("#right").width($("#content").width()- leftWidth - $("#openClose").width() -60);
		$(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
	}
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>