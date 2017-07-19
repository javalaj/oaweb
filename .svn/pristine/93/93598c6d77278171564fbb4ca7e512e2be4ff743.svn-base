<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>电脑补贴申请管理</title>
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
		<li class="active"><a href="${ctx}/oa/computersubsidy/computerSubsidy/">电脑补贴申请列表</a></li>
		<shiro:hasPermission name="oa:computersubsidy:computerSubsidy:edit"><li><a href="${ctx}/oa/computersubsidy/computerSubsidy/form">电脑补贴申请添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="computerSubsidy" action="${ctx}/oa/computersubsidy/computerSubsidy/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="proposer" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>申请补贴日期：</label>
				<input name="applyTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${computerSubsidy.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="oa:computersubsidy:computerSubsidy:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="computerSubsidy">
			<tr>
				<td><a href="${ctx}/oa/computersubsidy/computerSubsidy/form?id=${computerSubsidy.id}">
					<fmt:formatDate value="${computerSubsidy.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${computerSubsidy.remarks}
				</td>
				<shiro:hasPermission name="oa:computersubsidy:computerSubsidy:edit"><td>
    				<a href="${ctx}/oa/computersubsidy/computerSubsidy/form?id=${computerSubsidy.id}">修改</a>
					<a href="${ctx}/oa/computersubsidy/computerSubsidy/delete?id=${computerSubsidy.id}" onclick="return confirmx('确认要删除该电脑补贴申请吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>