<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>群管理</title>
<meta name="decorator" content="iim" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">


<style type="text/css">
.layui-tab {
	margin: 10px 0;
	text-align: center !important;
}

.layui-tab-title li {
	display: inline-block;
	vertical-align: middle;
	font-size: 14px;
	transition: all .2s;
	-webkit-transition: all .2s;
	position: relative;
	line-height: 40px;
	min-width: 65px;
	padding: 0 120px !important;
}
</style>


<script type="text/javascript">
	layui.use([ 'layer', 'element' ], function() {
		var layer = layui.layer, element = layui.element();
		//监听Tab切换
		element.on('tab(groupdemo)', function(data) {
			if (data.index == 0) {
				$("#createg").attr('src', '${ctx}/iim/contact/newGroup');
				$("#manageg").attr('src', '${ctx}/iim/contact/manageGroup');
			} else if (data.index == 1) {
				$("#findg").attr('src', '${ctx}/iim/contact/findGroup');
				$("#manageg").attr('src', '${ctx}/iim/contact/manageGroup');
			}else if (data.index == 2) {
				$("#findg").attr('src', '${ctx}/iim/contact/findGroup');
				$("#createg").attr('src', '${ctx}/iim/contact/newGroup');
			}
		});
	});
</script>
</head>
<body>


	<div class="layui-tab" lay-filter="groupdemo">
		<ul class="layui-tab-title">
			<li class="layui-this">查找群</li>
			<li>新建群</li>
			<li>群管理</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<iframe src="${ctx}/iim/contact/findGroup" width="100%"
					height="390px" frameborder="0" scrolling="no" id="findg"
					name="findg" marginwidth="0px"> </iframe>

			</div>
			<!-- --------------------------建群-------------------------------------------------------------------- -->
			<div class="layui-tab-item">
				<iframe src="${ctx}/iim/contact/newGroup" width="100%"
					height="390px" frameborder="0" scrolling="no" id="createg"
					name="createg" marginwidth="0px"> </iframe>
			</div>
			<!-- --------------------------管理群-------------------------------------------------------------------- -->
			<div class="layui-tab-item">
				<iframe src="${ctx}/iim/contact/manageGroup" width="100%"
					height="390px" frameborder="0" scrolling="no" id="manageg"
					name="manageg" marginwidth="0px"> </iframe>
			</div>
		</div>
	</div>
</body>
</html>