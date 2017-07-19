<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>会签副总审核</title>
<meta name="decorator" content="default" />
<script type="text/javascript" src="${ctxStatic}/jquery/jquery-ui.min.js"></script>	
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
						.validate(
								{
									submitHandler : function(form) {
										//oaLoading('正在提交，请稍候...');
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

				$("#btnImport1").click(function() {

					window.print();
				});
				
				$("#modal-container-262575").draggable({
					handle : ".modal-header",
					cursor : 'move',
					refreshPositions : false
				});
			});
	function cz() {
		var checkedList1 = new Array();
		$("input[name='subChk']:checked").each(function() {
			checkedList1.push($(this).val());
		});
		alert(checkedList1.toString());
	}
	function setSelectUserNo(radioObj) {

		var radioCheck = $(radioObj).val();
		if ("1" == radioCheck) {
			$(radioObj).attr("checked", false);
			$(radioObj).val("0");

		} else {
			$(radioObj).val("1");

		}
	}
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

ul li {
	float: left;
	list-style: none;
	padding-left: 10px;
}
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>${title}</h5>
		<!-- 		<h5>发文--审核</h5> -->
			</div>

			<div class="ibox-content">
				<form:form id="inputForm" modelAttribute="oaArchives"
					action="${ctx}/oa/oaArchives/departmensave" method="post"
					class="form-horizontal" style="margin-top: 15px;">
					<%-- <legend>${title }</legend> --%>
					<input type="hidden" name="token" value="${token }">
					<form:hidden path="id" />
					<form:hidden path="code" />
					<form:hidden path="urgency" />
					<form:hidden path="secrets" />
					<form:hidden path="createBy.name"/>
					<form:hidden path="leadName"/>
					<input type="hidden" name="issuedate"
						value="<fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd HH:mm:ss" />"/>
					<input type="hidden" name="draftdate"
						value="<fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />"/>
					<input type="hidden" name=qianfadate
						value="<fmt:formatDate value="${oaArchives.qianfadate}" pattern="yyyy-MM-dd HH:mm:ss" />"/>
					<sys:message content="${message}" />
			
					<ul class="ul-form">
						<li class="btns">
			<!-- 			<a id="modal-262575" -->
			<!-- 				href="#modal-container-262575" role="button" class="btn btn-primary" -->
			<!-- 				data-toggle="modal">编辑正文</a> -->
							<div class="modal fade" id="modal-container-262575" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;height:500px;">
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
											<sys:ckeditor replace="content" uploadPath="/oa/oaArchives" />
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
								<input type="text" value=" ${oaArchives.code}" class="form-control"  style="width:30%;" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="all"><label class="control-label">密级：</label> 
									<input type="text" value=" ${oaArchives.secrets}" class="form-control"  style="width:50%;" readonly="readonly">
								</td>
								<td><label class="control-label">紧急程度：</label>
									<input type="text" value=" ${oaArchives.urgency}" class="form-control"  style="width:50%;" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="all"><label class="control-label">核稿人(时间)：</label>
									<input type="text" value=" ${oaArchives.leadName}&nbsp;<fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control"  style="width:50%;" readonly="readonly">
								</td>
								<td><label class="control-label">拟稿部门和拟稿人：</label>
								<input type="text" value="${oaArchives.officeName}&nbsp;${createname}&nbsp;<fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control" style="width:50%;" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="all" colspan="3"><label class="control-label"
									for="tilte">事由：</label><input type="text" value=" ${oaArchives.title}" class="form-control"  style="width:30%;" readonly="readonly"></td>
							</tr>
							<tr>
								<td class="all" colspan="3"><label class="control-label">主送：</label>
			<%-- 						<!-- 				<div class="controls"> --> <sys:treeselect --%>
			<%-- 							id="oaArchivesRecord" name="oaArchivesRecordIds" --%>
			<%-- 							value="${oaArchives.oaIds}" disabled="true" --%>
			<%-- 							labelName="oaArchivesNames" --%>
			<%-- 							labelValue="${oaArchives.oaArchivesNames}" title="接收人" --%>
			<%-- 							url="/sys/office/treeData?type=3" cssClass="required" --%>
			<%-- 							notAllowSelectParent="true" notAllowSelectRoot="true" --%>
			<%-- 							checked="true" allowClear="true" /> <span class="help-inline" --%>
			<!-- 						id="tip"><font color="red">*</font> </span> -->
									<%-- <form:input path="oaArchivesNames" value="${oaArchives.oaArchivesNames}"/> --%>
									<input type="text" value="${oaArchives.oaArchivesNames}" class="form-control"  style="width:30%;" readonly="readonly">
								</td>
							</tr>
			
							<tr>
								<td class="all" colspan="3">
									<label class="control-label">抄送：</label>
									<input type="text" value="${oaArchives.ccunit}" class="form-control"  style="width:30%;" readonly="readonly">
								</td>
							</tr>
							<tr >
								<td class="all" colspan="3">
									<label class="control-label" for="contenthref">正文：</label>
									<a id="contenthref" href="#modal-container-262575" data-toggle="modal">正文内容</a>	
								</td>
							</tr>
							<tr>
								<td colspan="3"><label class="control-label">附件：</label> 
									<input type="hidden" id="billingFile${oaArchives.id}"
										value="${oaArchives.files}" /> <div style="margin-left: 10px;float: left;"><sys:ckfinder
										input="billingFile${oaArchives.id}" readonly="true" type="files"
										uploadPath="/oa/oaArchives" selectMultiple="true" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="all" colspan="3"><label class="control-label">主题词：</label>
									<input type="text" value="${oaArchives.keyword}" class="form-control"  style="width:30%;" readonly="readonly">
								</td>
							<tr>
							<td class="all" colspan="3"><label class="control-label">部门负责人意见：</label>
								<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.leadText}</textarea>
						</tr>
						
						<c:if test="${not empty oaArchives.signYfOpinion }">
							<tr>
								<td class="all" colspan="3"><label class="control-label">研发部副总意见：</label>
								<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signYfOpinion}</textarea>
							</tr>
						</c:if>
						<c:if test="${not empty oaArchives.signJsOpinion }">
							<tr>
								<td class="all" colspan="3"><label class="control-label">技术部副总意见：</label>
								<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signJsOpinion}</textarea>
							</tr>
						</c:if>
						<c:if test="${not empty oaArchives.signSwOpinion }">
							<tr>
								<td class="all" colspan="3"><label class="control-label">市场拓展部副总意见：</label>
								<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signSwOpinion}</textarea>
							</tr>
						</c:if>
						<c:if test="${not empty oaArchives.signScOpinion }">
							<tr>
								<td class="all" colspan="3"><label class="control-label">市场部副总意见：</label>
								<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signScOpinion}</textarea>
							</tr>
						</c:if>
						<c:if test="${not empty oaArchives.signRsOpinion }">
							<tr>
								<td class="all" colspan="3"><label class="control-label">人事部副总意见：</label>
								<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signRsOpinion}</textarea>
							</tr>
						</c:if>
						<c:if test="${not empty oaArchives.signCwOpinion }">
							<tr>
								<td class="all" colspan="3"><label class="control-label">财务部副总意见：</label>
								<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signCwOpinion}</textarea>
							</tr>
						</c:if>
							<tr>
								<td class="all" colspan="3"><label class="control-label">会签意见： <font color="red">*</font></label>
									<input name='pinion' maxlength="255"
									class="form-control"  required="required" style="width:30%;" type="text" /> <span
									class="help-inline"></span></td>
							</tr>
					</table>
					<div class="form-actions" style="text-align: left; margin-top: 15px; margin-bottom: 15px;">
						<shiro:hasPermission name="oa:oaArchives:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="提 交" />&nbsp;</shiro:hasPermission>
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />&nbsp;
						<c:if test="${task != null}">
							<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn" type="button" value="流程跟踪" />
						</c:if>
					</div>
				</form:form>
			</div>
		</div>
	</div>			
</body>
</html>