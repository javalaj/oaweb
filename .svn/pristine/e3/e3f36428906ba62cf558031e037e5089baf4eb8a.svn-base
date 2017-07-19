<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务表管理</title>
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
			$("#comments").focus();
			validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					$("input[type=checkbox]").each(function(){
						$(this).after("<input type=\"hidden\" name=\""+$(this).attr("name")+"\" value=\""
								+($(this).attr("checked")?"1":"0")+"\"/>");
						$(this).attr("name", "_"+$(this).attr("name"));
					});
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
	<style type="text/css">
		legend 	{
    				color: #77777D;
				}
	</style>
</head>
<body>
	<c:if test="${not empty genTable.name and empty genTable.id}">
	<i id="btnMenu" class="icon-th-list" style="cursor:pointer;float:right;margin:10px;"></i>
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
		<h5>业务表${not empty genTable.id?'修改':'添加'}</h5>
		<div class="ibox-tools">
			<a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<!-- <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
				<i class="fa fa-wrench"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
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
<script type="text/javascript">top.$.jBox.closeTip();</script>
</c:if>	
	<c:choose>
		<c:when test="${empty genTable.name}">
			<form:form id="inputForm" modelAttribute="genTable" action="${ctx}/gen/genTable/form" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<br/>
				<div class="control-group">
					<label class="control-label">表名:</label>
					<div class="controls">
						<form:select path="name" class="form-control" style="width: 50%;">
							<form:options items="${tableList}" itemLabel="nameAndComments" itemValue="name" htmlEscape="false"/>
						</form:select>
					</div>
					<!-- <div class="form-actions">
						<input id="btnSubmit" class="btn btn-primary" type="submit" value="下一步"/>&nbsp;
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
					</div> -->
				</div>
			</form:form>
		</c:when>
		<c:otherwise>
			<form:form id="inputForm" modelAttribute="genTable" action="${ctx}/gen/genTable/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<fieldset>
					<legend>基本信息</legend>
					
					<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
				   <tbody>
						<tr>
							<td class="width-15 active"><label class="pull-right"><font color="red">*</font>表名:</label></td>
							<td class="width-35">
							<input id="name" name="name" class="form-control required" value="${genTable.name}" maxlength="200" aria-required="true" type="text">
							</td>
							<td class="width-15 active"><label class="pull-right"><font color="red">*</font>说明:</label></td>
							<td class="width-35">
								<input id="comments" name="comments" class="form-control required" value="${genTable.comments}" maxlength="200" aria-required="true" type="text">
							</td>
						</tr>
						<tr>
							<td class="width-15 active"><label class="pull-right"><font color="red">*</font>类名:</label></td>
							<td class="width-35">
								<input id="className" name="className" class="form-control required" value="${genTable.className}" maxlength="200" aria-required="true" type="text">
							</td>
							<td class="width-15 active"><label class="pull-right">主表表名:</label></td>
							<td class="width-35">
								<form:select path="parentTable" cssClass="form-control">
									<form:option value="">无</form:option>
									<form:options items="${tableList}" itemLabel="nameAndComments" itemValue="name" htmlEscape="false"/>
								</form:select>
							</td>
						</tr>
						<tr>
							<td class="width-15 active"><label class="pull-right">当前表外键：</label></td>
							<td class="width-35">
							<form:select path="parentTableFk" cssClass="form-control">
								<form:option value="">无</form:option>
								<form:options items="${genTable.columnList}" itemLabel="nameAndComments" itemValue="name" htmlEscape="false"/>
							</form:select>
							<span class="help-inline">如果是附表，请指定主表表名和当前表的外键</span>
							</td>
							<div class="control-group hide">
								<label class="control-label">备注:</label>
								<div class="controls">
									<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
								</div>
							</div>
						</tr>
						
					</tbody>
				</table>
					<legend>字段列表</legend>
					<div class="control-group">
						<table id="contentTable" class="table table-striped table-bordered table-condensed">
							<thead><tr><th title="数据库字段名">列名</th><th title="默认读取数据库字段备注">说明</th><th title="数据库中设置的字段类型及长度">物理类型</th><th title="实体对象的属性字段类型">Java类型</th>
								<th title="实体对象的属性字段（对象名.属性名|属性名2|属性名3，例如：用户user.id|name|loginName，属性名2和属性名3为Join时关联查询的字段）">Java属性名称 <i class="icon-question-sign"></i></th>
								<th title="是否是数据库主键">主键</th><th title="字段是否可为空值，不可为空字段自动进行空值验证">可空</th><th title="选中后该字段被加入到insert语句里">插入</th>
								<th title="选中后该字段被加入到update语句里">编辑</th><th title="选中后该字段被加入到查询列表里">列表</th>
								<th title="选中后该字段被加入到查询条件里">查询</th><th title="该字段为查询字段时的查询匹配放松">查询匹配方式</th>
								<th title="字段在表单中显示的类型">显示表单类型</th><th title="显示表单类型设置为“下拉框、复选框、点选框”时，需设置字典的类型">字典类型</th><th>排序</th></tr></thead>
							<tbody>
							<c:forEach items="${genTable.columnList}" var="column" varStatus="vs">
								<tr${column.delFlag eq '1'?' class="error" title="已删除的列，保存之后消失！"':''}>
									<td nowrap>
										<input type="hidden" name="columnList[${vs.index}].id" value="${column.id}"/>
										<input type="hidden" name="columnList[${vs.index}].delFlag" value="${column.delFlag}"/>
										<input type="hidden" name="columnList[${vs.index}].genTable.id" value="${column.genTable.id}"/>
										<input type="hidden" name="columnList[${vs.index}].name" value="${column.name}"/>${column.name}
									</td>
									<td>
										<input type="text" name="columnList[${vs.index}].comments" value="${column.comments}" maxlength="200" class="form-control required" style="width:100px;"/>
									</td>
									<td nowrap>
										<input type="hidden" name="columnList[${vs.index}].jdbcType" value="${column.jdbcType}"/>${column.jdbcType}
									</td>
									<td>
										<select name="columnList[${vs.index}].javaType" class="required form-control" style="width:85px;*width:75px">
											<c:forEach items="${config.javaTypeList}" var="dict">
												<option value="${dict.value}" ${dict.value==column.javaType?'selected':''} title="${dict.description}">${dict.label}</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<input type="text" name="columnList[${vs.index}].javaField" value="${column.javaField}" maxlength="200" class="required form-control"/>
									</td>
									<td>
										<input type="checkbox" class="i-checks" name="columnList[${vs.index}].isPk" value="1" ${column.isPk eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" class="i-checks" name="columnList[${vs.index}].isNull" value="1" ${column.isNull eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" class="i-checks" name="columnList[${vs.index}].isInsert" value="1" ${column.isInsert eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" class="i-checks" name="columnList[${vs.index}].isEdit" value="1" ${column.isEdit eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" class="i-checks" name="columnList[${vs.index}].isList" value="1" ${column.isList eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" class="i-checks" name="columnList[${vs.index}].isQuery" value="1" ${column.isQuery eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<select name="columnList[${vs.index}].queryType" class="required form-control">
											<c:forEach items="${config.queryTypeList}" var="dict">
												<option value="${fns:escapeHtml(dict.value)}" ${fns:escapeHtml(dict.value)==column.queryType?'selected':''} title="${dict.description}">${fns:escapeHtml(dict.label)}</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select name="columnList[${vs.index}].showType" class="required form-control" style="width:100px;">
											<c:forEach items="${config.showTypeList}" var="dict">
												<option value="${dict.value}" ${dict.value==column.showType?'selected':''} title="${dict.description}">${dict.label}</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<input type="text" name="columnList[${vs.index}].dictType" value="${column.dictType}" maxlength="200" class="form-control"/>
									</td>
									<td>
										<input type="text" name="columnList[${vs.index}].sort" value="${column.sort}" maxlength="200" class="required form-control digits"/>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</fieldset>
				<c:if test="${empty genTable.id}">
				<div class="form-actions">
					<shiro:hasPermission name="gen:genTable:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div> 
				</c:if>
			</form:form>
		</c:otherwise>
	</c:choose>
	<c:if test="${empty genTable.id}">
	</div>
	</div> 
	</c:if>
</body>
</html>
