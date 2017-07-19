<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同付款申请信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$.validator.addMethod("checkMoney",function(value,element,params){
			return ($("body").data("contractMoney")-$("body").data("sumPayMoney")-value>=0)?true:false;
		},"输入的付款金额不得大于当前合同未付款金额");
		
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
			          maxmin: true, //开启最大化最小化按钮
			          shadeClose: true,
					  content: src //这里content是一个普通的String
				});	
			});
			
			$("#btnView").click(function(){
				var src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_contract_purchase_pay_approval','procDefId','')}/${oaContractPurchasePayApproval.procInsId}";
				top.layer.open({
					  type: 2, 
					  area: ["80%","80%"],
				      title: "合同付款流程图",
			          maxmin: true, //开启最大化最小化按钮
			          shadeClose: true,
					  content: src //这里content是一个普通的String
				});
			});			
			//$("#name").focus();
			$("#inputForm").validate({
				rules: {
				     "payMoney": {
				    	 required: true,
				    	 checkMoney: [""]
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
				reloadOaContractSales($(this).val());
			});
			loadAddInfoBy("${oaContractPurchasePayApproval.oaContractPurchaseStage.id}");
			
			$("#contractPurchaseTargetedFor").change(function(){  
				$(this).val();
			});
			
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
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden id="flag" path="act.flag"/>
		<sys:message content="${message}"/>
		<form:hidden path="oaContractPurchaseStage.id"/>
		<table class="table table-bordered table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td class="width-15 active" colspan="6"><div style='text-align:left'>
					<c:if test="${empty oaContractPurchasePayApproval.act.taskDefKey}">
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
					</c:if>
					<c:if test="${not empty oaContractPurchasePayApproval.act.taskDefKey}">
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="location.replace('${ctx}/act/task/todo/')"/>&nbsp;
					</c:if>
					<input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>&nbsp;
					
					<c:if test="${empty oaContractPurchasePayApproval.act.taskDefKey}">
						<input id="btnViewCommen" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
					</c:if>
					<c:if test="${not empty oaContractPurchasePayApproval.act.taskDefKey}">
						<input id="btnView" class="btn btn-primary" type="button" value="流程追踪"/>&nbsp;
					</c:if>
					<shiro:hasPermission name="oa:contract:oaContractPurchasePayApproval:edit">
						<c:if test="${empty oaContractPurchasePayApproval.act.taskDefKey}">
							<c:if test="${oaContractPurchasePayApproval.isStart ne '1'}">
								<input id="btnSave" class="btn btn-primary" type="submit" value="存草稿" onclick="$('#flag').val('save')"/>&nbsp;
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交"  onclick="$('#flag').val('true')"/>&nbsp;
							</c:if>
						</c:if>
						<c:if test="${not empty oaContractPurchasePayApproval.act.taskDefKey}">
							<c:if test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam1'}">
								<input id="btnSave" class="btn btn-primary" type="submit" value="存草稿" onclick="$('#flag').val('save')"/>&nbsp;
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交"  onclick="$('#flag').val('true')"/>&nbsp;
							</c:if>
							<c:if test="${oaContractPurchasePayApproval.act.taskDefKey ne 'exam1'}">
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="同意"  onclick="$('#flag').val('true')"/>&nbsp;
								<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="驳回" onclick="$('#flag').val('false')"/>&nbsp;
							</c:if>
						</c:if>
					</shiro:hasPermission>
				</div></td>
			</tr>
			<tr>
				<td class="width-15 active" >是否已启动流程</td>
				<td class="width-35">
					${fns:getDictLabel(oaContractPurchasePayApproval.isStart,'yes_no','否')}
				</td>
				<td class="width-15 active" >流程状态</td>
				<td class="width-35">
					${fns:getDictLabel(oaContractPurchasePayApproval.status,'ActEntity_ACT_STATUS','')}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>合同付款申请审批表</legend></fieldset></div></td>
			</tr>
			<c:if test="${oaContractPurchasePayApproval.isStart eq '1'}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left'><span style="color:#1c84c6">申请信息</span></div></td>
				</tr>
				<tr>
					<td class="width-15 active" >付款申请编号</td>
					<td class="width-35">
						${oaContractPurchasePayApproval.payApprovalNo}
					</td>
					<td class="width-15 active" >申请日期</td>
					<td class="width-35">
						<fmt:formatDate value="${oaContractPurchasePayApproval.applyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active" >申请人</td>
					<td class="width-35" colspan="3">
						${oaContractPurchasePayApproval.applicant.name}
					</td>
				</tr>
			</c:if>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><span style="color:#1c84c6">项目信息</span></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >项目编号</td>
				<td class="width-35">
					<span id="span_projectNo"></span>
				</td>
				<td class="width-15 active" >项目名称</td>
				<td class="width-35">
					<span id="span_projectName"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >客户经理</td>
				<td class="width-35">
					<span id="span_accountManagerName"></span>
				</td>
				<td class="width-15 active" >客户名称</td>
				<td class="width-35">
					<span id="span_accountName"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >客户类别</td>
				<td class="width-35">
					<span id="span_ownedIndustry"></span>
				</td>
				<td class="width-15 active" >服务内容</td>
				<td class="width-35">
					<span id="span_contractType"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >商务联系人</td>
				<td class="width-35" colspan="3">
					<span id="span_businessManager"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><span style="color:#1c84c6">合同信息</span></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >合同编号</td>
				<td class="width-35">
					<span id="span_contractNo"></span>
				</td>
				<td class="width-15 active" >合同名称</td>
				<td class="width-35">
					<span id="span_contractName"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >项目负责人</td>
				<td class="width-35">
					<span id="span_projectLeader"></span>
				</td>
				<td class="width-15 active" >合同面向对象 <span class="help-inline"><font color="red">*</font> </span></td>
				<td class="width-35">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.isStart ne '1' or oaContractPurchasePayApproval.act.taskDefKey eq 'exam1'}">
							<form:select path="contractPurchaseTargetedFor" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true" id="contractPurchaseTargetedFor">
								<form:options items="${fns:getDictList('oa_contract_purchase_pay_approval_targeted_for')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							
						</c:when>
						<c:otherwise>
							${fns:getDictLabel(oaContractPurchasePayApproval.contractPurchaseTargetedFor,'oa_contract_purchase_pay_approval_targeted_for','')}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >合同未付金额</td>
				<td class="width-35" colspan="3">
					<span id="span_divisionMoney"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><span style="color:#1c84c6">阶段信息</span></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >阶段序号</td>
				<td class="width-35" colspan="3">
					<span id="span_payStageInfo"></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><span style="color:#1c84c6">其他信息</span></div></td>
			</tr>
			
			<tr>
				<td class="width-15 active" >付款金额 <span class="help-inline"><font color="red">*</font> </span></td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.isStart ne '1' or oaContractPurchasePayApproval.act.taskDefKey eq 'exam1'}">
							<form:input id="payMoney" path="payMoney" htmlEscape="false" max="99999999" min="0" class="form-control number required"/>
							
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.payMoney}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >内容概括</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.isStart ne '1' or oaContractPurchasePayApproval.act.taskDefKey eq 'exam1'}">
							<form:textarea path="contentDescription" htmlEscape="false" maxlength="380" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.contentDescription}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >附件</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.isStart ne '1' or oaContractPurchasePayApproval.act.taskDefKey eq 'exam1'}">
							<form:hidden id="file" path="file" htmlEscape="false" maxlength="1000" class="form-control"/>
							<sys:ckfinder input="file" type="files" uploadPath="/oa/contract/oaContractPurchasePayApproval" selectMultiple="true"/>	
						</c:when>
						<c:otherwise>
							<form:hidden id="file" path="file" htmlEscape="false" maxlength="1000" class="form-control"/>
							<sys:ckfinder input="file" type="files" uploadPath="/oa/contract/oaContractPurchasePayApproval" selectMultiple="true" readonly="true"/>
						</c:otherwise>
					</c:choose>
					
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>客户经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >客户经理意见</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam2'}">
							<form:textarea path="accountmanageropinion" htmlEscape="false" rows="2" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.accountmanageropinion}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>商务联系人审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >商务部联系人意见</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam3'}">
							<form:textarea path="businessDeptLinkmanOpinion" htmlEscape="false" rows="2" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.businessDeptLinkmanOpinion}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>项目经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >项目经理意见</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam4'}">
							<form:textarea path="projectManagerOpinion" htmlEscape="false" rows="2" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.projectManagerOpinion}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>财务经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >财务部付款要求</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam5'}">
							<form:textarea path="financeDeptPaymentRequest" htmlEscape="false" rows="2" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.financeDeptPaymentRequest}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>工程部经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >工程部经理意见</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam6'}">
							<form:textarea path="engineeringDeptManagerOpinion" htmlEscape="false" rows="2" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.engineeringDeptManagerOpinion}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>技术部副总审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >技术部副总意见</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam7'}">
							<form:textarea path="techDeptVicePresidentOpinion" htmlEscape="false" rows="2" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.techDeptVicePresidentOpinion}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>商务经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >商务经理意见</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam8'}">
							<form:textarea path="businessManagerOpinion" htmlEscape="false" rows="2" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.businessManagerOpinion}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>市场部副总审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >市场部副总意见</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam9'}">
							<form:textarea path="businessDeptVicePresidentOpinion" rows="2" htmlEscape="false" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.businessDeptVicePresidentOpinion}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>财务部副总审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >财务部副总意见</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam10'}">
							<form:textarea path="financeDeptVicePresidentOpinion" rows="2" htmlEscape="false" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.financeDeptVicePresidentOpinion}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>总经理审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >总经理意见</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam11'}">
							<form:textarea path="generalManagerOpinion" htmlEscape="false" rows="2" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.generalManagerOpinion}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>出纳审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >备注信息</td>
				<td class="width-35" colspan="3">
					<c:choose>
						<c:when test="${oaContractPurchasePayApproval.act.taskDefKey eq 'exam12'}">
							<form:textarea path="remarks" htmlEscape="false" rows="2" maxlength="180" class="form-control "/>
						</c:when>
						<c:otherwise>
							${oaContractPurchasePayApproval.remarks}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<c:if test="${oaContractPurchasePayApproval.isStart eq '1' and not empty oaContractPurchasePayApproval.act.procInsId}">
			<act:histoicFlow procInsId="${oaContractPurchasePayApproval.act.procInsId}" />
		</c:if>		
	</form:form>
</body>
</html>