<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生成方案管理</title>
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
	<h5>生成方案列表</h5>
	<ibox:tools/>
	</div>
	
	<div class="ibox-content">
	
	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="genScheme" action="${ctx}/gen/genScheme/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
		<sys:message content="${message}"/>
		<div class="form-group">
		<span>方案名称 ：</span><form:input path="name" htmlEscape="false" maxlength="50" class="form-control input-sm" style="width: 15%;"/>
		</div>
	</form:form>
	<br>
	</div>
	</div>
	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
		<!-- 增加按钮 -->
		<shiro:hasPermission name="gen:genTable:edit">
			<table:addRow url="${ctx}/gen/genScheme/form" title="生成方案" width="80%" height="80%"/>
		</shiro:hasPermission>
			<table:refresh/>
		</div>
		<div class="pull-right">
			<table:search/>
			<table:reset/>
		</div>
	</div>
	</div>
	

	<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead><tr><th>方案名称</th><th>生成模块</th><th>模块名</th><th>功能名</th><th>功能作者</th><shiro:hasPermission name="gen:genScheme:view"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="genScheme">
			<tr>
				<td>${genScheme.name}</td>
				<td>${genScheme.packageName}</td>
				<td>${genScheme.moduleName}${not empty genScheme.subModuleName?'.':''}${genScheme.subModuleName}</td>
				<td>${genScheme.functionName}</td>
				<td>${genScheme.functionAuthor}</td>
				<td>
				<shiro:hasPermission name="gen:genScheme:view">
					<a href="#" onclick="openDialogView('查看生成方案', '${ctx}/gen/genScheme/form?id=${genScheme.id}','80%', '80%')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
				</shiro:hasPermission>	
				<shiro:hasPermission name="gen:genScheme:edit">
					<a href="#" onclick="openDialog('修改生成方案', '${ctx}/gen/genScheme/form?id=${genScheme.id}','80%', '80%')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 生成代码</a>
					<a href="${ctx}/gen/genScheme/delete?id=${genScheme.id}" onclick="return confirmx('确认要删除该业务表吗？', this.href)"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
				</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table:page page="${page}"/>
	<br>
	<br>
	</div>
</div>
</div>
</body>
</html>
