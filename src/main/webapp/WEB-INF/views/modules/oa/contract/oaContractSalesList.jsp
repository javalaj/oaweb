<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售合同管理</title>
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
		function fun(id,contractNo,contractName){
			var url = '${ctx}/oa/contract/oaContractSalesStage/form?contractSales.id='+id+"&contractSales.contractNo="+encodeURIComponent(contractNo)+"&contractSales.contractName="+encodeURIComponent(contractName);
			openDialog('添加阶段信息', url,'800px', '600px');
		}
		function resetForm(){
			resetSelection("contractStatus","oa_contract_sales_status");
			resetSelection("isOverdue","oa_contract_purchase_is_overdue");
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
				<h5>销售合同列表</h5>
			</div>
    		<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaContractSales" action="${ctx}/oa/contract/oaContractSales/" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<oa:searchGroup id="searchGroup">
								<label class="oa-search-group-alwaysVisible">合同编号：
									<form:input path="contractNo" htmlEscape="false" maxlength="64" class="form-control"/>
								</label>
								<label>合同名称：
									<form:input path="contractName" htmlEscape="false" maxlength="64" style="width: 300px;" class="form-control"/>
								</label>
								<label>合同状态：
									<form:select path="contractStatus" class="selectpicker " data-style="btn-inverse" data-live-search="true" id="contractStatus">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('oa_contract_sales_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>
								<label>签订日期：
									<input name="beginContractTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
										value="<fmt:formatDate value="${oaContractSales.beginContractTime}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
									<input name="endContractTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
										value="<fmt:formatDate value="${oaContractSales.endContractTime}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
								</label>
								<label>合同甲方：
									<form:input path="contractPartya" htmlEscape="false" maxlength="64" class="form-control"/>
								</label>
								<label>是否已过期：
									<form:select path="isOverdue" class="selectpicker " data-style="btn-inverse" data-live-search="true" id="isOverdue">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('oa_contract_purchase_is_overdue')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>
							</oa:searchGroup>
						</form:form>
						<sys:message content="${message}"/>
						<br/>
					</div>
				</div>
				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">	
							<shiro:hasPermission name="oa:contract:oaContractProtocol:edit"> 
								<table:addRow url="${ctx}/oa/contract/oaContractSales/form" title="销售合同"></table:addRow>
								<oa:fileImportForm  actionUrl="${ctx}/oa/contract/oaContractSales/import" 
													buttonText=" EXCEL导入" 
													templateUrl="${ctxStatic}/template/oa/contract/ContractSalesTemplate.xls" 
													title="销售合同EXCEL导入" 
													id="oaContractSales"
													filePathName="file"></oa:fileImportForm>		
							</shiro:hasPermission> 
						</div>
						<div class="pull-right">
							<button class="btn btn-primary btn-rounded btn-outline btn-sm "
								onclick="search()">
								<i class="fa fa-search"></i> 查询
							</button>
							<button id="btnReset" class="btn btn-primary btn-rounded btn-outline btn-sm "
								onclick="reset()">
								<i class="fa fa-refresh"></i> 重置
							</button>
						</div>
					</div>
				</div>	
				<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th>序号</th>
							<th>合同编号</th>
							<th>合同名称</th>
							<th>合同状态</th>
							<th>合同金额</th>
							<th>签订日期</th>
							<th>合同甲方</th>
							<shiro:hasPermission name="oa:contract:oaContractSales:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="oaContractSales" varStatus="status">
						<tr>
							<td>
								${status.count}
							</td>
							<td>
								${oaContractSales.contractNo}
							</td>
							<td title="${oaContractSales.contractName}">
								${fns:abbr2(oaContractSales.contractName,32)}
							</td>
							<td>
								${fns:getDictLabel(oaContractSales.contractStatus, 'oa_contract_sales_status', '')}
							</td>
							<td>
								${oaContractSales.contractMoney}
							</td>
							<td>
								<fmt:formatDate value="${oaContractSales.contractTime}" pattern="yyyy-MM-dd"/>
							</td>
							<td title="${oaContractSales.contractPartya}">
								${fns:abbr2(oaContractSales.contractPartya,32)}
							</td>
							<td>
								<shiro:hasPermission name="oa:contract:oaContractSales:view">
									<a href="#" onclick="openDialogView('查看销售合同', '${ctx}/oa/contract/oaContractSales/form?id=${oaContractSales.id}&pageType=view','800px', '600px')"
										class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i> 查看</a>
								</shiro:hasPermission>
								<shiro:hasPermission name="oa:contract:oaContractSales:edit">
				    				<a href="#" onclick="openDialog('修改销售合同', '${ctx}/oa/contract/oaContractSales/form?id=${oaContractSales.id}','800px', '600px')"
										class="btn btn-success btn-xs"><i class="fa fa-edit"></i> 修改</a>
									<a href="${ctx}/oa/contract/oaContractSales/delete?id=${oaContractSales.id}" onclick="return confirmx('确认要删除该销售合同吗？', this.href)"
										class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>	
			    					<shiro:hasPermission name="oa:contract:oaContractSalesStage:edit">
			    						<a href="javascript:void(0);" class="btn btn-default btn-xs" onclick="fun('${oaContractSales.id}','${oaContractSales.contractNo}','${oaContractSales.contractName}');" ><i class="fa fa-plus"></i> 添加阶段</a>
			    					</shiro:hasPermission>
								</shiro:hasPermission>	
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<table:page page="${page}"></table:page>
				<br/>
				<br/>
			</div>
		</div>
	</div>
</body>
</html>