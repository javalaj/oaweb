<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>固定资产管理管理</title>
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
		<li class="active"><a href="${ctx}/oa/oaEquipment/">全部</a></li>
		<li><a href="${ctx}/oa/oaEquipment/">在库</a></li>
		<li><a href="${ctx}/oa/oaEquipment/">外借</a></li>
		<li><a href="${ctx}/oa/oaEquipment/">已领用</a></li>
		<li><a href="${ctx}/oa/oaEquipment/">已报废</a></li>
		<li><a href="${ctx}/oa/oaEquipment/">待报废</a></li>
		<shiro:hasPermission name="oa:oaEquipment:edit"><li><a href="${ctx}/oa/oaEquipment/form">资产登记</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="oaEquipment" action="${ctx}/oa/oaEquipment/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="ename" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>资产品牌：</label>
				<form:select path="ebrand" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('equ_brand')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>资产状态：</label>
				<form:select path="state" class="input-medium">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('equ_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th><input type="checkbox">固定资产名称</th>
				<th>资产类别</th>
				<th>品牌</th>
				<th>型号规格</th>
				<th>价格(元)</th>				
				<th>数量</th>
				<th>采购日期</th>
				<th>状态</th>
				<th>人员</th>
				<shiro:hasPermission name="oa:oaEquipment:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaEquipment">
			<tr>
				<td><input type="checkbox"><a href="${ctx}/oa/oaEquipment/form?id=${oaEquipment.id}">
					${oaEquipment.ename}
				</a></td>
				<td>
					${fns:getDictLabel(oaEquipment.type, 'equ_type', '')}
				</td>
				<td>
					${fns:getDictLabel(oaEquipment.ebrand, 'equ_brand', '')}
				</td>

				<td>
						${fns:getDictLabel(oaEquipment.specs, 'equ_specs', '')}
				</td>
				<td>
				${oaEquipment.price}
				</td>
				<td>
					${oaEquipment.count}
				</td>
				<td>
					<fmt:formatDate value="${oaEquipment.indate}" pattern="yyyy-MM-dd "/>
				</td>
				<td>${fns:getDictLabel(oaEquipment.state, 'equ_state', '')}</td>
				<td>
					${fns:getUser().name}
				</td>
				<shiro:hasPermission name="oa:oaEquipment:edit"><td>
    				<%-- <a href="${ctx}/oa/oaEquipment/form?id=${oaEquipment.id}">修改</a> --%>
					<a href="${ctx}/oa/oaEquipment/delete?id=${oaEquipment.id}" onclick="return confirmx('确认要删除该固定资产管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>