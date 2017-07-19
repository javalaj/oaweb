<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售合同管理</title>
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
		$.validator.addMethod("startDateCompareWithEndDate",function(value,element,params){
			var compareVal=$(params[0]).val();
			if(compareVal==null||compareVal==""){
				return true;
			}else{
				return dateCompare(value, compareVal);
			}
		},"开始日期必须早于结束日期");
		
		$.validator.addMethod("endDateCompareWithStartDate",function(value,element,params){
			var compareVal=$(params[0]).val();
			if(compareVal==null||compareVal==""){
				return true;
			}else{
				return dateCompare(compareVal, value);
			}
		},"结束日期必须晚于开始日期");
		
		$(document).ready(function() {
			$(".selectpicker").selectpicker({noneSelectedText:'请选择'});
			//$("#name").focus();
			validateForm=$("#inputForm").validate({
				rules: {
					"projectLeader.name": {
				        required: true
				     },
				     "warrantyStartTime": {
				    	 required: true,
				    	 startDateCompareWithEndDate: ["#warrantyEndTime"]
					 },
				     "warrantyEndTime": {
				    	 required: true,
				    	 endDateCompareWithStartDate: ["#warrantyStartTime"]
					 }
				},
			    messages: {
			    	"projectLeader.name": {
			          required: "必填信息",
			        }
			    },
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
			$("#projectLeaderName").change(function(){  
				$(this).valid();  
			});
			$("#contractTime").change(function(){  
				$(this).valid();  
			});
			$("#warrantyStartTime").change(function(){  
				$(this).valid();  
			});
			$("#warrantyEndTime").change(function(){  
				$(this).valid();  
			});
			reloadOaProject("${oaContractSales.project.id}");
		});
		
		function reloadOaProject(projectIdx){
			$.ajax({
				type: "POST",
				url: "${ctx}/oa/project/oaProject/getOaProject",
				data: {projectId: projectIdx},
				dataType: 'json',
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
		function dateCompare(start, end) {
			var startTime = start;

			var endTime = end;
			if (startTime > endTime) {

				return false;
			} else
				return true;
		}
		function pickerFunctin() {
			$("#warrantyStartTime").valid();  
			$("#warrantyEndTime").valid();
		}
	</script>
</head>
<oam:body>
 	<oam:header>
		<a class="mui-icon mui-icon-back mui-pull-left" onclick="location.href='${mctx}/oa/contract/oaContractSales/'"></a>
		<h1 class="mui-title">销售合同查看</h1>
	</oam:header>
	<oam:message content="${message}"/>
	<oam:content>
		<oam:form id="inputForm" modelAttribute="oaContractSales" action="${mctx}/oa/contract/oaContractSales/save" method="post">
			<form:hidden path="id"/>
			<oam:listView>
				<oam:listViewCell title="合同编号:" cellType="input" >
					${oaContractSales.contractNo}
				</oam:listViewCell>
				<oam:listViewCell title="合同名称:" cellType="input" >
					${oaContractSales.contractName}
				</oam:listViewCell>
				<oam:listViewCell title="项目名称（旧）:" cellType="input" >
					${oaContractSales.projectOldName}
				</oam:listViewCell>
				<oam:listViewCell title="关联的项目:" cellType="input" >
					${oaContractSales.project.projectNo}<br>${oaContractSales.project.projectName}
				</oam:listViewCell>
				<oam:listViewCell title="服务内容:" cellType="input" >
					<span id="span_contractType"></span>
				</oam:listViewCell>
				<oam:listViewCell title="所属行业:" cellType="input" >
					<span id="span_ownedIndustry"></span>
				</oam:listViewCell>
				<oam:listViewCell title="合同甲方:" cellType="input" >
					${oaContractSales.contractPartya}
				</oam:listViewCell>
				<oam:listViewCell title="甲方开票信息:" cellType="input" >
					<form:hidden id="partyaTicket" path="partyaTicket" htmlEscape="false" maxlength="1000" class="form-control"/>
					<sys:ckfinder input="partyaTicket" type="files" uploadPath="/oa/contract/oaContractSales" selectMultiple="false" readonly="true"/>
				</oam:listViewCell>
				<oam:listViewCell title="合同金额:" cellType="input" >
					${oaContractSales.contractMoney}
				</oam:listViewCell>
				<oam:listViewCell title="合同签订日期:" cellType="input" >
					<fmt:formatDate value="${oaContractSales.contractTime}" pattern="yyyy-MM-dd"/>
				</oam:listViewCell>
				<oam:listViewCell title="保修开始时间:" cellType="input" >
					<fmt:formatDate value="${oaContractSales.warrantyStartTime}" pattern="yyyy-MM-dd"/>
				</oam:listViewCell>
				<oam:listViewCell title="保修结束时间:" cellType="input" >
					<fmt:formatDate value="${oaContractSales.warrantyEndTime}" pattern="yyyy-MM-dd"/>
				</oam:listViewCell>
				<oam:listViewCell title="项目负责人:" cellType="input" >
					${oaContractSales.projectLeader.name}
				</oam:listViewCell>
				<oam:listViewCell title="质保金金额:" cellType="input" >
					${oaContractSales.guaranteeMoney}
				</oam:listViewCell>
				<oam:listViewCell title="质保金收取时间:" cellType="input" >
					<fmt:formatDate value="${oaContractSales.guaranteeMoneyChargeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</oam:listViewCell>
				<oam:listViewCell title="合同状态:" cellType="input" >
					${fns:getDictLabel(oaContractSales.contractStatus, 'oa_contract_sales_status', '')}
				</oam:listViewCell>
				<oam:listViewCell title="反点合同:" cellType="input" >
					${fns:getDictLabel(oaContractSales.isCounterPointContract, 'yes_no', '')}
				</oam:listViewCell>
				<oam:listViewCell title="是否招投标:" cellType="input" >
					${fns:getDictLabel(oaContractSales.isBiddingOff, 'yes_no', '')}
				</oam:listViewCell>
				<oam:listViewCell title="备注:" cellType="input" >
					${oaContractSales.remarks}
				</oam:listViewCell>
				<oam:listViewCell title="合同电子版:" cellType="input" >
					<form:hidden id="contractElectronicVersion" path="contractElectronicVersion" htmlEscape="false" maxlength="1000" class="form-control"/>
					<sys:ckfinder input="contractElectronicVersion" type="files" uploadPath="/oa/contract/oaContractSales" selectMultiple="false" readonly="true"/>
				</oam:listViewCell>
				<oam:listViewCell title="合同扫描件:" cellType="input" >
					<form:hidden id="contractScanAttachment" path="contractScanAttachment" htmlEscape="false" maxlength="1000" class="form-control"/>
					<sys:ckfinder input="contractScanAttachment" type="files" uploadPath="/oa/contract/oaContractSales" selectMultiple="false" readonly="true"/>
				</oam:listViewCell>
				<oam:listViewCell title="违约惩罚:" cellType="input" >
					${oaContractSales.punishment}
				</oam:listViewCell>
			</oam:listView>	
		</oam:form>
	</oam:content>
</oam:body>
<%-- <body>
	<form:form id="inputForm" modelAttribute="oaContractSales" action="${ctx}/oa/contract/oaContractSales/save" method="post" class="form-horizontal">
		<ul class="nav nav-tabs myoa-tabs">
			<li class="active"><a href="#base" data-toggle="tab">销售合同主信息</a></li>			
			<c:if test="${not empty oaContractSales.id and oaContractSales.oaContractSalesStageList.size()>0}">
				<li><a href="#report" data-toggle="tab">阶段信息(${oaContractSales.oaContractSalesStageList.size()})</a></li>
			</c:if>
		</ul><br/>
		
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="tab-content">
			<div class="tab-pane active" id="base">
			</div>
			<c:if test="${not empty oaContractSales.id and oaContractSales.oaContractSalesStageList.size()>0}">
			<div class="tab-pane" id="report" >
				<table class="table table-condensed table-bordered dataTables-example dataTable no-footer">
					<c:forEach items="${oaContractSales.oaContractSalesStageList}" var="oaContractSalesStage">
						<tr>
							<td class="active" colspan="2"><div><fieldset><legend>合同付款阶段：[${oaContractSalesStage.payStageIndex}]${fns:getDictLabel(oaContractSalesStage.payStage, 'oa_contract_sales_stage_pay_stage', '')}</legend></fieldset></div></td>
						</tr>
						<tr>
							<td class="width-15 active" >合同付款阶段</td>
							<td class="width-35" >
								${fns:getDictLabel(oaContractSalesStage.payStage, 'oa_contract_sales_stage_pay_stage', '')}
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >验收完成时间</td>
							<td class="width-35" >
								<fmt:formatDate value="${oaContractSalesStage.checkCompleteTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >验收资料</td>
							<td class="width-35" >
								<input type="hidden" id="checkFile${oaContractSalesStage.id}"value="${oaContractSalesStage.checkFile}"/>
								<sys:ckfinder input="checkFile${oaContractSalesStage.id}" readonly="true" type="files" uploadPath="/oa/contract/oaContractSalesStage" selectMultiple="true"/>
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >是否已开票</td>
							<td class="width-35" >
								${fns:getDictLabel(oaContractSalesStage.isBilling, 'yes_no', '')}
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >开票金额</td>
							<td class="width-35" >
								${oaContractSalesStage.billingMoney}
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >开票日期</td>
							<td class="width-35" >
								<fmt:formatDate value="${oaContractSalesStage.billingTime}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >是否已收款</td>
							<td class="width-35" >
								${fns:getDictLabel(oaContractSalesStage.isGathering, 'yes_no', '')}
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >开票内容</td>
							<td class="width-35" >
								${oaContractSalesStage.billingContent}
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >发票号</td>
							<td class="width-35" >
								${oaContractSalesStage.billingNo}
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >收票回执</td>
							<td class="width-35" >
								${oaContractSalesStage.billingReceipt}
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >票种</td>
							<td class="width-35" >
								${fns:getDictLabel(oaContractSalesStage.billingType, 'oa_contract_sales_stage_billingType', '')}
							</td>
						</tr>
						<tr>
							<td class="width-15 active" >情况说明</td>
							<td class="width-35" >
								${oaContractSalesStage.situationDescription}
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>	
					</c:forEach>
				</table>
			</div>
			</c:if>	
		</div>		
	</form:form>
</body> --%>
</html>