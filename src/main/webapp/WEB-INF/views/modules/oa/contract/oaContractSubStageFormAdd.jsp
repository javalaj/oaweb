<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分包合同阶段信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍候...');
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
		});
		function pickerFunctin(id) {
			$("#"+id).valid();  
		}
	</script>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>
					补填分包合同阶段信息
				</h5>
				<div class="ibox-tools">
				</div>
			</div>
    		<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="inputForm" modelAttribute="oaContractPurchaseStage" action="${ctx}/oa/contract/oaContractSubStage/saveAdd" method="post" class="form-horizontal">
							<form:hidden path="id"/>
							<form:hidden path="contractPurchase.id"/>
							<sys:message content="${message}"/>
							<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
								<tr>
									<td class="width-15 active" colspan="2"><div style='text-align:left'><fieldset><legend>合同基本信息</legend></fieldset></div></td>
								</tr>
								<tr>
									<td class="width-15 active" >合同编号</td>
									<td class="width-35" >
										<form:input path="contractPurchase.contractNo" htmlEscape="false" class="form-control " readonly="true"/>
									</td>
								</tr>
								<tr>
									<td class="width-15 active" >合同名称</td>
									<td class="width-35" >
										<form:input path="contractPurchase.contractName" htmlEscape="false" class="form-control " readonly="true"/>
									</td>
								</tr>
								<tr>
									<td class="width-15 active" colspan="2"><div style='text-align:left'><fieldset><legend>合同阶段信息</legend></fieldset></div></td>
								</tr>
								<tr>
									<td class="width-15 active" >合同付款阶段</td>
									<td class="width-35" >
										[${oaContractPurchaseStage.payStageIndex}]${fns:getDictLabel(oaContractPurchaseStage.payStage, 'oa_contract_purchase_stage_pay_stage', '')}
									</td>
								</tr>
								<tr>
									<td class="width-15 active" >付款时间</td>
									<td class="width-35" >
										<input id="payTime" name="payTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
											value="<fmt:formatDate value="${oaContractPurchaseStage.payTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
											onclick="WdatePicker({onpicked:pickerFunctin('payTime'),dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
										<span class="help-inline"><font color="red">*</font></span>
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
										<form:input path="billingMoney" htmlEscape="false" min="0" max="9999999" class="form-control  number required"/>
										<span class="help-inline"><font color="red">*</font></span>
									</td>
								</tr>
								<tr>
									<td class="width-15 active" >发票号</td>
									<td class="width-35" >
										<form:input path="billingNo" htmlEscape="false" maxlength="64" class="form-control required"/>
										<span class="help-inline"><font color="red">*</font></span>
									</td>
								</tr>
								<tr>
									<td class="width-15 active" >票种</td>
									<td class="width-35" >
										<form:select path="billingType" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
											<form:option value="" label=""/>
											<form:options items="${fns:getDictList('oa_contract_purchase_stage_billing_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
										</form:select>
										<span class="help-inline"><font color="red">*</font></span>
									</td>
								</tr>
					
								<tr>
									<td class="width-15 active" >开票日期</td>
									<td class="width-35" >
										<input id="billingTime" name="billingTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
											value="<fmt:formatDate value="${oaContractPurchaseStage.billingTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
											onclick="WdatePicker({onpicked:pickerFunctin('billingTime'),dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
										<span class="help-inline"><font color="red">*</font></span>
									</td>
								</tr>
								<tr>
									<td class="width-15 active" >开票内容</td>
									<td class="width-35" >
										<form:input path="billingContent" htmlEscape="false" maxlength="200" class="form-control "/>
									</td>
								</tr>
								<tr>
									<td class="width-15 active" >发票扫描件</td>
									<td class="width-35" >
										<form:hidden id="billingFile" path="billingFile" htmlEscape="false" maxlength="1000" class="form-control"/>
										<sys:ckfinder input="billingFile" type="files" uploadPath="/oa/contract/oaContractSubStage" selectMultiple="true"/>
									</td>
								</tr>
								<tr>
									<td class="width-15" ></td>
									<td class="width-35" colspan="2">
							         	<div style='text-align:center'>
								         	<shiro:hasPermission name="oa:contract:oaContractSubStage:saveAdd"><input id="btnSubmit" class="btn btn-info btn-sm" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
											<a href="${ctx}/oa/contract/oaContractSub/form?id=${oaContractPurchaseStage.contractPurchase.id}&tabIndex=1"
												class="btn btn-white btn-sm"><i class="fa fa-back"></i>返回</a>
										</div>
									</td>
								</tr>
							</table>		
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>