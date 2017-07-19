<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>日程管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
					$("#btnSubmit").click(function() {
							var judge1 = judgeInt(); 
							return judge1;
						});
				$("#inputForm")
						.validate(
								{

									rules : {
										"compere.name" : {
											required : true
										},
										"actor.name" : {
											required : true
										},
										"isback.name" : {
											required : true
										},
										
									},
									messages : {
										"compere.name" : {
											required : "必填信息",
										},
										"actor.name" : {
											required : "必填信息",
										},
										"isback.name" : {
											required : "必填信息",
										},
									},
										submitHandler: function(form){
											oaLoading('操作正在进行中，请耐心等待');
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
				function judgeInt() {
					var judge = true;
					var str = "";
					var str1 = "*"
					var str2 = "不能为空并且输入两位以上的数 *";
					$("input[name='planTitle']").each(function() {
							if (!(/\S{2,}/.test($(this).val()))) {
								judge = false;
								str = str2;
							} else {
								str = str1;
							}
							$(this).next().children().text(str);
					});
					return judge;
				}
				$("input[name='planTitle']").blur(function(){
					if (!(/\S{2,}/.test($(this).val()))) {
						$(this).next().children().text("不能为空并且输入两位以上的数 *");
					} else {
						$(this).next().children().text("*");
					}
				})

				$("#select").change(function() {
					var select = $("#select").val();
					if (select == 0) {
						//工作任务
						window.location.href = "${ctx}/oa/mytask/myTask/form";
					} else if (select == 1) {
						//私人活动进入页面
						window.location.href = "${ctx}/oa/mytask/oaPlan/href";
					} else {

					}

				});
				$("#compereName").change(function() {
					$(this).valid();
				});
				$("#actorName").change(function() {
					$(this).valid();
				});

			});
</script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>新建会议: </h5>
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
	<form:form id="inputForm" modelAttribute="oaPlan"
		action="${ctx}/oa/mytask/oaPlan/save" method="post"
		class="form-inline">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">

			<tr>
				<td>计划类型： <font color="red">*</font></td>
				<td><form:select path="planType" class="form-control required"
						id="select" cssStyle="width: 75%">
						<form:option value="" label="" />
						<form:options items="${fns:getDictList('plan_type')}"
							itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select> <span class="help-inline"> </span></td>
				<td>会议日期： <font color="red">*</font></td>
				<td><input name="startDay" type="text" readonly="readonly"
					maxlength="20" class="laydate-icon form-control required"
									style="background-color: #FFFFFF;"
					value="<fmt:formatDate value="${oaPlan.startDay}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,minDate:'%y-%M-%d'});" />
					<span class="help-inline"> </span></td>
			</tr>
			<tr>
				<td>开始时间： <font color="red">*</font></td>
				<td colspan="4"><input name="startTime" type="text"
					readonly="readonly" maxlength="20"
					class="laydate-icon form-control required"
									style="width: 85px; background-color: #FFFFFF;"
					value="<fmt:formatDate value="${oaPlan.startTime}" pattern="HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'HH:mm',isShowClear:false,qsEnabled:true,quickSel:['08:30','12:00','13:00','13:30','17:30']});" />
					<span class="help-inline"> </span></td>


			</tr>
			<tr>
				<td>会议主题： <font color="red">*</font></td>
				<td><form:input  name="planTitle" path="planTitle" htmlEscape="false"
						maxlength="255" class="form-control" autocomplete="off" cssStyle="width: 55%" />
					<span class="help-inline"></span></td>
				<td>关联项目:</td>
				<td><form:select path="projectid" cssStyle="width: 75%" class="form-control required"
						name="projectid">
						<option value="0">请选择</option>
						<c:forEach items="${page}" var="oaProject" varStatus="status">
							<option value="${oaProject.id}">${oaProject.projectName}</option>
						</c:forEach>
					</form:select></td>
			</tr>
			<tr>
				<td>主持人: <font color="red">*</font></td>
				<td><sys:treeselect id="compere" name="compere"
						value="${oaPlan.compere.id}" labelName="compere.name"
						labelValue="${oaPlan.compere.name}" title="主持人"
						url="/sys/office/treeData?type=3&isAll=true" cssClass=" form-control input-sm required"
							allowClear="true" notAllowSelectParent="true" /> <span
					class="help-inline"></span></td>
				<td>参与者:</td>
				<td><sys:treeselect id="actor" name="actor"
						value="${oaPlan.actor.id}" labelName="actor.name"
						labelValue="${oaPlan.actor.name}" title="参与者"
						url="/sys/office/treeData?type=3&isAll=true" cssClass=" form-control input-sm required"
						allowClear="true" notAllowSelectParent="true" checked="true" /> <span
					class="help-inline"><font color="red">*</font> </span></td>
			</tr>
			<tr>
				<td>会议内容：</td>
				<td colspan="4"><form:textarea path="content"
						htmlEscape="false" rows="4"  cols="100" maxlength="1000"
						class="form-control " /></td>
			</tr>



			<tr>
				<td class="tit">附件:</td>
				<td colspan="4"><form:hidden id="files" path="files"
						htmlEscape="false" maxlength="64" class="iform-control" /> <sys:ckfinder
						input="files" type="files" uploadPath="/oa/mytask/oaPlan"
						selectMultiple="true" /></td>
			</tr>

			<tr>
				<td>是否回执：</td>
				<td><form:radiobuttons path="isback" 
						items="${fns:getDictList('isback')}" itemLabel="label"
						itemValue="value" htmlEscape="false" class="i-checks" /></td>
				<td >日程提醒：</td>
				<td ><form:select path="tip" class="form-control " cssStyle="width: 75%">
						<form:option value="4" label="" />
						<form:options items="${fns:getDictList('tip')}" itemLabel="label"
							itemValue="value" htmlEscape="false" />
					</form:select></td>
			</tr>

<tr>
<td colspan="3"></td>
<td colspan="2">
			<shiro:hasPermission name="oa:mytask:oaPlan:edit">
				<input id="btnSubmit" class="btn btn-myoa btn-myoa-large" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
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
		function history() {
			window.location.href = "${ctx}/oa/mytask/oaPlan/list";
		}
	</script>
</body>
</html>