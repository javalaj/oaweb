<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购合同管理</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<script type="text/javascript">
	var validateForm;
	function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		
	  if(validateForm.form()){
		  $("#inputForm").submit();
		  return true;
	  }
	  return false;
	}	
	$(document).ready(function() {
		$(".selectpicker").selectpicker({noneSelectedText:'请选择'});
		//$("#name").focus();
		validateForm=$("#inputForm").validate({
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				form.submit();
			},
			errorContainer: "#messageBox",
			errorPlacement: function(error, element) {
				$("#messageBox").text("输入有误，请先更正。");
				if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
					error.appendTo(element.parent().parent());
				} else {
					error.insertAfter(element);
				}
			}
		});
		
		$("#projectId").change(function(){
			reloadOaProject($(this).val());
			$(this).valid();  
		});
		
		reloadOaProject("${oaContractProtocol.project.id}");
	});
	
	function reloadOaProject(projectIdx){
		$.ajax({
			type: "POST",
			url: "${ctx}/oa/project/oaProject/getOaProject",
			data: {projectId: projectIdx},
			dataType: "json",
			success: function(data){
				getDictLabel(data.contractType,'oa_project_contractType',"",$("#span_contractType"),"");
				getDictLabel(data.ownedIndustry,'oa_project_ownedIndustry',"",$("#span_ownedIndustry"),"");
			}
		});
	}
	function getDictLabel(valuex,typex,defaultValuex,element,prefix){
		$.ajax({
			type: "POST",
			url: "${ctx}/sys/dict/getDictLabel",
			data: {value: valuex,type:typex,defaultValue:defaultValuex},
			dataType: 'json',
			success: function(data){
				element.html((prefix!=null?prefix:"")+data.dictLabel);
			}
		});
	}
	</script>
</head>
<oam:body>
 	<oam:header>
		<a class="mui-icon mui-icon-back mui-pull-left" onclick="location.href='${mctx}/oa/contract/oaContractProtocol/'"></a>
		<h1 class="mui-title">协议框架查看</h1>
	</oam:header>
	<oam:message content="${message}"/>
	<oam:content>
		<oam:form id="inputForm" modelAttribute="oaContractProtocol" action="${mctx}/oa/contract/oaContractProtocol/save" method="post">
			<form:hidden path="id"/>
			<oam:listView>
				<oam:listViewCell title="合同编号:" cellType="input" >
					${oaContractProtocol.contractNo}
				</oam:listViewCell>
				<oam:listViewCell title="合同名称:" cellType="input" >
					${oaContractProtocol.contractName}
				</oam:listViewCell>
				<oam:listViewCell title="项目名称（旧）:" cellType="input" >
					${oaContractProtocol.projectOldName}
				</oam:listViewCell>
				<oam:listViewCell title="项目:" cellType="input" >
					${oaContractProtocol.project.projectNo}<br>
					${oaContractProtocol.project.projectName}
				</oam:listViewCell>
				<oam:listViewCell title="服务内容:" cellType="input" >
					<span id="span_contractType"></span>
				</oam:listViewCell>
				<oam:listViewCell title="所属行业:" cellType="input" >
					<span id="span_ownedIndustry"></span>
				</oam:listViewCell>
				<oam:listViewCell title="合作单位:" cellType="input" >
					${oaContractProtocol.cooperationUnits}
				</oam:listViewCell>
				<oam:listViewCell title="合作内容:" cellType="input" >
					${oaContractProtocol.cooperationContents}
				</oam:listViewCell>
				<oam:listViewCell title="合同签订日期:" cellType="input" >
					<fmt:formatDate value="${oaContractProtocol.contractTime}" pattern="yyyy-MM-dd"/>
				</oam:listViewCell>
				<oam:listViewCell title="合同截止日期:" cellType="input" >
					<fmt:formatDate value="${oaContractProtocol.contractEndTime}" pattern="yyyy-MM-dd"/>
				</oam:listViewCell>
				<oam:listViewCell title="联系人:" cellType="input" >
					${oaContractProtocol.contact}
				</oam:listViewCell>
				<oam:listViewCell title="联系电话:" cellType="input" >
					${oaContractProtocol.contactNumber}
				</oam:listViewCell>
				<oam:listViewCell title="合同归档情况 :" cellType="input" >
					${fns:getDictLabel(oaContractProtocol.filingStatus, 'oa_contract_protocol_filingStatus', '')}
				</oam:listViewCell>
				<oam:listViewCell title="合同电子版:" cellType="input" >
					<form:hidden id="contractElectronicVersion" path="contractElectronicVersion" htmlEscape="false" maxlength="1000" class="form-control"/>
					<sys:ckfinder input="contractElectronicVersion" type="files" uploadPath="/oa/contract/oaContractProtocol" selectMultiple="false" readonly="true"/>
				</oam:listViewCell>
				<oam:listViewCell title="合同扫描件:" cellType="input" >
					<form:hidden id="contractScanAttachment" path="contractScanAttachment" htmlEscape="false" maxlength="1000" class="form-control"/>
					<sys:ckfinder input="contractScanAttachment" type="files" uploadPath="/oa/contract/oaContractProtocol" selectMultiple="false" readonly="true"/>
				</oam:listViewCell>
				<oam:listViewCell title="合同状态:" cellType="input" >
					${fns:getDictLabel(oaContractProtocol.contractStatus, 'oa_contract_protocol_status', '')}
				</oam:listViewCell>
				<oam:listViewCell title="备注信息:" cellType="input" >
					${oaContractProtocol.remarks}
				</oam:listViewCell>
			</oam:listView>	
		</oam:form>
	</oam:content>
