<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>链接管理</title>
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
	<%-- <ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/link/?category.id=${link.category.id}">链接列表</a></li>
		<li class="active"><a href="<c:url value='${fns:getAdminPath()}/cms/link/form?id=${link.id}&category.id=${link.category.id}'><c:param name='category.name' value='${link.category.name}'/></c:url>">链接<shiro:hasPermission name="cms:link:edit">${not empty link.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:link:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/> --%>
	<form:form id="inputForm" modelAttribute="link" action="${ctx}/cms/link/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">归属栏目:</label></td>
		         <td class="width-35" ><sys:treeselect id="category" name="category.id" value="${link.category.id}" labelName="category.name" labelValue="${link.category.name}"
					title="栏目" url="/cms/category/treeData" module="link" selectScopeModule="true" notAllowSelectRoot="false" notAllowSelectParent="true" cssClass="form-control required"/></td>
		         <td  class="width-15 active"><label class="pull-right">名称:</label></td>
		         <td  class="width-35" > <form:input path="title" htmlEscape="false" maxlength="200" class="form-control required"/>
				&nbsp;<label>颜色:</label>
				<form:select path="color" class="form-control required">
					<form:option value="" label="默认"/>
					<form:options items="${fns:getDictList('color')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">链接图片:</label></td>
		         <td class="width-35" ><form:hidden path="image" htmlEscape="false" maxlength="255" class="form-control"/>
				<sys:ckfinder input="image" type="images" uploadPath="/cms/link" selectMultiple="false"/></td>
		         <td  class="width-15 active"><label class="pull-right">链接地址:</label></td>
		         <td  class="width-35" ><form:input path="href" htmlEscape="false" maxlength="255" class="form-control"/></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">权重:</label></td>
		         <td class="width-35" ><form:input path="weight" htmlEscape="false" maxlength="200" class="form-control required "/>&nbsp;
				<span>
					<input id="weightTop" type="checkbox" class="i-checks" onclick="$('#weight').val(this.checked?'999':'0')"><label for="weightTop">置顶</label>
				</span>
				&nbsp;过期时间：
				<input id="weightDate" name="weightDate" type="text" readonly="readonly" maxlength="20" class="form-control"
					value="<fmt:formatDate value="${link.weightDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
				<span class="help-inline">数值越大排序越靠前，过期时间可为空，过期后取消置顶。</span></td>
		         <td  class="width-15 active"><label class="pull-right">备注:</label></td>
		         <td  class="width-35" >
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="form-control"/></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">状态:</label></td>
		         <td colspan="3" style="text-align: center;" class="width-35" ><form:radiobuttons path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required i-checks"/>
					<span class="help-inline"></span></td>
		         
		      </tr>	   
		    </tbody>
		  </table>		
	</form:form>
</body>
</html>