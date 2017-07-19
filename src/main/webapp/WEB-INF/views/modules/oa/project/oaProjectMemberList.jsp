<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目成员管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/project/oaProjectMember/">项目成员列表</a></li>
		<shiro:hasPermission name="oa:project:oaProjectMember:edit"><li><a href="${ctx}/oa/project/oaProjectMember/form">项目成员添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="oaProjectMember" action="${ctx}/oa/project/oaProjectMember/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>关联的项目：</label>
				<form:input path="project.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>关联的用户</th>
				<th>职责</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="oa:project:oaProjectMember:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaProjectMember">
			<tr>
				<td><a href="${ctx}/oa/project/oaProjectMember/form?id=${oaProjectMember.id}">
					${oaProjectMember.user.name}
				</a></td>
				<td>
					${oaProjectMember.duty}
				</td>
				<td>
					<fmt:formatDate value="${oaProjectMember.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${oaProjectMember.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${oaProjectMember.remarks}
				</td>
				<shiro:hasPermission name="oa:project:oaProjectMember:edit"><td>
    				<a href="${ctx}/oa/project/oaProjectMember/form?id=${oaProjectMember.id}">修改</a>
					<a href="${ctx}/oa/project/oaProjectMember/delete?id=${oaProjectMember.id}" onclick="return confirmx('确认要删除该项目成员吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>