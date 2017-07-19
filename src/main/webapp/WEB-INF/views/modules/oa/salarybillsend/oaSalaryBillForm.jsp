<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工资条发送管理</title>
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
			
		});
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaSalaryBill" action="${ctx}/oa/salarybillsend/oaSalaryBill/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<thead>
				<th>姓名</th>
				<th>发送工资条</th>
			</thead>
		   <tbody>
		   <c:forEach items="${oaSalaryBill.detailList}" var="oaSalaryDetails">
				<tr>
					<td class="width-35">
						${oaSalaryDetails.user}
					</td>
					<td class="width-35">
						${oaSalaryDetails.sendFlag eq '0' ? '成功':'失败'}
					</td>
		  		</tr>
		  	</c:forEach>
		  		<tr>
		  			<td colspan="2">本次上传工资记录${oaSalaryBill.successCount + oaSalaryBill.failCount}条，已成功发送${oaSalaryBill.successCount}条，
		  			其中有${oaSalaryBill.failCount}条发送失败，若发送失败请用户检查邮箱地址设置是否正确</td>
		  		</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>