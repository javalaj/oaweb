<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>售前项目立项申請</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<script type="text/javascript">
		$(document).ready(function() {
			if($("#isBid").val()=="1"){
				$("#tr_expectedBidTime").show();
			}else{
				$("#tr_expectedBidTime").hide();
			}
			
			$("#btnPrint").click(function(){
				var src="${ctx}/oa/project/oaProjectApproval/print?id=${oaProjectApproval.id}";
				top.layer.open({
					  type: 2, 
					  area: ["100%","100%"],
				      title: "打印预览",
			          maxmin: true, 
			          shadeClose: true,
					  content: src
				});
			});
			$("#btnViewCommen").click(function(){
				var src="${ctx}/act/process/resource/read?procDefId=${fns:getWorkflowVarValue('oa_project_approval','procDefId','')}&resType=image";
				if("${not empty oaProjectApproval.procInsId}"=="true"){
					src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_project_approval','procDefId','')}/${oaProjectApproval.procInsId}";
				}
				top.layer.open({
					  type: 2, 
					  area: ["100%","100%"],
				      title: "售前项目立项流程图",
			          maxmin: true, //开启最大化最小化按钮
			          shadeClose: true,
					  content: src //这里content是一个普通的String
				});	
			});
			$("#btnView").click(function(){
				var src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_project_approval','procDefId','')}/${oaProjectApproval.procInsId}";
				top.layer.open({
					  type: 2, 
					  area: ["100%","100%"],
				      title: "售前项目立项流程图",
			          maxmin: true, 
			          shadeClose: true,
					  content: src 
				});
			});
			
			
			$("#inputForm").validate({
				rules: {
					"accountManager.name": {
				        required: true
				     },
					"businessManager.name": {
				        required: true
				     },
					"technicalManager.name": {
				        required: true
				     },
					"projectManager.name": {
				        required: true
				     },
				     "expectedMoney":{
				    	 number:true,
				    	 min:0,
				    	 max:9999999
				     }
				},
			    messages: {
			    	"accountManager.name": {
			          required: "必填信息",
			        },
			        "businessManager.name": {
				      required: "必填信息",
				    },
				    "technicalManager.name": {
					  required: "必填信息",
					},
			        "projectManager.name": {
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
			$("#ownedIndustry").change(function(){  
				$(this).valid();  
			});
			$("#contractType").change(function(){  
				$(this).valid();  
			});
			$("#isBid").change(function(){  
				$(this).valid(); 
				if($(this).val()=="1"){
					$("#tr_expectedBidTime").show();
				}else{
					$("#tr_expectedBidTime").hide();
				}
			});
			$("#accountManagerName").change(function(){  
				$(this).valid();  
			});
			$("#businessManagerName").change(function(){  
				$(this).valid();  
			});
			$("#technicalManagerName").change(function(){  
				$(this).valid();  
			});
			$("#bookContractTime").change(function(){  
				$(this).valid();  
			});
		});
	</script>
	<style type="text/css">
		td{
			font-size:13px;
		}
	</style>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaProjectApproval" action="${mctx}/oa/project/oaProjectApproval/save" method="post" class="form-horizontal">
		<input type="hidden" name="token" value="${token }">
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden id="flag" path="act.flag"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td class="width-15 active" colspan="6"><div style='text-align:left'>
					<c:if test="${empty oaProjectApproval.act.taskDefKey}">
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
					</c:if>
					<c:if test="${not empty oaProjectApproval.act.taskDefKey}">
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
					</c:if>
					<c:if test="${empty oaProjectApproval.act.taskDefKey}">
					<input id="btnViewCommen" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
					</c:if>
					<c:if test="${not empty oaProjectApproval.act.taskDefKey}">
					<input id="btnView" class="btn btn-primary" type="button" value="流程追踪"/>&nbsp;
					</c:if>
					<shiro:hasPermission name="oa:project:oaProjectApproval:edit">
						<c:if test="${empty oaProjectApproval.act.taskDefKey}">
							<c:if test="${oaProjectApproval.isStart ne '1'}">
								<input id="btnSave" class="btn btn-primary" type="submit" value="保存" onclick="$('#flag').val('save')"/>&nbsp;
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交申请"  onclick="$('#flag').val('true')"/>&nbsp;
							</c:if>
						</c:if>
						<c:if test="${not empty oaProjectApproval.act.taskDefKey}">
							<c:if test="${oaProjectApproval.act.taskDefKey eq 'exam1'}">
								<input id="btnSave" class="btn btn-primary" type="submit" value="保存" onclick="$('#flag').val('save')"/>&nbsp;
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="重新提交申请"  onclick="$('#flag').val('true')"/>&nbsp;
								<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="销毁申请" onclick="$('#flag').val('false')"/>&nbsp;
							</c:if>
							<c:if test="${oaProjectApproval.act.taskDefKey ne 'exam1'}">
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="同意"  onclick="$('#flag').val('true')"/>&nbsp;
								<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="驳回" onclick="$('#flag').val('false')"/>&nbsp;
							</c:if>
						</c:if>
					</shiro:hasPermission>
				</div></td>
			</tr>		
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>售前项目立项申请表</legend></fieldset></div></td>
			</tr>
			<c:if test="${oaProjectApproval.isStart eq '1'}">
				<tr>
					<td class="width-15 active" >申请人</td>
					<td class="width-35">
						${oaProjectApproval.applicant.name}
					</td>
				</tr>
				<tr>
					<td class="width-15 active" >申请日期</td>
					<td class="width-35">
						<fmt:formatDate value="${oaProjectApproval.applyDate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
			</c:if>
			<c:if test="${oaProjectApproval.act.taskDefKey ne 'exam7'}">
			<tr>
				<td class="width-15 active" >项目名称</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'or oaProjectApproval.act.taskDefKey eq 'exam7'}">
						<form:input path="projectName" htmlEscape="false" maxlength="64" class="form-control required "/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'or oaProjectApproval.act.taskDefKey eq 'exam7')}">
						${oaProjectApproval.projectName}
					</c:if>
				</td>
			</tr>
			</c:if>
			<tr>
				<td class="width-15 active" style="width:25%">客户经理</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'}">
						<sys:treeselect id="accountManager" name="accountManager.id" 
						value="${empty oaProjectApproval.accountManager.id?fns:getUser().id:oaProjectApproval.accountManager.id}" 
						labelName="accountManager.name" 
						labelValue="${empty oaProjectApproval.accountManager.name?fns:getUser().name:oaProjectApproval.accountManager.name}" title="客户经理" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" notAllowSelectParent="true"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1')}">
						${oaProjectApproval.accountManager.name}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >客户名称</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'}">
						<form:input path="accountName" htmlEscape="false" maxlength="64" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1')}">
						${oaProjectApproval.accountName}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">所属行业</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'}">
						<form:select id="ownedIndustry" path="ownedIndustry" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
							<form:options items="${fns:getDictList('oa_project_ownedIndustry')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1')}">
						${fns:getDictLabel(oaProjectApproval.ownedIndustry,'oa_project_ownedIndustry','')}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">服务类别</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'}">
						<form:select id="contractType" path="contractType" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
							<form:options items="${fns:getDictList('oa_project_contractType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1')}">
						${fns:getDictLabel(oaProjectApproval.contractType,'oa_project_contractType','')}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">预计金额</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'}">
						<form:input path="expectedMoney" htmlEscape="false" class="form-control number required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1')}">
						${oaProjectApproval.expectedMoney}
					</c:if>
				</td>
			</tr>
			<c:if test="${not empty oaProjectApproval.establishmentTime}">
			<tr>
				<td class="width-15 active">立项日期</td>
				<td class="width-35">
					<fmt:formatDate value="${oaProjectApproval.establishmentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
			</c:if>
			<tr>
				<td class="width-15 active">是否投标</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'}">
						<form:select id="isBid" path="isBid" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1')}">
						${fns:getDictLabel(oaProjectApproval.isBid,'yes_no','')}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">预计签约时间</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'}">
						<input id="bookContractTime" name="bookContractTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
							value="<fmt:formatDate value="${oaProjectApproval.bookContractTime}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1')}">
						<fmt:formatDate value="${oaProjectApproval.bookContractTime}" pattern="yyyy-MM-dd"/>
					</c:if>
				</td>
			</tr>
			<tr id="tr_expectedBidTime">
				<td class="width-15 active">预计投标日期</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'}">
						<input id="expectedBidTime" name="expectedBidTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm "
							value="<fmt:formatDate value="${oaProjectApproval.expectedBidTime}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1')}">
						<fmt:formatDate value="${oaProjectApproval.expectedBidTime}" pattern="yyyy-MM-dd"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">项目背景描述</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'}">
						<form:textarea path="projectBgDescription" htmlEscape="false" rows="4" maxlength="500" class="form-control "/>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1')}">
						${oaProjectApproval.projectBgDescription}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">项目附件</td>
				<td class="width-35">
					<c:if test="${oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1'}">
						<form:hidden id="projectFile" path="projectFile" htmlEscape="false" maxlength="1000" class="form-control"/>
						<sys:ckfinder input="projectFile" type="files" uploadPath="/oa/project/oaProjectApproval" selectMultiple="true"/>
					</c:if>
					<c:if test="${!(oaProjectApproval.isStart ne '1' or oaProjectApproval.act.taskDefKey eq 'exam1')}">
						<form:hidden id="projectFile" path="projectFile" htmlEscape="false" maxlength="1000" class="form-control"/>
						<sys:ckfinder input="projectFile" type="files" uploadPath="/oa/project/oaProjectApproval" selectMultiple="true" readonly="true"/>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>市场部主管</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active">意见</td>
				<td class="width-35"><c:if test="${oaProjectApproval.act.taskDefKey eq 'exam2'}">
					<form:textarea path="marketingDirectorOpinion" htmlEscape="false" rows="4" maxlength="200" class="form-control required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</c:if>
				<c:if test="${oaProjectApproval.act.taskDefKey ne'exam2'}">
					${oaProjectApproval.marketingDirectorOpinion}
				</c:if></td>
			</tr>
			
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>商务部副总</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active">意见</td>
				<td class="width-35"><c:if test="${oaProjectApproval.act.taskDefKey eq 'exam3'}">
					<form:textarea path="viceMinisterOpinion" htmlEscape="false" rows="4" maxlength="200" class="form-control required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</c:if>
				<c:if test="${oaProjectApproval.act.taskDefKey ne 'exam3'}">
					${oaProjectApproval.viceMinisterOpinion}
				</c:if></td>
			</tr>
			<tr>
				<td class="width-15 active">商务支持</td>
				<td class="width-35"><c:if test="${oaProjectApproval.act.taskDefKey eq 'exam3'}">
					<sys:treeselect id="businessManager" name="businessManager.id" value="${oaProjectApproval.businessManager.id}" labelName="businessManager.name" labelValue="${oaProjectApproval.businessManager.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" notAllowSelectParent="true"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</c:if>
				<c:if test="${oaProjectApproval.act.taskDefKey ne 'exam3'}">
					${oaProjectApproval.businessManager.name}
				</c:if></td>
			</tr>
			
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>售前部经理</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active">意见</td>
				<td class="width-35"><c:if test="${oaProjectApproval.act.taskDefKey eq 'exam5'}">
					<form:textarea path="preSalesManagerOpinion" htmlEscape="false" rows="4" maxlength="200" class="form-control required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</c:if>
				<c:if test="${oaProjectApproval.act.taskDefKey ne 'exam5'}">
					${oaProjectApproval.preSalesManagerOpinion}
				</c:if></td>
			</tr>
			<tr>
				<td class="width-15 active">技术支持</td>
				<td class="width-35"><c:if test="${oaProjectApproval.act.taskDefKey eq 'exam5'}">
				<sys:treeselect id="technicalManager" name="technicalManager.id" value="${oaProjectApproval.technicalManager.id}" labelName="technicalManager.name" labelValue="${oaProjectApproval.technicalManager.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" notAllowSelectParent="true"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</c:if>
				<c:if test="${oaProjectApproval.act.taskDefKey ne 'exam5'}">
					${oaProjectApproval.technicalManager.name}
				</c:if></td>
			</tr>
			<c:if test="${oaProjectApproval.act.taskDefKey eq 'exam7'}">
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>项目管理专员</legend></fieldset></div></td>
			</tr>
			
				<tr>
					<td class="width-15 active" >项目名称</td>
					<td class="width-35">
						<form:input path="projectName" htmlEscape="false" maxlength="64" class="form-control required "/>
						<span class="help-inline"><font color="red">*</font> </span>
					</td>
					
					<!-- <td class="width-15 active">项目编号</td>
					<td>
					<c:if test="${oaProjectApproval.act.taskDefKey eq 'exam7'}">
						<form:input path="projectNo" htmlEscape="false" maxlength="64" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${oaProjectApproval.act.taskDefKey ne 'exam7'}">
						${oaProjectApproval.projectNo}
					</c:if>
					</td> -->
				</tr>
			</c:if>
			<c:if test="${oaProjectApproval.act.taskDefKey eq 'exam4' or oaProjectApproval.act.taskDefKey eq 'exam6' or oaProjectApproval.act.taskDefKey eq 'exam7'}">
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>其他环节</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active">意见</td>
				<td class="width-35">
					<form:textarea path="remarkText" htmlEscape="false" rows="4" maxlength="64" class="form-control required" style="width:98%"/>
					<span class="help-inline"><font color="red">*</font></span>
				</td>
			</tr>
			</c:if>
		</table>
		
		<c:if test="${oaProjectApproval.isStart eq '1' and not empty oaProjectApproval.act.procInsId}">
			<act:histoicFlowMobile procInsId="${oaProjectApproval.act.procInsId}" />
		</c:if>
	</form:form>
</body>
</html>