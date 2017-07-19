<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员入职信息管理</title>
	<meta name="decorator" content="default"/>
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnPrint").click(function(){
				var src="${ctx}/oa/emp/oaEmpJoinApproval/print?id=${oaEmpJoinApproval.id}";
				top.layer.open({
					  type: 2, 
					  area: ["100%","100%"],
				      title: "打印预览",
			          maxmin: true, //开启最大化最小化按钮
			          shadeClose: true,
					  content: src //这里content是一个普通的String
				});
			});
			
			$("#btnViewCommen").click(function(){
				var src="${ctx}/act/process/resource/read?procDefId=${fns:getWorkflowVarValue('oa_emp_join_approval','procDefId','')}&resType=image";
				if("${not empty oaEmpJoinApproval.procInsId}"=="true"){
					src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_emp_join_approval','procDefId','')}/${oaEmpJoinApproval.procInsId}";
				}
				top.layer.open({
					  type: 2, 
					  area: ["100%","100%"],
				      title: "员工入职流程图",
			          maxmin: true, 
			          shadeClose: true,
					  content: src 
				});		
				
			});
			
			$("#btnView").click(function(){
				var src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_emp_join_approval','procDefId','')}/${oaEmpJoinApproval.procInsId}";
				top.layer.open({
					  type: 2, 
					  area: ["100%","100%"],
				      title: "员工入职流程图",
			          maxmin: true, //开启最大化最小化按钮
			          shadeClose: true,
					  content: src //这里content是一个普通的String
				});				
			});
			
			$("#inputForm").validate({
				rules: {
					"office.name": {
				        required: true
				     }
				},
			    messages: {
			        "office.name": {
			          required: "必填信息",
			        }
			    },
				submitHandler: function(form){
					if($("#flag").val()=="true"&&("${oaEmpJoinApproval.isStart}"!="1"||"${oaEmpJoinApproval.act.taskDefKey}"=="exam1")){
						if("${fns:getOfficePrimaryPersonLoginNameOfUser()}"!=""){
							loading('操作正在进行，请稍等...');
							form.submit();
						}else{
							showTip("<找不到当前登录用户所属的部门主负责人>");
						}
					}else{
						loading('操作正在进行，请稍等...');
						form.submit();
					}
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
			
			$("#officeName").change(function(){  
				$(this).valid();  
			});
			$("#degrees").change(function(){  
				$(this).valid();  
			});
			$("#sex").change(function(){  
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
	<form:form id="inputForm" modelAttribute="oaEmpJoinApproval" action="${mctx}/oa/emp/oaEmpJoinApproval/save" method="post" class="form-horizontal">
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
					<c:if test="${empty oaEmpJoinApproval.act.taskDefKey}">
						<input id="btnCancel" class="btn" type="button" value="返 回"  onclick="history.go(-1)"/>&nbsp;
					</c:if>
					<c:if test="${not empty oaEmpJoinApproval.act.taskDefKey}">
						<input id="btnCancel" class="btn" type="button" value="返 回"  onclick="history.go(-1)"/>&nbsp;
					</c:if>
					<c:if test="${empty oaEmpJoinApproval.act.taskDefKey}">
						<input id="btnViewCommen" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
					</c:if>
					<c:if test="${not empty oaEmpJoinApproval.act.taskDefKey}">
						<input id="btnView" class="btn btn-primary" type="button" value="流程追踪"/>&nbsp;
					</c:if>
					<shiro:hasPermission name="oa:emp:oaEmpJoinApproval:edit">
						<c:if test="${empty oaEmpJoinApproval.act.taskDefKey}">
							<c:if test="${oaEmpJoinApproval.isStart ne '1'}">
								<input id="btnSave" class="btn btn-primary" type="submit" value="保存" onclick="$('#flag').val('save')"/>&nbsp;
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交申请"  onclick="$('#flag').val('true')"/>&nbsp;
							</c:if>
						</c:if>
						<c:if test="${not empty oaEmpJoinApproval.act.taskDefKey}">
							<c:if test="${oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
								<input id="btnSave" class="btn btn-primary" type="submit" value="保存" onclick="$('#flag').val('save')"/>&nbsp;
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="重新提交申请"  onclick="$('#flag').val('true')"/>&nbsp;
								<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="销毁申请" onclick="$('#flag').val('false')"/>&nbsp;
							</c:if>
							<c:if test="${oaEmpJoinApproval.act.taskDefKey ne 'exam1'}">
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="同意"  onclick="$('#flag').val('true')"/>&nbsp;
								<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="驳回" onclick="$('#flag').val('false')"/>&nbsp;
							</c:if>
						</c:if>
					</shiro:hasPermission>
				</div></td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="6"><div style='text-align:left'><fieldset><legend>员工入职审批表</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" style="width:25%">姓名</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<form:input path="empName" htmlEscape="false" maxlength="64" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${oaEmpJoinApproval.empName}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >性别</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<form:select path="sex" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
							<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline"><font color="red">*</font></span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${fns:getDictLabel(oaEmpJoinApproval.sex,'sex','')}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >民族</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<form:input path="nation" htmlEscape="false" maxlength="64" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font></span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${oaEmpJoinApproval.nation}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >职称</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<form:input path="title" htmlEscape="false" maxlength="64" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font></span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${oaEmpJoinApproval.title}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >归属部门</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<sys:treeselect id="office" name="office.id" value="${empty oaEmpJoinApproval.office.id?fns:getOfficeList().get(0).id:oaEmpJoinApproval.office.id}" labelName="office.name" labelValue="${empty oaEmpJoinApproval.office.name?fns:getOfficeList().get(0).name:oaEmpJoinApproval.office.name}"
							title="部门" url="/sys/office/treeData?type=2" cssClass="form-control required" allowClear="true" notAllowSelectParent="false"/>
						<span class="help-inline"><font color="red">*</font></span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${oaEmpJoinApproval.office.name}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >职务</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<form:input path="duty" htmlEscape="false" maxlength="64" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font></span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${oaEmpJoinApproval.duty}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >最高学历</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<form:select path="degrees" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
							<form:options items="${fns:getDictList('oa_emp_degrees')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline"><font color="red">*</font></span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${fns:getDictLabel(oaEmpJoinApproval.degrees,'oa_emp_degrees','')}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >身份证号</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<form:input path="idNumber" htmlEscape="false" maxlength="64" class="form-control "/>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${oaEmpJoinApproval.idNumber}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >入职时间</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<input name="entryTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm  required"
							value="<fmt:formatDate value="${empty oaEmpJoinApproval.entryTime?fns:getDatetime():oaEmpJoinApproval.entryTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						<fmt:formatDate value="${oaEmpJoinApproval.entryTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >联系电话</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<form:input path="telephone" htmlEscape="false" maxlength="64" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font></span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${oaEmpJoinApproval.telephone}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >现家庭住址</td>
				<td colspan="3">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<form:input path="homeAddress" htmlEscape="false" maxlength="64" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${oaEmpJoinApproval.homeAddress}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >面试官意见</td>
				<td colspan="5">
					<c:if test="${oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1'}">
						<form:textarea path="examinerOpinion" style="width:99%" htmlEscape="false" rows="2" maxlength="180" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${!(oaEmpJoinApproval.isStart ne '1' or oaEmpJoinApproval.act.taskDefKey eq 'exam1')}">
						${oaEmpJoinApproval.examinerOpinion}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="6"><div style='text-align:left'><fieldset><legend>入职申请提交人部门负责人审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >意见</td>
				<td colspan="5">
					<c:if test="${oaEmpJoinApproval.act.taskDefKey eq 'exam2'}">
						<form:textarea path="deptMinisterOpinion" htmlEscape="false" rows="2" maxlength="180" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${oaEmpJoinApproval.act.taskDefKey ne'exam2'}">
						${oaEmpJoinApproval.deptMinisterOpinion}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="6"><div style='text-align:left'><fieldset><legend>入职员工归属部门负责人审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >意见</td>
				<td colspan="5">
					<c:if test="${oaEmpJoinApproval.act.taskDefKey eq 'exam22'}">
						<form:textarea path="empDeptMinisterOpinion" htmlEscape="false" rows="2" maxlength="180" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${oaEmpJoinApproval.act.taskDefKey ne'exam22'}">
						${oaEmpJoinApproval.empDeptMinisterOpinion}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="6"><div style='text-align:left'><fieldset><legend>人力资源审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >试用期工资</td>
				<td class="width-35">
					<c:if test="${oaEmpJoinApproval.act.taskDefKey eq 'exam3'}">
						<form:input path="probationSalary" htmlEscape="false" maxlength="64" min="0" max="9999999" class="form-control required number"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${oaEmpJoinApproval.act.taskDefKey ne'exam3'}">
						${oaEmpJoinApproval.probationSalary}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >正式期工资</td>
				<td colspan="3">
					<c:if test="${oaEmpJoinApproval.act.taskDefKey eq 'exam3'}">
						<form:input path="regularSalary" htmlEscape="false" maxlength="64" min="0" max="9999999" class="form-control required number"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${oaEmpJoinApproval.act.taskDefKey ne'exam3'}">
						${oaEmpJoinApproval.regularSalary}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >意见</td>
				<td colspan="5">
					<c:if test="${oaEmpJoinApproval.act.taskDefKey eq 'exam3'}">
						<form:textarea path="hrOpinion" htmlEscape="false" rows="2" maxlength="180" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${oaEmpJoinApproval.act.taskDefKey ne'exam3'}">
						${oaEmpJoinApproval.hrOpinion}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="6"><div style='text-align:left'><fieldset><legend>行政人事副总审批项</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >意见</td>
				<td colspan="5">
					<c:if test="${oaEmpJoinApproval.act.taskDefKey eq 'exam4'}">
						<form:textarea path="hrMinisterOpinion" htmlEscape="false" rows="2" maxlength="180" class="form-control required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:if>
					<c:if test="${oaEmpJoinApproval.act.taskDefKey ne'exam4'}">
						${oaEmpJoinApproval.hrMinisterOpinion}
					</c:if>
				</td>
			</tr>
		</table>
		<c:if test="${oaEmpJoinApproval.isStart eq '1' and not empty oaEmpJoinApproval.act.procInsId}">
			<act:histoicFlowMobile procInsId="${oaEmpJoinApproval.act.procInsId}" />
		</c:if>
	</form:form>
</body>
</html>