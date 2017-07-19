<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生成方案管理</title>
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
<body class="gray-bg  pace-done">
	<%-- <ul class="nav nav-tabs">
		<li><a href="${ctx}/gen/genScheme/">生成方案列表</a></li>
		<li class="active"><a href="${ctx}/gen/genScheme/form?id=${genScheme.id}">生成方案<shiro:hasPermission name="gen:genScheme:edit">${not empty genScheme.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="gen:genScheme:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/> --%>
	
<%-- 	<i id="btnMenu" class="icon-th-list" style="cursor:pointer;float:right;margin:10px;"></i>
	<div id="menuContent"></div>
	<div class="pace  pace-inactive">
		<div class="pace-progress" style="width: 100%;" data-progress-text="100%" data-progress="99">
	  		<div class="pace-progress-inner"></div>
		</div>
		<div class="pace-activity"></div>
	</div>
	
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>生成方案${not empty genScheme.id?'修改':'添加'}</h5>
		<div class="ibox-tools">
			<a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<!-- <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
				<i class="fa fa-wrench"></i>
			</a> -->
			<!-- <ul class="dropdown-menu dropdown-user">
				<li><a href="#">选项1</a>
				</li>
				<li><a href="#">选项2</a>
				</li>
			</ul> -->
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a>
		</div>
	</div>
	
	<div class="ibox-content" style="display: block;">
	
<!-- 0:隐藏tip, 1隐藏box,不设置显示全部 -->
<script type="text/javascript">top.$.jBox.closeTip();</script> --%>

	<form:form id="inputForm" modelAttribute="genScheme" action="${ctx}/gen/genScheme/save" method="post" class="form-horizontal">
		<form:hidden path="id"/><form:hidden path="flag"/>
		<sys:message content="${message}"/>
		<%-- <div class="control-group">
			<label class="control-label">方案名称:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="required form-control" style="width: 15%;"/>
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">模板分类:</label>
			<div class="controls">
				<form:select path="category" class="required form-control"  style="width: 20%;">
					<form:options items="${config.categoryList}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">
					生成结构：{包名}/{模块名}/{分层(dao,entity,service,web)}/{子模块名}/{java类}
				</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">生成包路径:</label>
			<div class="controls">
				<form:input path="packageName" htmlEscape="false" maxlength="500" class="required form-control" style="width: 15%;"/>
				<span class="help-inline">建议模块包：com.thinkgem.jeesite.modules</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">生成模块名:</label>
			<div class="controls">
				<form:input path="moduleName" htmlEscape="false" maxlength="500" class="required form-control" style="width: 15%;"/>
				<span class="help-inline">可理解为子系统名，例如 sys</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">生成子模块名:</label>
			<div class="controls">
				<form:input path="subModuleName" htmlEscape="false" maxlength="500" class="form-control"  style="width: 15%;"/>
				<span class="help-inline">可选，分层下的文件夹，例如 </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">生成功能描述:</label>
			<div class="controls">
				<form:input path="functionName" htmlEscape="false" maxlength="500" class="required form-control"  style="width: 15%;"/>
				<span class="help-inline">将设置到类描述</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">生成功能名:</label>
			<div class="controls">
				<form:input path="functionNameSimple" htmlEscape="false" maxlength="500" class="required form-control" style="width: 15%;"/>
				<span class="help-inline">用作功能提示，如：保存“某某”成功</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">生成功能作者:</label>
			<div class="controls">
				<form:input path="functionAuthor" htmlEscape="false" maxlength="500" class="required form-control" style="width: 15%;"/>
				<span class="help-inline">功能开发者</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">业务表名:</label>
			<div class="controls">
				<form:select path="genTable.id" class="required form-control" style="width: 20%;">
					<form:options items="${tableList}" itemLabel="nameAndComments" itemValue="id" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">生成的数据表，一对多情况下请选择主表。</span>
			</div>
		</div>
		<div class="control-group hide">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">生成选项:</label>
			<div class="controls">
				<form:checkbox path="replaceFile" label="是否替换现有文件" cssClass="i-checks"/>
			</div>
		</div> --%>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>方案名称:</label></td>
		         <td class="width-35" > <form:input path="name" htmlEscape="false" maxlength="200" class="required form-control" /></td>
		         <td  class="width-15 active"><label class="pull-right">模板分类:</label></td>
		         <td  class="width-35" ><form:select path="category" class="required form-control"  >
					<form:options items="${config.categoryList}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">
					生成结构：{包名}/{模块名}/{分层(dao,entity,service,web)}/{子模块名}/{java类}
				</span></td>
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>生成包路径:</label></td>
		         <td class="width-35" > <form:input path="packageName" htmlEscape="false" maxlength="500" class="required form-control" />
				<span class="help-inline">建议模块包：com.thinkgem.jeesite.modules</span></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>生成模块名:</label></td>
		         <td  class="width-35" ><form:input path="moduleName" htmlEscape="false" maxlength="500" class="required form-control" />
				<span class="help-inline">可理解为子系统名，例如 sys</span></td>
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label class="pull-right">生成子模块:</label></td>
		         <td class="width-35" ><form:input path="subModuleName" htmlEscape="false" maxlength="500" class="form-control"  />
				<span class="help-inline">可选，分层下的文件夹，例如 </span></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>生成功能描述:</label></td>
		         <td  class="width-35" ><form:input path="functionName" htmlEscape="false" maxlength="500" class="required form-control"  />
				<span class="help-inline">将设置到类描述</span></td>
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>生成功能名:</label></td>
		         <td class="width-35" ><form:input path="functionNameSimple" htmlEscape="false" maxlength="500" class="required form-control" />
				<span class="help-inline">用作功能提示，如：保存“某某”成功</span></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>生成功能作者:</label></td>
		         <td  class="width-35" ><form:input path="functionAuthor" htmlEscape="false" maxlength="500" class="required form-control" />
				<span class="help-inline">功能开发者</span></td>
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>业务表名:</label></td>
		         <td class="width-35" ><form:select path="genTable.id" class="required form-control" >
					<form:options items="${tableList}" itemLabel="nameAndComments" itemValue="id" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">生成的数据表，一对多情况下请选择主表。</span></td>
		         <td  class="width-15 active"><label class="pull-right">备注:</label></td>
		         <td  class="width-35" ><form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="form-control"/></td>
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label class="pull-right">生成选项:</label></td>
		         <td class="width-35"  colspan="3"><form:checkbox path="replaceFile" label="是否替换现有文件" cssClass="i-checks"/></td>
		        
		      </tr>
		      
		      </tbody></table>
		<%-- <div class="form-actions">
			<shiro:hasPermission name="gen:genScheme:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保存方案" onclick="$('#flag').val('0');"/>&nbsp;
				<input id="btnSubmit" class="btn btn-danger" type="submit" value="保存并生成代码" onclick="$('#flag').val('1');"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div> --%>
	</form:form>
	
<!-- 		</div>
	</div>
</div> -->
</body>
</html>
