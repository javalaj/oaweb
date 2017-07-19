<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>申请用车成功！管理</title>
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
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-content">		
				<ul class="nav nav-tabs myoa-tabs">
					<li class="active"><a href="${ctx}/oa/oaUsecar/">申请用车列表</a></li>
					<shiro:hasPermission name="oa:oaUsecar:edit"><li><a href="${ctx}/oa/oaUsecar/form">申请用车成功！添加</a></li></shiro:hasPermission>
				</ul>
				<form:form id="searchForm" modelAttribute="oaUsecar" action="${ctx}/oa/oaUsecar/" method="post" class="breadcrumb form-search">
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
							<th>修改时间</th>
							<th>备注</th>
							<shiro:hasPermission name="oa:oaUsecar:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="oaUsecar">
						<tr>
							<td><a href="${ctx}/oa/oaUsecar/form?id=${oaUsecar.id}">
								<fmt:formatDate value="${oaUsecar.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</a></td>
							<td>
								${oaUsecar.remarks}
							</td>
							<shiro:hasPermission name="oa:oaUsecar:edit"><td>
			    				<a href="${ctx}/oa/oaUsecar/form?id=${oaUsecar.id}">修改</a>
								<a href="${ctx}/oa/oaUsecar/delete?id=${oaUsecar.id}" onclick="return confirmx('确认要删除该申请用车成功！吗？', this.href)">删除</a>
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