</oam:body>
<%-- <body>
	<form:form id="inputForm" modelAttribute="oaContractPurchase" action="${ctx}/oa/contract/oaContractPurchase/save" method="post" class="form-horizontal">
	
		<ul class="nav nav-tabs myoa-tabs" id="myTab">
			<li class="active"><a href="#base" data-toggle="tab">采购合同主信息</a></li>
			<c:if test="${not empty oaContractPurchase.id}">
				<li><a href="#report" data-toggle="tab">阶段信息(${oaContractPurchase.oaContractPurchaseStageList.size()})</a></li>
				<li><a href="#product" data-toggle="tab">物品清单(${oaContractPurchase.oaContractPurchaseProductList.size()})</a></li>
			</c:if>
		</ul><br/>
		
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="tab-content">
			<div class="tab-pane active" id="base">
			</div>
			
			<div class="tab-pane" id="report" >
				<c:if test="${oaContractPurchase.oaContractPurchaseStageList.size()<1}">
					<div style='text-align:left'><fieldset><legend>目前没有相关的阶段信息</legend></fieldset></div>
				</c:if>
				<c:if test="${not empty oaContractPurchase.id and oaContractPurchase.oaContractPurchaseStageList.size()>0}">
					<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
						<c:forEach items="${oaContractPurchase.oaContractPurchaseStageList}" var="oaContractPurchaseStage">
							<tr>
								<td class="width-15 active" colspan="3"><div style='text-align:left'><fieldset><legend>合同付款阶段：[${oaContractPurchaseStage.payStageIndex}]${fns:getDictLabel(oaContractPurchaseStage.payStage, 'oa_contract_purchase_stage_pay_stage', '')}</legend></fieldset></div></td>
							</tr>
							<tr>
								<td class="width-15 active" >阶段状态</td>
								<td class="width-35" >
									${fns:getDictLabel(oaContractPurchaseStage.payStageStatus, 'oa_contract_purchase_stage_pay_stage_status', '')}
								</td>
							</tr>
							<tr>
								<td class="width-15 active" >进度对应工作是否完成</td>
								<td class="width-35" >
									${fns:getDictLabel(oaContractPurchaseStage.isWorkProgressCompleted, 'yes_no', '')}
								</td>
							</tr>
							<tr>
								<td class="width-15 active" >进度文档</td>
								<td class="width-35" >
									<input type="hidden" id="workProgressFile${oaContractPurchaseStage.id}"value="${oaContractPurchaseStage.workProgressFile}"/>
									<sys:ckfinder input="workProgressFile${oaContractPurchaseStage.id}" readonly="true" type="files" uploadPath="/oa/contract/oaContractPurchaseStage" selectMultiple="true"/>
								</td>
							</tr>
							
							<c:if test="${oaContractPurchaseStage.payStageStatus ne '0'}">
								<tr>
									<td class="width-15 active" >付款申请流程</td>
									<td class="width-35" >
										<a href="${ctx}/oa/contract/oaContractPurchasePayApproval/form?oaContractPurchaseStage.id=${oaContractPurchaseStage.id}&oaContractPurchaseStageId=${oaContractPurchaseStage.id}"
											class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>查看</a>
									</td>
								</tr>
							</c:if>
							<tr>
								<td class="width-15 active" >付款时间</td>
								<td class="width-35" >
									<fmt:formatDate value="${oaContractPurchaseStage.payTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
							</tr>
							<tr>
								<td class="width-15 active" >付款金额</td>
								<td class="width-35" >
									${oaContractPurchaseStage.payMoney}
								</td>
							</tr>
							<tr>
								<td class="width-15 active" >发票金额</td>
								<td class="width-35" >
									${oaContractPurchaseStage.billingMoney}
								</td>
							</tr>
							<tr>
								<td class="width-15 active" >发票号</td>
								<td class="width-35" >
									${oaContractPurchaseStage.billingNo}
								</td>
							</tr>
							<tr>
								<td class="width-15 active" >票种</td>
								<td class="width-35" >
									${fns:getDictLabel(oaContractPurchaseStage.billingType, 'oa_contract_purchase_stage_billing_type', '')}
								</td>
							</tr>
							<tr>
								<td class="width-15 active" >开票日期</td>
								<td class="width-35" >
									<fmt:formatDate value="${oaContractPurchaseStage.billingTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
							</tr>
							<tr>
								<td class="width-15 active" >开票内容</td>
								<td class="width-35" >
									${oaContractPurchaseStage.billingContent}
								</td>
							</tr>
							<tr>
								<td class="width-15 active" >发票扫描件</td>
								<td class="width-35" >
									<input type="hidden" id="billingFile${oaContractPurchaseStage.id}"value="${oaContractPurchaseStage.billingFile}"/>
									<sys:ckfinder input="billingFile${oaContractPurchaseStage.id}" readonly="true" type="files" uploadPath="/oa/contract/oaContractPurchaseStage" selectMultiple="true"/>
								</td>
							</tr>
							<tr>
								<td class="width-15 active" >备注信息</td>
								<td class="width-35" >
									${oaContractPurchaseStage.remarks}
								</td>
							</tr>
							<c:if test="${oaContractPurchaseStage.payStageStatus eq '0' or oaContractPurchaseStage.payStageStatus eq '2'}">
								<tr>
									<td class="width-15 active" >操作</td>
									<td class="width-35" >
										<c:if test="${oaContractPurchaseStage.payStageStatus eq '0'}">
											<shiro:hasPermission name="oa:contract:oaContractPurchasePayApproval:approval">
													<input id="btnWf" class="btn btn-primary" type="button" value="发起合同付款流程" onclick="funwf('${oaContractPurchaseStage.id}');" />
											</shiro:hasPermission>
										</c:if>
										<c:if test="${oaContractPurchaseStage.payStageStatus eq '2'}">
											<shiro:hasPermission name="oa:contract:oaContractPurchaseStage:saveAdd">
													<input id="btnAdd" class="btn btn-primary" type="button" value="补填阶段信息" onclick="fun('${oaContractPurchase.id}','${oaContractPurchase.contractNo}','${oaContractPurchase.contractName}','${oaContractPurchaseStage.id}');" />
											</shiro:hasPermission>
										</c:if>
									</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>	
			</div>
			
			<div class="tab-pane" id="product" >
				
				<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
					<tr>
						<td class="width-15 active" >合同金额</td>
						<td class="width-35" >${oaContractPurchase.contractMoney}</td>
					</tr>
					<tr>
						<td class="width-15 active">物品清单金额</td>
						<td class="width-35" >${productsTotalMoney}</td>
					</tr>
					<tr>
						<td class="width-15 active"><span style="color:blue">核算结果</span></td>
						<td class="width-35" >
							<c:if test="${oaContractPurchase.contractMoney ne productsTotalMoney}"><span style="color:red">合同金额与清单未持平</span></c:if>
							<c:if test="${oaContractPurchase.contractMoney eq productsTotalMoney}"><span style="color:green">合同金额与清单已持平</span></c:if>
						</td>
					</tr>
					<shiro:hasPermission name="oa:contract:oaContractPurchaseProduct:edit">
						<tr>
							<td colspan="4">
								<div style='text-align:left'>
									<input id="btnAddProduct" class="btn btn-primary" type="button" value="添加物品" onclick="funAddProduct('${oaContractPurchase.id}');"/>
								</div>
							</td>
						</tr>
					</shiro:hasPermission>
				</table>
				<c:if test="${oaContractPurchase.oaContractPurchaseProductList.size()<1}">
					<div style='text-align:left'><fieldset><legend>目前没有相关的物品清单信息</legend></fieldset></div>
				</c:if>
				<c:if test="${not empty oaContractPurchase.id and oaContractPurchase.oaContractPurchaseProductList.size()>0}">
					<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
						<thead>
							<tr>
								<th>序号</th>
								<th>名称</th>
								<th>品牌型号</th>
								<th>单位</th>
								<th>数量</th>
								<th>单价</th>
								<th>总额</th>
								<shiro:hasPermission name="oa:contract:oaContractPurchaseProduct:edit"><th>操作</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${oaContractPurchase.oaContractPurchaseProductList}" var="oaContractPurchaseProduct" varStatus="status">
							<tr>
								<td>
									${status.count}
								</td>
								<td>
									${oaContractPurchaseProduct.name}
								</td>
								<td>
									${oaContractPurchaseProduct.productType}
								</td>
								<td>
									${oaContractPurchaseProduct.unit}
								</td>
								<td>
									${oaContractPurchaseProduct.num}
								</td>
								<td>
									${oaContractPurchaseProduct.price}
								</td>
								<td>
									${oaContractPurchaseProduct.totalPrice}
								</td>
								<td>
									<shiro:hasPermission name="oa:contract:oaContractPurchaseProduct:edit">
					    				<a href="${ctx}/oa/contract/oaContractPurchaseProduct/form?id=${oaContractPurchaseProduct.id}"
											class="btn btn-success btn-xs"><i class="fa fa-edit"></i>详情</a>
										<a href="${ctx}/oa/contract/oaContractPurchaseProduct/delete?id=${oaContractPurchaseProduct.id}" onclick="return confirmx('确认要删除该采购物品清单信息吗？', this.href)"
											class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>	
									</shiro:hasPermission>
								</td>								
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</c:if>	
			</div>
		</div>
	</form:form>
</body> --%>
</html>