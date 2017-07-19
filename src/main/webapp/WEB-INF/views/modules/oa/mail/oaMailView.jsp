<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>站内邮件</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	var validateForm;
	function doSubmit() {//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		if (validateForm.form()) {
			$("#inputForm").submit();
			return true;
		}

		return false;
	}
	$(document).ready(
			function() {
				validateForm = $("#inputForm")
						.validate(
								{
									rules : {},
									messages : {},
									submitHandler : function(form) {
										//loading('正在提交，请稍等...');
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

			});
</script>
<style type="text/css">
/* div.input-group.treeselect-div {
	width: 88%;
}

div.input-group.treeselect-div label.error {
	height: 20px;
} */
.xin_break_div {
	word-wrap: break-word;
	word-break: break-all;
}
</style>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaMailRecord"
		action="${ctx}/oa/mail/oaMail/dealExam" method="post"
		class="form-horizontal">
		<input type="hidden" value="${oaMail.id}" name="mailId" />
		<input type="hidden" value="${token}" name="token" />
		<sys:message content="${message}" />
		<table
			class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tbody>

				<tr>
					<td class="width-15 active"><label class="pull-right">部门：
					</label></td>
					<td class="width-35"><div class="xin_break_div">${oaMail.createBy.office.name}</div></td>
					<td class="width-15 active"><label class="pull-right">发起人：</label></td>
					<td class="width-35"><div class="xin_break_div">${oaMail.createBy.name}</div></td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">发起时间：</label></td>
					<td class="width-35">
						<div class="xin_break_div">
							<fmt:formatDate value="${oaMail.updateDate }"
								pattern="yyyy-MM-dd HH:mm" />
						</div>
					</td>
					<td class="width-15 active"><label class="pull-right">状态：</label></td>
					<td class="width-35"><div class="xin_break_div">
							<c:choose>
								<c:when test="${oaMail.isdraft=='0'}">
									<font color="red">草稿</font>
								</c:when>
								<c:when test="${oaMail.isdraft=='2'}">
									<font color="green">处理中</font>
								</c:when>
								<c:otherwise>
									<font color="blue">已办结</font>
								</c:otherwise>
							</c:choose>
						</div></td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">收件人：
					</label></td>
					<td class="width-35"><div class="xin_break_div">${oaMail.mainName}</div></td>
					<td class="width-15 active"><label class="pull-right">抄送：</label></td>
					<td class="width-35"><div class="xin_break_div">${oaMail.otherName}</div></td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">标题：
					</label></td>
					<td class="width-35"><div class="xin_break_div">${oaMail.title}</div></td>
					<td class="width-15 active"><label class="pull-right">附件：</label></td>
					<td class="width-35"><div id="file" class="xin_break_div">
							<sys:split-file-name urls="${oaMail.file}" id="file"></sys:split-file-name>
						</div></td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">内容：
					</label></td>
					<td class="width-35" colspan="3"><div class="xin_break_div">${oaMail.content}</div></td>
				</tr>
				<c:if test="${isdeal}">
					<tr>
						<td class="width-15 active"><label class="pull-right">回复留言：
						</label></td>
						<td class="width-35" colspan="3"><form:textarea path="text"
								htmlEscape="false" rows="5" maxlength="3000"
								class="form-control " /></td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</form:form>



	<div style="margin: 10px;">
		<table
			class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<thead>
				<tr>
					<th class="sort-column title">部门</th>
					<th class="sort-column title">处理人</th>
					<th class="sort-column title">意见</th>
					<th class="sort-column title">时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="now" items="${list}">
					<tr>
						<td><div class="xin_break_div">${now.createBy.office.name }</div></td>
						<td><div class="xin_break_div">${now.createBy.name }</div></td>
						<td><div class="xin_break_div">${now.text }</div></td>
						<td><div class="xin_break_div">
								<fmt:formatDate value="${now.createDate }"
									pattern="yyyy-MM-dd HH:mm" />
							</div></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<br>
	<div class="foot-btn" style="padding-left: 10px;">
		<c:if test="${isdeal}">
			<button class="btn btn-primary" onclick="doSubmit()">提交</button>
		</c:if>
		<c:if test="${empty back}">
			<button class="btn" onclick="history.go(-1)">返回</button>
		</c:if>
	</div>
</body>
</html>