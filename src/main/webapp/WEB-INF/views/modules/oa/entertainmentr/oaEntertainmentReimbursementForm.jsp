<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>招待费流程管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#btnSubmit").click(function() {
					submitUserList_5();
			});
			
			//$("#name").focus();
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
			
			$(".add1line").click(
					function() {
						$(this)
							.parent()
							.parent()
							.before(
		 					'<tr><td><input name="date" type="text" readonly="readonly" maxlength="20" style="width: 90%;" class="laydate-icon form-control layer-date input-sm" value="" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm:ss\',isShowClear:false});" /><span class="help-inline"><font color="red">*</font> </span></td><td><input type="text" name="currentunit"  style="width:90%" class="form-control required"/><span class="help-inline"><font color="red">*</font> </span></td><td><input type="text" name="reason" style="width:90%" class="form-control required" /><span class="help-inline"><font color="red">*</font> </span></td><td><input type="text" name="meals" style="width:90%" class="form-control required" /><span class="help-inline"><font color="red">*</font> </span></td><td><input type="text" name="alcoholtobacco" style="width:90%" class="form-control required" /><span class="help-inline"><font color="red">*</font> </span></td><td><input type="text" name="numOur" style="width:90%" class="form-control" /><span class="help-inline"><font color="red">*</font> </span></td><td><input type="text" name="numCustomers" class="form-control" style="width:90%" /><span class="help-inline"><font color="red">*</font> </span></td><td><select name="ispriorapproval" class="form-control"  style="width: 100%" onclick="ispriorapprovalClick(this)"><option value="是">是</option><option value="否" selected="selected">否</option></select></td><td><a onclick="del1line(this)"><img class="add-del-png" src=\'${ctxStatic}/images/del.png\' /></a><input type="hidden" name="delFlag" value="0"></td></tr>');
						return false;
					});
		});
		
		function ispriorapprovalClick(item) {
			if ($(item).val() == '否') {
				$(item).parent().next().children().attr("readonly", false).next()
						.children().text("*");
			} else {
				$(item).parent().next().children().attr("readonly", true).val("")
						.next().children().text("");
			}
		}

		
		
		function del1line(item) {
			$(item).next().val("1");
			$(item).parent().parent().hide();
			return false;
		}
		
		 function judgeNull() {
			var judge = true;
			var str = "";
			var str1 = "*"
			var str2 = "必填信息 *";
			$("textarea[name='taskName']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() == '') {
					str = str2;
					judge = false;
				} else {
					str = str1;
				}
				$(this).next().children().text(str);
			});
			//
			$("input[name='date']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() == '') {
					str = str2;
					judge = false;
				} else {
					str = str1;
				}
				$(this).next().children().text(str);
			});			
			//
			$("input[name='currentunit']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() == '') {
					str = str2;
					judge = false;
				} else {
					str = str1;
				}
				$(this).next().children().text(str);
			});
			//
			$("input[name='reason']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() == '') {
					str = str2;
					judge = false;
				} else {
					str = str1;
				}
				$(this).next().children().text(str);
			});
			//
			$("input[name='meals']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() == '') {
					str = str2;
					judge = false;
				} else {
					str = str1;
				}
				$(this).next().children().text(str);
			});
			//
			$("input[name='alcoholtobacco']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() == '') {
					str = str2;
					judge = false;
				} else {
					str = str1;
				}
				$(this).next().children().text(str);
			});
			//
			$("input[name='numOur']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() == '') {
					str = str2;
					judge = false;
				} else {
					str = str1;
				}
				$(this).next().children().text(str);
			});
			//
			$("input[name='numCustomers']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() == '') {
					str = str2;
					judge = false;
				} else {
					str = str1;
				}
				$(this).next().children().text(str);
			});
			//
			$("input[name='ispriorapproval']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() == '') {
					str = str2;
					judge = false;
				} else {
					str = str1;
				}
				$(this).next().children().text(str);
			});
			
			
			return judge;
		} 
	</script>
	
	<style type="text/css">
		.head{text-align: center;font-size: 20px;font-weight: bolder;}
		.add-del-png {
			width: 15px;
			height: 15px;
		}
		input[name='date']{
			overflow: hidden;
			text-overflow:ellipsis;
			white-space: nowrap;
		}
	</style>
</head>
<body class="gray-bg">
	<%-- <ul class="nav nav-tabs">			
		<li class="active"><a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form?id=${oaEntertainmentReimbursement.id}">申请-招待费报销</a></li>
	</ul><br/> --%>
	<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5><a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form?id=${oaEntertainmentReimbursement.id}">招待费流程管理</a> </h5>
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
		<label>招 待 费 报 销 审 批 单</label>
		<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
