<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>借支单信息管理</title>
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
			resetSelection("loanType","OaLoanMain_loanType");
			resetSelection("loanStatus","OaLoanMain_loanStatus");
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
				<h5>借支单信息列表</h5>
				<div class="ibox-tools">
				</div>
			</div>
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaLoanMain" action="${ctx}/oa/loan/oaLoanMain/" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<div class="form-group">
								<label>借支单类型：
									<form:select path="loanType"  class="selectpicker" data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('OaLoanMain_loanType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>
								<label>借支单状态：
									<form:select path="loanStatus" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('OaLoanMain_loanStatus')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>
								<label>借支人：
									<sys:treeselect id="loanUser" name="loanUser.id" value="${oaLoanMain.loanUser.id}" labelName="loanUser.name" labelValue="${oaLoanMain.loanUser.name}"
										title="用户" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
								</label>
								<label>借支单号：
									<form:input path="loanNo" htmlEscape="false" maxlength="64" class="form-control input-sm"/>
								</label>
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
									<th>借支单类型</th>
									<th>借支单状态</th>
									<th>借支人</th>
									<th>借支单号</th>
									<th>申请日期</th>
									<th>借支金额</th>
									<th>借支日期</th>
									<th>销账日期</th>
									<th>更新时间</th>
									<shiro:hasPermission name="oa:loan:oaLoanMain:edit"><th>操作</th></shiro:hasPermission>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${page.list}" var="oaLoanMain" varStatus="status">
								<tr>
									<td>
										${status.count}
									</td>
									<td>
										${fns:getDictLabel(oaLoanMain.loanType, 'OaLoanMain_loanType', '')}
									</td>
									<td>
										${fns:getDictLabel(oaLoanMain.loanStatus, 'OaLoanMain_loanStatus', '')}
									</td>
									<td>
										${oaLoanMain.loanUser.name}
									</td>
									<td>
										${oaLoanMain.loanNo}
									</td>
									<td>
										<fmt:formatDate value="${oaLoanMain.approvalTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>
										${oaLoanMain.loanMoney}
									</td>
									<td>
										<fmt:formatDate value="${oaLoanMain.loanTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>
										<fmt:formatDate value="${oaLoanMain.writeOffTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>
										<fmt:formatDate value="${oaLoanMain.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>
										<shiro:hasPermission name="oa:loan:oaLoanMain:view">
											<a href="#" onclick="openDialogView('查看借支单信息', '${ctx}/oa/loan/oaLoanMain/form?id=${oaLoanMain.id}','800px', '600px')"
												class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i> 查看</a>
										</shiro:hasPermission>
										<shiro:hasPermission name="oa:loan:oaLoanRepayment:edit">
											<c:if test="${oaLoanMain.loanStatus ne '1'}">
												<a href="#" onclick="openDialog('销账', '${ctx}/oa/loan/oaLoanRepayment/form?loanMain.id=${oaLoanMain.id}','800px', '500px')"
													class="btn btn-default btn-xs"><i class="fa-edit"></i> 销账</a>
						    				</c:if>
					    				</shiro:hasPermission>
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