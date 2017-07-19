<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>签报起草管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
				
						.validate(
								{
									rules: {
										"signType": {
									        required: true
									     },
									    
									},
								    messages: {
								    	"signType": {
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
                 
				$("#btnSubmit1").click(function(){
					$("#fruit").val("1")
         					
				})
				
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
		<h5>签报-申请 </h5>
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
	
<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<input onclick='btnPNGshow2("${procDefId}");' class="btn btn-primary btn-rounded btn-outline btn-sm"
							type="button" value="流程图" />
		</div>
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
				<td>密级： <font color="red">*</font></td>
				<td><form:select path="signType" class="selectpicker" data-style="btn-inverse" data-live-search="true" 
						id="select" cssStyle="width: 55% required">
						<form:option value="" label="请选择密级等级" />
						<form:options items="${fns:getDictList('sign_type')}"
							itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select>
					</td>
			</tr>

			<tr>
				<td>标题： <font color="red">*</font></td>
				<td colspan="4"><form:input path="signTitile"
						 cssStyle="width: 55%" htmlEscape="false" maxlength="255" class="form-control required " /></td>
			</tr>
			<tr>
				<td>内容：<font color="red">*</font></td>
				<td colspan="4"><form:textarea path="signContent"
						 cols="100" htmlEscape="false" rows="6" maxlength="200"
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
				<td>拟稿部门和拟稿人：</td>
				<td>[${ofName }]&nbsp;&nbsp;&nbsp;&nbsp;${crName }</td>
			</tr>
		<!-- 	<tr>
				<td>是否提交</td>
				<td><label><input name="Fruit" type="radio" value="1"
						onclick="setSelectUserNo(this);"  />&nbsp;&nbsp;保存草稿暂时不提交 </label><span
					style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;(默认不选,提交审核)</span></td>

			</tr> -->
			<tr>
			<td></td>
			<td colspan="2">
			<input id="btnSubmit1" class="btn btn-myoa" type="submit"
					value="存 草 稿" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="fruit"  name="Fruit" type="hidden" value="0"  />
				<input id="btnSubmit" class="btn btn-myoa-sec" type="submit"
					value="提 交" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history();" />
		</td>
			</tr>
		</table>
		
	</form:form>
		<br/>
		<br/>
		</div>
		</div>
		</div>
		<script type="text/javascript">
		
		function history(){
			window.location.href="${ctx}/oa/sign/oaSign/list";
		}
		
		</script>
</body>
</html>