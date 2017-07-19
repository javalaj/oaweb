<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日程管理</title>
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
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/plan/sysPlan/">日程列表</a></li>
		<shiro:hasPermission name="plan:sysPlan:edit"><li><a href="${ctx}/plan/sysPlan/form"><i class="icon-plus" title="新建日程"></i></a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysPlan" action="${ctx}/plan/sysPlan/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="planTitle" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>事件类型：</label>
				<form:select path="planType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('plantype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>创建时间：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${sysPlan.createDate}" pattern="yyyy-MM-dd "/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd ',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>日程图标</th>
				<th>日程类型</th>
				<th>日期</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>标题</th>
				<th>提醒</th>
				<%-- <shiro:hasPermission name="plan:sysPlan:edit"><th>操作</th></shiro:hasPermission> --%>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysPlan">
			<tr>
				<td>
				<i class="icon-${sysPlan.planIcon}"></i>
				</td>
				<td>
					${fns:getDictLabel(sysPlan.planType, 'plantype', '')}
				</td>
				
				<td>
					<fmt:formatDate value="${sysPlan.startTime}" pattern="yyyy-MM-dd "/>
				</td>
				<td>
					<fmt:formatDate value="${sysPlan.startTime}" pattern=" HH:mm"/>
				</td>
				<td>
					<fmt:formatDate value="${sysPlan.endTime}" pattern=" HH:mm"/>
				</td>	
				<td>
					<a href="${ctx}/plan/sysPlan/form?id=${sysPlan.id}">${sysPlan.planTitle}</a>
				</td>
				<td>
					${sysPlan.remarks}<shiro:hasPermission name="plan:sysPlan:edit"><a href="${ctx}/plan/sysPlan/delete?id=${sysPlan.id}" onclick="return confirmx('确认要删除该日程吗？', this.href)">删除</a></shiro:hasPermission>
				</td>
				<%-- <shiro:hasPermission name="plan:sysPlan:edit"><td>
    				<a href="${ctx}/plan/sysPlan/form?id=${sysPlan.id}">修改</a>
					<a href="${ctx}/plan/sysPlan/delete?id=${sysPlan.id}" onclick="return confirmx('确认要删除该日程吗？', this.href)">删除</a>
				</td></shiro:hasPermission> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>