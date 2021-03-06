<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>驳回修改</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
						.validate(
								{
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
</head>
	<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>公司签报流程 </h5>
		<div class="ibox-tools">
		</div>
	</div>
   <div class="ibox-content">
   	<sys:message content="${message}"/>
   	<div class="row">
	<div class="col-sm-12">
	<br/>
	</div>
	</div>

	<form:form id="inputForm" modelAttribute="oaSign"
		action="${ctx}/oa/sign/oaSign/save" method="post"
		class="form-inline">

		<form:hidden path="id" />
		<sys:message content="${message}" />
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>

				<td colspan="4"><h3 align='center'>楚 誉 科 技 股 份 有 限 公 司</h3>
					<h3 align='center'>签 报 审 批 单</h3></td>
			</tr>
			<tr>
				<td>密级：</td>
				<td><form:select path="signType" class="form-control required" cssStyle="width: 55%"
						id="select">
						<form:option value="" label="" />
						<form:options items="${fns:getDictList('sign_type')}"
							itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select></td>
				<%-- <td>编号：</td>
			<td >
			<form:select path="signNumber" class="input-xlarge required"  id="select">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('sign_number')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</td> --%>
			</tr>

			<tr>
				<td>标题：</td>
				<td colspan="4"><form:input path="signTitile"
						htmlEscape="false" maxlength="255"  class="form-control required " cssStyle="width: 55%"  /></td>
			</tr>
			<tr>
				<td>内容：</td>
				<td colspan="4"><form:textarea path="signContent"
					  cols="100"	htmlEscape="false" rows="6" maxlength="200"
						class="form-control required" disabled="disabled" /></td>
			</tr>
			<tr>
				<td>正文：</td>
				<td colspan="4"><form:textarea path="signText"
						htmlEscape="false" rows="6" maxlength="200"
						class="input-xxlarge required" disabled="disabled" /> <sys:ckeditor
						replace="signText" uploadPath="/oa/sign" /></td>
			</tr>
			<tr>
				<td>附件：</td>
				<td colspan="4"><form:hidden id="files" path="signFiles"
						htmlEscape="false" maxlength="64" class="form-control" /> <sys:ckfinder
						input="files" type="files" uploadPath="/oa/sign"
						selectMultiple="true" /></td>
			</tr>
			<tr>
				<td>部门负责人意见：</td>
				<td colspan="4">${oaSign.signHeadOpinion }</td>
			</tr>
			<%-- <div class="control-group">
			<label class="control-label">研发意见：</label>
			<div class="controls">
				<form:input path="signYfOpinion" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">技术意见：</label>
			<div class="controls">
				<form:input path="signJsOpinion" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">市场拓展部意见：</label>
			<div class="controls">
				<form:input path="signSwOpinion" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">市场部意见：</label>
			<div class="controls">
				<form:input path="signScOpinion" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">人事部意见：</label>
			<div class="controls">
				<form:input path="signRsOpinion" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">财务部意见：</label>
			<div class="controls">
				<form:input path="signCwOpinion" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">领导意见：</label>
			<div class="controls">
				<form:input path="signLdOpinion" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">
				<form:input path="signState" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">完成时间：</label>
			<div class="controls">
				<input name="completeDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${oaSign.completeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div> --%>
			<c:if test="${not empty oaSign.signYfOpinion }">
				<tr>
					<td>研发部副总意见：</td>
					<td colspan="4">${oaSign.signYfOpinion }</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signJsOpinion }">
				<tr>
					<td>技术部副总意见：</td>
					<td colspan="4">${oaSign.signJsOpinion }</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signSwOpinion }">
				<tr>
					<td>市场拓展部副总意见：</td>
					<td colspan="4">${oaSign.signSwOpinion }</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signScOpinion }">
				<tr>
					<td>市场部副总意见：</td>
					<td colspan="4">${oaSign.signScOpinion }</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signRsOpinion }">
				<tr>
					<td>人事部副总意见：</td>
					<td colspan="4">${oaSign.signRsOpinion }</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signCwOpinion }">
				<tr>
					<td>财务部副总意见：</td>
					<td colspan="4">${oaSign.signCwOpinion }</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signLdOpinion }">
				<tr>
					<td>领导意见：</td>
					<td colspan="4">${oaSign.signLdOpinion }</td>
				</tr>
			</c:if>
			<tr>
				<td></td>
				<td><label><input name="flag" type="radio" value="1"
						onclick="setSelectUserNo(this);" class="i-checks" checked />废 弃</label> <label><input
						name="flag" type="radio" value="2"
						onclick="setSelectUserNo(this);"  class="i-checks"  />重 新 提 交</label></td>
	<input id="fruit"  name="Fruit" type="hidden" value="0"  />
			</tr>
			<tr>
			<td></td>
			<td colspan="3">
				<shiro:hasPermission name="oa:sign:oaSign:edit">
				<input id="btnSubmit" class="btn btn-myoa-sec btn-myoa-large" type="submit"
					value="提 交" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history.go(-1)" />
		</td>
			</tr>
		</table>
	</form:form>
	<br/>
	<br/>
	</div>
	</div>
	</div>
</body>
</html>