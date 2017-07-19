<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工作流变量管理</title>
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
		initVarValueTd();
		$("#value").focus();
		 validateForm = $("#inputForm").validate({
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
		 
		$("#varType").change(function(){
			initVarValueTd();
		}); 
	});
	function initVarValueTd(){
		var value=$("#varType").val();
		if(value=='0'){
			$("#tr_0").show();
			$("#tr_1").hide();
			$("#tr_2").hide();
		}else if(value=='1'){
			$("#tr_0").hide();
			$("#tr_1").show();
			$("#tr_2").hide();
		}else if(value=='2'){
			$("#tr_0").hide();
			$("#tr_1").hide();
			$("#tr_2").show();
		}else{
			$("#tr_0").hide();
			$("#tr_1").hide();
			$("#tr_2").hide();
		}
	} 
	</script>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/workflow/sysWorkflowVar/">工作流变量列表</a></li>
		<li class="active"><a href="${ctx}/sys/workflow/sysWorkflowVar/form?id=${sysWorkflowVar.id}">工作流变量<shiro:hasPermission name="sys:workflow:sysWorkflowVar:edit">${not empty sysWorkflowVar.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:workflow:sysWorkflowVar:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/> --%>
	<form:form id="inputForm" modelAttribute="sysWorkflowVar" action="${ctx}/sys/workflow/sysWorkflowVar/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>				
		<%-- <div class="form-actions">
			<shiro:hasPermission name="sys:workflow:sysWorkflowVar:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div> --%>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-table-noborder">
		   <tbody>
		      <tr>
		         <td>	
		         	<label>流程名称: <font color="red">*</font></label>
		         </td>
		         <td>
		         	<form:input path="workflowName" htmlEscape="false" maxlength="64" class="form-control required"/>
		         </td>
		      </tr>
		      <tr>
		         <td>	
		         	<label>流程标识: <font color="red">*</font></label>
		         </td>
		         <td>
		         	<form:input path="workflowIdentification" htmlEscape="false" maxlength="64" class="form-control required"/>
		         </td>
		      </tr>
		      <tr>
		         <td>	
		         	<label>变量描述: <font color="red">*</font></label>
		         </td>
		         <td>
		         	<form:input path="varDescription" htmlEscape="false" maxlength="64" class="form-control required"/>
		         </td>
		      </tr>
		      <tr>
		         <td>	
		         	<label>变量键名: <font color="red">*</font></label>
		         </td>
		         <td>
		         	<form:input path="varName" htmlEscape="false" maxlength="64" class="form-control required"/>
		         </td>
		      </tr>
		      <tr>
		         <td>	
		         	<label>变量类型: <font color="red">*</font></label>
		         </td>
		         <td>
		         	<form:select path="varType" class="form-control required">
						<form:options items="${fns:getDictList('sys_workflow_var_var_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				 </td>
		      </tr>
		      <tr id="tr_0">
		         <td>	
		         	<label>自定义值: <font color="red">*</font></label>
		         </td>
		         <td>
		         	<form:input path="varValue" htmlEscape="false" maxlength="1000" class="form-control required"/>
		         </td>
		      </tr>
		      <tr id="tr_1">
		         <td>	
		         	<label>用户: <font color="red">*</font></label>
		         </td>
		         <td>
		         	<sys:treeselect id="varValueUser" name="varValueUser.id" 
									value="${sysWorkflowVar.varValueUser.id}" 
									labelName="varValueUser.name" 
									labelValue="${sysWorkflowVar.varValueUser.name}" 
									title="人员" 
									url="/sys/office/treeData?type=3&isAll=true" 
									cssClass="form-control required" 
									allowClear="true" 
									notAllowSelectParent="true"/>
		         </td>
		      </tr>
		      <tr id="tr_2">
		         <td>	
		         	<label>角色: <font color="red">*</font></label>
		         </td>
		         <td>
		         	<sys:treeselect id="varValueRole" name="varValueRole.id" 
									value="${sysWorkflowVar.varValueRole.id}" 
									labelName="varValueRole.name" 
									labelValue="${sysWorkflowVar.varValueRole.name}" 
									title="角色" 
									url="/sys/role/treeData" 
									cssClass="form-control required" 
									allowClear="true" 
									notAllowSelectParent="true"/>
		         </td>
		      </tr>
	          <tr>
		         <td>	
		         	<label>备注信息:</label>
		         </td>
		         <td>
		         	<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control"/>
		         </td>         
		      </tr>
		   </tbody>
		   </table>   
	</form:form>
</body>
</html>