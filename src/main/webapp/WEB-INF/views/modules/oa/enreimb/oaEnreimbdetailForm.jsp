<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存成功管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(document).ready(function() {
			validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍候...');
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
			
					laydate({
			            elem: '#date', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
			            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
			        });
		});
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaEnreimbdetail" action="${ctx}/oa/enreimb/oaEnreimbdetail/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
				<tr>
					<td class="width-15 active"><label class="pull-right">oa_enReimb表id：</label></td>
					<td class="width-35">
						<form:input path="oaEnrId" htmlEscape="false" maxlength="100" class="form-control "/>
					</td>
					<td class="width-15 active"><label class="pull-right">备注：</label></td>
					<td class="width-35">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">消费日期： <font color="red">*</font></label></td>
					<td class="width-35">
						<input id="date" name="date" type="text" maxlength="20" class="laydate-icon form-control layer-date required"
							value="<fmt:formatDate value="${oaEnreimbdetail.date}" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
					</td>
					<td class="width-15 active"><label class="pull-right">往来单位： <font color="red">*</font></label></td>
					<td class="width-35">
						<form:input path="currentunit" htmlEscape="false" maxlength="100" class="form-control required"/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">洽谈事由及项目名称： <font color="red">*</font></label></td>
					<td class="width-35">
						<form:input path="reason" htmlEscape="false" maxlength="100" class="form-control required"/>
					</td>
					<td class="width-15 active"><label class="pull-right">餐费：</label></td>
					<td class="width-35">
						<form:input path="meals" htmlEscape="false" class="form-control "/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">烟酒费：</label></td>
					<td class="width-35">
						<form:input path="alcoholtobacco" htmlEscape="false" class="form-control "/>
					</td>
					<td class="width-15 active"><label class="pull-right">我们公司的人数： <font color="red">*</font></label></td>
					<td class="width-35">
						<form:input path="numOur" htmlEscape="false" maxlength="10" class="form-control required"/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">客户人数：</label></td>
					<td class="width-35">
						<form:input path="numCustomers" htmlEscape="false" maxlength="10" class="form-control "/>
					</td>
					<td class="width-15 active"><label class="pull-right">是否在事前报批：</label></td>
					<td class="width-35">
						<form:input path="ispriorapproval" htmlEscape="false" maxlength="10" class="form-control "/>
					</td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>