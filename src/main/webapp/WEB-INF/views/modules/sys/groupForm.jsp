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
	$("input[name='name']").keyup(function(){
		iphonesFlag=true;
		var groupName=$("input[name='name']").val();
		$.ajax({
			url:"${ctx}/oa/adress/formCheckGroup",
			type:"post",
			dataType:"json",
			data:{name:groupName},
			success:function(data){
				for(var i = 0; i < data.length; i++) {
					if(groupName==data[i].name){
						iphonesFlag=false;
						break;
					}
					else{
						$("#groupTip").text("*");
					}
				}
			}
		});
	});	
})
function doSubmit() {
if(validateForm.form()){
	if(!iphonesFlag){
		$("#groupTip").text("*分组名重复");
		return false;
		}else{
				$("#inputForm").submit();
				oaLoading('操作正在进行中，请耐心等待');
					return true;
		}
}
	return false;
}


</script>
</head>

<body>
<form:form id="inputForm" modelAttribute="cytspoaaddressgroup"
		action="${ctx}/oa/adress/saveGroup" method="post" class="form-horizontal">
		<table
			class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
			<tbody>
			<tr>
					<td>分组名: <span class="help-inline"><font color="red" id="groupTip">*</font></span></td>
					<td><form:input path="name" name="name" 
							maxlength="64" class="form-control required" />
						</td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>