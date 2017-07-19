<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>发文管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript" src="${ctxStatic}/jquery/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(
		function() {
			/* //修改保存时，把重新选择的会签副总赋给departmentsign，进行保存
			$("#btnSubmit").click(function() {
				var str = "";
				var index = 0;
				$("input[type=checkbox]:checked").each(function() {
					if (index != 0) {
						str += ",";
					}
					str += $(this).val();
					index++;
				});
				$("#departmentsign").val(str);
			}); */

			//获取添加时选中的会签副总
			var departmentsign = document.getElementById("departmentsign").value;
			var departmentsigns = new Array();
			departmentsigns = departmentsign.split(",");
			for ( var str in departmentsigns) {
				$("input[name=departmentsign][value="+ departmentsigns[str] + "]").attr("checked", true);
			}
			
			/* $("#modal-262575").click(function(){
				$(this).css("display","block");
			});
 */
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler : function(form) {
					oaLoading('正在提交，请稍候...');
					form.submit();
				},
				errorContainer : "#messageBox",
				errorPlacement : function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")
							|| element.is(":radio")
							|| element.parent().is(
									".input-append")) {
						error.appendTo(element.parent()
								.parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			$("#modal-container-262575").draggable({
				handle : ".modal-header",
				cursor : 'move',
				refreshPositions : false
			});
		});

	/* function save(){$("#modal-container-262575").hide();} */
</script>
<style type="text/css">
h3 {
	color: red;
}

.oaArchivestop {
	text-align: right;
}

.control-label {
	color: red;
}

.left {
	width: 50%;
	border-right: 1px solid red;
}

.all {
	height: 30px;
}

.note {
	height: 100px;
}

.code {
	color: red;
	margin-left: 20px;
}

.modal-content {
	width: 100%;
	height: 100%;
}

table td {
	border-bottom: 1px solid red;
}
</style>

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox">

	<div class="ibox-title">
	    <h5>查看--发文详情</h5> 
	</div>
	<div class="ibox-content" style="padding: 5px 0;">
	<form:form id="inputForm" modelAttribute="oaArchives"
		action="${ctx}/oa/oaArchives/save" method="post"
		class="form-horizontal">
		<sys:message content="${message}" />
		<form:hidden path="id" />

		<input type="hidden" name="issuedate"
			value="<fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
		<input type="hidden" name="draftdate"
			value="<fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
		<input type="hidden" name=qianfadate
			value="<fmt:formatDate value="${oaArchives.qianfadate}" pattern="yyyy-MM-dd HH:mm:ss" />" />		
		<input type="hidden" name="departmentsign2" id="departmentsign"
			value="${oaArchives.departmentsign}" />

		<ul class="ul-form">
			<li class="btns">
				<div class="modal fade" id="modal-container-262575" role="dialog"
					aria-labelledby="myModalLabel" style="display:none;height:500px;">
					<div class="modal-dialog" style="width:750px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">正文</h4>
							</div>
							<div class="modal-body">

								<form:textarea path="content" htmlEscape="false" rows="20"
									maxlength="20000" class="input-xxlarge required" disabled="true"/>
								<sys:ckeditor replace="content" uploadPath="/oa/oaArchives"/>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>						
							</div>
						</div>
					</div>
				</div></li>
		</ul>

		<table class="table-form">
			<caption>
				<h3 align="center" style="font-size: 20px;font-weight: bolder;">${fns:getConfig('oaArchivesCaption')}</h3>
			</caption>
			<tbody>
				<tr>
					<td class="all" colspan="3"><label class="control-label">发文字号：</label>
						<input type="text" value=" ${oaArchives.code}" class="form-control"  style="width:40%;" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td class="all"><label class="control-label">密级：</label>
						<input type="text" value="${oaArchives.secrets}" class="form-control"  style="width:50%;" readonly="readonly">
					</td>
					<td><label class="control-label">紧急程度：</label>
						<input type="text" value="${oaArchives.urgency}" class="form-control"  style="width:50%;" readonly="readonly">
					</td>
				</tr>

				<%-- <tr class="note">
					<td class="left"><label class="control-label" for="manager">核稿人(时间)：</label>
						${oaArchives.leadText}&nbsp;<fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd HH:mm:ss" />
						<form:input path="leadText" htmlEscape="false" maxlength="20"  class="form-control" style="width:40%;" readonly="true"/>
					<td class="right" colspan="2"><label class="control-label">拟稿部门和拟稿人：</label>
						<input type="text" value="${fns:getUser().office.name}&nbsp;${oaArchives.createBy.name}&nbsp; <fmt:formatDate
							value="${oaArchives.draftdate}" pattern="yyyy-MM-dd" />" class="form-control" style="width:40%;" readonly="readonly"/>
					</td>
				</tr> --%>
				<tr>
					<td class="all"><label class="control-label">核稿人(时间)：</label>
						<input type="text" value=" ${oaArchives.leadName}&nbsp;<fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control"  style="width:50%;" readonly="readonly">
					<td><label class="control-label">拟稿部门和拟稿人：</label>
						<input type="text" value="${oaArchives.officeName}&nbsp;${oaArchives.createBy.name}&nbsp;<fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control" style="width:50%;" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td class="all" colspan="3"><label class="control-label" for="tilte">事由：</label>
					<input type="text" value="${oaArchives.title}" class="form-control"  style="width:40%;" readonly="readonly"/></td>
				</tr>

				<tr >
						<td class="all" colspan="3">
							<label class="control-label">主送：</label>
							<input type="text" value="${oaArchives.oaArchivesNames}" class="form-control"  style="width:40%;" readonly="readonly">
<!--  				<div class="controls" style="width:20%;margin-left: -20px;"> -->
					<%-- <sys:treeselect id="oaArchivesRecord" name="oaIds"						
						value="${oaArchives.oaIds}"
						labelName="oaArchivesNames"
						labelValue="${oaArchives.oaArchivesNames}" title="接收人"
						url="/sys/office/treeData?type=3" cssClass="form-control required"
						disabled="true"
						notAllowSelectParent="true" notAllowSelectRoot="true"  
						allowClear="true" />
					<span class="help-inline" id="tip"><font color="red">*</font> </span> --%>				
<!--  				</div>				 		 -->
						</td>											
					</tr>
					<tr>
						<td class="all" colspan="3">
							<label class="control-label">抄送：</label>
							<input type="text" value="${oaArchives.ccunit}" class="form-control"  style="width:40%;" readonly="readonly"/>
						</td>
					</tr>
<!-- 				<tr> -->
<!-- 					<td class="all" colspan="3"><label class="control-label">发送：</label> -->
<%-- 						<sys:treeselect id="user" name="user.id" --%>
<%-- 							value="${oaArchives.user.id}" labelName="user.name" --%>
<%-- 							labelValue="${oaArchives.user.name}" title="用户" --%>
<%-- 							url="/sys/office/treeData?type=3" cssClass="" allowClear="true" --%>
<%-- 							notAllowSelectParent="true" /></td> --%>
<!-- 				</tr> -->
				<%-- 					<tr >
						<td class="all" colspan="3"> 
						<label class="control-label">抄送：</label>
						<sys:treeselect id="user" name="user.id" value="${oaArchives.user.id}" labelName="user.name" labelValue="${oaArchives.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true" />
					
						</td> 
												
					</tr> --%>
				<tr >
					<td class="all" colspan="3">
						<label class="control-label" for="contenthref">正文：</label>
						<a id="contenthref" href="#modal-container-262575"  
			 			data-toggle="modal">正文内容</a>	
					</td>
				</tr>

				<tr>
					<td class="all" colspan="3"><label class="control-label"
						for="files">相关部门会签：</label> <form:checkboxes path="departmentsign"
							items="${fns:getDictList('departmentsign')}" value=""
							itemLabel="label" itemValue="value" htmlEscape="false"
							class="departmentsign" disabled="true"/></td>
				</tr>

				<tr>
					<td class="all" colspan="3"><label class="control-label" for="files">附件：</label> 
						<input type="hidden" id="billingFile${oaArchives.id}" value="${oaArchives.files}"  class="form-control"/> 
						<div style="margin-left: 10px;float: left;">
						<sys:ckfinder input="billingFile${oaArchives.id}" readonly="true" type="files"
							uploadPath="/oa/oaArchives" selectMultiple="true" />
						</div>
					</td>
				</tr>
				
				<tr>
					<td class="all" colspan="3"><label class="control-label">主题词：</label>
						<input type="text" value="${oaArchives.keyword}" class="form-control" style="width:20%;" readonly="readonly"/>
					</td>
				</tr>
				
			</tbody>
		</table>
		<div class="form-actions" style="text-align: left;margin-top: 15px;margin-bottom: 15px;">
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />&nbsp;&nbsp;&nbsp;
			<!-- <input
				onclick='btnPNGshow2("oa_Archvies:1:6552053766724510869ef1800054ad4a");'
				class="btn" type="button" value="流程图" /> -->
				<c:if test="${task != null}">
				&nbsp;<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn" type="button" value="流程跟踪" />
				</c:if>
		</div>
		<c:if test="${not empty oaArchives.id}">
					<act:histoicFlow procInsId="${oaArchives.procInsId}" />
				</c:if>
	</form:form>
	</div>
	</div>
	</div>
</body>
</html>