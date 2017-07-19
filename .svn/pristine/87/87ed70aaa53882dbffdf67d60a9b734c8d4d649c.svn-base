<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻中心管理</title>
	<meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/summernote/summernote.css" rel="stylesheet">
	 <link href="${ctxStatic}/summernote/summernote-bs3.css" rel="stylesheet">
	 <script src="${ctxStatic}/summernote/summernote.min.js"></script>
	 <script src="${ctxStatic}/summernote/summernote-zh-CN.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			
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
			
			var type = '${oaNews.status}';
			
			if (type == null || type == '')
				$("#status1").iCheck('check');
		});
	</script>
	<style>
		.table.myoa-table-noborder > tbody > tr > td:nth-child(2n+1) {
			width: 10%;
		}
	</style>
</head>
<body class="gray-bg">

	<div class="wrapper wrapper-content">
		<div class="ibox" style="width:800px; margin:0 auto;">
			<div class="ibox-title">
				<h5>新增文章</h5>
			</div>
			<div class="ibox-content">
				<form:form id="inputForm" modelAttribute="oaNews" action="${ctx}/oa/newscenter/oaNews/save" method="post" class="form-horizontal">
					<form:hidden path="id"/>
					<sys:message content="${message}"/>
					<table class="table table-condensed dataTables-example dataTable no-footer myoa-newstable-noborder myoa-table-noborder">
					   <tbody>
							<tr>
								<td class="width-15"><label class="pull-right">新闻标题：<font color="red">*</font></label></td>
								<td class="width-35">
									<form:input path="title" htmlEscape="false" maxlength="30" class="form-control required" style="width:60%"/>
								</td>
							</tr>
							<tr>
								<td class="width-15"><label class="pull-right">栏目类型：</label></td>
								<td class="width-35">
									<form:select path="type"  class="selectpicker" data-style="btn-inverse"  data-live-search="true">
										<form:options items="${fns:getNewsColumnList()}" itemLabel="columnName" itemValue="id" htmlEscape="false"/>
									</form:select>
								</td>
							</tr>
							<tr>
								<td class="width-15"><label class="pull-right">新闻图片：</label></td>
								<td class="width-35">
									<form:hidden id="photo" path="photo" htmlEscape="false" maxlength="255" class="form-control"/>
									<sys:ckfinder input="photo" type="images" uploadPath="/oa/newscenter/oaNews" selectMultiple="false"
									buttonLabel="上传图片"/>
								</td>										
							</tr>
							<tr>										
								<td class="width-15"><label class="pull-right">新闻内容：</label></td>
								<td class="width-35" colspan="3">
			                        <form:textarea path="content" htmlEscape="false" rows="6"  style="display: none;" maxlength="20000"  class="form-control "/> 
									<sys:ckeditor replace="content" uploadPath="/oa/notify" />
								</td>
							</tr>
							<tr>
								<td class="width-15"><label class="pull-right">状态：</label></td>
								<td class="width-35">
									<form:radiobuttons path="status" items="${fns:getDictList('oa_news_status')}" itemLabel="label"
									itemValue="value" htmlEscape="false" class="i-checks required" id="status"/>
								</td>
							</tr>
						</tbody>
					</table>
						<div style="text-align: center;">
							<shiro:hasPermission name="oa:newscenter:oaNews:edit">
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"  />&nbsp;
							</shiro:hasPermission>
							<input id="btnCancel" class="btn" type="button" value="返 回" onclick="window.location.replace('${ctx}/oa/newscenter/oaNews/list');" />
						</div>
				</form:form>
				<br>
				<br>
			</div>
		</div>
	</div>
</body>
</html>