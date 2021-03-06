<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员增补管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
				$("#btnSubmit").click(function() {
							var judge1 = judgeInt1(); 
							var judge2 =judgeInt2();
							var judge3 =judgeInt3();
							var judge4 =judgeInt4();
							return judge1&& judge2&&judge3 &&judge4;
						}); 
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
		function judgeInt1() {
			var judge = true;
			var str = "";
			var str1 = "*"
			var str2 = "输入正整数 *";
			$("input[name='number']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() != "") {
					if (!(/^\d+$/.test($(this).val()))) {
						judge = false;
						str = str2;
					} else {
						str = str1;
					}
					$(this).next().children().text(str);
				}
			});
			return judge;
		}
		function judgeInt2() {
			var judge = true;
			var str = "";
			var str1 = "*"
			var str2 = "输入正整数 *";
			$("input[name='upNumber']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() != "") {
					if (!(/^\d+$/.test($(this).val()))) {
						judge = false;
						str = str2;
					} else {
						str = str1;
					}
					$(this).next().children().text(str);
				}
			});
			return judge;
		}
		function judgeInt3() {
			var judge = true;
			var str = "";
			var str1 = "*"
			var str2 = "输入正整数 *";
			$("input[name='trial']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() != "") {
					if (!(/^\d+$/.test($(this).val()))) {
						judge = false;
						str = str2;
					} else {
						str = str1;
					}
					$(this).next().children().text(str);
				}
			});
			return judge;
		}
		function judgeInt4() {
			var judge = true;
			var str = "";
			var str1 = "*"
			var str2 = "输入正整数 *";
			$("input[name='official']").each(function() {
				if (!$(this).is(":hidden") && $(this).val() != "") {
					if (!(/^\d+$/.test($(this).val()))) {
						judge = false;
						str = str2;
					} else {
						str = str1;
					}
					$(this).next().children().text(str);
				}
			});
			return judge;
		} 
	</script>
	<style type="text/css">
	
	#cz{width: 100px;}
	
	.iradio_square-green{
		float:left;
	}
	.iradio_square-green + label{
		float:left;
	}
	</style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-title">
			<h5>人员增补-申请 </h5>
			<div class="ibox-tools">
			</div>
		</div>
	   <div class="ibox-content">
	   	<sys:message content="${message}"/>
	   
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-left">
					<input onclick='btnPNGshow2("${procDefId}");' class="btn btn-primary btn-rounded btn-outline btn-sm"
										type="button" value="流程图" />
				</div>
			</div>
			<form:form id="inputForm" modelAttribute="oaStaffupdated" action="${ctx}/oa/staff/oaStaffupdated/save" method="post" class="form-inline">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>		
				<div style="padding-bottom: 10px;text-align: center;font-size: 20px;">人员增补申请表</div>
				<div style="overflow: hidden;">
					<span style="display: inline-block; width: 72%;">申请人：${name }</span>
					<span>申请时间：	
						<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></span>
				</div>
				<table class="table table-bordered table-condensed dataTables-example dataTable">
		
				<tr>
					<td>需求部门： <span class="help-inline"><font color="red">*</font> </span></td>
					<td>
						<form:input path="department" htmlEscape="false" maxlength="255" class="form-control required"/>				
					</td>
					<td>现有人数： <span class="help-inline"><font color="red">*</font> </span></td>
					<td>
						<form:input path="number"   id="cz"   name="number"  htmlEscape="false" maxlength="11" class="form-control required number" />
						
					</td>
					<td>拟增人数： <span class="help-inline"><font color="red">*</font> </span></td>
					<td>
						<form:input  id="cz" path="upNumber" name="upNumber"  htmlEscape="false" maxlength="11" class="form-control required number"/>
						
					</td>
				</tr>
				<tr>
					<td rowspan="2">增补岗位名称： <span class="help-inline"><font color="red">*</font> </span></td>
					<td rowspan="2">
						<form:input path="upPostname"    htmlEscape="false" maxlength="255" class="form-control required "/>
						
					</td>
					<td rowspan="2">薪资范围：</td>	
					<td colspan="2">试用期薪资： <span class="help-inline"><font color="red">*</font> </span></td>
					<td>
						<form:input  id="cz" path="trial"  name="trial" htmlEscape="false" maxlength="11" class="form-control required number" />
						
					</td>	
				</tr>
				<tr>
					<td colspan="2">转正薪资： <span class="help-inline"><font color="red">*</font> </span></td>
					<td>
						<form:input  id="cz" path="official" name="official"  htmlEscape="false" maxlength="11" class="form-control required number"/>				
					</td>
				</tr>
				<tr>
					<td>增补原因<!-- (0:补缺，1：增加，2：储备) -->： <span class="help-inline"><font color="red">*</font> </span></td>
					<td colspan="2">
						<form:radiobuttons path="upReason" items="${fns:getDictList('up_reason')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required i-checks"/>
						
					</td>
					<td>期望到岗日期： <span class="help-inline"><font color="red">*</font> </span></td>
					<td colspan="2">
						<input name="expectationTime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
							value="<fmt:formatDate value="${oaStaffupdated.expectationTime}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>				
					</td>
				</tr>
				<tr>
					<td>岗位工作内容： <span class="help-inline"><font color="red">*</font> </span></td>
					<td colspan="5">
					<form:textarea path="upPostcontent"
								htmlEscape="false" rows="2" maxlength="600"
								class="form-control required" disabled="disabled" style="width: 100%;"/>
					<%-- 	<form:input path="upPostcontent" htmlEscape="false" maxlength="255" class="input-xlarge required"/> --%>
						
					</td>
				</tr>
				<tr>
					<td>增补岗位要求： <span class="help-inline"><font color="red">*</font> </span></td>
					<td colspan="5">
					<form:textarea path="upPostclaim"
									htmlEscape="false" rows="2" maxlength="600"
									class="form-control required" disabled="disabled" style="width: 100%;"/>
			<%-- 			<form:input path="upPostclaim" htmlEscape="false" maxlength="255" class="input-xlarge required"/> --%>
						
					</td>
				</tr>
				<tr>
				<td></td>
				<td colspan="6"><shiro:hasPermission name="oa:staff:oaStaffupdated:edit"><input id="btnSubmit" class="btn btn-myoa-sec" type="submit" value="提 交"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回" onclick="history.go(-1)"/></td>
				
				</tr>
				</table>
			</form:form>
		<br/>
		<br/>
		</div>
		</div>
		</div>
</div>		
</body>
</html>