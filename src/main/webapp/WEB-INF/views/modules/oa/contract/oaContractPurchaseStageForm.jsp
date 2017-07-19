<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购合同阶段信息管理</title>
	<meta name="decorator" content="default"/>
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
			
			$("#isWorkProgressCompleted").change(function(){  
				$(this).valid();
			});
		});
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaContractPurchaseStage" action="${ctx}/oa/contract/oaContractPurchaseStage/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="contractPurchase.id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
			<tr>
				<td class="active" colspan="2"><div style='text-align:left'><fieldset><legend>合同基本信息</legend></fieldset></div></td>
			</tr>
			<tr>
				<td>合同编号:</td>
				<td>
					<form:input path="contractPurchase.contractNo" htmlEscape="false" class="form-control " readonly="true"/>
				</td>
			</tr>
			<tr>
				<td>合同名称:</td>
				<td>
					<form:input path="contractPurchase.contractName" htmlEscape="false" class="form-control " readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="active" colspan="2"><div style='text-align:left'><fieldset><legend>合同阶段信息</legend></fieldset></div></td>
			</tr>
			<tr>
				<td>合同付款阶段类别：<span class="help-inline"><font color="red">*</font> </span></td>
				<td>
					<form:select path="payStage" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true" id="payStage">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('oa_contract_purchase_stage_pay_stage')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
					
				</td>
			</tr>
			<tr>
				<td>进度对应工作是否完成：<span class="help-inline"><font color="red">*</font> </span></td>
				<td>
					<form:select path="isWorkProgressCompleted" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true" id="payStage">
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
			</tr>
			<tr>
				<td>进度文档:</td>
				<td>
					<form:hidden id="workProgressFile" path="workProgressFile" htmlEscape="false" maxlength="1000" class="form-control"/>
					<sys:ckfinder input="workProgressFile" type="files" uploadPath="/oa/contract/oaContractPurchaseStage" selectMultiple="true"/>
				</td>
			</tr>
			<tr>
				<td>备注信息:</td>
				<td>
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
				</td>
			</tr>
		</table>		
	</form:form>
</body>
</html>