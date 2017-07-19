<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>协议框架合同管理</title>
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
			$(".selectpicker").selectpicker({noneSelectedText:'请选择'});
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
			
			$("#projectId").change(function(){
				reloadOaProject($(this).val());
				$(this).valid();  
			});
			
			reloadOaProject($("#projectId").val());
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
<body>
	<form:form id="inputForm" modelAttribute="oaContractProtocol" action="${ctx}/oa/contract/oaContractProtocol/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table" >
			<c:if test="${not empty oaContractProtocol.contractNo}">
				<tr>
					<td>合同编号</td>
					<td>
						${oaContractProtocol.contractNo}
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
				<td>合作单位</td>
				<td>
					<form:input path="cooperationUnits" htmlEscape="false" maxlength="64" class="form-control "/>
				</td>
			</tr>
			<tr>
				<td>合作内容</td>
				<td>
					<form:textarea path="cooperationContents" htmlEscape="false" rows="4" maxlength="1000" class="form-control "/>
				</td>
			</tr>
			<tr>
				<td>合同签订日期</td>
				<td>
					<input name="contractTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm "
						value="<fmt:formatDate value="${oaContractProtocol.contractTime}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</td>
			</tr>
			<tr>
				<td>合同截止日期</td>
				<td>
					<input name="contractEndTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm "
						value="<fmt:formatDate value="${oaContractProtocol.contractEndTime}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</td>
			</tr>
			<tr>
				<td>联系人</td>
				<td>
					<form:input path="contact" htmlEscape="false" maxlength="64" class="form-control "/>
				</td>
			</tr>
			<tr>
				<td>联系电话</td>
				<td>
					<form:input path="contactNumber" htmlEscape="false" maxlength="64" class="form-control "/>
				</td>
			</tr>
			<tr>
				<td>合同归档情况</td>
				<td>
					<form:radiobuttons path="filingStatus" items="${fns:getDictList('oa_contract_protocol_filingStatus')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/>
				</td>
			</tr>
			<tr>
				<td>合同电子版</td>
				<td>
					<form:hidden id="contractElectronicVersion" path="contractElectronicVersion" htmlEscape="false" maxlength="1000" class="form-control"/>
					<sys:ckfinder input="contractElectronicVersion" type="files" uploadPath="/oa/contract/oaContractProtocal" selectMultiple="false"/>
				</td>
			</tr>
			<tr>
				<td>合同扫描件</td>
				<td>
					<form:hidden id="contractScanAttachment" path="contractScanAttachment" htmlEscape="false" maxlength="1000" class="form-control"/>
					<sys:ckfinder input="contractScanAttachment" type="files" uploadPath="/oa/contract/oaContractProtocal" selectMultiple="false"/>
				</td>
			</tr>
			<tr>
				<td>合同状态</td>
				<td>
					<form:select path="contractStatus" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('oa_contract_protocol_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
			</tr>
			<tr>
				<td>备注信息</td>
				<td>
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>