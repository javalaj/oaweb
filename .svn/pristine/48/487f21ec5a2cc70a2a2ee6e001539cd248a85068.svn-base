<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>印章使用申请</title>
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
		<li class="active"><a href="${ctx}/oa/oaSealUse/">印章使用申请</a></li>
		<shiro:hasPermission name="oa:oaSealUse:edit"><li><a href="${ctx}/oa/oaSealUse/form">印章使用添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="oaSealUse" action="${ctx}/oa/oaSealUse/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>编号：</label>
				<form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>流程关联id：</label>
				<form:input path="procInsId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>删除标记(1是,0否)：</label>
				<form:radiobuttons path="delFlag" items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li><label>编号：</label>
				<form:input path="fileId" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>创建人</th>
				<th>编号</th>
				<th>所在部门</th>
				<th>申请日期</th>
				<th>印章类型</th>
				<th>是否携带外出</th>
				<th>摘要(事项)</th>
				<th>总经理签字</th>
				<th>总经理审批意见</th>
				<th>行政人事部签字</th>
				<th>行政人事部意见</th>
				<shiro:hasPermission name="oa:oaSealUse:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaSealUse">
			<tr>
				<td><a href="${ctx}/oa/oaSealUse/form?id=${oaSealUse.id}">
					${oaSealUse.createBy.id}
				</a></td>
				<td>
					${oaSealUse.fileId}
				</td>
				<td>
					${oaSealUse.officeName}
				</td>
				<td>
					<fmt:formatDate value="${oaSealUse.date}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(oaSealUse.sealType, 'sealType', '')}
				</td>
				<td>
					${fns:getDictLabel(oaSealUse.isout, 'isOut', '')}
				</td>
				<td>
					${oaSealUse.matter}
				</td>
				<td>
					${oaSealUse.examname}
				</td>
				<td>
					${oaSealUse.examtext}
				</td>
				<td>
					${oaSealUse.examname2}
				</td>
				<td>
					${oaSealUse.examtext2}
				</td>
				<shiro:hasPermission name="oa:oaSealUse:edit"><td>
    				<a href="${ctx}/oa/oaSealUse/form?id=${oaSealUse.id}">修改</a>
					<a href="${ctx}/oa/oaSealUse/delete?id=${oaSealUse.id}" onclick="return confirmx('确认要删除该生成成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>