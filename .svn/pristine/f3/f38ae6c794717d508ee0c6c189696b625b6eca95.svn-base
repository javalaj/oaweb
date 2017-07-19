<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>站点管理</title>
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
	});
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="site" action="${ctx}/cms/site/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">站点名称:</label></td>
		         <td class="width-35" ><form:input path="name" htmlEscape="false" maxlength="200" class="form-control required"/></td>
		         <td  class="width-15 active"><label class="pull-right">站点标题:</label></td>
		         <td  class="width-35" > <form:input path="title" htmlEscape="false" maxlength="200" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">站点logo:</label></td>
		         <td class="width-35" ><form:hidden path="logo" htmlEscape="false" maxlength="255" class="form-control"/>
				<sys:ckfinder input="logo" type="images" uploadPath="/cms/site"/>
				<span class="help-inline">建议Logo大小：1000 × 145（像素）</span></td>
		         <td  class="width-15 active"><label class="pull-right">描述:</label></td>
		         <td  class="width-35" ><form:textarea path="description" htmlEscape="false" rows="4" maxlength="200" class="form-control"/></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">关键字:</label></td>
		         <td class="width-35" ><form:input path="keywords" htmlEscape="false" maxlength="200" class="form-control"/>
				<span class="help-inline">填写描述及关键字，有助于搜索引擎优化</span></td>
		         <td  class="width-15 active"><label class="pull-right">默认主题:</label></td>
		         <td  class="width-35" ><form:select path="theme" class="form-control">
					<form:options items="${fns:getDictList('cms_theme')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">版权信息:</label></td>
		         <td class="width-35" ><form:textarea id="copyright" htmlEscape="true" path="copyright" rows="4" maxlength="200" class="form-control"/>
				<%-- <sys:ckeditor replace="copyright" uploadPath="/cms/site" /> --%></td>
		         <td  class="width-15 active"><label class="pull-right">描述:</label></td>
		         <td  class="width-35" ><form:input path="customIndexView" htmlEscape="false" maxlength="200" class="form-control"/></td>
		      </tr>		      
		    </tbody>
		  </table>		
	</form:form>
</body>
</html>