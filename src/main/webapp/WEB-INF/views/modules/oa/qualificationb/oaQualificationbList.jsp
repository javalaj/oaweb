<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>资质借用管理</title>
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
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox" >
		<div class="ibox-content">
			<ul class="nav nav-tabs myoa-tabs">
				<li class="active"><a href="${ctx}/oa/qualificationb/oaQualificationb/">资质借用列表</a></li>
				<shiro:hasPermission name="oa:qualificationb:oaQualificationb:edit"><li><a href="${ctx}/oa/qualificationb/oaQualificationb/form">资质借用添加</a></li></shiro:hasPermission>
			</ul>
			<form:form id="searchForm" modelAttribute="oaQualificationb" action="${ctx}/oa/qualificationb/oaQualificationb/" method="post" class="breadcrumb form-search">
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
						<th>remarks</th>
						<th>update_date</th>
						<shiro:hasPermission name="oa:qualificationb:oaQualificationb:edit"><th>操作</th></shiro:hasPermission>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="oaQualificationb">
					<tr>
						<td><a href="${ctx}/oa/qualificationb/oaQualificationb/form?id=${oaQualificationb.id}">
							${oaQualificationb.remarks}
						</a></td>
						<td>
							<fmt:formatDate value="${oaQualificationb.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<shiro:hasPermission name="oa:qualificationb:oaQualificationb:edit"><td>
		    				<a href="${ctx}/oa/qualificationb/oaQualificationb/form?id=${oaQualificationb.id}">修改</a>
							<a href="${ctx}/oa/qualificationb/oaQualificationb/delete?id=${oaQualificationb.id}" onclick="return confirmx('确认要删除该资质借用吗？', this.href)">删除</a>
						</td></shiro:hasPermission>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="pagination">${page}</div>
		</div>
	</div>
</div>			
</body>
</html>