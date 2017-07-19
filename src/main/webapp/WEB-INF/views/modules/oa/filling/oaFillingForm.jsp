<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>人事部归档管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaFilling"
		action="${ctx}/oa/filling/oaFilling/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<table
			class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
			<tbody>
				<tr>
					<td><label class="pull-right">归档时间：</label></td>
					<td><input name="fillingDate" type="text" readonly="readonly"
						maxlength="20" class="form-control"
						value="<fmt:formatDate value="${oaFilling.fillingDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					</td>
				</tr>
				<tr>					
					<td><label class="pull-right">归档人：</label></td>
					<td><form:input path="createBy.name" htmlEscape="false"
							maxlength="255" class="form-control" readonly="true" /></td>
				</tr>
				<tr>
					<td><label class="pull-right">发起日期：</label></td>
					<td><input name="applyDate" type="text" readonly="readonly"
						maxlength="20" class="form-control"
						value="<fmt:formatDate value="${oaFilling.applyDate}" pattern="yyyy-MM-dd "/>" />
					</td>					
				</tr>
				<tr>
					<td><label class="pull-right">发起人：</label></td>
					<td><form:input path="applyUser.name" htmlEscape="false"
							maxlength="255" class="form-control" readonly="true" /></td>
				</tr>
				<tr>
					<td><label class="pull-right">申请种类：</label></td>
					<td><form:input path="applyType" htmlEscape="false"
							maxlength="255" class="form-control" readonly="true" /></td>
					
				</tr>
				<tr>
					
					<td><label class="pull-right">申请小类：</label></td>
					<td><form:input path="applyTypeLit" htmlEscape="false"
							maxlength="255" class="form-control" readonly="true" /></td>
				</tr>
				<tr>
					<td><label class="pull-right">开始时间：</label></td>
					<td><input name="beginDate" type="text" readonly="readonly"
						maxlength="20" class="form-control"
						value="<fmt:formatDate value="${oaFilling.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					</td>
					
				</tr>
				<tr>					
					<td><label class="pull-right">结束时间：</label></td>
					<td><input name="endDate" type="text" readonly="readonly"
						maxlength="20" class="form-control"
						value="<fmt:formatDate value="${oaFilling.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					</td>
				</tr>
				<tr>
					<td><label class="pull-right">时长：</label></td>
					<td><form:input path="hours" htmlEscape="false" maxlength="11"
							class="form-control" readonly="true" /></td>					
				</tr>
				<tr>
					<td><label class="pull-right">申请理由：</label></td>
					<td><form:input path="applyReason" htmlEscape="false"
							maxlength="255" class="form-control" readonly="true" /></td>
				</tr>
				<tr>
					<td><label class="pull-right">备注：</label></td>
					<td><form:textarea path="remarks" htmlEscape="false" rows="4"
							maxlength="255" class="form-control" readonly="true" /></td>					
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>