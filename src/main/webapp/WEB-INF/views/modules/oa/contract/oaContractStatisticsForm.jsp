<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目统计</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#searchForm").validate({
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
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content" style="width: 800px; margin: 0 auto;">
		<div class="ibox">
			<div class="ibox-title">
				<h5>合同统计</h5>
				<div class="ibox-tools">
				</div>
			</div>
    		<div class="ibox-content">    			
				<form:form id="searchForm" modelAttribute="oaContractStatistics" action="${ctx}/oa/contract/oaContractStatistics/statistics" method="post" class="form-horizontal">
					<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">						
						<tr>
							<td>选择合同类别 <span class="help-inline"><font color="red">*</font> </span></td>
							<td>
								<form:select path="realContractType" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
									<form:option value="0" label="【销售】合同"/>
									<form:option value="1" label="【采购】+【分包】合同"/>
								</form:select>					
							</td>
						</tr>
						<tr>
							<td>选择服务类别</td>
							<td>
								<form:select path="contractType" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
									<form:option value="" label="全部"/>
									<form:options items="${fns:getDictList('oa_project_contractType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
							</td>
						</tr>
						<tr>
							<td>项目名称</td>
							<td>
								<form:input path="projectName" htmlEscape="false" class="form-control "/>
							</td>
						</tr>
						<tr>
							<td>项目立项时间 <span class="help-inline"><font color="red">*</font> </span></td>
							<td>
								<input name="beginEstablishmentTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
									value="<fmt:formatDate value="${oaProject.beginEstablishmentTime}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
								<input name="endEstablishmentTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
									value="<fmt:formatDate value="${oaProject.endEstablishmentTime}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>					
							</td>
						</tr>
						<tr>
							<td></td>
							<td style="padding-top: 16px;"><input id="btnSubmit" class="btn btn-myoa btn-myoa-large" type="submit" value="开始统计"/></td>
						</tr>
					</table>
				</form:form>
			</div>
    	</div>
    </div>	
</body>
</html>