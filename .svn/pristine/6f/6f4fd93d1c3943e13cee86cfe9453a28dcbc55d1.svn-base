<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>我的任务管理</title>
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
	<style type="text/css">
	.ul-form li{ margin-left:100px;}
.btns{margin-left:0px;}
	
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/oaTask/">我布置的任务<span style="color:red;">(11)</span></a></li>
		<li ><a href="${ctx}/oa/oaTask/">我收到的任务<span style="color:red;">(11)</span></a></li>
		<li ><a href="${ctx}/oa/oaTask/">所有任务<span style="color:red;">(11)</span></a></li>
		<shiro:hasPermission name="oa:oaTask:edit"><li><a href="${ctx}/oa/oaTask/form">新建任务</a></li></shiro:hasPermission> 
	</ul>
	<form:form id="searchForm" modelAttribute="oaTask" action="${ctx}/oa/oaTask/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form" >
		<li><i class="icon-tags" style="color:blue;"></i><a href="">进行中<span>11</span></a>				
			</li>
			<li><i class="icon-tags" style="color:green;"></i><a href="">已完成<span>11</span></a>		
			</li>
			<li><i class="icon-tags" style="color:red;"></i><a href="">已超期<span>11</span></a>		
			</li>
			<li>
				<form:input path="title" htmlEscape="false" placeholder="查找我收到的任务" maxlength="200" class="input-medium"/><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
			</li>
			
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<input id="btn" class="btn btn-primary" type="button" value="编辑子任务" onclick="window.location.href=''"/>	<input id="btn" class="btn btn-primary" type="button" value="办结" onclick="window.location.href=''"/>	<input id="btn" class="btn btn-primary" type="button" onclick="window.location.href=''" value="移交任务"/>	
	<input id="btn" class="btn btn-primary" type="button" value="收藏" onclick="window.location.href=''"/>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>任务名称</th>
				<th>关联项目</th>				
				<th>任务发起人</th>
				<th>发起部门</th>
				<th>任务开始时间</th>
				<th>期望完成时间</th>
				<%-- <shiro:hasPermission name="oa:oaTask:edit"><th>操作</th></shiro:hasPermission> --%>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaTask">
			<tr>
				<td><a href="${ctx}/oa/oaTask/form?id=${oaTask.id}">
					${oaTask.title}
				</a></td>
				
				<td>
					${oaTask.createBy.id}
				</td>
				<td>
					${oaTask.createBy.id}
				</td>
				<td>
					${oaTask.createBy.office.name}
				</td>
				<td>
					<fmt:formatDate value="${oaTask.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${oaTask.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<%-- <shiro:hasPermission name="oa:oaTask:edit"><td>
    				<a href="${ctx}/oa/oaTask/form?id=${oaTask.id}">修改</a>
					<a href="${ctx}/oa/oaTask/delete?id=${oaTask.id}" onclick="return confirmx('确认要删除该我的任务吗？', this.href)">删除</a>
				</td></shiro:hasPermission> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>