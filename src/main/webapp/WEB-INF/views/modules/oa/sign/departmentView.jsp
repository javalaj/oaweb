<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>查看—签报申请</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
		<script type="text/javascript">

$(document).ready(function() {

   CKEDITOR.config.readOnly = true;

});

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
		action="${ctx}/oa/sign/oaSign/depform" method="post"
		class="form-horizontal">
		<table class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
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
				<c:if test="${not empty oaSign.signNumber }">
					<td>编号：</td>
					<td><c:choose>
							<c:when test="${oaSign.signNumber == 0}">
								【楚财签】${oaSign.code }号
							</c:when>
							<c:when test="${oaSign.signNumber == 1 }">
							【楚人签】${oaSign.code }号
							</c:when>
							<c:when test="${oaSign.signNumber == 2 }">
							【楚市签】${oaSign.code }号
							</c:when>
							<c:when test="${oaSign.signNumber == 3 }">
							【楚研签】${oaSign.code }号
							</c:when>
							<c:otherwise>
							【楚技签】${oaSign.code }号
							</c:otherwise>
						</c:choose></td>
				</c:if>
			</tr>

			<tr>
				<td>标题：</td>
				<td>${oaSign.signTitile }</td>
				<c:if test="${not empty oaSign.pName }">
					<td>相关部门会签:</td>
					<td>${oaSign.pName}</td>
				</c:if>
			</tr>
			<tr>
				<td>内容：</td>
				<td colspan="4"><textarea rows="6" maxlength="200"
						class="input-xxlarge required" disabled="disabled"
						readonly="readonly">${oaSign.signContent }</textarea></td>
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
				<td colspan="4"><input type="hidden"
					id="billingFile${oaSign.id}" value="${oaSign.signFiles}" /> <sys:ckfinder
						input="billingFile${oaSign.id}" readonly="true" type="files"
						uploadPath="/oa/sign" selectMultiple="true" /></td>
			</tr>
			<tr>
				<td>部门负责人意见：</td>
				<td colspan="4">${oaSign.signHeadOpinion }</td>
			</tr>
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
				<td colspan="3">
					<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history.go(-1)" />
			<c:if test="${task != null}">
				&nbsp;<input
					onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
					class="btn" type="button" value="流程跟踪" />
			</c:if>
				</td>
				</tr>
		</table>
		<div class="form-actions">
		
		</div>
	</form:form>
	

	<br/>
	<br/>
	</div>
	</div>
	</div>
	<c:if test="${not empty oaSign.id}">
		<act:histoicFlow procInsId="${oaSign.procInsId}" />
	</c:if>
</body>
</html>