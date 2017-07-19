<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户意见管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		/* $(document).ready(function() {
			
			$("#inputForm").validate({
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
			
			$("#type").change(function(){  
				$(this).valid();  
			});
		}); */
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(document).ready(function() {
			$("#value").focus();
			 validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					//loading('正在提交，请稍等...');
					form.submit();
					oaLoading('操作正在进行中，请耐心等待');
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
		});
	</script>
	<style>
		.table.myoa-newitem-table>tbody>tr>td {
			border-top-width: 0;
		}
		.table.myoa-newitem-table>tbody>tr>td:nth-child(odd) {
			width: 20%;
			text-align: right;
		}
		.table.myoa-newitem-table>tbody>tr>td:nth-child(even) {
			width: 80%;
		}
	</style>
</head>
<body>
	<!-- <div style='text-align:left'><fieldset><legend>用户意见提交</legend></fieldset></div> -->
	<form:form id="inputForm" modelAttribute="oaEmpOpinion" action="${ctx}/oa/emp/oaEmpOpinion/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
		<%-- <div class="control-group">
			<label class="control-label">意见类别：</label>
			<div class="controls">
				<form:select path="type" class="input-medium required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('oa_emp_opinion_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">意见标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">意见：</label>
			<div class="controls">
				<form:textarea path="opinion" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" maxlength="1000" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/oa/emp/oaEmpOpinion" selectMultiple="true"/>
			</div>
		</div> --%>
		<%-- <div class="form-actions">
			<shiro:hasPermission name="oa:emp:oaEmpOpinion:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="提交"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div> --%>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
		   <tbody>
		      <tr>
		         <td >	<label class="pull-right"><font color="red">*</font> 意见类别:</label></td>
		         <td ><form:select path="type" class="selectpicker required" data-style="btn-inverse"  data-live-search="true">
					<form:options items="${fns:getDictList('oa_emp_opinion_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select></td>
		      </tr>
		      <tr>
		         <td >	<label class="pull-right"><font color="red">*</font>意见标题:</label></td>
		          <td ><form:input path="title" htmlEscape="false" maxlength="64" class="form-control required"/></td>
		      </tr>
		       <tr>
		         <td >	<label class="pull-right"><font color="red">*</font>意见:</label></td>
		         <td ><form:textarea path="opinion" htmlEscape="false" rows="4" maxlength="255" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td >	<label class="pull-right">附件:</label></td>
		          <td ><form:hidden id="file" path="file" htmlEscape="false" maxlength="1000" class="form-control"/>
				<sys:ckfinder input="file" type="files" uploadPath="/oa/emp/oaEmpOpinion" selectMultiple="true"/></td>
		      </tr>		      
		   </tbody>
		   </table>   
	</form:form>
</body>
</html>