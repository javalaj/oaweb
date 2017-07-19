<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>栏目管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		
		});
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>栏目管理</h5>
			</div>
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaNewsColumn" action="${ctx}/oa/newscenter/oaNewsColumn/" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<sys:message content="${message}"/>
							<!--查询条件-->
							<div class="form-group">
								<span>栏目名称：</span>
									<form:input path="columnName" htmlEscape="false" maxlength="255"  class=" form-control input-sm"/>
							</div>
						</form:form>
						<br/>
					</div>
				</div>
				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<shiro:hasPermission name="oa:newscenter:oaNewsColumn:add">
								<!-- 增加按钮 -->
								<table:addRow url="${ctx}/oa/newscenter/oaNewsColumn/form" title="栏目管理" width="800px;" height="350px"/>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:newscenter:oaNewsColumn:edit">
								<!-- 编辑按钮 -->
							    <table:editRow url="${ctx}/oa/newscenter/oaNewsColumn/form" title="栏目管理" id="contentTable" width="800px;" height="350px"/>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:newscenter:oaNewsColumn:del">
								<!-- 删除按钮 -->
								<table:delRow url="${ctx}/oa/newscenter/oaNewsColumn/deleteAll" id="contentTable" confirm_content="确认要删除栏目吗？"/>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:newscenter:oaNewsColumn:import">
								<!-- 导入按钮 -->
								<table:importExcel url="${ctx}/oa/newscenter/oaNewsColumn/import"/>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:newscenter:oaNewsColumn:export">
								<!-- 导出按钮 -->
					       		<table:exportExcel url="${ctx}/oa/newscenter/oaNewsColumn/export"/>
					       	</shiro:hasPermission>
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
							<th style="width: 10px;"><input type="checkbox" class="i-checks"></th>
							<th  class="sort-column columnName">栏目名称</th>
							<th  class="sort-column ">栏目管理员</th>
							<th  class="sort-column createBy.id">创建人</th>
							<th  class="sort-column createDate">创建时间</th>
							<th  class="sort-column updateDate">更新时间</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="oaNewsColumn">
						<tr>
							<td><input type="checkbox" id="${oaNewsColumn.id}" class="i-checks"></td>
							<td >
								${oaNewsColumn.columnName}
							</td>
							<td >
								${fns:getUserById(oaNewsColumn.admin.id).name}
							</td>
							<td >
								${fns:getUserById(oaNewsColumn.createBy.id).name}
							</td>
							<td >
								<fmt:formatDate value="${oaNewsColumn.createDate}" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td >
								<fmt:formatDate value="${oaNewsColumn.updateDate}" pattern="yyyy-MM-dd HH:mm"/>
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