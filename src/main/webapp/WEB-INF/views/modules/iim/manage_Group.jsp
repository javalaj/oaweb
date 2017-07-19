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

<script type="text/javascript">
	layui
			.use(
					[ 'layer', 'element', 'upload', 'form' ],
					function() {
						var layer = layui.layer, form = layui.form, upload = layui.upload, element = layui
								.element();
						//$(window.parent.$("#createg")).attr('src',$(window.parent.$("#createg")).attr('src'));
						$(window.parent.$("#findg")).attr('src',
								$(window.parent.$("#findg")).attr('src'));
					});

</script>
</head>
<body>
	<div class="mygroup">
		<div class="myown-top">
			我管理的群<span>（${size1}）</span>
		</div>
		<ul class="group-list">
			<c:forEach items="${group1}" var="group">
				<li><span class="group-list-img"><img
						src="${group.avatar}" alt="" /></span> <span class="group-list-name">${group.groupname}</span>
					<div class="group-list-btn">
						<a href="${ctx}/iim/contact/updateGroup?id=${group.id}"
							class="layui-btn layui-btn-normal btn-edit">群修改</a> <a
							href="${ctx}/iim/contact/manageUser?id=${group.id}"
							class="layui-btn btn-build">群成员</a> <a
							href="${ctx}/iim/contact/managedelGroup?id=${group.id}"
							onclick="return confirmx('确认要解散该群吗？', this.href)"
							class="layui-btn layui-btn-primary">解散群</a>
					</div></li>

			</c:forEach>
		</ul>
		<div class="myown-top">
			我加入的群<span>（${size2}）</span>
		</div>
		<ul class="group-list">
			<c:forEach items="${group2}" var="group">
				<li><span class="group-list-img"><img
						src="${group.avatar}" alt="" /></span> <span class="group-list-name">${group.groupname}</span>
					<div class="group-list-btn">
						<a href="${ctx}/iim/contact/manageUser?id=${group.id}"
							class="layui-btn btn-build">群成员</a> <a
							href="${ctx}/iim/contact/manageexitGroup?id=${group.id}"
							onclick="return confirmx('确认要退出该群吗？', this.href)"
							class="layui-btn layui-btn-primary">退出群</a>
					</div></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>