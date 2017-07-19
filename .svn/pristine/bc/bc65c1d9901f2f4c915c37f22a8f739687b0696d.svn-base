<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>易耗品管理</title>
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
		<li class="active"></li>
	</ul>
	<form:form id="searchForm" modelAttribute="perishableProducts" 
	action="${ctx}/perishableproducts/perishableProducts/statistics" method="post" class="breadcrumb form-search">
		<ul class="ul-form">
			<li><label>用品类别：</label>
				<form:select path="itemCategory" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('item_category')}" itemLabel="label" 
					itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>入库时间：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${perishableProducts.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${perishableProducts.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
			&nbsp;&nbsp;<input id="btnNext" class="btn btn-primary" type="button" value="返回"
			onclick="window.location='${ctx}/perishableproducts/perishableProducts/'"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>统计周期</th>
				<th>用品编号</th>
				<th>用品名称</th>
				<th>用品类别</th>
				<th>库存数量</th>
				<th>单价(元)</th>
				<th>单位</th>
				<th>合计金额</th>
			</tr>
		</thead>
		<tbody> <c:set var="sum" value="0"/>
		<c:forEach items="${list}" var="perishableProducts">
			<tr>
				<td>
					<fmt:formatDate value="${perishableProducts.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td><a href="${ctx}/perishableproducts/perishableProducts/form?id=${perishableProducts.id}">
					${perishableProducts.serialNumber}
				</a></td>
				<td>
					${perishableProducts.itemName}
				</td>
				<td>
					${fns:getDictLabel(perishableProducts.itemCategory, 'item_category', '')}
				</td>
				<td>
					${perishableProducts.amount}
				</td>
				<td>
					${perishableProducts.unitPrice}
				</td>
				<td>
					${fns:getDictLabel(perishableProducts.unit, 'unit', '')}
				</td>
				<td>
					${perishableProducts.amount * perishableProducts.unitPrice}
				</td>
			</tr><c:set var="sum" value="${sum + perishableProducts.amount * perishableProducts.unitPrice}"/>
		</c:forEach>
		</tbody>
	</table>
	<span style="float: right;">总金额${sum}元</span>
</body>
</html>