<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目统计</title>
	<meta name="decorator" content="default"/>
	<style>
		.myoa-project-statis-table>tbody>tr>td>span {
			display: inline-block;
		}
		.myoa-project-statis-table>tbody>tr>td>span>label {
		    margin: 0 16px 6px 2px;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#searchForm").validate({
			 submitHandler: function(form){
					var index = layer.load(1);
					oaLoading('正在提交，请稍候...', {
						  time: 1200000 //1200秒关闭（如果不配置，默认是3秒）
						});					
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")){
						$("#"+element.attr("name")+"ErrorPlacement").append(error);
					}else if(element.is(":radio")||element.parent().is(".input-append")){
						
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
				<h5>项目统计</h5>
				<div class="ibox-tools">
				</div>
			</div>
    		<div class="ibox-content"> 
				<form:form id="searchForm" modelAttribute="oaProject" action="${ctx}/oa/project/oaProject/statistics" method="post" class="form-horizontal">
					<table class="table table-condensed dataTables-example dataTable no-footer myoa-project-statis-table myoa-newitem-table">
						<tr>
							<td>服务类别</td>
							<td>
								<form:select path="contractType" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
									<form:option value="" label="全部"/>
									<form:options items="${fns:getDictList('oa_project_contractType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
							</td>
						</tr>
						<tr>
							<td>统计时段(起点) <span class="help-inline"><font color="red">*</font> </span></td>
							<td>
								<input name="beginEstablishmentTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
									value="<fmt:formatDate value="${oaProject.beginEstablishmentTime}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>				
							</td>
						</tr>
						<tr>
							<td>统计时段(终点) <span class="help-inline"><font color="red">*</font> </span></td>
							<td>
								<input name="endEstablishmentTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
									value="<fmt:formatDate value="${oaProject.endEstablishmentTime}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>					
							</td>
						</tr>
						<tr>
							<td>统计字段 <span class="help-inline"><font color="red">*</font> </span></td>
							<td>
								<form:checkboxes path="statisticsWordType" items="${fns:getDictList('project_statistics_word_type')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks required"/>					
								<div id="statisticsWordTypeErrorPlacement" style="font-size: 13px"></div>
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