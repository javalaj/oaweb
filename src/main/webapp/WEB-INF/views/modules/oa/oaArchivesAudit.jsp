<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公文审批</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍等...');
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
	h3{color: red;}
	.oaArchivestop{
		text-align:right;
}
.control-label{ color:red;}
.left{ width:50%;border-right: 1px solid red;}
.all{ height: 30px;}
.note{height:100px; }
.code{color:red;margin-left: 20px;}
.modal-content{ width:100%;height:100%;}
table td{
border-bottom:1px solid red;
}	
	</style>
</head>
<body>
	
	
	<form:form id="inputForm" modelAttribute="oaArchives" action="${ctx}/oa/oaArchives/saveAudit" method="post" class="breadcrumb form-search">
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden id="flag" path="act.flag"/>
		<sys:message content="${message}"/>
	<table class="table table-bordered">
<%-- 	<caption><h3>${oaArchives.act.taskName}</h3></caption>				 --%>
				<tbody>
					<tr>
						<td class="all" >
					<label class="control-label">密级：</label><form:select path="secrets" class="input-xlarge ">
					<form:option value="" label="机密程度"/>
					<form:options items="${fns:getDictList('secrets')}"  itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select></td><td>
					<label class="control-label">紧急程度：</label><form:select path="urgency" class="input-xlarge ">
					<form:option value="" label="紧急程度"/>
					<form:options items="${fns:getDictList('urgency')}"  itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select></td><td >
				<form:select path="code" class="input-xlarge " id="code">
					<form:option value="" label="楚誉字" />
					<form:options items="${fns:getDictList('code')}"  maxlength="64"  itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
						</td>
											
					</tr>
					<tr class="note">
						<td class="left" ><label class="control-label" for="manager">核稿：</label>			
				${oaArchives.leadText}
						<td class="right" colspan="2">
							<label class="control-label">拟稿部门和拟稿人：</label>
							${oaArchives.createBy.office.name}&nbsp;${oaArchives.createBy.name}
						</td>										
					</tr>
					<tr >
						<td class="all" colspan="3">
						<label class="control-label"  for="tilte">事由：</label>
						
			
				<form:input path="title" htmlEscape="false" id="title" maxlength="255" class="input-xlarge "/>
			<span class="help-inline"><font color="red">*</font> </span>
						</td>
<!-- 					<tr > -->
<!-- 						<td class="all" colspan="3"> -->
<!-- 						<label class="control-label">主送：</label> -->
<%-- 						<sys:treeselect id="user" name="user.id" value="${oaArchives.user.id}" labelName="user.name" labelValue="${oaArchives.user.name}" --%>
<%-- 					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/> --%>
<!-- 					<span class="help-inline"><font color="red">*</font> </span>	 -->
<!-- 						</td> -->
						
					
<!-- 					</tr> -->
<!-- 					<tr > -->
<!-- 						<td class="all" colspan="3">  -->
<!-- 						<label class="control-label">抄送：</label> -->
<%-- 						<sys:treeselect id="user" name="user.id" value="${oaArchives.user.id}" labelName="user.name" labelValue="${oaArchives.user.name}" --%>
<%-- 					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/> --%>
<!-- 					<span class="help-inline"><font color="red">*</font> </span> -->
<!-- 						</td> -->
												
<!-- 					</tr> -->
					<tr >
						<td class="all" colspan="3">
<!-- 						<label class="control-label" for="contenthref">正文：</label> -->
<!-- 						<a id="contenthref" href="">正文内容</a>	 -->


							<div class="control-group">
				<label class="control-label">接受人：</label>
				<div class="controls">
					<sys:treeselect id="oaArchivesRecord" name="oaArchivesRecordIds"
						value="${oaArchives.oaArchivesRecordIds}"
						labelName="oaArchivesRecordNames"
						labelValue="${oaArchives.oaArchivesRecordNames}" title="接收人"
						url="/sys/office/treeData?type=3" cssClass="required"
						
						notAllowSelectParent="true" notAllowSelectRoot="true"  
						checked="true" allowClear="true" />
					<span class="help-inline" id="tip"><font color="red">*</font> </span>
				</div>
			</div>
							
						</td> 
											
					</tr>
					<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="files">附件：</label>
							<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
						<label class="control-label">主题词：</label>
					<form:input path="keyword" htmlEscape="false" maxlength="255" class="input-xlarge " />
					
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="checkText">技术部领导意见：</label>
							${oaArchives.checkText}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
						<label class="control-label" for="checkText1">研发部领导意见：</label>	
							${oaArchives.checkText1}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="checkText2">商务部领导意见：</label>
								${oaArchives.checkText2}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="checkText3">市场部领导意见：</label>
							${oaArchives.checkText3}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="checkText4">人事行政部领导意见：</label>
							${oaArchives.checkText4}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
						<label class="control-label" for="checkText5">财务部领导意见：</label>
						${oaArchives.checkText5}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="managerText">总经理签发意见：</label>
							${oaArchives.managerText}
						</td>
												
					</tr>				
<tr>
					<td class="all">您的意见</td>
					<td colspan="2">
						<form:textarea path="act.comment" class="required" rows="2" maxlength="20" cssStyle="width:500px"/>
					</td>
				</tr>
				</tbody>
			</table>
		<div class="form-actions">
			<shiro:hasPermission name="oa:oaArchives:edit">
				<c:if test="${oaArchives.act.taskDefKey eq 'apply_end'}">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="分发" onclick="$('#flag').val('yes')"/>&nbsp;
				</c:if>
				<c:if test="${oaArchives.act.taskDefKey ne 'apply_end'}">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="同 意" onclick="$('#flag').val('yes')"/>&nbsp;
					<input id="btnSubmit" class="btn btn-inverse" type="submit" value="驳 回" onclick="$('#flag').val('no')"/>&nbsp;
				</c:if>
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		<act:histoicFlow procInsId="${oaArchives.act.procInsId}"/>
	</form:form>
</body>
</html>
