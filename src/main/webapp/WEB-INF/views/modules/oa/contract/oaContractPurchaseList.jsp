<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购合同管理</title>
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
			var url = '${ctx}/oa/contract/oaContractPurchaseStage/form?contractPurchase.id='+id+"&contractPurchase.contractNo="+encodeURIComponent(contractNo)+"&contractPurchase.contractName="+encodeURIComponent(contractName);
			openDialog('添加阶段信息', url,'800px', '600px');
		}
		
		function resetForm(){
			resetSelection("contractStatus","oa_contract_purchase_status");
			resetOaProjectListSelection("projectId","");
			resetSupmanagementListSelection("supplierId","");
			resetSelection("isOverdue","oa_contract_purchase_is_overdue");
        }
		
		function resetOaProjectListSelection(id,typex){
			$("#"+id).val("");
			$("#s2id_"+id).children("a").children("span.select2-chosen").html("全部");
			$("#"+id).empty();
			$("#"+id).append("<option value=\"\" selected=\"selected\">全部</option>");
			$.ajax({
				type: "POST",
				url: "${ctx}/oa/contract/oaContractPurchase/oaProjectList",
				data: {type:typex},
				dataType: 'json',
				success: function(data){
					for(var i=0;i<data.length;i++)  
					{  
						$("#"+id).append("<option value=\""+data[i].id+"\">"+"["+data[i].projectNo+"]"+data[i].projectName+"</option>");
					}
				}
			});
		}
		function resetSupmanagementListSelection(id,typex){
			$("#"+id).val("");
			$("#s2id_"+id).children("a").children("span.select2-chosen").html("全部");
			$("#"+id).empty();
			$("#"+id).append("<option value=\"\" selected=\"selected\">全部</option>");
			$.ajax({
				type: "POST",
				url: "${ctx}/oa/contract/oaContractPurchase/supmanagementList",
				data: {type:typex},
				dataType: 'json',
				success: function(data){
					for(var i=0;i<data.length;i++)  
					{  
						$("#"+id).append("<option value=\""+data[i].id+"\">"+"["+data[i].orgCode+"]"+data[i].supName+"</option>");
					}
				}
			});
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
				<h5>采购合同列表</h5>
				<div class="ibox-tools">
				</div>
			</div>
    		<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaContractPurchase" action="${ctx}/oa/contract/oaContractPurchase/" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<oa:searchGroup id="searchGroup">
								<label class="oa-search-group-alwaysVisible">合同编号：
									<form:input path="contractNo" htmlEscape="false" maxlength="64" class="form-control"/>
								</label>
								<label>合同名称：
									<form:input path="contractName" htmlEscape="false" maxlength="64" class="form-control"/>
								</label>
								<label>合同状态：
									<form:select path="contractStatus" class="selectpicker " data-style="btn-inverse" data-live-search="true" id="contractStatus">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('oa_contract_purchase_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>
								<label>关联的项目：
									<form:select path="project.id" class="selectpicker " data-style="btn-inverse" data-live-search="true" name="project.id" id="projectId">
										<form:option value="" label="全部"/>
										<c:forEach items="${oaProjectList}" var="oaProject">
											<form:option value="${oaProject.id}">[${oaProject.projectNo}]${oaProject.projectName}</form:option>
										</c:forEach>
									</form:select>
								</label>
								<label>签订日期：
									<input name="beginContractTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
										value="<fmt:formatDate value="${oaContractPurchase.beginContractTime}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
									<input name="endContractTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
										value="<fmt:formatDate value="${oaContractPurchase.endContractTime}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
								</label>
								<label>供应商：
									<form:select path="supplier.id" class="selectpicker " data-style="btn-inverse" data-live-search="true" name="supplier.id" id="supplierId">
										<form:option value="" label="全部"/>
										<c:forEach items="${supmanagementList}" var="supmanagement">
											<form:option value="${supmanagement.id}">[${supmanagement.orgCode}]${supmanagement.supName}</form:option>
										</c:forEach>
									</form:select>
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
							<shiro:hasPermission name="oa:contract:oaContractPurchase:edit"> 
								<table:addRow url="${ctx}/oa/contract/oaContractPurchase/form" title="采购合同"></table:addRow>
								<oa:fileImportForm  actionUrl="${ctx}/oa/contract/oaContractPurchase/import" 
													buttonText=" EXCEL导入" 
													templateUrl="${ctxStatic}/template/oa/contract/ContractPurchaseTemplate.xls" 
													title="采购合同EXCEL导入" 
													id="oaContractPurchase"
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
							<th>关联的项目</th>
							<th>合同金额</th>
							<th>合同签订日期</th>
							<th>供应商</th>
							<th>验货状态</th>
							<th>已付金额</th>
							<th>未付金额</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="oaContractPurchase" varStatus="status">
						<tr>
							<td>
								${status.count}
							</td>
							<td><a href="${ctx}/oa/contract/oaContractPurchase/form?id=${oaContractPurchase.id}">
								${oaContractPurchase.contractNo}
							</a></td>
							<td title="${oaContractPurchase.contractName}">
								${fns:abbr2(oaContractPurchase.contractName,32)}
							</td>
							<td>
								${fns:getDictLabel(oaContractPurchase.contractStatus, 'oa_contract_purchase_status', '')}
							</td>
							<td>
								<a href="${ctx}/oa/project/oaProject/form?id=${oaContractPurchase.project.id}">${oaContractPurchase.project.projectName}</a>
							</td>
							<td>
								${oaContractPurchase.contractMoney}
							</td>
							<td>
								<fmt:formatDate value="${oaContractPurchase.contractTime}" pattern="yyyy-MM-dd"/>
							</td>
							<td title="${oaContractPurchase.supplier.supName}">
								${fns:abbr2(oaContractPurchase.supplier.supName,32)}
							</td>
							<td>
								${fns:getDictLabel(oaContractPurchase.isInspected, 'oa_contract_purchase_is_inspected', '')}
							</td>
							<td>
								${oaContractPurchase.sumPayMoney}
							</td>
							<td>
								${oaContractPurchase.contractMoney-oaContractPurchase.sumPayMoney}
							</td>
							<td>
								<shiro:hasPermission name="oa:contract:oaContractPurchase:view">
									<a href="javascript:void(0);" onclick="openDialogView('查看采购合同', '${ctx}/oa/contract/oaContractPurchase/form?id=${oaContractPurchase.id}','800px', '600px')"
										class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i> 查看</a>
								</shiro:hasPermission>
								<shiro:hasPermission name="oa:contract:oaContractPurchase:edit">
				    				<a href="javascript:void(0);" onclick="openDialog('修改采购合同', '${ctx}/oa/contract/oaContractPurchase/form?id=${oaContractPurchase.id}','800px', '600px')"
										class="btn btn-success btn-xs"><i class="fa fa-edit"></i> 修改</a>
									<a href="${ctx}/oa/contract/oaContractPurchase/delete?id=${oaContractPurchase.id}" onclick="return confirmx('确认要删除该采购合同吗？', this.href)"
										class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>	
			    					<shiro:hasPermission name="oa:contract:oaContractPurchaseStage:edit">
			    						<c:if test="${oaContractPurchase.isAddStageAbled eq '1'}">
			    							<a href="javascript:void(0);" class="btn btn-default btn-xs" onclick="fun('${oaContractPurchase.id}','${oaContractPurchase.contractNo}','${oaContractPurchase.contractName}');" ><i class="fa fa-plus"></i> 添加阶段</a>
			    						</c:if>
			    					</shiro:hasPermission>
								</shiro:hasPermission>
								<c:if test="${oaContractPurchase.isInspected ne '1' and oaContractPurchase.isInspected ne '2'}">
									<shiro:hasPermission name="oa:contract:oaContractPurchase:inspection">
										<a href="#" onclick="openDialog('采购合同验货', '${ctx}/oa/contract/oaContractPurchase/formInspection?id=${oaContractPurchase.id}','600px', '260px')"
											class="btn btn-default btn-xs"><i class="fa fa-edit"></i> 验货</a>
									</shiro:hasPermission>
								</c:if>
								<c:if test="${oaContractPurchase.isInspected eq '1'}">
									<shiro:hasPermission name="oa:contract:oaContractPurchase:checkInspection">
										<a href="${ctx}/oa/contract/oaContractPurchase/checkInspection?id=${oaContractPurchase.id}" onclick="return confirmx('确认已验货吗？', this.href)"
											class="btn btn-default btn-xs"><i class="fa fa-edit"></i> 确认验货</a>	
									</shiro:hasPermission>
								</c:if>	
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