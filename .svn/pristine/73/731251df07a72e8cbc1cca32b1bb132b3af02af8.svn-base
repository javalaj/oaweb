<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>群成员</title>
<meta name="decorator" content="iim" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<style type="text/css">
.layui-table {
	width: 650px;
	margin: 0 !important;
	background-color: #fff;
}
</style>



<script type="text/javascript">
	layui
			.use(
					[ 'layer', 'element', 'upload', 'form' ],
					function() {
						var layer = layui.layer, form = layui.form, upload = layui.upload, element = layui
								.element();

					});
</script>
</head>
<body>
	<div class="mygroup1">
		<div class="search-top">
			<a href="javascript:" onclick="self.location=document.referrer;"
				class="search-return"><i class="layui-icon">&#xe603;</i>&nbsp;返回</a>
		</div>
		<div class="group-myown">
			<div class="group-myown-info">
				<div class="group-myown-img">
					<img src="${group.avatar}" alt="" />
				</div>
				<span class="group-myown-name">${group.groupname}</span>
			</div>
			<div style="overflow-y: auto; height: 300px; margin: 10px 0;">
				<table class="layui-table group-own-table">
					<thead>
						<tr>
							<th>姓名</th>
							<th>联系方式</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list1}" var="group">
							<tr>
								<td><span class="group-role"><img
										src="${ctxStatic}/common/img/qunzhu.png" alt="群主"></span><span
									class="group-list-img"><img src="${group.photo}" alt="" /></span><span
									class="name">${group.name}</span> <c:if
										test="${group.status=='online'}">
										<span class="group-state"><img
											src="${ctxStatic}/common/img/online.png" alt="在线"></span>
									</c:if> <c:if test="${group.status=='offline'}">
										<span class="group-state"><img
											src="${ctxStatic}/common/img/outline.png" alt="离线"></span>
									</c:if></td>
									<td>${group.phone}</td>
								<td>${group.office.name}</td>
								<td></td>
							</tr>
						</c:forEach>



						<c:forEach items="${list2}" var="group">
							<c:if test="${usergroup.state=='0'}">
								<tr>
									<td><span class="group-role"><img
											src="${ctxStatic}/common/img/guanliyuan.png" alt="管理员"></span><span
										class="group-list-img"><img src="${group.photo}" alt="" /></span><span
										class="name">${group.name}</span> <c:if
											test="${group.status=='online'}">
											<span class="group-state"><img
												src="${ctxStatic}/common/img/online.png" alt="在线"></span>
										</c:if> <c:if test="${group.status=='offline'}">
											<span class="group-state"><img
												src="${ctxStatic}/common/img/outline.png" alt="离线"></span>
										</c:if></td>
										<td>${group.phone}</td>
									<td>${group.office.name}</td>
									
									<td><a
										href="${ctx}/iim/contact/setGroupUser?userid=${group.id}&groupid=${groupid}"
										class="layui-btn btn-build"
										style="width: 93px; font-size: 0.05px; text-align: center;">取消管理员</a>
										<a
										href="${ctx}/iim/contact/delGroupUser?userid=${group.id}&groupid=${groupid}"
										onclick="return confirmx('确认要删除成员吗？', this.href)"
										class="layui-btn layui-btn-primary">删除成员</a></td>
								</tr>
							</c:if>

							<c:if test="${usergroup.state!='0'}">
								<tr>
									<td><span class="group-role"><img
											src="${ctxStatic}/common/img/guanliyuan.png" alt="管理员"></span><span
										class="group-list-img"><img src="${group.photo}" alt="" /></span><span
										class="name">${group.name}</span> <c:if
											test="${group.status=='online'}">
											<span class="group-state"><img
												src="${ctxStatic}/common/img/online.png" alt="在线"></span>
										</c:if> <c:if test="${group.status=='offline'}">
											<span class="group-state"><img
												src="${ctxStatic}/common/img/outline.png" alt="离线"></span>
										</c:if></td>
										<td>${group.phone}</td>
									<td>${group.office.name}</td>
									<td></td>
								</tr>





							</c:if>
						</c:forEach>



						<c:forEach items="${list3}" var="group">
							<c:if test="${usergroup.state=='0'}">
								<tr>
									<td><span class="group-list-img"><img
											src="${group.photo}" alt="" /></span><span class="name">${group.name}</span>
										<c:if test="${group.status=='online'}">
											<span class="group-state"><img
												src="${ctxStatic}/common/img/online.png" alt="在线"></span>
										</c:if> <c:if test="${group.status=='offline'}">
											<span class="group-state"><img
												src="${ctxStatic}/common/img/outline.png" alt="离线"></span>
										</c:if></td>
										<td></td>
									<td>${group.office.name}</td>
									<td><a
										href="${ctx}/iim/contact/setGroupUser?userid=${group.id}&groupid=${groupid}"
										class="layui-btn btn-build" 
										style="width: 93px; font-size: 0.05px; text-align: center;">设置管理员</a> <a
										href="${ctx}/iim/contact/delGroupUser?userid=${group.id}&groupid=${groupid}"
										onclick="return confirmx('确认要删除成员吗？', this.href)"
										class="layui-btn layui-btn-primary">删除成员</a></td>
								</tr>
							</c:if>


							<c:if test="${usergroup.state=='5'}">
								<tr>
									<td><span class="group-list-img"><img
											src="${group.photo}" alt="" /></span><span class="name">${group.name}</span>
										<c:if test="${group.status=='online'}">
											<span class="group-state"><img
												src="${ctxStatic}/common/img/online.png" alt="在线"></span>
										</c:if> <c:if test="${group.status=='offline'}">
											<span class="group-state"><img
												src="${ctxStatic}/common/img/outline.png" alt="离线"></span>
										</c:if></td>
										<td>${group.phone}</td>
									<td>${group.office.name}</td>
									<td> <a
										href="${ctx}/iim/contact/delGroupUser?userid=${group.id}&groupid=${groupid}"
										onclick="return confirmx('确认要删除成员吗？', this.href)"
										class="layui-btn layui-btn-primary">删除成员</a></td>
								</tr>

							</c:if>
							
							
							<c:if test="${usergroup.state=='1'}">
								<tr>
									<td><span class="group-list-img"><img
											src="${group.photo}" alt="" /></span><span class="name">${group.name}</span>
										<c:if test="${group.status=='online'}">
											<span class="group-state"><img
												src="${ctxStatic}/common/img/online.png" alt="在线"></span>
										</c:if> <c:if test="${group.status=='offline'}">
											<span class="group-state"><img
												src="${ctxStatic}/common/img/outline.png" alt="离线"></span>
										</c:if></td>
										<td>${group.phone}</td>
									<td>${group.office.name}</td>
									<td> </td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>