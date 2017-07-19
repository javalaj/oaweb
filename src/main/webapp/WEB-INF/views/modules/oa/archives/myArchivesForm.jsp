<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>分发</title>
<meta name="decorator" content="default" />
<script type="text/javascript" src="${ctxStatic}/jquery/jquery-ui.min.js"></script>	
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//$("#name").focus();

						//获取添加时选中的会签副总
						var departmentsign = document
								.getElementById("departmentsign").value;
						var departmentsigns = new Array();
						departmentsigns = departmentsign.split(",");
						for ( var str in departmentsigns) {
							$(
									"input[name=departmentsign][value="
											+ departmentsigns[str] + "]").attr(
									"checked", true);
						}
						//修改保存时，把重新选择的会签副总赋给departmentsign，进行保存
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
						});

						$("#inputForm").validate(
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
				<h5>${title }</h5>
<!-- 	<h5>发文--审核</h5> -->
		<!-- <div class="ibox-tools">
			<a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
				<i class="fa fa-wrench"></i>
			</a>
			
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a>
		</div> -->
			</div>
			<div class="ibox-content">
				<form:form id="inputForm" modelAttribute="oaArchives"
					action="${ctx}/oa/oaArchives/mysingsave" method="post"
					class="form-horizontal" style="margin-top: 15px;">
					<%-- <legend>${title }</legend> --%>
					<input type="hidden" name="token" value="${token }">
					<input type="hidden" name="departmentsign2" id="departmentsign"
						value="${oaArchives.departmentsign}" />
					<input type="hidden" name="flag" value="1" />
					<form:hidden path="id" />
					<form:hidden path="code" />
					<form:hidden path="urgency" />
					<form:hidden path="secrets" />
					<form:hidden path="createBy.name" />
					<form:hidden path="leadName"/>
					<form:hidden path="oaArchivesNames"/>
					<input type="hidden" name="issuedate"
						value="<fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
					<input type="hidden" name="draftdate"
						value="<fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
					<input type="hidden" name=qianfadate
						value="<fmt:formatDate value="${oaArchives.qianfadate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
					<input type="hidden" name="issuingtime" 
						value="<fmt:formatDate value="${oaArchives.qianfadate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
					<sys:message content="${message}" />
			
					<ul class="ul-form" style="padding-top: 20px;">
						<li class="btns">
						<!-- <a id="modal-262575"
							href="#modal-container-262575" role="button" class="btn btn-primary"
							data-toggle="modal">查看正文</a> -->
							<div class="modal fade" id="modal-container-262575" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true" style="width:400px;width:700px;">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header" style="width:400px;width:680px;">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
											<h4 class="modal-title" id="myModalLabel">正文</h4>
										</div>
										<div class="modal-body" style="width:300px;width:660px;">
			
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
						<%-- <li class="btns"><input id="btnView" class="btn btn-primary"
							type="button"
							onclick="javascript:window.location.href='${ctx}/act/process/resource/read?procDefId=oa_Archvies:1:6552053766724510869ef1800054ad4a&resType=image'"
							value="查看流程图" /></li> --%>
						<li class="btns"><input id="btnView" class="btn btn-primary"
							type="button"
							onclick="javascript:window.location.href='${ctx}/oa/oaArchives/seeprint?id=${oaArchives.id}'" value="打印"/></li>
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
			<!-- 				<tr class="note"> -->
			<!-- 					<td class="left"><label class="control-label" for="manager">核稿：</label> -->
			<%-- 						${oaArchives.leadText} --%>
			<!-- 					<td class="right" colspan="2"><label class="control-label">拟稿部门和拟稿人：</label> -->
			<%-- 						${fns:getUser().office.name}&nbsp;${ oaArchives.createBy.name}</td> --%>
			<!-- 				</tr> -->
							<tr class="note">
								<td class="left"><label class="control-label" for="manager">核稿人(时间)：</label>
									
			  					<input type="text" value="${oaArchives.leadName}&nbsp;<fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd" />" class="form-control"  style="width:50%;" readonly="readonly">
								<td class="right" colspan="2"><label class="control-label">拟稿部门和拟稿人：</label>
								<input type="text" value="${oaArchives.officeName}&nbsp;${ oaArchives.createBy.name}&nbsp;<fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd" />" class="form-control" style="width:50%;" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="all" colspan="3"><label class="control-label"
									for="tilte">事由：</label><input type="text" value=" ${oaArchives.title}" class="form-control"  style="width:30%;" readonly="readonly"></td>
							</tr>
							<!-- 				<tr > -->
							<!-- 						<td class="all" colspan="3"> -->
							<!-- 						<label class="control-label"  for="tilte">发文日期：</label>						 -->
							<%-- 						<fmt:formatDate value="${oaArchives.exeDate}" --%>
							<%-- 							pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
			
							<!-- 						</tr> -->
							<tr>
			<!-- 					<td class="all" colspan="3"><label class="control-label">发送人员：</label> -->
			<!-- 						<div class="controls"> -->
			<%-- 							<sys:treeselect id="oaArchivesRecord" name="oaArchivesRecordIds" --%>
			<%-- 								value="${oaArchives.oaArchivesRecordIds}" --%>
			<%-- 								labelName="oaArchivesRecordNames"  --%>
			<%--  								labelValue="${oaArchives.oaArchivesRecordNames}" title="接收人" --%>
			<%--  								url="/sys/office/treeData?type=3" cssClass="required"  --%>
			<%--  								notAllowSelectParent="true" notAllowSelectRoot="true"  --%>
			<%--  								checked="true" allowClear="true" />  --%>
			<!-- 							<span class="help-inline" id="tip"><font color="red">*</font> -->
			<!-- 							</span> -->
			<!-- 						</div></td> -->
									
									<td class="all" colspan="3"><label class="control-label">主送：</label>
			 						<%-- <div class="controls" style="width:20%;margin-left: -20px;">
										<sys:treeselect id="oaArchivesRecord" name="oaArchivesRecordIds"
											value="${oaArchives.oaIds}" labelName="oaArchivesNames"
											labelValue="${oaArchives.oaArchivesNames}" title="接收人"
											url="/sys/office/treeData?type=3" cssClass="form-control required"
											disabled="true" notAllowSelectParent="true"
											notAllowSelectRoot="true" checked="true" allowClear="true" />							
			 						</div> --%>
			 						<input type="text" value="${oaArchives.oaArchivesNames}" name="oaArchivesRecordIds" class="form-control"  style="width:30%;" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="all" colspan="3">
									<label class="control-label">抄送：</label>
									<input type="text" value="${oaArchives.ccunit}" class="form-control"  style="width:30%;" readonly="readonly">
								</td>
							</tr>
			
							<tr>
								<td class="all" colspan="3"><label class="control-label"
									for="files">相关部门会签：</label> <form:checkboxes path="departmentsign"
										items="${fns:getDictList('departmentsign')}" value=""
			 							itemLabel="label" itemValue="value" htmlEscape="false"
			 							class="i-checks departmentsign" disabled="true" /></td>
							</tr>
			
							<tr>
			
								<td colspan="3"><label class="control-label">附件：</label>
								<input type="hidden" id="billingFile${oaArchives.id}" value="${oaArchives.files}" /><div style="margin-left: 10px;float: left;"> <sys:ckfinder
										input="billingFile${oaArchives.id}" readonly="true" type="files"
										uploadPath="/oa/oaArchives" selectMultiple="true" /></div></td>
							</tr>
							<tr>
								<td class="all" colspan="3"><label class="control-label">主题词：</label>
									<input type="text" value="${oaArchives.keyword}" class="form-control"  style="width:30%;" readonly="readonly"></td>
							</tr>
											
							<tr>
								<td class="all"><label class="control-label">印发时间：</label>
								<input type="text" value="<fmt:formatDate value="${oaArchives.issuingtime}" pattern="yyyy-MM-dd" />" class="form-control"  style="width:40%;" readonly="readonly">
								<td><label class="control-label">印发份数：</label>
								<form:input path="issuedNum" htmlEscape="false" maxlength="10" class="form-control"  style="width:50%;"/></td>
							</tr>
							<tr>
								<td class="all" colspan="3"><label class="control-label">主题词：</label>
									<input type="text" value="${oaArchives.keyword}" class="form-control"  style="width:30%;" readonly="readonly">
								</td>
							<tr>
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
						<c:if test="${not empty oaArchives.managerText }">
							<tr>
								<td class="all" colspan="3"><label class="control-label">总经理签发意见：</label>
								<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.managerText}</textarea>
							</tr>
						</c:if>
					</table>
					<div class="form-actions" style="text-align: left; margin-top: 15px; margin-bottom: 15px;">
						<shiro:hasPermission name="oa:oaArchives:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="分 发" />&nbsp;</shiro:hasPermission>
							<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />&nbsp;
						<c:if test="${task != null}">
							<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn" type="button" value="流程跟踪" />&nbsp;
						</c:if>
					</div>
				</form:form>
			</div>
		</div>
	</div>			
</body>
</html>