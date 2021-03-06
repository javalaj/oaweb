<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>打卡记录管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<ul class="nav nav-tabs myoa-tabs">
				<li class="active"><a href="${ctx}/oa/coding/oaCoding/detail">打卡记录列表</a>
				</li>
			</ul>
			<form:form id="searchForm" modelAttribute="oaCoding"
				action="${ctx}/oa/coding/oaCoding/" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="ul-form">
					<li><label>部门：</label> <sys:treeselect id="office" name="deptid"
							value="${deptid}" labelName="deptname" labelValue="${deptname}"
							title="部门" url="/sys/office/treeData?type=2" cssClass="input-small"
							allowClear="true" notAllowSelectParent="true" /></li>
					<li><label>考勤日期：</label> <input id="timerec" name="timerec"  value="${timerec }"
						type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM',readOnly:true})" />
					</li>
					<li class="btns"><input id="btnSubmit" class="btn btn-primary"
						type="submit" value="查询" /></li>
					<li class="btns">	<input id="btnCancel" class="btn" type="button" value="返 回"
						onclick="history.go(-1)" /></li>
					<li class="clearfix"></li>
				</ul>
			</form:form>
			<sys:message content="${message}" />
			<table id="contentTable"
				class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>职工姓名</th>
						<th>所在部门</th>
						<th>考勤天数</th>
						<th>未达标天数</th>
						<c:forEach items="${days }" var="day">
							<th class="detail">${day }</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list}" var="oaViewCoding" varStatus="index">
						<tr>
							<td><a
								href="${ctx}/oa/coding/oaCoding/detail?id=${oaContract.id}">${oaViewCoding.userName}</a>
							</td>
							<td>${oaViewCoding.deptName}</td>
							<td>${oaViewCoding.workingDays}</td>
							<td>${oaViewCoding.workingLessDays}</td>
							<c:forEach items="${page.list[index.index].daysWorking}" var="dw">
								<td class="detail">${dw}</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagination">${page}</div>

		</div>
	</div>
	
</body>
</html>