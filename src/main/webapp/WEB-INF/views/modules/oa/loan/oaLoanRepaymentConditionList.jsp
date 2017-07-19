<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>借支还款信息管理</title>
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
		function resetForm(){
			resetSelection("repaymentType","OaLoanRepayment_repaymentType");
        }
		function resetSelection(id,typex){
			$("#"+id).val("");
			$("#s2id_"+id).children("a").children("span.select2-chosen").html("全部");
			$("#"+id).empty();
			$("#"+id).append("<option value=\"\" selected=\"selected\">全部</option>");
			$.ajax({
				type: "POST",
				url: "${ctx}/sys/dict/getDictList",
				data: {type:typex},
				dataType: 'json',
				success: function(data){
					for(var i=0;i<data.length;i++)  
					{  
						$("#"+id).append("<option value=\""+data[i].value+"\">"+data[i].label+"</option>");
					}
				}
			});
		}
	</script>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>借支还款信息列表</h5>
				<div class="ibox-tools">
				</div>
			</div>
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaLoanRepayment" action="${ctx}/oa/loan/oaLoanRepayment/conditionList" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<div class="form-group">
								<label>销账类型：</label>
									<form:select path="repaymentType"  class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('OaLoanRepayment_repaymentType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								<label>借支人：</label>
									<sys:treeselect id="loanUser" name="loanUser.id" value="${oaLoanRepayment.loanUser.id}" labelName="loanUser.name" labelValue="${oaLoanRepayment.loanUser.name}"
										title="用户" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
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
									<th>登记日期</th>
									<th>还款金额</th>
									<th>销账类型</th>
									<th>借支单号</th>
									<th>借支人</th>
									<th>报销单号</th>
									<th>借支日期</th>
									<th>借支金额</th>
									<th>经办人</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${page.list}" var="oaLoanRepayment" varStatus="status">
								<tr>
									<td>
										${status.count}
									</td>
									<td>
										<fmt:formatDate value="${oaLoanRepayment.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>
										${oaLoanRepayment.repaymentMoney}
									</td>
									<td>
										${fns:getDictLabel(oaLoanRepayment.repaymentType, 'OaLoanRepayment_repaymentType', '')}
									</td>
									<td>
										<a href="#" onclick="openDialogView('查看借支单信息', '${ctx}/oa/loan/oaLoanMain/form?id=${oaLoanRepayment.loanMain.id}','800px', '600px')">
											${oaLoanRepayment.loanMain.loanNo}
										</a>
									</td>
									<td>
										${oaLoanRepayment.loanUser.name}
									</td>
									<td>
										${oaLoanRepayment.billingNo}
									</td>
									<td>
										<fmt:formatDate value="${oaLoanRepayment.loanMain.loanTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>
										${oaLoanRepayment.loanMain.loanMoney}
									</td>
									<td>
										${oaLoanRepayment.dealUser.name}
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