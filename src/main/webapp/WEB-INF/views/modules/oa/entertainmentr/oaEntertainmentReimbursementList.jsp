<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>招待费流程管理</title>
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
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/">招待费流程列表</a></li>
		<shiro:hasPermission name="oa:entertainmentr:oaEntertainmentReimbursement:edit"><li><a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form">招待费流程添加</a></li></shiro:hasPermission>
	</ul> --%>
	<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>招待费流程管理列表 </h5>
		<div class="ibox-tools">
			<!-- <a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
				<i class="fa fa-wrench"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#">选项1</a>
				</li>
				<li><a href="#">选项2</a>
				</li>
			</ul>
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a> -->
		</div>
	</div>
    
    <div class="ibox-content">
	<sys:message content="${message}"/>
	<form:form id="searchForm" modelAttribute="oaEntertainmentReimbursement" action="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>修改时间</th>
				<th>备注</th>
				<shiro:hasPermission name="oa:entertainmentr:oaEntertainmentReimbursement:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaEntertainmentReimbursement">
			<tr>
				<td><a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form?id=${oaEntertainmentReimbursement.id}">
					<fmt:formatDate value="${oaEntertainmentReimbursement.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${oaEntertainmentReimbursement.remarks}
				</td>
				<shiro:hasPermission name="oa:entertainmentr:oaEntertainmentReimbursement:edit"><td>
    				<a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form?id=${oaEntertainmentReimbursement.id}">修改</a>
					<a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/delete?id=${oaEntertainmentReimbursement.id}" onclick="return confirmx('确认要删除该招待费流程吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	<br/>
	<br/>
	</div>
	</div>
</div>
</body>
</html>