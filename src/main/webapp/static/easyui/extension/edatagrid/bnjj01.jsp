<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/base/base.jsp"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
<script type="text/javascript" src="jquery.edatagrid.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#tt').edatagrid({
				pagination : true,
			pageSize : 2,
			});
		});
	</script>
<body>
	<h1>Editable DataGrid</h1>
	<div style="margin-bottom:10px">
		<a href="#" onclick="javascript:$('#tt').edatagrid('addRow')">AddRow</a>
		<a href="#" onclick="javascript:$('#tt').edatagrid('saveRow')">SaveRow</a>
		<a href="#" onclick="javascript:$('#tt').edatagrid('cancelRow')">CancelRow</a>
		<a href="#" onclick="javascript:$('#tt').edatagrid('destroyRow')">destroyRow</a>
	</div>
	<table id="tt" style="width:600px;height:200px"
			title="Editable DataGrid"
			url="${path}/du/getAllUserst"
			singleSelect="true">
		<thead>
			<tr>
				<th field="itemid" width="100" editor="{type:'validatebox',options:{required:true}}">Item ID</th>
				<th field="productid" width="100" editor="text">Product ID</th>
				<th field="listprice" width="100" align="right" editor="{type:'numberbox',options:{precision:1}}">List Price</th>
				<th field="unitcost" width="100" align="right" editor="numberbox">Unit Cost</th>
				<th field="attr1" width="150" editor="text">Attribute</th>
			</tr>
		</thead>
	</table>
</body>
</html>
