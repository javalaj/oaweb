<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>站内邮件管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>站内邮件列表</h5>
			</div>

			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaMail"
							action="${ctx}/oa/mail/oaMail/" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden"
								value="${page.pageNo}" />
							<input id="pageSize" name="pageSize" type="hidden"
								value="${page.pageSize}" />
							<sys:message content="${message}" />

							<!--查询条件-->
							<div class="form-group">
								<span>标题：</span>
								<form:input path="title" htmlEscape="false" maxlength="1000"
									class="form-control input-sm" style="width: 300px;" />

							</div>
						</form:form>
						<br />
					</div>
				</div>

				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<shiro:hasPermission name="oa:mail:oaMail:edit">
								<!-- 增加按钮 -->
								<a href="#"
									onclick="openDialog2('新增站内邮件', '${ctx}/oa/mail/oaMail/form','800px', '600px','存草稿,发送,关闭')"
									class="btn btn-white btn-sm"><i class="fa fa-plus"></i>写邮件</a>
							</shiro:hasPermission>
							<%--
							<shiro:hasPermission name="oa:mail:oaMail:edit">
								<!-- 编辑按钮 -->
								<table:editRow url="${ctx}/oa/mail/oaMail/form" title="站内邮件"
									id="contentTable" />
							</shiro:hasPermission>
							--%>
							<shiro:hasPermission name="oa:mail:oaMail:edit">
								<!-- 删除按钮 -->
								<table:delRow url="${ctx}/oa/mail/oaMail/deleteAll"
									id="contentTable" confirm_content="确认要删除站内邮件吗?"/>
							</shiro:hasPermission>
						</div>
						<div class="pull-right">
							<table:search />
							<table:reset />
						</div>
					</div>
				</div>

				<table id="contentTable"
					class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th><input type="checkbox" class="i-checks"></th>
							<th class="sort-column title">标题</th>
							<th class="sort-column remarks">状态</th>
							<th class="sort-column updateDate">发送时间</th>
							<shiro:hasPermission name="oa:mail:oaMail:view">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="oaMail">
							<tr>
								<td><input type="checkbox" id="${oaMail.id}"
									class="i-checks"></td>
								<td>${oaMail.title}</td>
								<td><c:choose>
										<c:when test="${oaMail.isdraft=='0'}">
											<font color="red">草稿</font>
										</c:when>
										<c:when test="${oaMail.isdraft=='2'}">
											<font color="green">处理中</font>
										</c:when>
										<c:otherwise>
											<font color="blue">已办结</font>
										</c:otherwise>
									</c:choose></td>
								<td><fmt:formatDate value="${oaMail.updateDate}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><shiro:hasPermission name="oa:mail:oaMail:view">
										<a href="#"
											onclick="openDialogView('查看站内邮件', '${ctx}/oa/mail/oaMail/view?noback=1&id=${oaMail.id}','800px', '600px')"
											class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>
											查看</a>
									</shiro:hasPermission> <c:if test="${oaMail.isdraft == '0'}">

										<shiro:hasPermission name="oa:mail:oaMail:edit">
											<a href="#"
												onclick="openDialog2('修改站内邮件', '${ctx}/oa/mail/oaMail/form?id=${oaMail.id}','800px', '600px','存草稿,发送,关闭')"
												class="btn btn-success btn-xs"><i class="fa fa-edit"></i>
												修改</a>
										</shiro:hasPermission>



									</c:if> <%--<shiro:hasPermission name="oa:mail:oaMail:edit">
										<a href="${ctx}/oa/mail/oaMail/delete?id=${oaMail.id}"
											onclick="return confirmx('确认要删除该站内邮件吗？', this.href)"
											class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>
											删除</a>
									</shiro:hasPermission> --%></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table:page page="${page}" />
				<br> <br>
			</div>
		</div>
	</div>
</body>
</html>