<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>栏目管理管理</title>
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
				rules: {
					"admin.name": {
				        required: true
				     }
				},
			    messages: {
			    	"admin.name": {
			          required: "必填信息",
			        }
			    },	
				submitHandler: function(form){
					oaLoading('正在提交，请稍候...',3600);
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
			$("#admin").change(function(){  
				$(this).valid();  
			});
		});
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaNewsColumn" action="${ctx}/oa/newscenter/oaNewsColumn/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-table-noborder">
		   <tbody>
				<tr>
					<td><label class="pull-right">栏目名称： <font color="red">*</font></label></td>
					<td>
						<form:input path="columnName" htmlEscape="false" maxlength="6" class="form-control required"/>
					</td>
				</tr>
				<tr>
					<td><label class="pull-right">栏目管理员： <font color="red">*</font></label></td>
					<td>
						<sys:treeselect id="admin" name="admin.id" value="${oaNewsColumn.admin.id}" labelName="admin.name" labelValue="${fns:getUserById(oaNewsColumn.admin.id).name}"
							title="用户" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" notAllowSelectParent="true"/>
					</td>
				</tr>
				<tr>
					<td><label class="pull-right">栏目说明：</label></td>
					<td>
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					</td>
		  		</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>