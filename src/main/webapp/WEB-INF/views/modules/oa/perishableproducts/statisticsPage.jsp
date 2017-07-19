<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用品统计</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			
			$("#type1").iCheck('check');
			
			$("#searchForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍等...');
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
	<style>
		.myoa-project-statis-table>tbody>tr>td>span {
			display: inline-block;
		}
		.myoa-project-statis-table>tbody>tr>td>span>label {
		    margin: 0 16px 6px 2px;
		}
		.table tr td:first-child span{
        	position: relative;
        }
		.sgin-red:after{
        	position: absolute;
		    display: block;
		    content: '*';
		    color: red;
		    top: 2px;
    		right: -7px;
        }
        .table tr:nth-of-type(3) td span{
        	top:-2px;
        }
	</style>
</head>
<body style="padding: 0px" class="gray-bg">
	<div class="wrapper wrapper-content" style="width: 800px; margin: 0 auto;">
		<div class="ibox">
			<div class="ibox-title">
				<h5>用品统计</h5>
				<div class="ibox-tools">
				</div>
			</div> 
    		<div class="ibox-content">
    			<sys:message content="${message}"/>
				<form:form id="searchForm" modelAttribute="perishableHistory" action="${ctx}/oa/fixedassets/perishableHistory/" method="post" class="breadcrumb form-search">
					<table class="table table-condensed dataTables-example dataTable no-footer myoa-project-statis-table myoa-newitem-table">
						<tr>
							<td>选择类别</td>
							<td>
								<form:select path="perishableProducts.itemCategory" class="selectpicker " data-style="btn-inverse" data-live-search="true">
									<form:option value="" label="全部"/>
									<form:options items="${fns:getDictList('item_category')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<form:radiobuttons path="type" items="${fns:getDictList('statistics')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/>
							</td>
						</tr>
						<tr>
							<td><span class="sgin-red">选择统计时段</span></td>
							<td>
								<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm required"
								value="<fmt:formatDate value="${perishableHistory.beginCreateDate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
								<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm required"
								value="<fmt:formatDate value="${perishableHistory.endCreateDate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
							</td>
						</tr>
						<tr>
							<td><span class="sgin-red">选择统计字段</span></td>
							<td>
								<form:checkboxes path="statisticsWordType" items="${fns:getDictList('perishable_statistics_word_type')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks required"/>
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