<!-- 			<tr> -->
<!-- 				<td colspan="9" class="head"></td> -->
<!-- 			</tr> -->
<thead>
			<tr>
				<td rowspan="2" width=20%>日期</td>
				<td rowspan="2" width=15%>往来单位</td>
				<td rowspan="2" width=15%>洽谈事由及项目名称</td>
				<td colspan="2" width=20%>实际金额</td>
				<td colspan="2" width=20%>参与人数</td>
				<td rowspan="2">是否在事前报批</td>
				<td rowspan="2">操作</td>				
			</tr>
			<tr>
				<td>餐费</td>
				<td>酒水/烟等</td>
				<td>我司</td>
				<td>客户</td>
			</tr>
</thead><tbody>
			<c:forEach var="oaEnter" items="${listOaEnter}">
				<tr>
					<td>
						<input name="date" type="text" readonly="readonly"
									maxlength="20" style="width: 90%;" class="laydate-icon form-control layer-date input-sm"
									value="<fmt:formatDate value="${oaEnter.date}"
						pattern="yyyy-MM-dd HH:mm:ss" />"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" /><span
									class="help-inline"  onblur="judgeNull()"><font color="red">*</font> </span>
					</td>
					<td>					
						<input type="text" name="currentunit" value="${oaEnter.currentunit}" required="required"  style="width:90%"  class="form-control" onblur="judgeNull()"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</td>
					<td>
						<input type="text" name="reason" value="${oaEnter.reason}" style="width:90%" required="required" class="form-control"  onblur="judgeNull()"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</td>
					<td>
						<input type="text" name="meals" value="${oaEnter.meals}" style="width:90%" required="required" class="form-control"  onblur="judgeNull()"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</td>
					<td>
						<input type="text" name="alcoholtobacco" value="${oaEnter.alcoholtobacco}" style="width:90%" required="required" class="form-control"  onblur="judgeNull()"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</td>
					<td>
						<input type="text" name="numOur" value="${oaEnter.numOur}" style="width:90%" required="required" class="form-control" />
						<span class="help-inline"><font color="red">*</font> </span>
					</td>
					<input  type="hidden" name="procInsId" value="${oaEnter.procInsId }"/>
					<input  type="hidden" name="id" value="${oaEnter.id }"/>
					<input type="hidden" name="sameid" value="${oaEnter.sameid}"/>
					<input type="hidden" name="flag" value="0" id="flag"/>
					<td>
						<input type="text" name="numCustomers" value="${oaEnter.numCustomers}" style="width:90%" required="required" class="form-control"   onblur="judgeNull()"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</td>					
					<td>
						<select name="ispriorapproval" style="width: 100%" class="form-control"
							onclick="ispriorapprovalClick(this)"  onblur="judgeNull()"><option value="是">是</option>
							<option value="否" selected="selected">否</option></select>
					</td>
					<td><a onclick="del1line(this)"><img class="add-del-png"
							src='${ctxStatic}/images/del.png' /></a><input type="hidden"
						name="delFlag" value="0"></td>
				</tr>
				</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a class="add1line"><img class="add-del-png"
									src="${ctxStatic}/images/add.png" /></a></td>
			</tr>
			</tbody>
		</table>
		
		<div class="form-actions" style="text-align:center;">
			<input id="btnSubmit" class="btn btn-primary" type="button" value="提交" />
			<c:if test="${not empty oaEntertainmentReimbursement.id}">
				<input id="btnCancle2" class="btn btn-primary" type="submit"
					value="取消申请" />&nbsp;
			</c:if>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
			<c:if test="${task != null}">
				&nbsp;<input
				onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
				class="btn" type="button" value="流程跟踪" />
		</c:if>
		</div>
		
	</form:form>
	<br/>
	<br/>
	</div>
	</div>
</div>
	<c:if test="${not empty oaEntertainmentReimbursement.id}">
		<act:histoicFlow procInsId="${oaEntertainmentReimbursement.procInsId}" />
	</c:if>
	
	
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
						url : "${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/save",
						type : "POST",
						contentType : 'application/json;charset=utf-8',
						dataType : "text",
						data : jsonStr,
						async:false,
						success : function(data) {
							var json = eval("("+data+")");
							if (data == "1") {
								/* top.$.jBox.tip.mess = 1;
								top.$.jBox.tip("保存失败", "error", {
									persistent : true,
									opacity : 0
								});
								$("#messageBox").show(); */
								top.layer.alert('保存失败!', {icon: 0, title:'警告'});
								window.location.href = '${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form';
							} else {
								 $("input[type=button]").attr('disabled',false)

								/* top.$.jBox.tip.mess = 1;
								top.$.jBox.tip("保存成功", "success", {
									persistent : true,
									opacity : 0
								});
								$("#messageBox").show(); */
								top.layer.alert('保存成功!', {icon: 0, title:'提示'});
								window.location.href = '${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/view?sameid='+json.name;
							}
						},
						error : function(res) {
							/* top.$.jBox.tip.mess = 1;
							top.$.jBox.tip("保存失败", "error", {
								persistent : true,
								opacity : 0
							});
							$("#messageBox").show(); */
							top.layer.alert('保存失败!', {icon: 0, title:'警告'});
							window.location.href = '${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form';
						}
					});
		}
		
		</script>
</body>
</html>