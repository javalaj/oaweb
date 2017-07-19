<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存发文记录成功管理</title>
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
<body>
	<ul class="nav nav-tabs myoa-tabs">
		<li class="active"><a href="${ctx}/oa/oaArchivesRecord/">保存发文记录成功列表</a></li>
		<shiro:hasPermission name="oa:oaArchivesRecord:edit"><li><a href="${ctx}/oa/oaArchivesRecord/form">保存发文记录成功添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="oaArchivesRecord" action="${ctx}/oa/oaArchivesRecord/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>编号：</label>
				<form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>公文ID：</label>
				<form:input path="oaArchivesId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>接受人：</label>
				<sys:treeselect id="user" name="user.id" value="${oaArchivesRecord.user.id}" labelName="user.name" labelValue="${oaArchivesRecord.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>阅读标记：</label>
				<form:input path="readFlag" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>公文ID</th>
				<th>接受人</th>
				<th>阅读标记</th>
				<shiro:hasPermission name="oa:oaArchivesRecord:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaArchivesRecord">
			<tr>
				<td><a href="${ctx}/oa/oaArchivesRecord/form?id=${oaArchivesRecord.id}">
					${oaArchivesRecord.oaArchivesId}
				</a></td>
				<td>
					${oaArchivesRecord.user.name}
				</td>
				<td>
					${oaArchivesRecord.readFlag}
				</td>
				<shiro:hasPermission name="oa:oaArchivesRecord:edit"><td>
    				<a href="${ctx}/oa/oaArchivesRecord/form?id=${oaArchivesRecord.id}">修改</a>
					<a href="${ctx}/oa/oaArchivesRecord/delete?id=${oaArchivesRecord.id}" onclick="return confirmx('确认要删除该保存发文记录成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>