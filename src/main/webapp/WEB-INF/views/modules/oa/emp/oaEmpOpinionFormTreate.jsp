<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户意见管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		/* $(document).ready(function() {
			//$("#name").focus();
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
			$("#istreated").change(function(){  
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
		});
	</script>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/emp/oaEmpOpinion/treateForm?id=${oaEmpOpinion.id}">处理用户意见</a></li>
	</ul><br/> --%>
	<form:form id="inputForm" modelAttribute="oaEmpOpinion" action="${ctx}/oa/emp/oaEmpOpinion/treate" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
<%-- 		<div class="control-group">
			<label class="control-label">意见类别：</label>
			<div class="controls">
			${fns:getDictLabel(oaEmpOpinion.type, 'oa_emp_opinion_type', '')}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">意见标题：</label>
			<div class="controls">
				${oaEmpOpinion.title}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">意见：</label>
			<div class="controls">
				${oaEmpOpinion.opinion}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="file" path="file" htmlEscape="false" maxlength="1000" class="input-xlarge"/>
				<sys:ckfinder input="file" type="files" uploadPath="/oa/emp/oaEmpOpinion" selectMultiple="true" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">处理状态：</label>
			<div class="controls">
			${fns:getDictLabel(oaEmpOpinion.istreated, 'oa_emp_opinion_isTreated', '')}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div> --%>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td  class="width-15 active"><label>意见类别:</label></td>
		         <td class="width-35" >${fns:getDictLabel(oaEmpOpinion.type, 'oa_emp_opinion_type', '')}</td>
		         <td  class="width-15 active"><label>意见标题:</label></td>
		          <td  class="width-35" >${oaEmpOpinion.title}</td>
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label>意见:</label></td>
		         <td class="width-35" >${oaEmpOpinion.opinion}</td>
		         <td  class="width-15 active">	<label>附件:</label></td>
		          <td  class="width-35" ><form:hidden id="file" path="file" htmlEscape="false" maxlength="1000" class="form-control"/>
				<sys:ckfinder input="file" type="files" uploadPath="/oa/emp/oaEmpOpinion" selectMultiple="true" readonly="true"/></td>
		      </tr>	
		       <tr>
		         <td  class="width-15 active"><label>状态:</label></td>
		         <td class="width-35" >${fns:getDictLabel(oaEmpOpinion.istreated, 'oa_emp_opinion_isTreated', '')}</td>
		         <td  class="width-15 active"><label><span class="help-inline">处理意见: 
		         <font color="red">*</font> </span></label></td>
		          <td  class="width-35" ><form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control required"/></td>
		      </tr>		      
		   </tbody>
		   </table>   
		<%-- <div class="form-actions">
			<shiro:hasPermission name="oa:emp:oaEmpOpinion:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保存处理"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div> --%>
	</form:form>
</body>
</html>