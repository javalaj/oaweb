<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日常借支审批信息管理</title>
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
	<style>
	tbody tr:hover th,tbody tr:hover td {
		background: #EEF0F2;
	}
	</style>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>日常借支申请列表</h5>
				<div class="ibox-tools">
				</div>
			</div>
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaLoanDailyApproval" action="${ctx}/oa/loan/oaLoanDailyApproval/conditionList" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<div class="form-group">
								<label>标题：</label>
									<form:input path="title" htmlEscape="false" maxlength="100" class="form-control"/>
							</div>
						</form:form>
						<sys:message content="${message}"/>
						<!-- 工具栏 -->
						<div class="row">
							<div class="col-sm-12">
								<div class="pull-left">
								</div>
								<div class="pull-right">
									<button class="btn btn-primary btn-rounded btn-outline btn-sm "
										onclick="search()">
										<i class="fa fa-search"></i> 查询
									</button>
									<button id="btnReset" class="btn btn-primary btn-rounded btn-outline btn-sm "
										onclick="reset();">
										<i class="fa fa-refresh"></i> 重置
									</button>
								</div>
							</div>
						</div>
						<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
							<thead>
								<tr>
									<th>序号</th>
									<th>标题</th>
									<th>是否用于采购</th>
									<th>借支金额</th>
									<th>申请时间</th>
									<th>流程结束时间</th>
									<th>审批状态</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${page.list}" var="oaLoanDailyApproval" varStatus="status">
								<tr>
									<td>
										${status.count}
									</td>
									<td>
										${oaLoanDailyApproval.title}
									</td>
									<td>
										${fns:getDictLabel(oaLoanDailyApproval.isPurchase, 'yes_no', '')}
									</td>
									<td>
										${oaLoanDailyApproval.loanMoney}
									</td>
									<td>
										<fmt:formatDate value="${oaLoanDailyApproval.approvalTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>
										<fmt:formatDate value="${oaLoanDailyApproval.approvalPassTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>
										${fns:getDictLabel(oaLoanDailyApproval.status, 'oa_loan_daily_approval_status', '')}
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<table:page page="${page}"></table:page>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>