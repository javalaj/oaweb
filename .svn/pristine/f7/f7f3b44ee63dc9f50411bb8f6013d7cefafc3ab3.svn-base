<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公文审批详情</title>
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
</head>
<body>
	<form:form class="breadcrumb form-search">
		<sys:message content="${message}"/>
		<table class="table table-bordered">
	<caption><h3>${oaArchives.act.taskName}</h3></caption>				
				<tbody>
					<tr>
					<td class="all"><label class="control-label">密级：</label> 
<%-- 						<form:select path="secrets" class="input-xlarge "> --%>
<%-- 							<form:option value="" label="机密程度" /> --%>
<%-- 							<form:options items="${fns:getDictList('secrets')}" --%>
<%-- 								itemLabel="label" itemValue="value" htmlEscape="false" /> --%>
<%-- 						</form:select></td> --%>
						${oaArchives.secrets}
					</td>
					<td><label class="control-label">紧急程度：</label>
						${oaArchives.urgency}</td>
					<td>${oaArchives.code}</td>

				</tr>
					<tr class="note">
						<td class="left" ><label class="control-label" for="manager">核稿：</label>			
				${oaArchives.leadText}
						<td class="right" colspan="2">
							<label class="control-label">拟稿部门和拟稿人：</label>
							${oaArchives.office.name}&nbsp;${oaArchives.createBy.name}
						</td>										
					</tr>
					<tr >
						<td class="all" colspan="3">
						<label class="control-label"  for="tilte">事由：</label>
						
			
<%-- 				<form:input path="title" value="${oaArchives.title}" htmlEscape="false" id="title" maxlength="255" class="input-xlarge "/> --%>
			${oaArchives.title}
			<span class="help-inline"><font color="red">*</font> </span>
						</td></tr>
					<tr >
						<td class="all" colspan="3">
						<label class="control-label"  for="tilte">发文日期：</label>
							<fmt:formatDate value="${oaArchives.exeDate}"
 								pattern="yyyy-MM-dd HH:mm:ss" /> 
						</td>
					</tr>	
						
						
<!-- 					<tr > -->
						<%-- <td class="all" colspan="3">
						<label class="control-label">发送：</label>
						<sys:treeselect id="user" name="user.id" value="${oaArchives.user.id}" labelName="user.name" labelValue="${oaArchives.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>
					
						</td>
						
					
					
					 --%>
												
<!-- 					</tr> -->
<!-- 					<tr > -->
<!-- 						<td class="all" colspan="3"> -->
<!-- 						<label class="control-label" for="contenthref">正文：</label> -->
<!-- 						<a id="contenthref" href="">正文内容</a>	 -->
<!-- 						</td> -->
											
<!-- 					</tr> -->
					<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="files">附件：</label>
<%-- 							<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="input-xlarge"/>							 --%>
							${oaArchives.files}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
						<label class="control-label">主题词：</label>
<%-- 					<form:input path="keyword" htmlEscape="false" maxlength="255" class="input-xlarge " /> --%>
					${oaArchives.keyword}
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
							<label class="control-label" for="checkText2">市场拓展部领导意见：</label>
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
				</tbody>
			</table>
		<act:histoicFlow procInsId="${oaArchives.act.procInsId}" />
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
