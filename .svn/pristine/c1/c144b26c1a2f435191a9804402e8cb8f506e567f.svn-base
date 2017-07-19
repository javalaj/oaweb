<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目成员管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				rules: {
					"user.name": {
				        required: true
				     }
				},
			    messages: {
			        "user.name": {
			          required: "必填信息",
			        }
			    },
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
			$("#userName").change(function(){  
				$(this).valid();  
			});
		});
	</script>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>项目成员<shiro:hasPermission name="oa:project:oaProjectMember:edit">${not empty oaProjectMember.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="oa:project:oaProjectMember:edit">查看</shiro:lacksPermission></h5>
				<div class="ibox-tools">
				</div>
			</div>
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
					<form:form id="inputForm" modelAttribute="oaProjectMember" action="${ctx}/oa/project/oaProjectMember/save" method="post" class="form-horizontal">
						<form:hidden path="id"/>
						<form:hidden path="project.id"/>
						<sys:message content="${message}"/>
						<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
						   <tbody>
						      <tr>
						         <td>	
						        	<label class="pull-right">关联的用户 <span class="help-inline"><font color="red">*</font> </span></label>
						         </td>
						         <td>
						         	<sys:treeselect id="user" name="user.id" value="${oaProjectMember.user.id}" labelName="user.name" labelValue="${oaProjectMember.user.name}"
										title="用户" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
									
						         </td>
						      </tr>
						      <tr>
						         <td>	
						        	<label class="pull-right">成员类别 <span class="help-inline"><font color="red">*</font> </span></label>
						         </td>
						         <td>
       								<form:select path="type" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
										<form:options items="${fns:getDictListWithoutStrs('OaProjectMember_type','0')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
									
						         </td>
						      </tr>
						      <tr>
						         <td>	
						        	<label class="pull-right">职责</label>
						         </td>
						         <td>
						         	<form:input path="duty" htmlEscape="false" maxlength="200" class="form-control "/>
						         </td>
						      </tr>
						      <tr>
						      	 <td></td>
						         <td>
								         <shiro:hasPermission name="oa:project:oaProjectMember:edit"><input id="btnSubmit" class="btn btn-myoa-sec btn-myoa-large" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
										 <a href="${ctx}/oa/project/oaProject/form?id=${oaProjectMember.project.id}&&tabIndex=4"
												class="btn btn-myoa btn-myoa-large"><i class="fa fa-back"></i>返回</a>
						          </td>
						      </tr>
						   </tbody>
						   </table> 		
					</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>