<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>链接管理</title>
	<meta name="decorator" content="default"/>
</head>
<body class="gray-bg">
<%-- 	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/link/?category.id=${link.category.id}">链接列表</a></li>
		<shiro:hasPermission name="cms:link:edit"><li><a href="<c:url value='${fns:getAdminPath()}/cms/link/form?id=${link.id}&category.id=${link.category.id}'><c:param name='category.name' value='${link.category.name}'/></c:url>">链接添加</a></li></shiro:hasPermission>
	</ul> --%>
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>链接列表 </h5>
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
	<div class="row">
			<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="link" action="${ctx}/cms/link/" method="post" class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<table:sortColumn id="orderBy" name="orderBy"
						value="${page.orderBy}" callback="sortOrRefresh();" />
						<div class="form-group">
		<span>栏目：</span><sys:treeselect id="category" name="category.id" value="${link.category.id}" labelName="category.name" labelValue="${link.category.name}"
					title="栏目" url="/cms/category/treeData" module="link" notAllowSelectRoot="false" cssClass="form-control m-b"/>
		<span>名称：</span><form:input path="title" htmlEscape="false" maxlength="50" class="form-control m-b"/>&nbsp;
		<span>状态：</span><form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/>
	</div>
	</form:form>
	<br />
			</div>
		</div>
		<!-- 工具栏 -->
		<div class="row">
			<div class="col-sm-12">
				<div class="pull-left">	
				<shiro:hasPermission name="cms:link:add"> 
						<table:addRow url="${ctx}/cms/link/form" title="链接" width="800px"
							height="510px" ></table:addRow>
						<!-- 增加按钮 -->
					</shiro:hasPermission>	
					 <shiro:hasPermission name="cms:link:edit"> 
						<table:editRow url="${ctx}/cms/link/form" id="contentTable" title="链接" width="800px"
							height="510px" ></table:editRow>
						<!-- 修改按钮 -->
					</shiro:hasPermission>
					<shiro:hasPermission name="cms:link:del"> 
							<table:delRow url="${ctx}/cms/link/deleteAll" id="contentTable"></table:delRow>
						<!-- 删除按钮 -->
					</shiro:hasPermission>
					<button class="btn btn-white btn-sm " data-toggle="tooltip"
						data-placement="left" onclick="sortOrRefresh()" title="刷新">
						<i class="glyphicon glyphicon-repeat"></i> 刷新
					</button>

				</div>
				<div class="pull-right">
					<button class="btn btn-primary btn-rounded btn-outline btn-sm "
						onclick="search()">
						<i class="fa fa-search"></i> 查询
					</button>
					<button class="btn btn-primary btn-rounded btn-outline btn-sm "
						onclick="reset()">
						<i class="fa fa-refresh"></i> 重置
					</button>
				</div>
			</div>
		</div>
	<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead><tr><th><input type="checkbox" class="i-checks"></th><th>栏目</th><th>名称</th><th>权重</th><th>发布者</th><th>更新时间</th><shiro:hasPermission name="cms:link:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="link">
			<tr><td><input type="checkbox" id="${link.id}" class="i-checks"></td>
				<td><a href="javascript:" onclick="$('#categoryId').val('${link.category.id}');$('#categoryName').val('${link.category.name}');$('#searchForm').submit();return false;">${link.category.name}</a></td>
				<td><a href="#" onclick="openDialogView('查看链接信息', '${ctx}/cms/link/form?id=${link.id}','800px', '510px')"  title="${link.title}">${fns:abbr(link.title,40)}</a></td>
				<td>${link.weight}</td>
				<td>${link.user.name}</td>
				<td><fmt:formatDate value="${link.updateDate}" type="both"/></td>
				<td>
				<a href="${link.href}" target="_blank" class="btn btn-info btn-xs"><i class="fa fa-edit"></i>访问</a>
    				<shiro:hasPermission name="cms:link:edit"><a href="#" onclick="openDialog('修改链接信息', '${ctx}/cms/link/form?id=${link.id}','800px', '510px')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>修改</a></shiro:hasPermission>
					<shiro:hasPermission name="cms:link:del"><a href="${ctx}/cms/link/delete?id=${link.id}${link.delFlag ne 0?'&isRe=true':''}&categoryId=${link.category.id}" onclick="return confirmx('确认要${link.delFlag ne 0?'发布':'删除'}该链接吗？', this.href)" class="btn btn-danger btn-xs">${link.delFlag ne 0?'<i class="fa fa-file"></i>发布':'<i class="fa fa-trash"></i>删除'}</a></shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table:page page="${page}"></table:page>
	<br/>
	<br/>
	</div>
	</div>
</div>
</body>
</html>