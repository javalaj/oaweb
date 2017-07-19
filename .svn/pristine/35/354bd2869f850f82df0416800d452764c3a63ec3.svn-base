<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>员工转正申请管理</title>
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
		<li class="active"><a href="${ctx}/oa/oaEmployeeFormal/">员工转正申请列表</a></li>
		<shiro:hasPermission name="oa:oaEmployeeFormal:edit"><li><a href="${ctx}/oa/oaEmployeeFormal/form">员工转正申请添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="oaEmployeeFormal" action="${ctx}/oa/oaEmployeeFormal/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>更新时间</th>
				<th>备注</th>
				<th>姓名</th>
				<shiro:hasPermission name="oa:oaEmployeeFormal:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaEmployeeFormal">
			<tr>
				<td><a href="${ctx}/oa/oaEmployeeFormal/form?id=${oaEmployeeFormal.id}">
					<fmt:formatDate value="${oaEmployeeFormal.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${oaEmployeeFormal.remarks}
				</td>
				<td>
					${oaEmployeeFormal.name}
				</td>
				<shiro:hasPermission name="oa:oaEmployeeFormal:edit"><td>
    				<a href="${ctx}/oa/oaEmployeeFormal/form?id=${oaEmployeeFormal.id}">修改</a>
					<a href="${ctx}/oa/oaEmployeeFormal/delete?id=${oaEmployeeFormal.id}" onclick="return confirmx('确认要删除该员工转正申请吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>