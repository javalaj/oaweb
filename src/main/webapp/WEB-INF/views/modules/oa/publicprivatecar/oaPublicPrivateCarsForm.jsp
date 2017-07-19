<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>私车公用管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#btnCancle2").click(function(){
					$("#flag").val("1");
					
				})
			
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
		});
		
		function choose(){
	
			var gotime = document.getElementById("gotime").value; //获取出发时间 
			var backtime = document.getElementById("backtime").value;//获取返回时间
			var got = new Date(gotime.replace(/-/g,"/"));
			var backt = new Date(backtime.replace(/-/g,"/"));
			if(Date.parse(backt)<Date.parse(got)){
				top.layer.msg("出发时间必须小于返回时间！！");
				/* top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("出发时间必须小于返回时间！！！", "error", {
					persistent : true,
					opacity : 0
				}); */
				$("#messageBox").show();
				return false;
			}
			
			var gokilometer = document.getElementById("go").value;//起始公里数
			var backkilometer = document.getElementById("back").value;//返回公里数
			
			if(isNaN(gokilometer) || (isNaN(backkilometer))){
				top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("公里数请输入数字！", "error", {
					persistent : true,
					opacity : 0
				});
				$("#messageBox").show();
				return false;
			}
			
			if(gokilometer<0 || backkilometer<0){
				top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("公里数请输入正数！", "error", {
					persistent : true,
					opacity : 0
				});
				$("#messageBox").show();
				return false;
			}
			
			if(parseInt(gokilometer)>parseInt(backkilometer)){
				top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("起始公里数必须小于返回公里数！！！", "error", {
					persistent : true,
					opacity : 0
				});
				$("#messageBox").show();
				return false;
			}
			
			var picture = document.getElementById("picture").value;//验证上传的照片
			if(picture == null || picture == ''){
				top.layer.msg("请上传照片！！");
				/* top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("请上传照片！！！", "error", {
					persistent : true,
					opacity : 0
				}); */
				$("#messageBox").show();
				return false;
			}
			return true;
		}
	</script>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/liucheng.css">
<style>
/* .form-inline .form-control {
	width: 40%;
} */
</style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox" style="width: 800px;margin: 0 auto;">
	<div class="ibox-title">
		<h5>${title }</h5>
	</div>
	<div class="ibox-content">
	<form:form id="inputForm" modelAttribute="oaPublicPrivateCars" action="${ctx}/oa/publicprivatecar/oaPublicPrivateCars/save" method="post" class="form-inline myoa-details-form">
		<input type="hidden" name="token" value="${token }">
		<%-- <legend>${title }</legend> --%>
		<input type="hidden" name="flag" value="0" id="flag">
		<form:hidden path="id" />
		<form:hidden path="procInsId" />		
		<sys:message content="${message}"/>	
		
		<div class="control-group">
			<label class="control-label">借用人：</label>			
			<input type="text" value="${oaPublicPrivateCars.createBy.name}" disabled class="form-control" style="width:40%;">
			
		</div>	
		<div class="control-group">
			<label class="control-label">所在部门：</label>
			
				<input type="text" value="${oaPublicPrivateCars.officename}" disabled class="form-control" style="width:40%;">
			
		</div>
					
		<div class="control-group">
			<label class="control-label" style="padding-top:0;">用车范围： <font color="red">*</font></label>
			
				<form:radiobuttons path="usescope" checked="checked" items="${fns:getDictList('useScope')}" itemLabel="label" itemValue="value" htmlEscape="false" class="input-xlarge required i-checks"/>
		</div>
		<div class="control-group">
			<label class="control-label">事由： <font color="red">*</font></label>
			
				<form:input path="usereason" htmlEscape="false" maxlength="100" class="form-control required" style="width:40%;"/>
			
		</div>
		<div class="control-group">
			<label class="control-label">起始时间： <font color="red">*</font></label>
			
				<input name="starttime"  id="gotime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
					value="<fmt:formatDate value="${oaPublicPrivateCars.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" style="background-color: #FFFFFF;" style="width:40%;"/>
		</div>
		<div class="control-group">
			<label class="control-label">结束时间： <font color="red">*</font></label>
			
				<input name="endtime" type="text" readonly="readonly" maxlength="20" id="backtime" class="laydate-icon form-control layer-date input-sm required"
					value="<fmt:formatDate value="${oaPublicPrivateCars.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" style="background-color: #FFFFFF;" style="width:40%;"/>
				
			
		</div>
		<div class="control-group">
			<label class="control-label">起始公里数： <font color="red">*</font></label>
			
				<form:input path="gokilometer" htmlEscape="false" maxlength="64" class="form-control required" style="width:40%;" id="go"/>
			
		</div>
		<div class="control-group">
			<label class="control-label">返回公里数： <font color="red">*</font></label>
			
				<form:input path="backkilometer" htmlEscape="false" maxlength="64" class="form-control required" style="width:40%;" id="back"/>
			
		</div>
		<div class="control-group">
			<label class="control-label">目的地： <font color="red">*</font></label>
			
				<form:input path="destination" htmlEscape="false" maxlength="100" class="form-control required" style="width:40%;"/>
			
		</div>
		<div class="control-group">
			<label class="control-label">上传照片： <font color="red">*</font></label>
			<div class="" style="display: inline-block;">
				<form:hidden id="picture" path="picture" htmlEscape="false" maxlength="4000" class="input-xlarge required"/>
				<sys:ckfinder input="picture" type="images" uploadPath="/oa/publicprivatecar/oaPublicPrivateCars/photo" selectMultiple="true" maxWidth="100" maxHeight="100" buttonLabel="上传照片"/>
			</div>
		</div>
	
		<div class="control-group">
			<label class="control-label">备注：</label>
			
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control" style="width:40%;"/>
			
		</div>
		<div class="form-actions" style="text-align:left; margin-top:15px;margin-bottom: 15px;">
			<shiro:hasPermission name="oa:publicprivatecar:oaPublicPrivateCars:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" onclick="return choose();"
					value="提交" />&nbsp;
			</shiro:hasPermission>
			<c:if test="${not empty oaPublicPrivateCars.id}">
				<input id="btnCancle2" class="btn btn-primary" type="submit"
					value="取消申请" />&nbsp;
			</c:if>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
			<c:choose>
				<c:when test="${task != null}">&nbsp;
					<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
					class="btn" type="button" value="流程跟踪" />
				</c:when>
				<c:otherwise>&nbsp;
					<input onclick='btnPNGshow2("${procDefId}");' class="btn"
					type="button" value="流程图" />
				</c:otherwise>
			</c:choose>			
		</div>
		
	</form:form>
	</div>
	<c:if test="${not empty oaPublicPrivateCars.id}">
		<act:histoicFlow procInsId="${oaPublicPrivateCars.procInsId}" />
	</c:if>
	</div>
</div>
</body>
</html>