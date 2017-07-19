<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>招待费流程管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			
			$("#btnSubmit").click(function() {
				var value  = $('input[name="exam"]:checked').val(); 
				$("#isagree2").val(value);
				submitUserList_5();
			});
			
			$("#inputForm").validate({
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
		
		})
	</script>
	
	<style type="text/css">
		.head{text-align: center;font-size: 20px;font-weight: bolder;}
		.add-del-png {
			width: 15px;
			height: 15px;
		}
	</style>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form?id=${oaEntertainmentReimbursement.id}">审核-招待费流程</a></li>
	</ul><br/> --%>
	<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5><a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form?id=${oaEntertainmentReimbursement.id}">审核-招待费流程</a> </h5>
		<div class="ibox-tools">
			<!-- <a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
				<i class="fa fa-wrench"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#">选项1</a>
				</li>
				<li><a href="#">选项2</a>
				</li>
			</ul>
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a> -->
		</div>
	</div>
    
    <div class="ibox-content">
	<sys:message content="${message}"/>
	<form:form id="inputForm" method="post" class="form-horizontal">
<%-- 		<form:hidden path="id"/> --%>
<%-- 		<input  value="${listOaEnter}" name="listOaEnter"/> --%>
		<sys:message content="${message}"/>	
		<legend>${title }</legend>
		<input type="hidden" name="token" value="${token }">
		
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td colspan="9" class="head">招 待 费 报 销 审 批 单</td>
			</tr>
			<tr>
				<td rowspan="2">日期</td>
				<td rowspan="2">往来单位</td>
				<td rowspan="2">洽谈事由及项目名称</td>
				<td colspan="2">实际金额</td>
				<td colspan="2">参与人数</td>
				<td rowspan="2">是否在事前报批</td>
				<td rowspan="2">操作</td>				
			</tr>
			<tr>
				<td>餐费</td>
				<td>酒水/烟等</td>
				<td>我司</td>
				<td>客户</td>
			</tr>
			
			<tbody>
			<c:forEach var="oaEnter" items="${listOaEnter}">
				<tr>
					<td>
					<input type="hidden" name="date" value="<fmt:formatDate value="${oaEnter.date}"
						pattern="yyyy-MM-dd HH:mm:ss" />"/>
						<fmt:formatDate value="${oaEnter.date}"
						pattern="yyyy-MM-dd HH:mm:ss" />						
					</td>
					<td>
						<input type="hidden" name="currentunit" value="${oaEnter.currentunit}"/>
						${oaEnter.currentunit}
					</td>
					<td>
					<input type="hidden" name="reason" value="${oaEnter.reason}"/>
					${oaEnter.reason}						
					</td>
					<td>
					<input type="hidden" name="meals" value="${oaEnter.meals}"/>
					${oaEnter.meals}	
					</td>
					<td>
					<input type="hidden" name="alcoholtobacco" value="${oaEnter.alcoholtobacco}"/>
					${oaEnter.alcoholtobacco}	
					</td>
					<td>
					<input type="hidden" name="numOur" value="${oaEnter.numOur}"/>
					${oaEnter.numOur}	
					</td>
					<td>
					<input type="hidden" name="numCustomers" value="${oaEnter.numCustomers}"/>
					${oaEnter.numCustomers}	
					</td>					
					<td>
					${oaEnter.ispriorapproval}
					<input type="hidden" name="ispriorapproval" value="${oaEnter.ispriorapproval}"/>
					<input type="hidden" name="isagree2" value="" id="isagree2"/>
					<input type="hidden" name="examtext2" value=""/>
					<input type="hidden" name="procInsId" value="${oaEnter.procInsId }"/>
					<input type="hidden" name="id" value="${oaEnter.id }"/>
					<input type="hidden" name="sameid" value="${oaEnter.sameid}"/>
					</td>					
				</tr>
				</c:forEach>
				<tr>
					<td colspan="2">
						合计金额
					</td>
					<td colspan="6">
						${total}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						大写金额
					</td>
					<td colspan="6">
						${money_string}
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						财务审核
					</td>
					<td colspan="6">
						<input type="radio" name="exam" value="0">同意
						<input type="radio" name="exam" value="1" checked="checked">不同意	
					</td>
				</tr>	
				<tr>
					<td colspan="2">财务审核意见</td>
					<td colspan="6"><input type="text" name="examtext2"/></td>
				</tr>					
			</tbody>
		</table>
					
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="button" value="提交" />&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<c:if test="${task != null}">
				&nbsp;<input
				onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
				class="btn" type="button" value="流程跟踪" />
		</c:if>
		</div>
		
	</form:form>
	<c:if test="${not empty oaEntertainmentReimbursement.sameid}">
		<act:histoicFlow procInsId="${oaEntertainmentReimbursement.procInsId}" />
	</c:if>
	<br/>
	<br/>
	</div>
	</div>
</div>
	<script type="text/javascript">
		(function($) {
			$.fn.serializeJson = function() {
				var jsonData1 = {};
				var serializeArray = this.serializeArray();
				// 先转换成{"id": ["12","14"], "name": ["aaa","bbb"], "pwd":["pwd1","pwd2"]}这种形式
				$(serializeArray).each(
						function() {
							if (jsonData1[this.name]) {
								if ($.isArray(jsonData1[this.name])) {
									jsonData1[this.name].push(this.value);
								} else {
									jsonData1[this.name] = [
											jsonData1[this.name], this.value ];
								}
							} else {
								jsonData1[this.name] = this.value;
							}
						});
				// 再转成[{"id": "12", "name": "aaa", "pwd":"pwd1"},{"id": "14", "name": "bb", "pwd":"pwd2"}]的形式
				var vCount = 0;
				// 计算json内部的数组最大长度
				for ( var item in jsonData1) {
					var tmp = $.isArray(jsonData1[item]) ? jsonData1[item].length
							: 1;
					vCount = (tmp > vCount) ? tmp : vCount;
				}

				if (vCount > 1) {
					var jsonData2 = new Array();
					for (var i = 0; i < vCount; i++) {
						var jsonObj = {};
						for ( var item in jsonData1) {
							jsonObj[item] = jsonData1[item][i];
						}
						jsonData2.push(jsonObj);
					}
					return JSON.stringify(jsonData2);
				} else {
					return "[" + JSON.stringify(jsonData1) + "]";
				}
			};
		})(jQuery);
		function submitUserList_5() {			
			var jsonStr = $("#inputForm").serializeJson();
			$.ajax({
						url : "${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/dealExam2",
						type : "POST",
						contentType : 'application/json;charset=utf-8',
						dataType : "text",
						data : jsonStr,
						async:false,
						success : function(data) {
							var json = eval("("+data+")");
							if (data == "1") {
								top.$.jBox.tip.mess = 1;
								top.$.jBox.tip("保存失败", "error", {
									persistent : true,
									opacity : 0
								});
								$("#messageBox").show();
								window.location.href = '${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/exam2';
							} else {
								top.$.jBox.tip.mess = 1;
								top.$.jBox.tip("保存成功", "success", {
									persistent : true,
									opacity : 0
								});
								$("#messageBox").show();
								window.location.href = '${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/view?sameid='+json.name;
							}
						},
						error : function(res) {
							top.$.jBox.tip.mess = 1;
							top.$.jBox.tip("保存失败", "error", {
								persistent : true,
								opacity : 0
							});
							$("#messageBox").show();
							window.location.href = '${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/exam2';
						}
					});
		}
		</script>
</body>
</html>