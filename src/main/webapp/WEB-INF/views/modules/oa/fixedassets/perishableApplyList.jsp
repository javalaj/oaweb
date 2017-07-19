<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>低值易耗品申请管理</title>
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
		<li class="active"><a href="${ctx}/oa/fixedassets/perishableApply/">低值易耗品申请列表</a></li>
		<shiro:hasPermission name="oa:fixedassets:perishableApply:edit">
		<li><a href="${ctx}/oa/fixedassets/perishableApply/form">低值易耗品申请添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="perishableApply" 
	action="${ctx}/oa/fixedassets/perishableApply/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>备注信息</th>
				<shiro:hasPermission name="oa:fixedassets:perishableApply:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="perishableApply">
			<tr>
				<td><a href="${ctx}/oa/fixedassets/perishableApply/form?id=${perishableApply.id}">
					${perishableApply.remarks}
				</a></td>
				<shiro:hasPermission name="oa:fixedassets:perishableApply:edit"><td>
    				<a href="${ctx}/oa/fixedassets/perishableApply/form?id=${perishableApply.id}">修改</a>
					<a href="${ctx}/oa/fixedassets/perishableApply/delete?id=${perishableApply.id}" 
					onclick="return confirmx('确认要删除该低值易耗品申请吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>