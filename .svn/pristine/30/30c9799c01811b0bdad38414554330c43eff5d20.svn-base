<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>私人活动</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
				$("#btnSubmit").click(function() {
							var judeg2 = judgeDate();
							var judge1 = judgeInt(); 
							return judge1&&judeg2;
						});
			$("#inputForm").validate({
				
				rules: {
					"compere.name": {
				        required: true
				     },
				     "actor.name": {
					        required: true
					     },
				},
			    messages: {
			    	"compere.name": {
			          required: "必填信息",
			        },
			        "actor.name": {
				          required: "必填信息",
				        },
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
			function judgeInt() {
				var judge = true;
				var str = "";
				var str1 = "*"
				var str2 = "不能为空并且输入两位以上的数 *";
				$("input[name='planTitle']").each(function() {
						if (!(/\S{2,}/.test($(this).val()))) {
							judge = false;
							str = str2;
						} else {
							str = str1;
						}
						$(this).next().children().text(str);
				});
				return judge;
			}
			$("input[name='planTitle']").blur(function(){
				if (!(/\S{2,}/.test($(this).val()))) {
					$(this).next().children().text("不能为空并且输入两位以上的数 *");
				} else {
					$(this).next().children().text("*");
				}
			})
					 	function judgeDate() {
		var judge = true;
		var last = "";
		var index = 0;
		var str = "";
		var str1 = "*"
		var str2 = "时间错误 *";
		$("input[name$='startTime']").each(
				function() {
					if (index % 2 == 0) {
						last = $(this).val();
					} else {
						if (!$(this).is(":hidden") && $(this).val() != ""
							&& last != "") {
							if (new Date($(this).val()) < new Date(last)) {
								judge = false;
								str = str1;
							} else {
								
								str = str2;
							}
							$("#cz").children().text(str);
					}
					}
					index++;
				});
		return judge;
	}
		});
	</script>
</head>
<body>
	<sys:message content="${message}"/>
	<form:form id="inputForm" modelAttribute="oaPlan" action="${mctx}/oa/plan/oaPlan/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td class="width-15 active" colspan="2">
					<input id="btnCancel" class="btn btnCancel" type="button" value="返 回" onclick="location.href='${mctx}/oa/plan/oaPlan'"/>
					<shiro:hasPermission name="oa:mytask:oaPlan:edit">
						<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
					</shiro:hasPermission>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="2">
					<div style='text-align:center'><fieldset><legend>私人活动编辑</legend></fieldset></div>
				</td>
			</tr>		
			<tr>
				<td class="width-15 active">计划类型：</td>
				<td class="width-35">
					私人活动
				</td>
			</tr>
			<tr>
				<td class="width-15 active">活动日期</td>
				<td class="width-35">
					<input name="startDay" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
						value="<fmt:formatDate value="${oaPlan.startDay}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,minDate:'%y-%M-%d'});"/>	
					<span class="help-inline"><font color="red">*</font> </span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">活动主题</td>
				<td class="width-35">
					<form:input name="planTitle" path="planTitle" htmlEscape="false" maxlength="255" class="form-control " cssStyle="width: 100%"/>
				 	<span class="help-inline"><font color="red">*</font></span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">开始时间</td>
				<td class="width-35">
					<input name="startTime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
						value="<fmt:formatDate value="${startime}" pattern="HH:mm"/>"
						onclick="WdatePicker({dateFmt:'HH:mm',isShowClear:false,qsEnabled:true,quickSel:['08:30','12:00','13:00','13:30','17:30']});"/>	
					<span class="help-inline"><font color="red">*</font> </span>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">结束时间</td>
				<td class="width-35">
					<input name="endTime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
						value="<fmt:formatDate value="${endtime}" pattern="HH:mm"/>"
						onclick="WdatePicker({dateFmt:'HH:mm',isShowClear:false,qsEnabled:true,quickSel:['08:30','12:00','13:00','13:30','17:30']});"/>
					<span class="help-inline"><font color="red">*</font><span id="cz" class="help-inline"><font color="red"></font> </span> </span>
				</td>
			</tr>	
			<tr>
				<td class="width-15 active">提醒</td>
				<td class="width-35">
					<form:select path="tip" cssStyle="width: 100%" class="form-control">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('tip')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">
				   	重复周期
				</td>
			    <td class="width-35">
				  	<form:select path="cycle"  cssStyle="width: 100%" class="form-control ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('cycle')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
			</tr>	
		
		</table>
	</form:form>
	
	 <script type="text/javascript">
 
 function history(){
	 window.location.href="${ctx}/oa/mytask/oaPlan/list";
 }
 </script>
</body>
 

</html>