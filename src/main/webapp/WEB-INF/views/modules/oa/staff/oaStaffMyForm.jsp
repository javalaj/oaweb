<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员增补管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				$("#btnSubmit").click(function() {
					var judge1 = judgeInt1(); 
					var judge2 =judgeInt2();
					var judge3 =judgeInt3();
					var judge4 =judgeInt4();
					return judge1&& judge2&&judge3 &&judge4;
				}); 
				submitHandler: function(form){
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
		function setSelectUserNo(radioObj){  
	          
	        var radioCheck= $(radioObj).val();  
	        if("1"==radioCheck){  
	            $(radioObj).attr("checked",false);  
	            $(radioObj).val("0");  
	              
	        }else{   
	            $(radioObj).val("1");  
	              
	        }  
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
</head>
<body>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>人员增补-重新申请 </h5>
		<div class="ibox-tools">
		</div>
	</div>
   <div class="ibox-content">
   	<sys:message content="${message}"/>
   	<div class="row">
	<div class="col-sm-12">
	<br/>
	</div>
	</div>
	
	<form:form id="inputForm" modelAttribute="oaStaffupdated" action="${ctx}/oa/staff/oaStaffupdated/save" method="post" class="form-inline">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<table class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<tr>

				<td colspan="6"><h3 align='center'>人员新增申请表</h3></td>
			</tr>
			<tr>

				<td colspan="4">申请人：${oaStaffupdated.createBy.name }</td>
				<td colspan="4">申请时间：	
				<fmt:formatDate value="${oaStaffupdated.createDate}" pattern="yyyy-MM-dd "/>
					</td>
			</tr>
		<tr>
			<td>需求部门： <font color="red">*</font> </td>
			<td>
				<form:input path="department" htmlEscape="false" maxlength="255" class="form-control required"/>
				<span class="help-inline"></span>
			</td>
			<td>现有人数： <font color="red">*</font> </td>
			<td>
				<form:input path="number" id="cz"      htmlEscape="false" maxlength="11" class="form-control required number" />
				<span class="help-inline"></span>
			</td>
			<td>拟增人数： <font color="red">*</font></td>
			<td>
				<form:input path="upNumber" id="cz"  htmlEscape="false" maxlength="11" class="form-control required number"/>
				<span class="help-inline"> </span>
			</td>
		</tr>
		<tr>
			<td style="width: 250px;">岗位名称： <font color="red">*</font></td>
		<td>
				<form:input path="upPostname"  id="cz" htmlEscape="false" maxlength="255" class="form-control required"/>
				<span class="help-inline"> </span>
			</td>
			    	<td>试用期薪资： <font color="red">*</font></td>
			<td>
				<form:input path="trial"  id="cz"  htmlEscape="false" maxlength="11" class="form-control required number" />
				<span class="help-inline"> </span>
			</td>
			<td>转正薪资： <font color="red">*</font></td>
			<td>
				<form:input path="official"  id="cz" htmlEscape="false" maxlength="11" class="form-control required number"  />
				<span class="help-inline"> </span>
			</td>
			</tr>
		<tr>
			<td>增补原因<!-- (0:补缺，1：增加，2：储备) -->： <font color="red">*</font></td>
			<td>
				<form:radiobuttons path="upReason" items="${fns:getDictList('up_reason')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required i-checks"/>
				<span class="help-inline" > </span>
			</td>
			<td>期望到岗时间： <font color="red">*</font></td>
			<td colspan="6">
				<input name="expectationTime" type="text" readonly="readonly" maxlength="20"  class="laydate-icon form-control layer-date input-sm required"
					value="<fmt:formatDate value="${oaStaffupdated.expectationTime}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"> </span>
			</td>
		</tr>
		<tr>
			<td>岗位工作内容： <font color="red">*</font></td>
			<td colspan="6">
			<form:textarea path="upPostcontent"
						htmlEscape="false" rows="2" maxlength="600"
						cols="100" class="input-xxlarge required" disabled="disabled" />
			<%-- 	<form:input path="upPostcontent" htmlEscape="false" maxlength="255" class="input-xlarge required"/> --%>
				<span class="help-inline"> </span>
			</td>
		</tr>
	<tr>
			<td>增补岗位要求： <font color="red">*</font></td>
		<td colspan="6">
		<form:textarea path="upPostclaim"
						htmlEscape="false" rows="2" maxlength="600"
					  cols="100" 	 class="input-xxlarge required" disabled="disabled" />
	<%-- 			<form:input path="upPostclaim" htmlEscape="false" maxlength="255" class="input-xlarge required"/> --%>
				<span class="help-inline"> </span>
			</td>
</tr>
<c:if test="${not empty oaStaffupdated.demandOpinion }">
	<tr>
			<td>部门副总意见：</td>
		<td colspan="6">
		<textarea  rows="2"  cols="100"  maxlength="200" class="input-xxlarge required" disabled="disabled" readonly="readonly"> ${oaStaffupdated.demandOpinion  }</textarea>
	 
			</td>
</tr>
</c:if>
<c:if test="${not empty oaStaffupdated.personnelmattersOpinion }">
	<tr>
			<td>人事行政部副总意见：</td>
		<td colspan="6">
		<textarea  rows="2"  cols="100"  maxlength="200" class="input-xxlarge required" disabled="disabled" readonly="readonly">${oaStaffupdated.personnelmattersOpinion  }</textarea>
	  
			</td>
</tr>
</c:if>
<c:if test="${not empty oaStaffupdated.bossOpinion }">
	<tr>
			<td>总经理意见：</td>
		<td colspan="6">
		<textarea  rows="2"  cols="100"  maxlength="200" class="input-xxlarge required" disabled="disabled" readonly="readonly">  ${oaStaffupdated.bossOpinion  }</textarea>
	
			</td>
</tr>
</c:if>
<tr>
		<td>是否提交： <font color="red">*</font></td>
		<td colspan="6"><label><input id="actor" name="Fruit" type="radio" value="1" class="required i-checks" checked="checked"/>重新提交</label> 
		    <label><input id="actor" name="Fruit" type="radio" value="2" class="required i-checks"/>废弃</label>
		  <span style="display: none;"> <form:input path="procInsId" /></span> <span class="help-inline"></span>
		</td>
		
		</tr>
		<tr>
		<td></td>
		<td colspan="6"><shiro:hasPermission name="oa:staff:oaStaffupdated:edit"><input id="btnSubmit" class="btn btn-myoa-sec btn-myoa-large" type="submit" value="提 交"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn btn-myoa" type="button" value="返回" onclick="history.go(-1)"/></td>
		
		</tr>
</table>
	</form:form>
	</div>
	</div>
	</div>
		<c:if test="${not empty oaStaffupdated.id}">
		<act:histoicFlow procInsId="${oaStaffupdated.procInsId}" />
	</c:if>
</body>
</html>