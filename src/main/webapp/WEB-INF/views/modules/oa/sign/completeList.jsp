<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<html>
<head>
<title >审核完成页面</title>
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
	<script type="text/javascript">

$(document).ready(function() {

   CKEDITOR.config.readOnly = true;

});

</script>
<style>
@media print {
	.noprint {
		display: none
	}
}
.form-horizontal textarea{
	width:70%;
	background-color:#fff;
	border:none;
	border-radius:4px;
	padding:4px;
}
.noprint{
	margin-left:10px;
}
</style>
</head>

<body>
<body class="gray-bg myoa-print-page">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>公司签报流程 </h5>
		<div class="ibox-tools">
		</div>
	</div>
   <div class="ibox-content">
   	<div class="row">
	<div class="col-sm-12">
	<input id="btnImport1"
			class="btn btn-myoa noprint" type="button" value="打印" />
				<c:if test="${task != null}">
				&nbsp;<input
					onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
					class="btn" type="button" value="流程跟踪" />
			</c:if>
	<br/>
	</div>
	</div>
	<sys:message content="${message}"/>
	<form:form id="inputForm" modelAttribute="oaSign"
		action="${ctx}/oa/sign/oaSign/depform" method="post"
		class="form-horizontal ">
		<table class="table table-striped table-bordered table-condensed dataTables-example dataTable">
			<tr>
				<td colspan="4"><h3 align='center'>楚 誉 科 技 股 份 有 限 公 司</h3>
					<h3 align='center'>签 报 审 批 单</h3></td>
			</tr>
			<tr>
				<td>密级：</td>
				<td><c:choose>
						<c:when test="${oaSign.signType == 0}">
								绝密
							</c:when>
						<c:when test="${oaSign.signType == 1 }">
							机密
							</c:when>
							<c:when test="${oaSign.signType == 2 }">
							秘密
							</c:when>
							<c:when test="${oaSign.signType == 3 }">
							内部
							</c:when>
						<c:otherwise>
							公开
							</c:otherwise>
					</c:choose></td>
				<td>编号：</td>
				<td><c:choose>
						<c:when test="${oaSign.signNumber == 0}">
							楚财签】
							</c:when>
						<c:when test="${oaSign.signNumber == 1 }">
							【楚人签】
							</c:when>
						<c:when test="${oaSign.signNumber == 2 }">
							【楚研签】
							</c:when>
						<c:when test="${oaSign.signNumber == 3 }">
							【楚技签】
							</c:when>
						<c:when test="${oaSign.signNumber == 4 }">
							【楚市签】
							</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>${oaSign.code }号</td>
			</tr>

			<tr>
				<td>标题：</td>
				<td colspan="4">${oaSign.signTitile }</td>
			</tr>
			<tr>
				<td>内容：</td>
				<td colspan="4"><textarea rows="6" maxlength="200"
						class="input-xxlarge required" disabled="disabled"
						readonly="readonly">${oaSign.signContent }</textarea></td>
			</tr>
			<tr>
				<td>正文：</td>
				<td colspan="4" style="width: 200px;height: 200px;">
				${text }
		<%-- 		 <form:textarea path="signText"
						htmlEscape="false" rows="6" maxlength="200"
						class="input-xxlarge required" disabled="disabled" /> <sys:ckeditor
						replace="signText" uploadPath="/oa/sign" /> --%></td>
			</tr>
			<tr class='noprint'>
				<td>附件：</td>
				<td colspan="4"><input type="hidden"
					id="billingFile${oaSign.id}" value="${oaSign.signFiles}" /> <sys:ckfinder
						input="billingFile${oaSign.id}" readonly="true" type="files"
						uploadPath="/oa/sign" selectMultiple="true" /></td>
			</tr>
			<c:if test="${not empty oaSign.signHeadOpinion }">
			<tr>
				<td>部门负责人意见：</td>
				<td colspan="4">${oaSign.signHeadOpinion }</td>
			</tr>
			</c:if>
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
				<td>拟稿人：</td>
				<td>${crName}</td>
				<td>拟稿时间:</td>
				<td><fmt:formatDate value="${oaSign.createDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
				<tr>
				<td>拟稿部门:</td>
				<td colspan="4">${ofName }</td>
			</tr>
			
		</table>
		<div class="row noprint " style="text-align:center;">
				<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history.go(-1)" />
			</div>
	</form:form>
	<br/>
	<br/>
	</div>
	</div>
	</div>
</body>
</html>