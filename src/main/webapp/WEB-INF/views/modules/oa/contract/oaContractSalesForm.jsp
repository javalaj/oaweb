<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售合同管理</title>
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
			reloadOaProject($("#projectId").val());
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
<body>
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
				<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
					<c:if test="${not empty oaContractSales.contractNo}">
						<tr>
							<td>合同编号</td>
							<td>
								${oaContractSales.contractNo}
							</td>
						</tr>
					</c:if>
					<tr>
						<td>合同名称 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<form:input path="contractName" htmlEscape="false" maxlength="64" class="form-control required"/>							
						</td>
					</tr>
					<tr>
						<td>项目名称（旧）</td>
						<td>
							<form:input path="projectOldName" htmlEscape="false" maxlength="64" class="form-control "/>
						</td>
					</tr>
					<tr>
						<td>关联的项目</td>
						<td>
							<form:select path="project.id" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true" name="project.id" id="projectId">
								<form:option value="" label=""/>
								<c:forEach items="${oaProjectList}" var="oaProject">
									<form:option value="${oaProject.id}">[${oaProject.projectNo}]${oaProject.projectName}</form:option>
								</c:forEach>
							</form:select>
						</td>
					</tr>
					<tr>
						<td>服务内容</td>
						<td>
							<span id="span_contractType"></span>
						</td>
					</tr>
					<tr>
						<td>所属行业</td>
						<td>
							<span id="span_ownedIndustry"></span>
						</td>
					</tr>
					<tr>
						<td>合同甲方 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<form:input path="contractPartya" htmlEscape="false" maxlength="64" class="form-control required"/>							
						</td>
					</tr>
					<tr>
						<td>甲方开票信息</td>
						<td>
							<form:hidden id="partyaTicket" path="partyaTicket" htmlEscape="false" maxlength="1000" class="form-control"/>
							<sys:ckfinder input="partyaTicket" type="files" uploadPath="/oa/contract/oaContractSales" selectMultiple="false"/>
						</td>
					</tr>
					<tr>
						<td>合同金额 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<form:input path="contractMoney" htmlEscape="false" max="9999999" min="0" class="form-control number required"/>							
						</td>
					</tr>
					<tr>
						<td>合同签订日期 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<input name="contractTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
								value="<fmt:formatDate value="${oaContractSales.contractTime}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>							
						</td>
					</tr>
					<tr>
						<td>合同保质期 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<form:input path="warrantyMonth" htmlEscape="false" max="1200" min="1" class="form-control number required"/>							
						</td>
					</tr>
					<tr>
						<td>合同保修开始日期</td>
						<td>
							<input id="warrantyStartTime" name="warrantyStartTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm "
								value="<fmt:formatDate value="${oaContractSales.warrantyStartTime}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({onpicked:pickerFunctin,dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</td>
					</tr>
					<tr>
						<td>合同保修结束日期</td>
						<td>
							<input id="warrantyEndTime" name="warrantyEndTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm "
								value="<fmt:formatDate value="${oaContractSales.warrantyEndTime}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({onpicked:pickerFunctin,dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</td>
					</tr>
					<tr>
						<td>项目负责人 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<sys:treeselect id="projectLeader" name="projectLeader.id" value="${oaContractSales.projectLeader.id}" labelName="projectLeader.name" labelValue="${oaContractSales.projectLeader.name}"
								title="用户" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" notAllowSelectParent="true"/>							
						</td>
					</tr>
					<tr>
						<td>质保金金额 <span class="help-inline"><font color="red"></font> </span></td>
						<td>
							<form:input path="guaranteeMoney" htmlEscape="false" max="9999999" min="0" class="form-control number"/>							
						</td>
					</tr>
					<tr>
						<td>质保金收取时间</td>
						<td>
							<input name="guaranteeMoneyChargeTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm "
								value="<fmt:formatDate value="${oaContractSales.guaranteeMoneyChargeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
						</td>
					</tr>
					<tr>
						<td>合同状态</td>
						<td>
							<form:select path="contractStatus" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('oa_contract_sales_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</td>
					</tr>
					<tr>
						<td>反点合同</td>
						<td >
							<form:radiobuttons path="isCounterPointContract" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/>
						</td>
					</tr>
					<tr>
						<td>是否经过招投标</td>
						<td>
							<form:radiobuttons path="isBiddingOff" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/>
						</td>
					</tr>
					<tr>
						<td>备注（合同主要信息）</td>
						<td>
							<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
						</td>
					</tr>
					<tr>
						<td>合同电子版</td>
						<td>
							<form:hidden id="contractElectronicVersion" path="contractElectronicVersion" htmlEscape="false" maxlength="1000" class="form-control"/>
							<sys:ckfinder input="contractElectronicVersion" type="files" uploadPath="/oa/contract/oaContractSales" selectMultiple="false"/>
						</td>
					</tr>
					<tr>
						<td>合同扫描件</td>
						<td>
							<form:hidden id="contractScanAttachment" path="contractScanAttachment" htmlEscape="false" maxlength="1000" class="form-control"/>
							<sys:ckfinder input="contractScanAttachment" type="files" uploadPath="/oa/contract/oaContractSales" selectMultiple="false"/>
						</td>
					</tr>
					<tr>
						<td>违约惩罚</td>
						<td>
							<form:textarea path="punishment" htmlEscape="false"  rows="4" maxlength="1000" class="form-control "/>
						</td>
					</tr>
				</table>
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
</body>
</html>