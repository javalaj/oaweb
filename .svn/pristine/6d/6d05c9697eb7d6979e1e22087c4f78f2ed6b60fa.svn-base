<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部署流程 - 流程管理</title>
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
		$("#name").focus();
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
	<div class="wrapper wrapper-content">
	<form id="inputForm" action="${ctx}/act/process/deploy" method="post" enctype="multipart/form-data" class="form-horizontal">		
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-table-noborder">
		   <tbody>
		      <tr>
		         <td><label>流程分类: <font color="red">*</font></label></td>
		         <td><select id="category" name="category" class="selectpicker m-b required" data-style="btn-inverse" data-live-search="true">
					<c:forEach items="${fns:getDictList('act_category')}" var="dict">
						<option value="${dict.value}">${dict.label}</option>
					</c:forEach>
				</select></td>
		         <td><label>流程文件: <font color="red">*</font></label></td>
		         <td><input type="file" id="file" name="file" class="required form-control"/>
				<span class="help-inline">支持文件格式：zip、bar、bpmn、bpmn20.xml</span></td>
		      </tr>
		     </tbody></table>
	</form>
	</div>
</body>
</html>
