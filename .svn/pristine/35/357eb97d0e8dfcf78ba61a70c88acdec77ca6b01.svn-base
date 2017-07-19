<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="default" />
<title>Insert title here</title>
</head>
<script type="text/javascript">
 function print(){
	window.print();
}
</script>
<style>
@media print {
	.noprint {
		display: none
	}
}
</style>
<body class="myoa-print-page" >
<div class="wrapper wrapper-content">
	<div class="noprint myoa-print-noprint">
		<input id="btnImport1" class="btn btn-myoa noprint noprint myoa-print-noprint" type="button" onclick="print();" value="打印" />
	</div>
	<table  id="contentTable"
				class="table table-striped table-bordered table-condensed" style="margin-top:10px;">
				<thead id="threadHead">
					<tr class="blackBorder">
						<th>姓名</th>
						<th>公司</th>
						<th>岗位</th>
						<th>手机号</th>
						<th>办公电话</th>
						<th>QQ号</th>
						<th>电子邮箱</th>
						<th>联系地址</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page}" var="cytspoaaddress">
						<tr class="blackBorder">
							<td>${cytspoaaddress.name}</td>
							<td>${cytspoaaddress.company}</td>
							<td>${cytspoaaddress.position}</td>
							<td>${cytspoaaddress.iphone}</td>
							<td>${cytspoaaddress.oph}</td>
							<td>${cytspoaaddress.qq}</td>
							<td>${cytspoaaddress.email}</td>
							<td>${cytspoaaddress.ofaddress}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
</div>
</body>
</html>