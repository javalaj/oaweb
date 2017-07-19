<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>栏目管理</title>
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
	<form:form id="inputForm" modelAttribute="category" action="${ctx}/cms/category/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>归属机构:</label></td>
		         <td class="width-35" > <sys:treeselect id="office" name="office.id" value="${category.office.id}" labelName="office.name" labelValue="${category.office.name}"
					title="机构" url="/sys/office/treeData" cssClass="form-control required"/></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>上级栏目:</label></td>
		         <td  class="width-35" > <sys:treeselect id="category" name="parent.id" value="${category.parent.id}" labelName="parent.name" labelValue="${category.parent.name}"
					title="栏目" url="/cms/category/treeData" extId="${category.id}" cssClass="form-control required"/></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">栏目模型:</label></td>
		         <td class="width-35" ><form:select path="module" class="form-control">
					<form:option value="" label="公共模型"/>
					<form:options items="${fns:getDictList('cms_module')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>栏目名称:</label></td>
		         <td  class="width-35" ><form:input path="name" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">缩略图:</label></td>
		         <td class="width-35" ><form:hidden path="image" htmlEscape="false" maxlength="255" class="form-control"/>
				<sys:ckfinder input="image" type="thumb" uploadPath="/cms/category"/></td>
		         <td  class="width-15 active"><label class="pull-right">链接:</label></td>
		         <td  class="width-35" ><form:input path="href" htmlEscape="false" maxlength="200" class="form-control"/>
				<span class="help-inline">栏目超链接地址，优先级“高”</span></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">目标:</label></td>
		         <td class="width-35" ><form:input path="target" htmlEscape="false" maxlength="200" class="form-control"/>
				<span class="help-inline">栏目超链接打开的目标窗口，新窗口打开，请填写：“_blank”</span></td>
		         <td  class="width-15 active"><label class="pull-right">描述:</label></td>
		         <td  class="width-35" ><form:textarea path="description" htmlEscape="false" rows="4" maxlength="200" class="form-control"/></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">关键字:</label></td>
		         <td class="width-35" ><form:input path="keywords" htmlEscape="false" maxlength="200" class="form-control"/>
				<span class="help-inline">填写描述及关键字，有助于搜索引擎优化</span></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>排序:</label></td>
		         <td  class="width-35" ><form:input path="sort" htmlEscape="false" maxlength="11" class="form-control required"/>
				<span class="help-inline">栏目的排列次序</span></td>
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>在导航中显示:</label></td>
		         <td class="width-35" ><form:radiobuttons path="inMenu" items="${fns:getDictList('show_hide')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required i-checks"></form:radiobuttons><span class="help-inline">是否在导航中显示该栏目</span></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>在分类页中显示列表:</label></td>
		         <td  class="width-35" ><form:radiobuttons path="inList" items="${fns:getDictList('show_hide')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required i-checks"/>
				<span class="help-inline">是否在分类页中显示该栏目的文章列表</span></td>
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label class="pull-right">展现方式:</label></td>
		         <td class="width-35" ><form:select path="showModes" class="form-control">
					<form:option value="" label="默认"/>
					<form:options items="${fns:getDictList('cms_show_modes')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select><span class="help-inline">默认展现方式：有子栏目显示栏目列表，无子栏目显示内容列表。</span></td>
		         <td  class="width-15 active"><label class="pull-right">是否允许评论:</label></td>
		         <td  class="width-35" ><form:radiobuttons path="allowComment" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/></td>
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label class="pull-right">是否需要审核:</label></td>
		         <td class="width-35" ><form:radiobuttons path="isAudit" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/></td>
		         <td  class="width-15 active"><label class="pull-right">自定义列表视图:</label></td>
		         <td  class="width-35" > <form:select path="customListView" class="form-control">
                    <form:option value="" label="默认视图"/>
                    <form:options items="${listViewList}" htmlEscape="false"/>
                </form:select>
                <span class="help-inline">自定义列表视图名称必须以"${category_DEFAULT_TEMPLATE}"开始</span></td>
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label class="pull-right">自定义内容视图:</label></td>
		         <td class="width-35" ><form:select path="customContentView" class="form-control">
                    <form:option value="" label="默认视图"/>
                    <form:options items="${contentViewList}" htmlEscape="false"/>
                </form:select>
                <span class="help-inline">自定义内容视图名称必须以"${article_DEFAULT_TEMPLATE}"开始</span></td>
		         <td  class="width-15 active"><label class="pull-right">自定义视图参数:</label></td>
		         <td  class="width-35" > <form:input path="viewConfig" htmlEscape="true" class="form-control"/>
                <span class="help-inline">视图参数例如: {count:2, title_show:"yes"}</span></td>
		      </tr>
		    </tbody>
		  </table>
	</form:form>
</body>
</html>