<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body class="gray-bg">
	
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>业务表单列表  </h5><!-- （欢迎使用代码生成器，最新版请访问<a target="_blank" href="http://www.chuyutech.com">http://www.chuyutech.com</a>) -->
		<ibox:tools/>
	</div>
	
	<div class="ibox-content">
	
	<!--查询条件-->
	<div class="row">
	<div class="col-sm-12">
		<form id="searchForm" class="form-inline" action="${ctx}/gen/genTable" method="post">
		<input id="pageNo" name="pageNo" value="${page.pageNo}" type="hidden">
		<input id="pageSize" name="pageSize" value="${page.pageSize}" type="hidden">
		<input id="orderBy" name="orderBy" value="" type="hidden">

		<sys:message content="${message}"/>
		<div class="form-group">
		<span>表名：</span><input id="nameLike" name="nameLike" class=" form-control input-sm" value="" maxlength="50" type="text">
		<span>说明：</span><input id="comments" name="comments" class=" form-control input-sm" value="" maxlength="50" type="text">
		<span>父表表名：</span><input id="parentTable" name="parentTable" class=" form-control input-sm" value="" maxlength="50" type="text">
		</div>
	</form>
	<br>
	</div>
	</div>
    	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<shiro:hasPermission name="gen:genTable:edit">
				<table:addRow url="${ctx}/gen/genTable/form" title="业务表"/><!-- 增加按钮 -->
				
				<table:editRow url="${ctx}/gen/genTable/form" id="contentTable"  title="业务表"  width="80%" height="80%"/><!-- 编辑按钮 -->
				
				<table:delRow url="${ctx}/gen/genTable/deleteAll" id="contentTable" /><!-- 删除按钮 -->
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
		<thead>
		<tr>
			<th> <input type="checkbox" class="i-checks"></th>
			<th>表名 </th>
			<th>说明</th>
			<th>类名 </th>
			<th>主表 </th>
			<shiro:hasPermission name="gen:genTable:edit">
				<th>操作</th>
			</shiro:hasPermission>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="genTable">
			<tr>
				<td> <input type="checkbox" id="${genTable.id}" class="i-checks"></td>
				<td>${genTable.name}</td>
				<td>${genTable.comments}</td>
				<td>${genTable.className}</td>
				<td title="点击查询子表"><a href="javascript:" onclick="$('#parentTable').val('');$('#searchForm').submit();"></a></td>
				<td>
					<shiro:hasPermission name="gen:genTable:view">
						<a href="#" onclick="openDialogView('查看业务表', '${ctx}/gen/genTable/form?id=${genTable.id}','80%', '80%')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="gen:genTable:edit">
						<a href="#" onclick="openDialog('修改业务表', '${ctx}/gen/genTable/form?id=${genTable.id}','80%', '80%')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
						<a href="${ctx}/gen/genTable/delete?id=${genTable.id}" onclick="return confirmx('确认要删除该业务表吗？', this.href)"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
					</shiro:hasPermission>
				</td>
				
			</tr>

		</c:forEach>
		</tbody>
	</table>
		<!-- 分页代码 -->
	<table:page page="${page}"/>
	<br>
	<br>
	</div>
	</div>

</div>
</body>
</html>
