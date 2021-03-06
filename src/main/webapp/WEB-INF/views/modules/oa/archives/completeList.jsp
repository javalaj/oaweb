<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>审核完成页面</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//$("#name").focus();

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

						$("#inputForm").validate(
								{
									submitHandler : function(form) {
										oaLoading('正在提交，请稍等...');
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
					});
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
<style>
@media print {
	.noprint {
		display: none
	}
}
</style>
</head>

<body>
<div class="ibox-title">
<!-- 		<h5>发文--完成</h5> -->
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
	
	<ul class="ul-form noprint">
		<li><input id="btnImport1"
			class="btn btn-primary noprint noprint" type="button" value="打印" /></li>
	</ul>
	<form:form id="inputForm" modelAttribute="oaArchives"
		action="${ctx}/oa/oaArchives/depform" method="post"
		class="form-horizontal " style="margin-top: 15px;">
		<input type="hidden" name="departmentsign" id="departmentsign"
			value="${oaArchives.departmentsign}" />

		<table class="table-form">
			<caption>
				<h3 align="center" style="font-size: 20px;font-weight: bolder;">${fns:getConfig('oaArchivesCaption')}</h3>
			</caption>
			<tbody>
				<tr>
					<td class="all" colspan="3"><label class="control-label">发文字号：</label>
						<input type="text" value=" ${oaArchives.code}" class="form-control"  style="width:20%;" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td class="all"><label class="control-label">密级：</label>
						<input type="text" value=" ${oaArchives.secrets}" class="form-control"  style="width:20%;" readonly="readonly">
					</td>
					<td><label class="control-label">紧急程度：</label>
						<input type="text" value=" ${oaArchives.urgency}" class="form-control"  style="width:20%;" readonly="readonly">
					</td>
				</tr>
				<%-- <tr class="note">
					<td class="left"><label class="control-label" for="manager">核稿：</label>
						${oaArchives.leadText}
					<td class="right" colspan="2"><label class="control-label">拟稿部门和拟稿人：</label>
						${oaArchives.officeName}&nbsp;${ oaArchives.createBy.name}&nbsp;<fmt:formatDate 
						value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />"</td>
				</tr> --%>
				<tr>
					<td class="all"><label class="control-label" for="manager">核稿人(时间)：</label>
						${oaArchives.leadName}&nbsp;<fmt:formatDate value="${oaArchives.issuedate}"
  					pattern="yyyy-MM-dd HH:mm:ss" />
					<td><label class="control-label">拟稿部门和拟稿人：</label>
					<input type="text" value="${oaArchives.officeName}&nbsp;${oaArchives.createBy.name}&nbsp; <fmt:formatDate
							value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control" style="width:40%;" readonly="readonly"/>
				</tr>
				<tr>
					<td class="all" colspan="3"><label class="control-label"
						for="tilte">事由：</label><input type="text" value="${oaArchives.title}" class="form-control"  style="width:20%;"/>
					</td>
				</tr>
				<!-- 				<tr > -->
				<!-- 						<td class="all" colspan="3"> -->
				<!-- 						<label class="control-label"  for="tilte">发文日期：</label>						 -->
				<%-- 						<fmt:formatDate value="${oaArchives.exeDate}" --%>
				<%-- 							pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>

				<!-- 						</tr> -->
				<tr>
					<td class="all" colspan="3"><label class="control-label">主送：</label>
					<input type="text" value="${oaArchives.oaArchivesNames}" class="form-control"  style="width:20%;" readonly="readonly">
						<%--<div class="controls" style="width:20%;margin-left: -20px;">
							 <sys:treeselect id="oaArchivesRecord" name="oaArchivesRecordIds"
								value="${oaArchives.oaArchivesRecordIds}"
								labelName="oaArchivesRecordNames"
								labelValue="${oaArchives.oaArchivesRecordNames}" title="接收人"
								url="/sys/office/treeData?type=3" cssClass="form-control required"
								notAllowSelectParent="true" notAllowSelectRoot="true"
								checked="true" allowClear="true" />
						</div> --%>
					</td>
				</tr>
				<tr>
					<td class="all" colspan="3">
						<label class="control-label">抄送：</label>
						<input type="text" value=" ${oaArchives.ccunit}" class="form-control"  style="width:20%;" readonly="readonly">
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

					<td>附件：</td>
					<td colspan="3"><input type="hidden"
						id="billingFile${oaArchives.id}" value="${oaArchives.files}" /><div style="margin-left: 10px;float: left;"> <sys:ckfinder
							input="billingFile${oaArchives.id}" readonly="true" type="files"
							uploadPath="/oa/oaArchives" selectMultiple="true" /></div></td>
				</tr>
				<tr>
					<td class="all" colspan="3"><label class="control-label">主题词：</label>
						<%-- 					<form:input path="keyword" htmlEscape="false" maxlength="255" class="input-xlarge " /> --%>
						<input type="text" value=" ${oaArchives.keyword}" class="form-control"  style="width:20%;" readonly="readonly">
					</td>

				</tr>
				<tr>
				<td class="all" colspan="3"><label class="control-label">部门负责人意见：</label>
					<textarea rows="0" class="form-control" style="width:20%; height:35px;" readonly="readonly">${oaArchives.leadText}</textarea>
				</tr>
				<c:if test="${not empty oaArchives.signYfOpinion }">
				<tr>
					<td class="all" colspan="3"><label class="control-label">研发部副总意见：</label>
					<textarea rows="0" class="form-control" style="width:20%; height:35px;" readonly="readonly">${oaArchives.signYfOpinion}</textarea>
				</tr>
			</c:if>
			<c:if test="${not empty oaArchives.signJsOpinion }">
				<tr>
					<td class="all" colspan="3"><label class="control-label">技术部副总意见：</label>
					<textarea rows="0" class="form-control" style="width:20%; height:35px;" readonly="readonly">${oaArchives.signJsOpinion}</textarea>
				</tr>
			</c:if>
			<c:if test="${not empty oaArchives.signSwOpinion }">
				<tr>
					<td class="all" colspan="3"><label class="control-label">市场拓展部副总意见：</label>
					<textarea rows="0" class="form-control" style="width:20%; height:35px;" readonly="readonly">${oaArchives.signSwOpinion}</textarea>
				</tr>
			</c:if>
			<c:if test="${not empty oaArchives.signScOpinion }">
				<tr>
					<td class="all" colspan="3"><label class="control-label">市场部副总意见：</label>
					<textarea rows="0" class="form-control" style="width:20%; height:35px;" readonly="readonly">${oaArchives.signScOpinion}</textarea>
				</tr>
			</c:if>
			<c:if test="${not empty oaArchives.signRsOpinion }">
				<tr>
					<td class="all" colspan="3"><label class="control-label">人事部副总意见：</label>
					<textarea rows="0" class="form-control" style="width:20%; height:35px;" readonly="readonly">${oaArchives.signRsOpinion}</textarea>
				</tr>
			</c:if>
			<c:if test="${not empty oaArchives.signCwOpinion }">
				<tr>
					<td class="all" colspan="3"><label class="control-label">总经理签发意见：</label>
					<textarea rows="0" class="form-control" style="width:20%; height:35px;" readonly="readonly">${oaArchives.managerText}</textarea>
				</tr>
			</c:if>
				<tr>
					<td>总经理意见：</td>
					<td colspan="3"><input type="text" value=" ${oaArchives.managerText}" class="form-control"  style="width:20%;" readonly="readonly"></td>
				</tr>
		</table>
		<div class="form-actions"  style="text-align: left; margin-top: 15px; margin-bottom: 15px;">
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>