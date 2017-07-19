<%@page import="org.activiti.engine.repository.Model"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>供应商管理详情</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
var validateForm;
function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
  if(validateForm.form()){
	  $("#inputForm").submit();
	  return true;
  }
  return false;
}
	$(document).ready(
		function() {
			//$("#name").focus();
			validateForm = $("#inputForm").validate({
				submitHandler : function(form) {
					oaLoading('正在提交，请稍候...');
					form.submit();
				},
				errorContainer : "#messageBox",
				errorPlacement : function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")
							|| element.is(":radio")
							|| element.parent().is(
									".input-append")) {
						error.appendTo(element.parent()
								.parent());
					} else {
						error.insertAfter(element);
					}
				}
		});
	});	
</script>
</head>

<body>	
<div class="ibox-content">
	<form:form id="inputForm" modelAttribute="supmanagement" action="${ctx}/oa/supmanagement/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
		   <tbody>
		      <tr>
		         <td><label>组织机构代码： <font color="red">*</font></label></td>
		         <td><form:input path="orgCode" htmlEscape="false" maxlength="100" class="form-control required"  id="orgCode"/><span id="tip" style="color: red"></span></td>		         
		      </tr>
		      <tr>		        
		         <td><label>供应商名称: <font color="red">*</font></label></td>
		         <td><form:input path="supName" htmlEscape="false" maxlength="100" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td><label>单位号码: <font color="red">*</font></label></td>
		         <td><form:input path="telephone" htmlEscape="false" maxlength="64" class="form-control required" id="phone"/></td>		         
		      </tr>
		      <tr>		        
		         <td><label>税务登记号: <font color="red">*</font></label></td>
		         <td><form:input path="taxNumber" htmlEscape="false" maxlength="64" class="form-control required" /></td>
		      </tr>
		      <tr>
		         <td><label>单位联系地址: <font color="red">*</font></label></td>
		         <td><form:input path="address" htmlEscape="false" maxlength="45" class="form-control required"/></td>		        
		      </tr>
		      <tr>		         
		         <td><label>供应商联系人: <font color="red">*</font></label></td>
		         <td><form:input path="suppliercontact" htmlEscape="false" maxlength="45" class="form-control required"/></td>
		      </tr>
		       <tr>
		       	 <td><label>创建者:</label></td>
 		       	 <td><input type="text" value="${createname}" maxlength="45" disabled="disabled" class="form-control required"/></td>		       	 
		      </tr>
		      <tr>		       	
		       	 <td><label>创建时间:</label></td>
		         <td><span class="lbl"><fmt:formatDate value="${supmanagement.createDate}" type="both" dateStyle="full"/></span></td>
		      </tr>
		      <tr>
		       	 <td><label>更新者:</label></td>
		       	 <td><input type="text" value="${updatename }" class="form-control required"/></td>		       	 
		      </tr>
		      <tr>		       	 
		       	 <td><label>更新时间:</label></td>
		         <td><span class="lbl"><fmt:formatDate value="${supmanagement.updateDate}" type="both" dateStyle="full"/></span></td>
		      </tr>
		      <tr>
		       	 <td><label>备注信息:</label></td>
		         <td><form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control"/></td>
		      </tr>
			 </tbody>
		</table>
	</form:form>	
</div>		
</body>
</html>