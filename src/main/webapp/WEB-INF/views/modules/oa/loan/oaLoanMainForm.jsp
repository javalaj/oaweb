<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>借支单信息管理</title>
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
			//$("#name").focus();
			validateForm=$("#inputForm").validate({
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
		});
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaLoanMain" action="${ctx}/oa/loan/oaLoanMain/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
		   <tbody>
		   	  <tr>
		         <td>	
		        	借支单类型
		         </td>
		         <td>
					<form:select path="loanType" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
						<form:options items="${fns:getDictList('OaLoanMain_loanType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
		         </td>		         
		      </tr>
		      <tr>		         
		         <td>	
		        	借支单号
		         </td>
		         <td>
		         	<form:input path="loanNo" htmlEscape="false" maxlength="64" class="form-control "/>
		         </td>
		      </tr>
		      <tr>
		      	 <td>	
		         	借支人
		         </td>
		         <td>
		         	<sys:treeselect id="loanUser" name="loanUser.id" value="${oaLoanMain.loanUser.id}" labelName="loanUser.name" labelValue="${oaLoanMain.loanUser.name}"
						title="用户" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
		         </td>		        
		      </tr>
		      <tr>		      	
		         <td>	
		         	申请日期
		         </td>
		         <td>
 		         	<input name="approvalTime" style="width:100% !important" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm" 
 						value="<fmt:formatDate value="${oaLoanMain.approvalTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" 
 						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> 
		         </td>
		      </tr>
		      <tr>
		      	 <td>	
		        	借支金额
		         </td>
		         <td>
		         	<form:input path="loanMoney" htmlEscape="false" class="form-control number required"/>
		         </td>		        
		      </tr>
		      <tr>		      	
		         <td>	
		         	借支日期
		         </td>
		         <td>
		         	<input name="loanTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm"
						value="<fmt:formatDate value="${oaLoanMain.loanTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
		         </td>
		      </tr>
		      <tr>
		         <td>	
		        	借支单状态
		         </td>
		         <td>
					<form:select path="loanStatus" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
						<form:options items="${fns:getDictList('OaLoanMain_loanStatus')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
		         </td>		        
		      </tr>
		      <tr>		         		         
		         <td>	
		        	销账日期
		         </td>
		         <td>
			         <input name="writeOffTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm"
						value="<fmt:formatDate value="${oaLoanMain.writeOffTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
		         </td>
		      </tr>
		      <tr>
		         <td>	
		         	备注信息
		         </td>
		         <td>
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
		         </td>
		      </tr>
		   </tbody>
		   </table>		
	</form:form>
</body>
</html>