<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
<title>公文管理管理</title>
<meta name="decorator" content="default" />
<script src="${ctxStatic}/jquery/jquery-ui-1.10.2.custom.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(
		function() {
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
			var departmentsign = document.getElementById("departmentsign").value;
			var departmentsigns = new Array();
			departmentsigns = departmentsign.split(",");
			for ( var str in departmentsigns) {
				$("input[name=departmentsign][value="+ departmentsigns[str] + "]").attr("checked", true);
			}

						//$("#name").focus();
						$("#inputForm").validate(
								{
									submitHandler : function(form) {
										loading('正在提交，请稍等...');
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
						$("#modal-container-262575").draggable({
							handle : ".modal-header",
							cursor : 'move',
							refreshPositions : false
						});
					});

	//判断是否选择发送人
	function choose() {
		var upper = document.getElementById("userName").value;
		if (upper == null || upper == '') {
			top.$.jBox.tip.mess = 1;
			top.$.jBox.tip("请选择发送人！", "error", {
				persistent : true,
				opacity : 0
			});
			$("#messageBox").show();
			return false;
		}
		$('#flag').val('yes')
		return true;
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
	
	/* function save(){$("#modal-container-262575").hide();} */
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
</style>

</head>
<body>


	<form:form id="inputForm" modelAttribute="oaArchives"
		action="${ctx}/oa/oaArchives/save" method="post"
		class="breadcrumb form-search">
		<sys:message content="${message}" />
		<form:hidden path="id" />
		<input type="hidden" name="departmentsign" id="departmentsign"
			value="${oaArchives.departmentsign}" />

		<ul class="ul-form">
			<!-- 	<li class="btns"><input id="btnSave" class="btn btn-primary"  -->
			<%-- 		 onclick="window.location.href='${ctx}/oa/oaArchives/save?isdraft=1&&id=${oaArchives.id}'" type="button" value="保存"/></li> --%>
			<li class="btns"><a id="modal-262575"
				href="#modal-container-262575" role="button" class="btn btn-primary"
				data-toggle="modal">编辑正文</a>
				<div class="modal fade" id="modal-container-262575" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">正文</h4>
							</div>
							<div class="modal-body">

								<form:textarea path="content" htmlEscape="false" rows="20"
									maxlength="20000" class="input-xxlarge required" />
								<sys:ckeditor replace="content" uploadPath="/oa/oaArchives" />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">保存</button>
							</div>
						</div>
					</div>
				</div></li>
			<li class="btns">
				<!-- 	<div class="form-actions"> --> <shiro:hasPermission
					name="oa:oaArchives:edit">
					<input id="btnSubmit" class="btn btn-primary" type="submit"
						value="提交" onclick="return choose();" />&nbsp;			
			</shiro:hasPermission> <input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" /> <!-- 		</div> -->
			</li>
		</ul>

		<table class="table table-bordered">
			<caption>
				<h3>${fns:getConfig('oaArchivesCaption')}<h2>
			</caption>
			<tbody>
				<tr>
					<td class="all"><label class="control-label">发文字号：</label> <form:select
							path="code" class="input-xlarge " id="code">
							<form:option value="楚誉【】" label="楚誉字" />
							<form:options items="${fns:getDictList('code')}" maxlength="64"
								itemLabel="label" itemValue="value" htmlEscape="false" />
						</form:select></td>
					<td><label class="control-label">紧急程度：</label> <form:select
							path="urgency" class="input-xlarge ">
							<form:option value="2" label="普通" />
							<form:options items="${fns:getDictList('urgency')}"
								itemLabel="label" itemValue="value" htmlEscape="false" />
						</form:select></td>



				</tr>
				<tr class="note">
					<td class="left"><label class="control-label" for="manager">核稿：</label>
						${oaArchives.leadText}
					<td class="right" colspan="2"><label class="control-label">拟稿部门和拟稿人：</label>
						${fns:getUser().office.name}&nbsp;${fns:getUser().name}</td>
				</tr>
				<tr>
					<td class="all" colspan="3"><label class="control-label"
						for="tilte">事由：</label> <form:input path="title"
							htmlEscape="false" id="title" maxlength="255"
							class="input-xlarge " /> <span class="help-inline"><font
							color="red">*</font> </span></td>
				</tr>
				<tr>
					<td class="all" colspan="3"><label class="control-label"
						for="tilte">发文日期：</label> <input name="exeDate" type="text"
						readonly="readonly" maxlength="20" class="input-medium Wdate "
						value="<fmt:formatDate value="${oaArchives.exeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
						<span class="help-inline"><font color="red">*</font> </span></td>
				</tr>
				<tr>
					<td class="all" colspan="3"><label class="control-label">发送：</label>
						<sys:treeselect id="user" name="user.id"
							value="${oaArchives.user.id}" labelName="user.name"
							labelValue="${oaArchives.user.name}" title="用户"
							url="/sys/office/treeData?type=3" cssClass="" allowClear="true"
							notAllowSelectParent="true" /></td>


				</tr>
				<%-- 					<tr >
						<td class="all" colspan="3"> 
						<label class="control-label">抄送：</label>
						<sys:treeselect id="user" name="user.id" value="${oaArchives.user.id}" labelName="user.name" labelValue="${oaArchives.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true" />
					
						</td> 
												
					</tr> --%>
				<!-- 					<tr > -->
				<!-- 						<td class="all" colspan="3"> -->
				<!-- 						<label class="control-label" for="contenthref">正文：</label> -->
				<!-- 						<a id="contenthref" href="">正文内容</a>	 -->
				<!-- 						</td> -->

				<!-- 					</tr> -->
				<tr>
					<td class="all" colspan="3"><label class="control-label">密级：</label>
						<form:select path="secrets" class="input-xlarge ">
							<form:option value="0" label="秘密" />
							<form:options items="${fns:getDictList('secrets')}"
								itemLabel="label" itemValue="value" htmlEscape="false" />
						</form:select></td>
				</tr>

				<tr>
					<td class="all" colspan="3"><label class="control-label"
						for="files">相关部门会签：</label> <form:checkboxes path="departmentsign"
							items="${fns:getDictList('departmentsign')}" value=""
							itemLabel="label" itemValue="value" htmlEscape="false"
							class="departmentsign" /></td>
				</tr>

				<tr>
					<td class="all" colspan="3"><label class="control-label"
						for="files">附件：</label> <form:hidden id="files" path="files"
							htmlEscape="false" maxlength="255" class="input-xlarge" /> <sys:ckfinder
							input="files" type="files" uploadPath="/oa/oaArchives"
							selectMultiple="true" /></td>

				</tr>
				<tr>
					<td class="all" colspan="3"><label class="control-label">主题词：</label>
						<form:input path="keyword" htmlEscape="false" maxlength="255"
							class="input-xlarge " /></td>
				</tr>


				<tr>
					<td class="left"><label class="control-label">印发时间：</label></td>

					<td colspan="2"><label class="control-label">印发份数：</label></td>
				</tr>

				<tr>
				<td class="all" colspan="3"><label class="control-label">是否提交：</label><label><input name="Fruit" type="radio" value="1"
						onclick="setSelectUserNo(this);" />&nbsp;&nbsp;保存草稿暂时不提交 </label><span
					style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;(默认不选,提交审核)</span></td>

				</tr>

<!-- 				<tr> -->
<!-- 					<td class="all" colspan="3"><label class="control-label" -->
<!-- 						for="managerText">是否提交：</label> <input type="radio" value="0" -->
<!-- 						name="isdraft" />保存为草稿暂不提交</td> -->
<!-- 				</tr> -->
			</tbody>
		</table>
	</form:form>
</body>
</html>