<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>发起人最后申请</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
						.validate(
								{
									rules: {
										"actor.name": {
									        required: true
									     },
									    
									},
								    messages: {
								    	"actor.name": {
								          required: "必填信息",
								        },
								       
								    },
									
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
	$("#selectName").change(function(){  
		$(this).valid();  
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
		action="${ctx}/oa/sign/oaSign/mysingsave" method="post"
		class="form-inline">
<input type="hidden" name="token" value="${token }">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
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
				<td><form:select path="signNumber" data-style="btn-inverse" data-live-search="true" 
					class="selectpicker required"  id="select">
						<form:option value="" label="请选择编号" />
						<form:options items="${fns:getDictList('sign_number')}"
							itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select><input id="cor" name="cor" type="text" value="${cor }" class="input-xlarge " readonly="readonly" style="width: 130px" /><span class="help-inline"><font color="red">*</font></span></td>
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
				<tr>

					<td>是否提交</td>
					<td colspan="4" ><label><input id="actor" name="Fruit" type="radio" value="1" class="required i-checks"  checked/>同意</label>
						<label><input id="actor" name="Fruit" type="radio" value="2" class="required i-checks" />重新发起</label> <span
						style="display: none;"> <form:input path="procInsId" /></span><span class="help-inline"><font color="red">*</font></span></td>

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