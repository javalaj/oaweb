<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员增补管理</title>
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
<div class="ibox">
<div class="ibox-title">
		<h5>人员增补列表 </h5>
	</div>
	
	<div class="ibox-content">
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/staff/oaStaffupdated/">人员增补列表</a></li>
		<shiro:hasPermission name="oa:staff:oaStaffupdated:edit"><li><a href="${ctx}/oa/staff/oaStaffupdated/form">人员增补添加</a></li></shiro:hasPermission>
	</ul> --%>
	<form:form id="searchForm" modelAttribute="oaStaffupdated" action="${ctx}/oa/staff/oaStaffupdated/" method="post" class="breadcrumb form-search">
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
				<shiro:hasPermission name="oa:staff:oaStaffupdated:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaStaffupdated">
			<tr>
				<shiro:hasPermission name="oa:staff:oaStaffupdated:edit"><td>
    				<a href="${ctx}/oa/staff/oaStaffupdated/form?id=${oaStaffupdated.id}">修改</a>
					<a href="${ctx}/oa/staff/oaStaffupdated/delete?id=${oaStaffupdated.id}" onclick="return confirmx('确认要删除该人员增补吗？', this.href)">删除</a>
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