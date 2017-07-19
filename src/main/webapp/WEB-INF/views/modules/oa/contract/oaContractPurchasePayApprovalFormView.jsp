<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同付款申请信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#btnPrint").click(function(){
				var src="${ctx}/oa/contract/oaContractPurchasePayApproval/print?id=${oaContractPurchasePayApproval.id}"
				top.layer.open({
					  type: 2, 
					  area: ["80%","80%"],
				      title: "打印预览",
			          maxmin: true,
			          shadeClose: true,
					  content: src
				});
			});
			$("#btnViewCommen").click(function(){
				var src="${ctx}/act/process/resource/read?procDefId=${fns:getWorkflowVarValue('oa_contract_purchase_pay_approval','procDefId','')}&resType=image";
				if("${not empty oaContractPurchasePayApproval.procInsId}"=="true"){
					src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_contract_purchase_pay_approval','procDefId','')}/${oaContractPurchasePayApproval.procInsId}";
				}
				top.layer.open({
					  type: 2, 
					  area: ["80%","80%"],
				      title: "合同付款流程图",
			          maxmin: true,
			          shadeClose: true,
					  content: src
				});	
			});
			
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
			$("#projectId").change(function(){  
				reloadOaContractSales($(this).val());
			});
			loadAddInfoBy("${oaContractPurchasePayApproval.oaContractPurchaseStage.id}");
		});
		function reloadOaContractSales(projectIdx){
			$.ajax({
				type: "POST",
				url: "${ctx}/oa/contract/oaContractPurchase/getOaContractPurchaseList",
				data: {projectId: projectIdx},
				dataType: 'json',
				success: function(data){
					$("#s2id_contractPurchaseId").children("a").children("span.select2-chosen").empty();
					$("#contractPurchaseId").empty();
					$.each(data, function(index,item){
						$("#contractPurchaseId").append("<option value='"+item.id+"'>["+item.contractNo+"]"+item.contractName+"</option>");
					});
				}
			});
			
		}
		function loadAddInfoBy(oaContractPurchaseStageIdx){
			$.ajax({
				type: "POST",
				url: "${ctx}/oa/contract/oaContractPurchasePayApproval/loadAddInfoBy",
				data: {oaContractPurchaseStageId: oaContractPurchaseStageIdx},
				dataType: 'json',
				success: function(data){
					$("#span_projectNo").html(data.oaProject.projectNo);
					$("#span_projectName").html(data.oaProject.projectName);
					$("#span_accountManagerName").html(data.oaProject.accountManager.name);
					$("#span_accountName").html(data.oaProject.accountName);
					getDictLabel(data.oaProject.contractType,'oa_project_contractType',"",$("#span_contractType"));
					getDictLabel(data.oaProject.ownedIndustry,'oa_project_ownedIndustry',"",$("#span_ownedIndustry"));
					$("#span_contractNo").html(data.oaContractPurchase.contractNo);
					$("#span_contractName").html(data.oaContractPurchase.contractName);
					$("#span_businessManager").html(data.oaProject.businessManager.name);
					$("#span_projectLeader").html(data.oaContractSales.projectLeader.name);
					getDictLabel(data.oaContractPurchaseStage.payStage,'oa_contract_purchase_stage_pay_stage',"",$("#span_payStageInfo"),"["+data.oaContractPurchaseStage.payStageIndex+"]");
					$("#span_divisionMoney").html(data.oaContractPurchase.contractMoney-data.oaContractPurchase.sumPayMoney);
					$("body").data("contractMoney", data.oaContractPurchase.contractMoney);  // blah设置为hello
					$("body").data("sumPayMoney", data.oaContractPurchase.sumPayMoney);
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
					if(prefix!=null){
						element.html(prefix+data.dictLabel);
					}else{
						element.html(data.dictLabel);
					}
					
				}
			});
		}
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaContractPurchasePayApproval" action="${ctx}/oa/contract/oaContractPurchasePayApproval/save" method="post" class="form-horizontal">
		<sys:message content="${message}"/>
		<table class="table table-bordered table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
					<input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>&nbsp;
					<input id="btnViewCommen" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
				</div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">是否已启动流程</td>
				<td class="width-35">
					${fns:getDictLabel(oaContractPurchasePayApproval.isStart,'yes_no','否')}
				</td>
				<td class="width-15 active" style="width:100px">流程状态</td>
				<td class="width-35">
					${fns:getDictLabel(oaContractPurchasePayApproval.status,'ActEntity_ACT_STATUS','')}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>合同付款申请审批表</legend></fieldset></div></td>
			</tr>
			<c:choose>
				<c:when test="${oaContractPurchasePayApproval.isStart eq '1'}">
					<tr>
						<td class="width-15 active" colspan="4"><div style='text-align:left'><span style="color:#1c84c6">申请信息</span></div></td>
					</tr>
					<tr>
						<td class="width-15 active" style="width:100px">付款申请编号</td>
						<td class="width-35">
							${oaContractPurchasePayApproval.payApprovalNo}
						</td>
						<td class="width-15 active" style="width:100px">申请日期</td>
						<td class="width-35">
							<fmt:formatDate value="${oaContractPurchasePayApproval.applyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
					</tr>
					<tr>
						<td class="width-15 active" style="width:100px">申请人</td>
						<td class="width-35" colspan="3">
							${oaContractPurchasePayApproval.applicant.name}
						</td>
					</tr>
				</c:when>
			</c:choose>
			
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><span style="color:#1c84c6">项目信息</span></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">项目编号</td>
				<td class="width-35">
					<span id="span_projectNo"></span>
				</td>
				<td class="width-15 active" style="width:100px">项目名称</td>
				<td class="width-35">
					<span id="span_projectName"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">客户经理</td>
				<td class="width-35">
					<span id="span_accountManagerName"></span>
				</td>
				<td class="width-15 active" style="width:100px">客户名称</td>
				<td class="width-35">
					<span id="span_accountName"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">客户类别</td>
				<td class="width-35">
					<span id="span_ownedIndustry"></span>
				</td>
				<td class="width-15 active" style="width:100px">服务内容</td>
				<td class="width-35">
					<span id="span_contractType"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">商务联系人</td>
				<td class="width-35" colspan="3">
					<span id="span_businessManager"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><span style="color:#1c84c6">合同信息</span></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">合同编号</td>
				<td class="width-35">
					<span id="span_contractNo"></span>
				</td>
				<td class="width-15 active" style="width:100px">合同名称</td>
				<td class="width-35">
					<span id="span_contractName"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">项目负责人</td>
				<td class="width-35">
					<span id="span_projectLeader"></span>
				</td>
				<td class="width-15 active" style="width:100px">合同面向对象</td>
				<td class="width-35" colspan="3">
					${fns:getDictLabel(oaContractPurchasePayApproval.contractPurchaseTargetedFor,'oa_contract_purchase_pay_approval_targeted_for','')}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">合同未付金额</td>
				<td class="width-35" colspan="3">
					<span id="span_divisionMoney"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><span style="color:#1c84c6">阶段信息</span></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">阶段序号</td>
				<td class="width-35" colspan="3">
					<span id="span_payStageInfo"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><span style="color:#1c84c6">其他信息</span></div></td>
			</tr>
			
			<tr>
				<td class="width-15 active" style="width:100px">付款金额</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.payMoney}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">内容概括</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.contentDescription}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">附件</td>
				<td class="width-35" colspan="3">
					<form:hidden id="file" path="file" htmlEscape="false" maxlength="1000" class="input-xlarge"/>
					<sys:ckfinder input="file" type="files" uploadPath="/oa/contract/oaContractPurchasePayApproval" selectMultiple="true" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>客户经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">客户经理意见</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.accountmanageropinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>商务联系人审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">商务部联系人意见</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.businessDeptLinkmanOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>项目经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">项目经理意见</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.projectManagerOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>财务经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">财务部付款要求</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.financeDeptPaymentRequest}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>工程部经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">工程部经理意见</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.engineeringDeptManagerOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>技术部副总审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">技术部副总意见</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.techDeptVicePresidentOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>商务经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">商务经理意见</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.businessManagerOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>市场部副总审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">市场部副总意见</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.businessDeptVicePresidentOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>财务部副总审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">财务部副总意见</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.financeDeptVicePresidentOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>总经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">总经理意见</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.generalManagerOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>出纳审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:100px">备注信息</td>
				<td class="width-35" colspan="3">
					${oaContractPurchasePayApproval.remarks}
				</td>
			</tr>
		</table>
		<c:if test="${oaContractPurchasePayApproval.isStart eq '1' and not empty oaContractPurchasePayApproval.act.procInsId}">
			<act:histoicFlow procInsId="${oaContractPurchasePayApproval.act.procInsId}" />
		</c:if>			
	</form:form>
</body>
</html>