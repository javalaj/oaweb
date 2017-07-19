<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存车辆管理成功管理</title>
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
		
		//防止重复提交
		function checksave(){
			var id = "${carManagement.id}";
			if (id != null && id != ""){
				document.getElementById("btnSubmit").setAttribute("disabled",true);
			}else{
				document.getElementById("btnNext").setAttribute("disabled",true);
			}
		}
	</script>
</head>

<body>	
	<form:form id="inputForm" modelAttribute="carManagement" action="${ctx}/oa/carManagement/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-table-noborder">
		   <tbody>
		     <tr>
		         <td>图片：</td>
		         <td>
		         	<form:hidden id="photo" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
					<sys:ckfinder input="photo" type="images" uploadPath="/photo" selectMultiple="true" maxWidth="100" maxHeight="100" readonly="true"/>
				</td>
				<td>车牌号：</td>
		         <td><input type="text" value="${carManagement.platenum }" class="form-control" readonly="readonly"/></td>	         
		      </tr>

		      <tr>
		         <td>品牌：</td>
		         <td><input type="text" value="${carManagement.brand }" class="form-control" readonly="readonly"/></td>		
		         <td>型号：</td>
		         <td><input type="text" value="${carManagement.model }" class="form-control" readonly="readonly"/></td>         
		      </tr>

		      <tr>
		         <td>座位数：</td>
		         <td><input type="text" value="${carManagement.seatnum }" class="form-control" readonly="readonly"/></td>	
		         <td>公里数:</td>
		         <td><input type="text" value="${carManagement.kilometers }" class="form-control" readonly="readonly"/></td>	         
		      </tr>

		      <tr>
		       	 <td>购买日期：</td>
 		       	 <td><input type="text" value="<fmt:formatDate value="${carManagement.buydate}" pattern="yyyy-MM-dd" />" class="laydate-icon form-control layer-date input-sm" readonly="readonly"/></td>	
 		       	 <td>车架号：</td>
		         <td><span class="lbl"><input type="text" value="${carManagement.framenum }" class="form-control" readonly="readonly"/></span></td>	       	 
		      </tr>
		       
		      <tr>
		       	 <td>车辆价格：</td>
		       	 <td><input type="text" value="${carManagement.price}" class="form-control" readonly="readonly"/></td>	
		       	 <td>保险公司：</td>
		         <td><span class="lbl"><input type="text" value="${carManagement.insurer }" class="form-control" readonly="readonly"/></span></td>	       	 
		      </tr>
		      	      
		      <tr>
		       	 <td>保单号：</td>
 		       	 <td><input type="text" value="${carManagement.policynum }" class="form-control" readonly="readonly"/></td>	
 		       	 <td>行驶证号：</td>
		         <td><span class="lbl"><input type="text" value="${carManagement.driverlicense }" class="form-control" readonly="readonly"/></span></td>	       	
		      </tr>

		      <tr>
		       	 <td>行驶证有效期：</td>
		       	 <td><input type="text" value="<fmt:formatDate value="${carManagement.dlicensedate}" pattern="yyyy-MM-dd" />" class="form-control" readonly="readonly"/></td>		
		       	 <td>车辆状态：</td>
		         <td><span class="lbl">
		         		<c:if test="${carManagement.state eq 0}"><input type="text" value="正常" class="form-control" readonly="readonly"/></c:if>
		         		<c:if test="${carManagement.state eq 1}"><input type="text" value="已停用" class="form-control" readonly="readonly"/></c:if>
		         	</span>
		         </td>       	 
		      </tr>
			 </tbody>
		</table>
</form:form>		
</body>
</html>



<%-- <body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/oa/carManagement/">车辆列表</a></li>
		<li class="active"><a href="${ctx}/oa/carManagement/detail?id=${carManagement.id}">车辆详情</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="carManagement" action="${ctx}/oa/carManagement/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		
		<div class="control-group">	
			<label class="control-label">图片：</label>		
			<div class="controls">
				<form:hidden id="photo" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="photo" type="images" uploadPath="/photo" selectMultiple="true" maxWidth="100" maxHeight="100" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">车牌号：</label>
			<div class="controls">
				<input type="text" value="${carManagement.platenum }" class="form-control" readonly="readonly"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">品牌：</label>
			<div class="controls">
				<input type="text" value="${carManagement.brand }" class="form-control" readonly="readonly"/>
				<form:select path="brand" readonly="true" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('brands')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
<!-- 				<span class="help-inline"><font color="red">*</font> </span> -->
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">型号：</label>
			<div class="controls">
				<input type="text" value="${carManagement.model }" class="form-control" readonly="readonly"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">座位数：</label>
			<input type="text" value="${carManagement.seatnum }" class="form-control" readonly="readonly"/>
		</div>
		<div class="control-group">
			<label class="control-label">公里数：</label>
			<input type="text" value="${carManagement.kilometers }" class="form-control" readonly="readonly"/>
		</div>
		<div class="control-group">
			<label class="control-label">购买日期：</label>
			<input type="text" value="<fmt:formatDate value="${carManagement.buydate}" pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control" readonly="readonly"/>
		</div>
		<div class="control-group">
			<label class="control-label">车架号：</label>
			<input type="text" value="${carManagement.framenum }" class="form-control" readonly="readonly"/>
		</div>
		<div class="control-group">
			<label class="control-label">车辆价格：</label>
			<input type="text" value="${carManagement.brand }" class="form-control" readonly="readonly"/>
		</div>
		<div class="control-group">
			<label class="control-label">保险公司：</label>
			<input type="text" value="${carManagement.insurer }" class="form-control" readonly="readonly"/>
		</div>
		<div class="control-group">
			<label class="control-label">保单号：</label>
			<input type="text" value="${carManagement.policynum }" class="form-control" readonly="readonly"/>
		</div>
		<div class="control-group">
			<label class="control-label">行驶证号：</label>
			<input type="text" value="${carManagement.driverlicense }" class="form-control" readonly="readonly"/>
		</div>
		<div class="control-group">
			<label class="control-label">行驶证有效期：</label>
			<input type="text" value="<fmt:formatDate value="${carManagement.dlicensedate}" pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control" readonly="readonly"/>
		</div>
		<div class="control-group" style="display: none">
			<label class="control-label">车辆状态（0.正常  1.已停用）：</label>
			<input type="text" value="${carManagement.state }" class="form-control" readonly="readonly"/>
		</div>
		
		<div class="form-actions">			
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html> --%>