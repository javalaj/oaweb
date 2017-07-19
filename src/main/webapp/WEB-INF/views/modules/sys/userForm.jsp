<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<style>
		.myoa-table-noborder.table > thead > tr > th, 
		.myoa-table-noborder.table > tbody > tr > th, 
		.myoa-table-noborder.table > tfoot > tr > th, 
		.myoa-table-noborder.table > thead > tr > td, 
		.myoa-table-noborder.table > tbody > tr > td, 
		.myoa-table-noborder.table > tfoot > tr > td {
			border-top: none;
		}
	</style>
	<script type="text/javascript">
	var validateForm;
	function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
	  if(validateForm.form()){
		  $("#inputForm").submit();
		  return true;
	  }

	  return false;
	}
	//判断输入的工号是否存在
	function sub(){
		var no = document.getElementById("no").value.trim();
		<c:forEach items="${listUser}" var="item" varStatus="status">
			<c:if test="${item.no ne user.no}"> //数据库中的工号不等于当前user.no
			if(no == ("${item.no}")){
				top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("已存在此用户工号！", "error", {
					persistent : true,
					opacity : 0
				});
				$("#messageBox").show();
				return false;
			}			
			</c:if>
		</c:forEach>
		return true;
	}
		$(document).ready(function() {			  
			//$("#no").focus();		
			validateForm = $("#inputForm").validate({
				rules: {
					loginName: {remote: "${ctx}/sys/user/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')},
					no:{remote: "${ctx}/sys/user/checkNo?oldNo=" + encodeURIComponent('${user.no}')}
				},
				messages: {			
					loginName: {remote: "用户登录名已存在"},
					no:{remote:"用户工号已存在"},
					confirmNewPassword: {equalTo: "输入与上面相同的密码"}
				},
				submitHandler: function(form){
					oaLoading('操作正在进行中，请耐心等待');
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
			//否则打开修改对话框，不做任何更改直接submit,这时再触发远程校验，耗时较长，
			//submit函数在等待远程校验结果然后再提交，而layer对话框不会阻塞会直接关闭同时会销毁表单，因此submit没有提交就被销毁了导致提交表单失败。
			//$("#inputForm").validate().element($("#loginName"));
		});

	
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-table-noborder">
		   <tbody>
		      <tr>
		         <td class="width-15">	<label>头像：</label></td>
		         <td class="width-35"><form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="form-control"/>
						<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/></td>
		         <td  class="width-15">	<label>归属公司: <font color="red">*</font></label></td>
		         <td class="width-35"><sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}"
						title="公司" url="/sys/office/treeData?type=1" cssClass="form-control required"/></td>
		      </tr>
		      
		      <tr>
		         <td><label>归属部门: <font color="red">*</font></label></td>
		         <td><sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="form-control required" notAllowSelectParent="false"/></td>
		         <td><label>工号: <font color="red">*</font></label></td>
		         <td>
		         <input id="oldNo" name="oldNo" type="hidden" value="${user.no}"><form:input path="no" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td><label>岗位: <font color="red">*</font></label></td>
		         <td><form:input path="duty" htmlEscape="false" maxlength="20" class="form-control required"/></td>
		         <td><label>性别: <font color="red">*</font></label></td>
		         <td><form:select path="gender" class="selectpicker" data-style="btn-inverse" data-live-search="true">
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select></td>
		      </tr>
		       <tr>
		         <td><label>入职日期: <font color="red">*</font></label></td>
		         <td><input id="inDate" name="indate" type="text" maxlength="20" class="laydate-icon form-control layer-date input-sm required"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false})"
					value="<fmt:formatDate value="${user.indate}" pattern="yyyy-MM-dd"/>"
					/></td>
		         <td><label>办公地点:</label></td>
		         <td><form:input path="worklocation" htmlEscape="false" maxlength="100" class="form-control"/></td>
		      </tr>
		      <tr>
		         <td><label>姓名: <font color="red">*</font></label></td>
		         <td><form:input path="name" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		         <td><label>登录名: <font color="red">*</font></label></td>
		         <td><input id="oldLoginName" name="oldLoginName" type="hidden" value="${user.loginName}">
					 <form:input path="loginName" htmlEscape="false" maxlength="50" class="form-control required userName"/></td>
		      </tr>
		      
		      
		      <tr>
		         <td><label>密码: <c:if test="${empty user.id}"><font color="red">*</font></c:if></label></td>
		         <td><input id="newPassword" name="newPassword" type="password" value="" maxlength="50" minlength="3" class="form-control ${empty user.id?'required':''}"/>
					<c:if test="${not empty user.id}"><span class="help-inline">若不修改密码，请留空。</span></c:if></td>
		         <td><label>确认密码: <c:if test="${empty user.id}"><font color="red">*</font></c:if></label></td>
		         <td><input id="confirmNewPassword" name="confirmNewPassword" type="password"  class="form-control ${empty user.id?'required':''}" value="" maxlength="50" minlength="3" equalTo="#newPassword"/></td>
		      </tr>
		      
		       <tr>
		         <td><label>邮箱:</label></td>
		         <td><form:input path="email" htmlEscape="false" maxlength="100" class="form-control email"/></td>
		         <td><label>电话:</label></td>
		         <td><form:input path="phone" htmlEscape="false" maxlength="100" class="form-control"/></td>
		      </tr>
		      
		      <tr>
		         <td><label>手机:</label></td>
		         <td><form:input path="mobile" htmlEscape="false" maxlength="100" class="form-control"/></td>
		         <td><label>是否允许登录:</label></td>
		         <td><form:select path="loginFlag"  class="selectpicker" data-style="btn-inverse" data-live-search="true">
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select></td>
		      </tr>
		      
		      <tr>
		         <td><label>用户类型:</label></td>
		         <td><form:select path="userType" class="selectpicker" data-style="btn-inverse" data-live-search="true">
					<form:option value="" label="请选择"/>
						<form:options items="${fns:getDictList('sys_user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select></td>
		         <td><label>用户角色: <font color="red">*</font></label></td>
		         <td>
		         	<form:checkboxes path="roleIdList" items="${allRoles}" itemLabel="name" itemValue="id" htmlEscape="false" cssClass="i-checks required"/>
		         	<label id="roleIdList-error" class="error" for="roleIdList"></label>
		         </td>
		      </tr>
		      
		       <tr>
		         <td><label>备注:</label></td>
		         <td><form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control"/></td>
		         <td><label></label></td>
		         <td></td>
		      </tr>
		      
		      <c:if test="${not empty user.id}">
		       <tr>
		         <td><label>创建时间:</label></td>
		         <td><span class="lbl"><fmt:formatDate value="${user.createDate}" type="both" dateStyle="full"/></span></td>
		         <td><label>最后登录:</label></td>
		         <td><span class="lbl">IP: ${user.loginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${user.loginDate}" type="both" dateStyle="full"/></span></td>
		      </tr>
		     </c:if>
		</tbody>   
		</table>   
	</form:form>
</body>
</html>