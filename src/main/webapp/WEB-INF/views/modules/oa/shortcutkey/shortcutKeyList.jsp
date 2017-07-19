<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>快捷方式管理</title>
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
		
		function add(){
			window.location.replace("${ctx}/oa/shortcutkey/shortcutKey/form");
		}
	</script>
</head>
<body class="gray-bg">
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/shortcutkey/shortcutKey/">快捷方式列表</a></li>
		<shiro:hasPermission name="oa:shortcutkey:shortcutKey:edit"><li><a href="${ctx}/oa/shortcutkey/shortcutKey/form">快捷方式添加</a></li></shiro:hasPermission>
	</ul> --%>
	<div class="wrapper wrapper-content">
	<div class="ibox">

	<div class="ibox-content">
	<sys:message content="${message}"/>
	
	<div class="row">
	<div class="col-sm-12">
	
	<form:form id="searchForm" modelAttribute="shortcutKey" action="${ctx}/oa/shortcutkey/shortcutKey/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div class="form-group">
			<label>名称：</label>
				<form:input path="menu.name" htmlEscape="false" 
				maxlength="64" class="form-control input-sm" style="width: 200px;"/>
		</div>
	</form:form>
		<br/>
	</div>
	</div>	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<shiro:hasPermission name="oa:shortcutkey:shortcutKey:edit">
			<button class="btn btn-white btn-sm" data-toggle="tooltip" 
			 style="outline-style: none;"  data-placement="left" onclick="add()" title="快捷方式添加"> 快捷方式添加</button>
			</shiro:hasPermission>			

		</div>
		<div class="pull-right">
			<table:search/>
			<table:reset/>
		</div>
	</div>
	</div>
		
	<table id="contentTable" class="table table-striped table-bordered table-condensetable table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footerd">
		<thead>
			<tr>
				<th>快捷方式名称</th>
				<th>路径</th>
				<th>创建日期</th>
				<th>更新时间</th>
				<shiro:hasPermission name="oa:shortcutkey:shortcutKey:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="shortcutKey">
			<tr>
				<td><a href="${ctx}/oa/shortcutkey/shortcutKey/form?id=${shortcutKey.id}">
					${shortcutKey.menu.name}
				</a></td>
				<td>
					${shortcutKey.menu.href}
				</td>
				<td>
					<fmt:formatDate value="${shortcutKey.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${shortcutKey.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="oa:shortcutkey:shortcutKey:edit"><td>
    				<a href="${ctx}/oa/shortcutkey/shortcutKey/form?id=${shortcutKey.id}">修改</a>
					<a href="${ctx}/oa/shortcutkey/shortcutKey/delete?id=${shortcutKey.id}" onclick="return confirmx('确认要删除该快捷方式吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		<table:page page="${page}"></table:page>
			<br>
		<br>
	</div>
</div>
</div>
</body>
</html>