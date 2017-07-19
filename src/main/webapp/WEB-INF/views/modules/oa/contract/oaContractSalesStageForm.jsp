<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售合同阶段信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){
			
		  if(validateForm.form()){
			$("#inputForm").submit();
			 return true;
		  }
		  return false;
		}
		$(document).ready(function() {
			//$("#name").focus();
			validateForm=$("#inputForm").validate({
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
			
			$("#payStage").change(function(){  
				$(this).valid();  
			});
		});
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaContractSalesStage" action="${ctx}/oa/contract/oaContractSalesStage/save" method="post" class="form-horizontal">
	
		<form:hidden path="id"/>
		<form:hidden path="contractSales.id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
			<tr>
				<td class="active" colspan="2"><div style='text-align:left'><fieldset><legend>合同基本信息</legend></fieldset></div></td>
			</tr>
			<tr>
				<td>合同编号</td>
				<td>
					<form:input path="contractSales.contractNo" htmlEscape="false" class="form-control " readonly="true"/>
				</td>
			</tr>
			<tr>
				<td>合同名称</td>
				<td>
					<form:input path="contractSales.contractName" htmlEscape="false" class="form-control " readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="active" colspan="2"><div style='text-align:left'><fieldset><legend>合同阶段信息</legend></fieldset></div></td>
			</tr>
			<tr>
				<td>合同付款阶段 <span class="help-inline"><font color="red">*</font> </span></td>
				<td>
					<form:select path="payStage" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
						<form:options items="${fns:getDictList('oa_contract_sales_stage_pay_stage')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
					
				</td>
			</tr>
			<tr>
				<td>验收完成时间</td>
				<td>
					<input name="checkCompleteTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm  "
						value="<fmt:formatDate value="${oaContractSalesStage.checkCompleteTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</td>
			</tr>
			<tr>
				<td>验收资料</td>
				<td>
					<form:hidden id="checkFile" path="checkFile" htmlEscape="false" maxlength="1000" class="form-control"/>
					<sys:ckfinder input="checkFile" type="files" uploadPath="/oa/contract/oaContractSalesStage" selectMultiple="true"/>
				</td>
			</tr>
			<tr>
				<td>是否已开票 <span class="help-inline"><font color="red">*</font> </span></td>
				<td>
					<form:select path="isBilling" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
					
				</td>
			</tr>
			<tr>
				<td>开票金额 <span class="help-inline"><font color="red">*</font> </span></td>
				<td>
					<form:input path="billingMoney" htmlEscape="false" min="0" max="9999999" class="form-control number required"/>
					
				</td>
			</tr>
			<tr>
				<td>开票日期</td>
				<td>
					<input name="billingTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm  "
						value="<fmt:formatDate value="${oaContractSalesStage.billingTime}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</td>
			</tr>
			<tr>
				<td>是否已收款 <span class="help-inline"><font color="red">*</font> </span></td>
				<td>
					<form:select path="isGathering" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
					
				</td>
			</tr>
			<tr>
				<td>开票内容</td>
				<td>
					<form:input path="billingContent" htmlEscape="false" maxlength="200" class="form-control "/>
				</td>
			</tr>
			<tr>
				<td>发票号</td>
				<td>
					<form:input path="billingNo" htmlEscape="false" maxlength="64" class="form-control "/>
				</td>
			</tr>
			<tr>
				<td>收票回执</td>
				<td>
					<form:input path="billingReceipt" htmlEscape="false" maxlength="200" class="form-control "/>
				</td>
			</tr>
			<tr>
				<td>票种</td>
				<td>
					<form:select path="billingType" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
						<form:option value="" label="未选择"/>
						<form:options items="${fns:getDictList('oa_contract_sales_stage_billingType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
			</tr>
			<tr>
				<td>情况说明</td>
				<td class="width-35" >
					<form:input path="situationDescription" htmlEscape="false" maxlength="200" class="form-control "/>
				</td>
			</tr>
		</table>		
	</form:form>
</body>
</html>