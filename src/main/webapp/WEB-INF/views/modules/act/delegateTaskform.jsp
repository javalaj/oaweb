<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>添加分组</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
var validateForm;var iphonesFlag;
$(document).ready(function() {
	validateForm = $("#inputForm").validate({
		submitHandler: function(form){
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
})
function doSubmit() {
if(validateForm.form()){
				$("#inputForm").submit();
				oaLoading('操作正在进行中，请耐心等待');
					return true;
		}
}


</script>
</head>

<body>
<form:form id="inputForm"
		action="${ctx}/act/task/delegateTask?taskId=${taskId }" method="post" class="form-horizontal">
		<table
			class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
			<tbody>
			<tr>
					<td>选择任务处理人: <span class="help-inline"><font color="red">*</font></span></td>
					<td>
					   <sys:treeselect id="userId" name="userId" value="" labelName="userId" labelValue=""
						title="任务处理人" url="/sys/office/treeData?type=3&isAll=true" cssClass="form-control required" allowClear="true" notAllowSelectParent="true"  />
					</td>											
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>