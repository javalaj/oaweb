<%@page import="org.activiti.engine.repository.Model"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>供应商管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
			var validateForm;
			function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
			  if(validateForm.form()){
/* 				  choose();
				  if(choose()){  */
				  $("#inputForm").submit();
				  return true; /* } */ 
			  }
		
			  return false;
			}

			$(document).ready(function() {
				//$("#value").focus();
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
	
	
			//验证组织机构代码
			function choose(){
				var code = document.getElementById("orgCode").value;//获取输入的组织机构代码
				var con = document.getElementById("phone").value;//获取输入的联系方式
				var ws = [3, 7, 9, 10, 5, 8, 4, 2];
				var str = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
				var reg = /^([0-9A-Z]){8}-[0-9|X]$/;
				if (!reg.test(code)) {
				   /* top.$.jBox.tip.mess = 1;
					top.$.jBox.tip("企业代码不正确，请输入正确的企业代码！", "error", {
						persistent : true,
						opacity : 0
					});
					$("#messageBox").show(); */
					$("#tip").text("企业代码不正确，请输入正确的企业代码!");
					return false;
				}

				var sum = 0;
				for (var i = 0; i < 8; i++) {
				sum += str.indexOf(code.charAt(i)) * ws[i];
				}
				var c9 = 11 - (sum % 11);
				if(c9==10){
				   c9='X';
				}else if(c9==11){
				   c9='0';
				}

				if(c9 != code.charAt(9)){
				   /* top.$.jBox.tip.mess = 1;
					top.$.jBox.tip("企业代码不正确，请输入正确的企业代码！", "error", {
						persistent : true,
						opacity : 0
					});
					$("#messageBox").show(); */
					$("#tip").text("企业代码不正确，请输入正确的企业代码!");
				    return false;
				}
				
				//手机号码验证
				var re = /^(1[34578][0-9]{9})$/;
				if (re.test(con) == false) {
					top.layer.msg("手机号码输入不合规范！！");
					/* top.$.jBox.tip.mess = 1;
					top.$.jBox.tip("手机号码输入不合规范！！", "error", {
						persistent : true,
						opacity : 0
					}); */
					$("#messageBox").show();
					return false;
				}
				
// 				//联系方式的规则
// 				var mobile =  /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
// 				var phone = /^0\d{2,3}-?\d{7,8}$/; 
// 				if((!mobile.test(con))){
// 					top.$.jBox.tip.mess = 1;
// 					top.$.jBox.tip("请输入正确的联系方式！！", "error", {
// 						persistent : true,
// 						opacity : 0
// 					});
// 					$("#messageBox").show();
// 					return false;
// 				}
              $("#tip").text("");
				return true;
			}
</script>
</head>
<body>
<div class="ibox-content">
<form:form id="inputForm" modelAttribute="supmanagement" action="${ctx}/oa/supmanagement/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
		   <tbody>
		      <tr>
		         <td><label>组织机构代码： <font color="red">*</font></label></td>
		         <td><form:input path="orgCode" htmlEscape="false" maxlength="100" class="form-control required"  id="orgCode"/><span id="tip" style="color: red"></span></td>		         
		      </tr>
		      <tr>	         
		         <td><label>供应商名称: <font color="red">*</font></label></td>
		         <td><form:input path="supName" htmlEscape="false" maxlength="100" class="form-control required"/></td>
		      </tr>		      
		      <tr>
		         <td><label>单位号码: <font color="red">*</font></label></td>
		         <td><form:input path="telephone" htmlEscape="false" maxlength="64" class="form-control required" id="phone"/></td>		         
		      </tr>
		      <tr>		         
		         <td><label>税务登记号: <font color="red">*</font></label></td>
		         <td><form:input path="taxNumber" htmlEscape="false" maxlength="64" class="form-control required" /></td>
		      </tr>
		      <tr>
		         <td><label>单位联系地址: <font color="red">*</font></label></td>
		         <td><form:input path="address" htmlEscape="false" maxlength="45" class="form-control required"/></td>
		         
		      </tr>
		      <tr>		         
		         <td><label>供应商联系人: <font color="red">*</font></label></td>
		         <td><form:input path="suppliercontact" htmlEscape="false" maxlength="45" class="form-control"/></td>
		      </tr>
		      <tr>
		      	 <td><label>备注信息:</label></td>
		         <td><form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="100" class="form-control " /></td>
		      </tr>
			 </tbody>
		</table>
</form:form>
</div>
<%-- 	<form:form id="inputForm" modelAttribute="supmanagement" --%>
<%-- 		action="${ctx}/oa/supmanagement/save" method="post"                                   --%>
<%-- 		 class="form-horizontal"> --%>
<%-- 		<form:hidden path="id" /> --%>
<%-- 		<sys:message content="${message}" /> --%>
<!-- 		<div class="control-group"> -->
<!-- 			<label class="control-label">组织机构代码：</label> -->
<!-- 			<div class="controls"> -->
<%-- 				<form:input path="orgCode" htmlEscape="false" maxlength="64" id="orgCode" --%>
<%-- 					class="input-xlarge required" /> --%>
<!-- 				<span class="help-inline"><font color="red">*</font> </span> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="control-group"> -->
<!-- 			<label class="control-label">供应商名称：</label> -->
<!-- 			<div class="controls"> -->
<%-- 				<form:input path="supName" htmlEscape="false" maxlength="30" --%>
<%-- 					class="input-xlarge required" /> --%>
<!-- 				<span class="help-inline"><font color="red">*</font> </span> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="control-group"> -->
<!-- 			<label class="control-label">单位号码：</label> -->
<!-- 			<div class="controls"> -->
<%-- 				<form:input path="telephone" htmlEscape="false" maxlength="64" --%>
<%-- 					class="input-xlarge required" id="phone"/> --%>
<!-- 				<span class="help-inline"><font color="red">*</font> </span> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="control-group"> -->
<!-- 			<label class="control-label">税务登记号：</label> -->
<!-- 			<div class="controls"> -->
<%-- 				<form:input path="taxNumber" htmlEscape="false" maxlength="64" --%>
<%-- 					class="input-xlarge required" /> --%>
<!-- 				<span class="help-inline"><font color="red">*</font> </span> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="control-group"> -->
<!-- 			<label class="control-label">单位联系地址：</label> -->
<!-- 			<div class="controls"> -->
<%-- 				<form:input path="address" htmlEscape="false" maxlength="45" --%>
<%-- 					class="input-xlarge required"/> --%>
<!-- 				<span class="help-inline"><font color="red">*</font> </span> -->
<!-- 			</div> -->
<!-- 		</div> -->

<!-- 		<div class="control-group"> -->
<!-- 			<label class="control-label">备注信息：</label> -->
<!-- 			<div class="controls"> -->
<%-- 				<form:textarea path="remarks" htmlEscape="false" rows="4" --%>
<%-- 					maxlength="255" class="input-xxlarge " /> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="form-actions"> -->
<%-- 			<shiro:hasPermission name="oa:supmanagement:edit"> --%>
<!-- 				<input id="btnSubmit" class="btn btn-primary" type="submit" -->
<!-- 					value="保 存" onclick="return choose();"/>&nbsp; -->
<%-- 			</shiro:hasPermission> --%>
<!-- 			<input id="btnCancel" class="btn" type="button" value="返回 " -->
<!-- 				onclick="history.go(-1)" /> -->
<!-- 		</div> -->
<%-- 	</form:form> --%>
</body>
</html>