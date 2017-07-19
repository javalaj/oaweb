<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title></title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			checksave();//文档加载时判断
			
			$("#inputForm").validate({
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

		
		//当点击提交按钮时，判断是否选择启用原因
		function choose(){
			if(($('select').val() == null || $('select').val() == "" ) &&  ($("#otherR").val()=="" || $("#otherR").val()==null)) {
				top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("请选择或填写启用原因！！！", "error", {
					persistent : true,
					opacity : 0
				});
				$("#messageBox").show();
				return false;			   						   
			}			
			return true;	
		}
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox" style="width: 800px;margin: 0 auto;">
			<div class="ibox-title">
				<h5><a href="${ctx}/oa/carManagement/form?id=${carManagement.id}">车辆<shiro:hasPermission name="oa:carManagement:edit">${not empty carManagement.id?'修改':'报废'}</shiro:hasPermission><shiro:lacksPermission name="oa:carManagement:edit">查看</shiro:lacksPermission></a></h5>		
			</div>
			<div class="ibox-content">
	<%-- <ul class="nav nav-tabs">
		<li><a href="${ctx}/oa/carManagement/">车辆列表</a></li>
		<li class="active"><a href="${ctx}/oa/carManagement/form?id=${carManagement.id}">车辆<shiro:hasPermission name="oa:carManagement:edit">${not empty carManagement.id?'修改':'报废'}</shiro:hasPermission><shiro:lacksPermission name="oa:carManagement:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/> --%>
	<form:form id="inputForm" modelAttribute="carManagement" action="${ctx}/oa/carManagement/useAndStop" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		
		<legend style="margin-bottom: 20px;">请确认启用车辆：</legend>
<%--  		<input type="checkbox" name="subChk" value="${carManagement.id}" onclick="chk()"/>  --%>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
				   <tbody>
				      <tr>
				         <td>车牌号：</td>
				         <td>
				         	${carManagement.platenum}
						</td>		         
				      </tr>
				      <tr>		         
				         <td>公里数：</td>
				         <td>${carManagement.kilometers}公里</td>
				      </tr>		      
				      <tr>
				         <td>购买日期：</td>
				         <td>${buyd}</td>		         
				      </tr>
				      <tr>		         
				         <td>启用原因：</td>
				         <td>
				         	<form:select path="usereason" class="form-control selectpicker" data-style="btn-inverse" data-live-search="true" id="delcar">
								<form:option value="" label="未选择" selected="selected"/>
								<form:options items="${fns:getDictList('usereason')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</td>
				      </tr>
				      
				      <tr> 
				         <td>其他原因：</td>
				         <td>
				         	<form:input path="otherreason" htmlEscape="false" maxlength="64"  class="form-control" id="otherR"/>
				         </td>		        
				      </tr>
				      <tr> 		        
				         <td></td>
				         <td><input id="btnSubmit" class="btn btn-primary" type="submit" value="提交" onclick="return choose();"/>&nbsp;				
							<input id="btnCancel" class="btn" type="button" value="取消" onclick="window.location.href='${ctx}/oa/carManagement/list' "/>		
				      </tr>
				    </tbody>
				 </table>		
			</form:form>
			</div>
		</div>
	</div>		
</body>
</html>