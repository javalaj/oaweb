<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>站点管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	function refresh(){//刷新
		
		window.location="${ctx}/cms/site/";
	}		
	</script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>站点列表 </h5>
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
	<form:form id="searchForm" modelAttribute="site" action="${ctx}/cms/site/" method="post" class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<table:sortColumn id="orderBy" name="orderBy"
						value="${page.orderBy}" callback="sortOrRefresh();" />
						<div class="form-group">
		<span>名称：</span><form:input path="name" htmlEscape="false" maxlength="50" class=" form-control m-b"/>
		<span>状态：</span><form:radiobuttons path="delFlag" items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks" />
		</div>
	</form:form>
	<br />
			</div>
		</div>
	
	<!-- 工具栏 -->
		<div class="row">
			<div class="col-sm-12">
				<div class="pull-left">	
				<%-- <shiro:hasPermission name="cms:site:add"> --%>
						<table:addRow url="${ctx}/cms/site/form" title="站点" width="800px"
							height="510px" ></table:addRow>
						<!-- 增加按钮 -->
					<%-- </shiro:hasPermission>	 --%>
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
		<thead><tr><th>名称</th><th>标题</th><th>描述</th><th>关键字</th><th>主题</th><shiro:hasPermission name="cms:site:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="site">
			<tr>
				<td><a href="#" onclick="openDialogView('查看站点信息', '${ctx}/cms/site/form?id=${site.id}','800px', '510px')" title="${site.name}">${fns:abbr(site.name,40)}</a></td>
				<td>${fns:abbr(site.title,40)}</td>
				<td>${fns:abbr(site.description,40)}</td>
				<td>${fns:abbr(site.keywords,40)}</td>
				<td>${site.theme}</td>
				<td>
				<shiro:hasPermission name="cms:site:edit"><a href="#"
									onclick="openDialog('修改站点信息', '${ctx}/cms/site/form?id=${site.id}','800px', '510px')"
									class="btn btn-success btn-xs"><i class="fa fa-edit"></i>
									修改</a>
							</shiro:hasPermission> <%-- <shiro:hasPermission name="cms:site:del"> --%>
								<a href="${ctx}/cms/site/delete?id=${site.id}${site.delFlag ne 0?'&isRe=true':''}"
									onclick="return confirmx('确认要${site.delFlag ne 0?'恢复':''}删除该用户吗？', this.href)"
									class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>
									${site.delFlag ne 0?'恢复':''}删除</a>
							<%-- </shiro:hasPermission>  --%>   				
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